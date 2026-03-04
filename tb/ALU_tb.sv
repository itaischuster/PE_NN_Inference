`timescale 1ns/1ps

module ALU_tb;
    logic clk;
    logic rst;
    logic [4:0]  mac_cmd;
    logic [31:0] op_A;
    logic [31:0] op_B;
    
    logic done;
    logic busy;
    logic [63:0] accumulator;

    localparam NOP      = 5'd0;
    localparam RST_ACC  = 5'd1;
    localparam MAC4     = 5'd2;
    localparam MAC8     = 5'd3;
    localparam ADD_BIAS = 5'd4;
    localparam MULT32   = 5'd5;

    integer log_file;
    int pass_count = 0;
    int fail_count = 0;

    ALU uut (
        .clk(clk),
        .mac_cmd(mac_cmd),
        .rst(rst),
        .op_A(op_A),
        .op_B(op_B),
        .done(done),
        .busy(busy),
        .accumulator(accumulator)
    );

    initial begin
        clk = 0;
        forever #2 clk = ~clk;
    end

    // Task to apply a single-cycle command
    task send_cmd(input [4:0] cmd, input [31:0] a, input [31:0] b);
        mac_cmd = cmd;
        op_A = a;
        op_B = b;
        @(posedge clk);
        #1;
    endtask

    // Task to check the accumulator and log the result
    task check_result(input string test_name, input logic [63:0] expected);
        if (accumulator === expected) begin
            $display("[PASS] %s", test_name);
            pass_count++;
        end else begin
            $display("[FAIL] %s | Expected: %0d, Got: %0d", test_name, expected, accumulator);
            fail_count++;
        end
    endtask

    // Main Test Sequence
    initial begin
        log_file = $fopen("ALU_results.log", "w");

        $display("Starting ALU Verification Sequence...");
        $display("-----------------------------------");

        // Initialization
        rst = 1'b0;
        mac_cmd = NOP;
        op_A = 0;
        op_B = 0;
        @(posedge clk);
        @(posedge clk);
        rst = 1'b1; // Deactivate reset
        #1;
        check_result("Async Hardware Reset", 64'd0);

        // TEST 1: ADD_BIAS (Single Cycle)
        // Expected: Accumulator goes from 0 to 5.
        send_cmd(ADD_BIAS, 32'd0, 32'd5);
        send_cmd(NOP, 0, 0); // Drop command
        check_result("ADD_BIAS operation", 64'd5);

        // TEST 2: MAC8 (Single Cycle)
        // op_A bytes: {1, 1, 1, 1}
        // op_B bytes: {2, 2, 2, 2}
        // Math: (1*2) + (1*2) + (1*2) + (1*2) = 8. 
        // Expected: 5 (current acc) + 8 = 13.
        send_cmd(MAC8, {8'd1, 8'd1, 8'd1, 8'd1}, {8'd2, 8'd2, 8'd2, 8'd2});
        send_cmd(NOP, 0, 0);
        check_result("MAC8 operation", 64'd13);

        // TEST 3: NOP and State Holding
        // Ensure accumulator holds 13 when nothing is happening
        send_cmd(NOP, 32'hFFFF_FFFF, 32'hFFFF_FFFF);
        check_result("NOP holds state", 64'd13);

        // TEST 4: MULT32 (Multi-Cycle & Internal Routing)
        // Multiply the current accumulator (13) by op_B (3). Expected = 39.
        mac_cmd = MULT32;
        op_B = 32'd3;
        @(posedge clk); 
        #1; // ADDED: Wait 1ns for the hardware to register the command and output busy
        
        if (busy !== 1'b1) begin
            $display("[FAIL] Busy flag did not assert immediately!");
            fail_count++;
        end else begin
            $display("[PASS] Busy flag asserted");
            pass_count++;
        end

        // Try to hijack the ALU mid-calculation with a standard command
        mac_cmd = MAC8; 
        
        // Wait for the done pulse
        wait(done == 1'b1);
        #1; // Check immediately after done goes high
        
        if (busy !== 1'b0) begin
            $display("[FAIL] Busy flag did not drop when done pulsed!");
            fail_count++;
        end
        
        check_result("MULT32 sequence & routing", 64'd39);

        // TEST 5: Synchronous Clear
        // Expected: Accumulator clears to 0 on the next clock
        send_cmd(RST_ACC, 0, 0);
        check_result("Synchronous RST_ACC", 64'd0);

        // TEST 6: Asynchronous Reset Mid-Operation
        // Start another MULT32
        send_cmd(ADD_BIAS, 0, 32'd10); // Give it some base value
        mac_cmd = MULT32;
        op_B = 32'd5;
        @(posedge clk);
        @(posedge clk); // Wait 2 cycles into the calculation
        
        // Fire async reset asynchronously (no clock edge)
        rst = 1'b0; 
        #1;
        
        if (accumulator === 64'd0 && busy === 1'b0) begin
            $display("[PASS] Async reset mid-operation");
            pass_count++;
        end else begin
            $display("[FAIL] Async reset failed to flush state immediately");
            fail_count++;
        end
        rst = 1'b1;

        // TEST 7: Zero Multiplication (Operand Isolation check)
        // Force the accumulator back to a known state, then multiply by 0
        @(posedge clk);
        send_cmd(ADD_BIAS, 0, 32'd99);
        mac_cmd = MULT32;
        op_B = 32'd0; // Multiply by 0
        wait(done == 1'b1);
        #1;
        check_result("Multiply by Zero (Isolation)", 64'd0);

        // TEST 8: MAC4 Instruction & 4x4 Routing
        // First, clear the accumulator so we have clean math
        send_cmd(RST_ACC, 0, 0);
        // Feed 1s into op_A and 2s into op_B (eight 4-bit chunks each)
        // Hex 1111_1111 means every 4-bit chunk is a 1. 
        // Hex 2222_2222 means every 4-bit chunk is a 2.
        // Math: 8 chunks * (1 * 2) = 16.
        send_cmd(MAC4, 32'h1111_1111, 32'h2222_2222);
        send_cmd(NOP, 0, 0);
        check_result("MAC4 operation", 64'd16);

        // TEST 9: Negative Math & Sign Extension
        send_cmd(RST_ACC, 0, 0);
        // ADD_BIAS with -10 (Hex FFFF_FFF6)
        send_cmd(ADD_BIAS, 0, 32'hFFFF_FFF6);
        
        // MAC8 with op_A = -2 (8-bit FE repeated) and op_B = 3 (8-bit 03 repeated)
        // Your design treats op_A as signed always, and op_B as signed here[cite: 76, 77].
        // Math: 4 chunks * (-2 * 3) = -24
        // Expected Accumulator: -10 + (-24) = -34. 
        // In 64-bit two's complement, -34 is FFFF_FFFF_FFFF_FFDE.
        send_cmd(MAC8, 32'hFEFE_FEFE, 32'h0303_0303);
        send_cmd(NOP, 0, 0);
        check_result("Negative Math & Sign Extension", 64'hFFFF_FFFF_FFFF_FFDE);

        // TEST 10: Unsigned MULT32 Scaling Factor
        send_cmd(RST_ACC, 0, 0);
        send_cmd(ADD_BIAS, 0, 32'd5); // Load a base value of 5
        
        // Multiply by 32-bit all 1s (Hex FFFF_FFFF)
        // During MULT32, op_B is forced to be unsigned.
        // So this is 5 * 4,294,967,295 (not 5 * -1).
        mac_cmd = MULT32;
        op_B = 32'hFFFF_FFFF;
        @(posedge clk);
        wait(done == 1'b1);
        #1;
        
        // Expected Math: 5 * 4,294,967,295 = 21,474,836,475
        // In 64-bit hex, that is 0000_0004_FFFF_FFFB.
        // If your hardware fails and does signed math, it will output -5 instead.
        check_result("Unsigned MULT32 Scaling", 64'h0000_0004_FFFF_FFFB);
        // TEST 11: Max Positive Carry Ripple
        send_cmd(RST_ACC, 0, 0);
        send_cmd(ADD_BIAS, 0, 32'h7FFF_FFFF); // Max 32-bit positive
        
        mac_cmd = MULT32;
        op_B = 32'hFFFF_FFFF; // Max 32-bit unsigned
        @(posedge clk);
        wait(done == 1'b1);
        #1;
        // Expected: 2,147,483,647 * 4,294,967,295 = 9,223,372,030,412,324,865
        check_result("Max Positive Carry Ripple", 64'h7FFF_FFFE_8000_0001);

        // TEST 12: The -128 Asymmetry (Max Negative)
        send_cmd(RST_ACC, 0, 0);
        send_cmd(ADD_BIAS, 0, 32'h8000_0000); // Max 32-bit negative (-2,147,483,648)
        
        mac_cmd = MULT32;
        op_B = 32'hFFFF_FFFF; 
        @(posedge clk);
        wait(done == 1'b1);
        #1;
        // Expected: -2,147,483,648 * 4,294,967,295 = -9,223,372,032,559,808,512
        check_result("Max Negative Asymmetry", 64'h8000_0000_8000_0000);

        // TEST 13: Operand Isolation Sign Toggle
        send_cmd(RST_ACC, 0, 0);
        send_cmd(ADD_BIAS, 0, 32'hFFFF_FFFF); // Load -1
        
        mac_cmd = MULT32;
        op_B = 32'h0000_0001; // Multiply by 1
        @(posedge clk);
        wait(done == 1'b1);
        #1;
        // Expected: -1 * 1 = -1 (All 1s in 64-bit hex)
        check_result("Isolation Sign Toggle", 64'hFFFF_FFFF_FFFF_FFFF);
        // TEST 14: 64-bit Accumulator Rollover
        send_cmd(RST_ACC, 0, 0);
        // Add -1 (Sign extends FFFF_FFFF to 64 bits of all 1s)
        send_cmd(ADD_BIAS, 0, 32'hFFFF_FFFF); 
        // Add +1
        send_cmd(ADD_BIAS, 0, 32'd1);
        send_cmd(NOP, 0, 0);
        // Expected: -1 + 1 = 0 (perfect rollover)
        check_result("64-bit Accumulator Rollover", 64'd0);

        // TEST 15: Back-to-Back Pipeline Stress
        send_cmd(RST_ACC, 0, 0);
        // Fire three MAC8 commands in a row (Adding 4 each time)
        // Math per cycle: 4 chunks * (1 * 1) = 4
        send_cmd(MAC8, 32'h0101_0101, 32'h0101_0101); // Acc = 4
        send_cmd(MAC8, 32'h0101_0101, 32'h0101_0101); // Acc = 8
        send_cmd(MAC8, 32'h0101_0101, 32'h0101_0101); // Acc = 12
        send_cmd(NOP, 0, 0);
        check_result("Back-to-Back Stress", 64'd12);

        // TEST 16: FSM Immediate Re-trigger
        send_cmd(RST_ACC, 0, 0);
        send_cmd(ADD_BIAS, 0, 32'd2); // Base value = 2
        
        // First MULT32 (2 * 3 = 6)
        mac_cmd = MULT32;
        op_B = 32'd3;
        @(posedge clk);
        wait(done == 1'b1);
        
        // The EXACT cycle done is high, fire a new MULT32 (6 * 4 = 24)
        mac_cmd = MULT32;
        op_B = 32'd4;
        @(posedge clk); 
        
        // Wait for the second operation to finish
        wait(done == 1'b1);
        #1;
        check_result("FSM Immediate Re-trigger", 64'd24);

        // Finish and Log Results
        $display("-----------------------------------");
        $display("Simulation Complete!");
        $display("Total Passes: %0d", pass_count);
        $display("Total Fails:  %0d", fail_count);
        
        if (fail_count == 0) begin
            $fwrite(log_file, "STATUS: PASSED | Module: ALU | Tests: %0d\n", pass_count);
        end else begin
            $fwrite(log_file, "STATUS: FAILED | Module: ALU | Errors: %0d\n", fail_count);
        end
        
        $fclose(log_file);
        $finish;
    end
endmodule