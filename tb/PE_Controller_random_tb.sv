`timescale 1ns/1ps 

module PE_Controller_random_tb;

    // Signals
    logic clk;
    logic rst_n;
    logic [4:0] pe_opcode;
    logic alu_busy;
    logic alu_done;
    
    logic [4:0] alu_cmd;
    logic quantize_en;
    logic activation_en;
    logic pe_ready;
    logic output_valid;

    // DUT
    PE_Controller uut (
        .clk(clk),
        .rst_n(rst_n),
        .pe_opcode(pe_opcode),
        .alu_busy(alu_busy),
        .alu_done(alu_done),
        .alu_cmd(alu_cmd),
        .quantize_en(quantize_en),
        .activation_en(activation_en),
        .pe_ready(pe_ready),
        .output_valid(output_valid)
    );

    // Clock Generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Reference Model Variables
    logic expected_state; // 0 = IDLE, 1 = WAIT_MAC
    logic [4:0] expected_mac_cmd;
    logic expected_q_en;
    logic expected_a_en;
    logic expected_out_valid;
    
    int loop_count = 10000;
    int pass_count = 0;
    int fail_count = 0;

    // Sequential Reference Model
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            expected_state <= 1'b0; // IDLE
            expected_mac_cmd <= 5'b00000;
            expected_q_en <= 1'b0;
            expected_a_en <= 1'b0;
            expected_out_valid <= 1'b0;
        end else begin
            // Track the 2-cycle delay for APPLY_ACT
            // It reads the registered activation_en from the previous cycle
            expected_out_valid <= expected_a_en;

            // Track FSM State and Pipeline Routing
            if (expected_state == 1'b0) begin
                // Default clears
                expected_q_en <= 1'b0;
                expected_a_en <= 1'b0;
                expected_mac_cmd <= 5'b00000;

                // Decode Instruction
                case (pe_opcode)
                    5'b00001, 5'b00010, 5'b00011, 5'b00100, 5'b00101: begin
                        expected_mac_cmd <= pe_opcode;
                    end
                    5'b00110: expected_q_en <= 1'b1;
                    5'b00111: expected_a_en <= 1'b1;
                endcase

                // State transition
                if (pe_opcode == 5'b00101) begin // MULT32
                    expected_state <= 1'b1; // WAIT_MAC
                end

            end else begin
                // Stalled state
                expected_q_en <= 1'b0;
                expected_a_en <= 1'b0;
                expected_mac_cmd <= 5'b00000;
                // expected_mac_cmd holds its value from the previous cycle (memory behavior)

                if (alu_done) begin
                    expected_state <= 1'b0; // IDLE
                end
            end
        end
    end

    // Real-Time Checker (Evaluates on negedge to let signals settle)
    always @(negedge clk) begin
        if (rst_n) begin
            if (alu_cmd !== expected_mac_cmd) begin
                $display("[FAIL] mac_cmd mismatch at %0t. Exp %0d, Got %0d", $time, expected_mac_cmd, alu_cmd);
                fail_count++;
            end
            if (quantize_en !== expected_q_en) begin
                $display("[FAIL] quantize_en mismatch at %0t. Exp %0b, Got %0b", $time, expected_q_en, quantize_en);
                fail_count++;
            end
            if (activation_en !== expected_a_en) begin
                $display("[FAIL] activation_en mismatch at %0t. Exp %0b, Got %0b", $time, expected_a_en, activation_en);
                fail_count++;
            end
            if (output_valid !== expected_out_valid) begin
                $display("[FAIL] output_valid mismatch at %0t. Exp %0b, Got %0b", $time, expected_out_valid, output_valid);
                fail_count++;
            end
            if (pe_ready !== (expected_state == 1'b0)) begin
                $display("[FAIL] pe_ready mismatch at %0t. Exp %0b, Got %0b", $time, (expected_state == 1'b0), pe_ready);
                fail_count++;
            end
        end
    end

    // Main Random Stimulus Driver
    initial begin
        $display("Starting PE_Controller Constrained Random Test...");
        
        // Initialize
        rst_n = 1'b1;
        pe_opcode = 5'b00000;
        alu_busy = 1'b0;
        alu_done = 1'b0;
        
        #1; rst_n = 1'b0; 
        @(posedge clk); #1; 
        rst_n = 1'b1;

        // Run 10,000 chaotic cycles
        for (int i = 0; i < loop_count; i++) begin
            @(posedge clk);
            
            // 3% chance to trigger a violent reset mid-operation
            if ($urandom_range(0, 100) < 3) begin
                rst_n = 1'b0;
                pe_opcode = 5'b00000;
            end else begin
                rst_n = 1'b1;
                // Randomize a 5-bit opcode
                pe_opcode = $urandom_range(0, 31);
                
                alu_busy = $urandom_range(0, 1);
                // Heavy bias toward 0 for mac_done to allow multi-cycle stalls
                alu_done = ($urandom_range(0, 10) > 8) ? 1'b1 : 1'b0; 
            end
        end

        // Log Results
        $display("----------------------------------------");
        $display("Constrained Random Simulation Complete!");
        $display("Cycles Tested: %0d", loop_count);
        $display("Total Errors:  %0d", fail_count);
        if (fail_count == 0) $display("Result: PERFECT PASS");
        $stop;
    end

endmodule

