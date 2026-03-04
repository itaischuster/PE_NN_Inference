`timescale 1ns/1ps 

module PE_Controller_tb;

    // 1. Signals matching the PE_Controller interface
    logic clk;
    logic rst;
    logic [4:0] pe_opcode;
    logic mac_busy;
    logic mac_done;
    
    logic [4:0] mac_cmd;
    logic quantize_en;
    logic activation_en;
    logic pe_ready;
    logic output_valid;

    // Local Opcode Definitions for readability
    localparam NOP = 5'b00000;
    localparam RST_ACC = 5'b00001;
    localparam MAC4 = 5'b00010;
    localparam MAC8 = 5'b00011;
    localparam ADD_BIAS = 5'b00100;
    localparam MULT32 = 5'b00101;
    localparam SHIFT_RIGHT = 5'b00110;
    localparam APPLY_ACT = 5'b00111;

    // Log counters
    int pass_count = 0;
    int fail_count = 0;

    // 2. Instantiate the Design Under Test (DUT)
    PE_Controller uut (
        .clk(clk),
        .rst(rst),
        .pe_opcode(pe_opcode),
        .mac_busy(mac_busy),
        .mac_done(mac_done),
        .mac_cmd(mac_cmd),
        .quantize_en(quantize_en),
        .activation_en(activation_en),
        .pe_ready(pe_ready),
        .output_valid(output_valid)
    );

    // 3. Clock Generation (10ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Helper Task to check all outputs simultaneously
    task check_state(
        input string test_name, 
        input logic [4:0] exp_cmd, 
        input logic exp_q_en, 
        input logic exp_a_en, 
        input logic exp_ready, 
        input logic exp_out_val
    );
        if (mac_cmd === exp_cmd && 
            quantize_en === exp_q_en && 
            activation_en === exp_a_en && 
            pe_ready === exp_ready && 
            output_valid === exp_out_val) begin
            $display("[PASS] %s", test_name);
            pass_count++;
        end else begin
            $display("[FAIL] %s", test_name);
            $display("       Expected: cmd=%0d, q_en=%0b, a_en=%0b, rdy=%0b, out_val=%0b", 
                     exp_cmd, exp_q_en, exp_a_en, exp_ready, exp_out_val);
            $display("       Got:      cmd=%0d, q_en=%0b, a_en=%0b, rdy=%0b, out_val=%0b", 
                     mac_cmd, quantize_en, activation_en, pe_ready, output_valid);
            fail_count++;
        end
    endtask

    // 4. Main Directed Test Sequence
    initial begin
        $display("Starting PE_Controller Directed Tests...");
        $display("----------------------------------------");

        // Initialization
        rst = 1'b1; // Start HIGH to create a true falling edge
        pe_opcode = NOP;
        mac_busy = 1'b0;
        mac_done = 1'b0;
        #1; 
        rst = 1'b0; // Slam it LOW to explicitly trigger negedge rst
        
        // Let reset settle over a clock edge
        @(posedge clk);
        #1; 

        // TEST 1: Reset and Idle Stability
        // During reset, the module is NOT ready
        check_state("Test 1a: Async Reset State (During Reset)", NOP, 0, 0, 0, 0); 
        
        rst = 1'b1; #1; // Release reset
        // Now it should be awake and ready
        check_state("Test 1b: Post-Reset Recovery", NOP, 0, 0, 1, 0);

        // TEST 2: Combinational Instruction Decoding
        pe_opcode = RST_ACC; #1;
        check_state("Test 2a: Decode RST_ACC", RST_ACC, 0, 0, 1, 0);

        pe_opcode = MAC8; #1;
        check_state("Test 2b: Decode MAC8", MAC8, 0, 0, 1, 0);

        pe_opcode = ADD_BIAS; #1;
        check_state("Test 2c: Decode ADD_BIAS", ADD_BIAS, 0, 0, 1, 0);

        pe_opcode = SHIFT_RIGHT; #1;
        check_state("Test 2d: Decode SHIFT_RIGHT", NOP, 1, 0, 1, 0);

        // TEST 3: Output Valid Pipeline Delay
        pe_opcode = APPLY_ACT; #1;
        check_state("Test 3a: Decode APPLY_ACT (Combo check)", NOP, 0, 1, 1, 0);
        
        @(posedge clk); #1; // Let the clock edge register the output_valid signal
        pe_opcode = NOP; #1; // Drop the opcode immediately
        check_state("Test 3b: Output Valid Delay (Seq check)", NOP, 0, 0, 1, 1);

        // Clear output valid on next edge
        @(posedge clk); #1; 

        // TEST 4: The MULT32 FSM Stall Sequence
        pe_opcode = MULT32; #1;
        check_state("Test 4a: Decode MULT32 (Combo Check)", MULT32, 0, 0, 1, 0);

        @(posedge clk); #1; // FSM jumps to WAIT_MAC
        pe_opcode = MAC4;   // Try to send a new instruction while stalled
        #1;
        check_state("Test 4b: Stalled FSM ignores new opcodes", NOP, 0, 0, 0, 0); 
        
        mac_done = 1'b1; // Simulate the MAC finishing
        @(posedge clk); #1; // FSM should jump back to IDLE
        mac_done = 1'b0;
        pe_opcode = NOP; #1;
        check_state("Test 4c: FSM Recovers to IDLE", NOP, 0, 0, 1, 0);

        // TEST 5: Asynchronous Reset Mid-Stall
        pe_opcode = MULT32;
        @(posedge clk); #1; // FSM jumps to WAIT_MAC, pe_ready drops
        
        rst = 1'b0; #1; // Asynchronous violent reset
        check_state("Test 5a: Async Reset Mid-Stall (During)", NOP, 0, 0, 0, 0); 

        pe_opcode = NOP; // Clear the instruction bus before waking up!
        rst = 1'b1; #1; // Release reset
        check_state("Test 5b: Mid-Stall Reset Recovery", NOP, 0, 0, 1, 0);

        // TEST 6: The Do No Harm Test (Reserved Opcodes)
        pe_opcode = 5'b11111; #1;
        check_state("Test 6: Reserved Opcode (11111)", NOP, 0, 0, 1, 0);
        pe_opcode = NOP; #1;

        // TEST 7: Rogue MAC Status Flags (Noise Immunity)
        mac_done = 1'b1; 
        mac_busy = 1'b1; #1;
        check_state("Test 7: Ignored Rogue Flags in IDLE", NOP, 0, 0, 1, 0);
        mac_done = 1'b0; 
        mac_busy = 1'b0; #1;

        // TEST 8: Maximum Throughput Pipeline (Back-to-Back Execution)
        pe_opcode = MAC8; #1;
        check_state("Test 8a: Pipeline MAC8", MAC8, 0, 0, 1, 0);
        
        @(posedge clk); #1;
        pe_opcode = SHIFT_RIGHT; #1;
        check_state("Test 8b: Pipeline SHIFT_RIGHT", NOP, 1, 0, 1, 0);
        
        @(posedge clk); #1;
        pe_opcode = APPLY_ACT; #1;
        check_state("Test 8c: Pipeline APPLY_ACT", NOP, 0, 1, 1, 0);
        
        @(posedge clk); #1;
        pe_opcode = MAC4; #1;
        // output_valid should pop high here exactly 1 cycle after APPLY_ACT
        check_state("Test 8d: Pipeline MAC4 + Valid Output", MAC4, 0, 0, 1, 1);
        
        @(posedge clk); #1;
        pe_opcode = NOP; #1;
        check_state("Test 8e: Pipeline Clear", NOP, 0, 0, 1, 0);

        // TEST 9: The 1-Cycle Fake-Out (Instant Recovery)
        pe_opcode = MULT32; 
        mac_done = 1'b1; // Assert done immediately to simulate a fast finish or stuck flag
        @(posedge clk); #1; // FSM jumps to WAIT_MAC and sees mac_done instantly
        
        pe_opcode = NOP; // Clear instruction bus
        check_state("Test 9a: Instant Stall & See Flag", NOP, 0, 0, 0, 0);
        
        @(posedge clk); #1; // FSM should bounce right back to IDLE on this edge
        mac_done = 1'b0; // Clear the rogue flag
        check_state("Test 9b: Instant Recovery to IDLE", NOP, 0, 0, 1, 0);

        // 5. Finish and Log Results
        $display("----------------------------------------");
        $display("Directed Simulation Complete!");
        $display("Total Passes: %0d", pass_count);
        $display("Total Fails:  %0d", fail_count);
        $finish;
    end
endmodule