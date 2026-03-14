`timescale 1ns/1ps

module ALU_tb;
    logic clk;
    logic rst;
    logic [4:0]  alu_cmd;
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
        .alu_cmd(alu_cmd),
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
        alu_cmd = cmd;
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

        // =====================================================================
        // ORIGINAL TESTS (1-18)
        // =====================================================================

        // TEST 1: Async Hardware Reset
        rst = 1'b0;
        alu_cmd = NOP; // Required: safe value during reset
        op_A = 0;
        op_B = 0;
        @(posedge clk);
        @(posedge clk);
        rst = 1'b1;
        #1;
        check_result("Async Hardware Reset", 64'd0);

        // TEST 2: NOP Holds State
        // The NOP here IS the test — proves NOP ignores noisy inputs
        send_cmd(RST_ACC, 0, 0);
        send_cmd(ADD_BIAS, 0, 32'd13);
        send_cmd(NOP, 32'hFFFF_FFFF, 32'hFFFF_FFFF); // Required: this IS the test
        check_result("NOP holds state", 64'd13);

        // TEST 3: Synchronous RST_ACC
        send_cmd(ADD_BIAS, 0, 32'd99);
        send_cmd(RST_ACC, 0, 0);
        check_result("Synchronous RST_ACC", 64'd0);

        // TEST 4: Async Reset Mid-Operation
        send_cmd(RST_ACC, 0, 0);
        send_cmd(ADD_BIAS, 0, 32'd10);
        alu_cmd = MULT32;
        op_B = 32'd5;
        @(posedge clk);
        @(posedge clk);
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

        // TEST 5: ADD_BIAS Operation
        send_cmd(RST_ACC, 0, 0);
        send_cmd(ADD_BIAS, 32'd0, 32'd5);
        check_result("ADD_BIAS operation", 64'd5);

        // TEST 6: MAC4 Operation
        send_cmd(RST_ACC, 0, 0);
        send_cmd(MAC4, 32'h1111_1111, 32'h2222_2222);
        check_result("MAC4 operation", 64'd16);

        // TEST 7: MAC8 Operation
        send_cmd(RST_ACC, 0, 0);
        send_cmd(ADD_BIAS, 0, 32'd5);
        send_cmd(MAC8, {8'd1, 8'd1, 8'd1, 8'd1}, {8'd2, 8'd2, 8'd2, 8'd2});
        check_result("MAC8 operation", 64'd13);

        // TEST 8 & 9: Busy Flag Asserted AND MULT32 Sequence & Routing
        send_cmd(RST_ACC, 0, 0);
        send_cmd(ADD_BIAS, 0, 32'd13);
        alu_cmd = MULT32;
        op_B = 32'd3;
        @(posedge clk); 
        #1;
        if (busy !== 1'b1) begin
            $display("[FAIL] Busy flag did not assert immediately!");
            fail_count++;
        end else begin
            $display("[PASS] Busy flag asserted");
            pass_count++;
        end
        alu_cmd = MAC8;
        wait(done == 1'b1);
        #1;
        if (busy !== 1'b0) begin
            $display("[FAIL] Busy flag did not drop when done pulsed!");
            fail_count++;
        end
        check_result("MULT32 sequence & routing", 64'd39);

        // TEST 10: Back-to-Back Stress
        send_cmd(RST_ACC, 0, 0);
        send_cmd(MAC8, 32'h0101_0101, 32'h0101_0101); // Acc = 4
        send_cmd(MAC8, 32'h0101_0101, 32'h0101_0101); // Acc = 8
        send_cmd(MAC8, 32'h0101_0101, 32'h0101_0101); // Acc = 12
        check_result("Back-to-Back Stress", 64'd12);

        // TEST 11: FSM Immediate Re-trigger
        send_cmd(RST_ACC, 0, 0);
        send_cmd(ADD_BIAS, 0, 32'd2);
        alu_cmd = MULT32;
        op_B = 32'd3;
        @(posedge clk);
        wait(done == 1'b1);
        alu_cmd = MULT32;
        op_B = 32'd4;
        @(posedge clk);
        #1;
        alu_cmd = NOP; // Required: prevent MULT32 re-trigger while waiting for done
        wait(done == 1'b1);
        #1;
        check_result("FSM Immediate Re-trigger", 64'd24);

        // TEST 12: Negative Math & Sign Extension
        send_cmd(RST_ACC, 0, 0);
        send_cmd(ADD_BIAS, 0, 32'hFFFF_FFF6);
        send_cmd(MAC8, 32'hFEFE_FEFE, 32'h0303_0303);
        check_result("Negative Math & Sign Extension", 64'hFFFF_FFFF_FFFF_FFDE);

        // TEST 13: Unsigned MULT32 Scaling
        send_cmd(RST_ACC, 0, 0);
        send_cmd(ADD_BIAS, 0, 32'd5);
        alu_cmd = MULT32;
        op_B = 32'hFFFF_FFFF;
        @(posedge clk);
        wait(done == 1'b1);
        #1;
        check_result("Unsigned MULT32 Scaling", 64'h0000_0004_FFFF_FFFB);

        // TEST 14: Max Positive Carry Ripple
        send_cmd(RST_ACC, 0, 0);
        send_cmd(ADD_BIAS, 0, 32'h7FFF_FFFF);
        alu_cmd = MULT32;
        op_B = 32'hFFFF_FFFF;
        @(posedge clk);
        wait(done == 1'b1);
        #1;
        check_result("Max Positive Carry Ripple", 64'h7FFF_FFFE_8000_0001);

        // TEST 15: Max Negative Asymmetry
        send_cmd(RST_ACC, 0, 0);
        send_cmd(ADD_BIAS, 0, 32'h8000_0000); 
        alu_cmd = MULT32;
        op_B = 32'hFFFF_FFFF; 
        @(posedge clk);
        wait(done == 1'b1);
        #1;
        check_result("Max Negative Asymmetry", 64'h8000_0000_8000_0000);

        // TEST 16: Signed Zero-Crossing Wrap-Around
        send_cmd(RST_ACC, 0, 0);
        send_cmd(ADD_BIAS, 0, 32'hFFFF_FFFF);
        send_cmd(ADD_BIAS, 0, 32'd1);
        check_result("Signed Zero-Crossing Wrap-Around", 64'd0);

        // TEST 17: Multiply by Zero (Isolation)
        send_cmd(RST_ACC, 0, 0);
        send_cmd(ADD_BIAS, 0, 32'd99);
        alu_cmd = MULT32;
        op_B = 32'd0;
        @(posedge clk);
        wait(done == 1'b1);
        #1;
        check_result("Multiply by Zero (Isolation)", 64'd0);

        // TEST 18: Isolation Sign Toggle
        send_cmd(RST_ACC, 0, 0);
        send_cmd(ADD_BIAS, 0, 32'hFFFF_FFFF);
        alu_cmd = MULT32;
        op_B = 32'h0000_0001;
        @(posedge clk);
        wait(done == 1'b1);
        #1;
        check_result("Isolation Sign Toggle", 64'hFFFF_FFFF_FFFF_FFFF);

        // =====================================================================
        // NEW TESTS (19-26)
        // =====================================================================

        // TEST 19: MAC4 with Negative Nibbles
        send_cmd(RST_ACC, 0, 0);
        send_cmd(MAC4, 32'hF1F1_F1F1, 32'h2323_2323);
        check_result("MAC4 Negative Nibbles", 64'd4);

        // TEST 20: ADD_BIAS with Negative Value (Isolated)
        send_cmd(RST_ACC, 0, 0);
        send_cmd(ADD_BIAS, 0, 32'h8000_0000);
        check_result("ADD_BIAS Negative (Isolated)", 64'hFFFF_FFFF_8000_0000);

        // TEST 21: MAC8 with Negative Bytes from Zero
        send_cmd(RST_ACC, 0, 0);
        send_cmd(MAC8, 32'hFF80_017F, 32'h02FE_0380);
        check_result("MAC8 Negative Bytes from Zero", 64'hFFFF_FFFF_FFFF_C181);

        // TEST 22: Mode Switching MAC8 then MAC4 Back-to-Back
        send_cmd(RST_ACC, 0, 0);
        send_cmd(MAC8, {8'd2, 8'd2, 8'd2, 8'd2}, {8'd3, 8'd3, 8'd3, 8'd3});
        send_cmd(MAC4, 32'h1111_1111, 32'h2222_2222);
        check_result("Mode Switch MAC8 then MAC4", 64'd40);

        // TEST 23: Done Flag Pulse Width
        send_cmd(RST_ACC, 0, 0);
        send_cmd(ADD_BIAS, 0, 32'd7);
        alu_cmd = MULT32;
        op_B = 32'd2;
        @(posedge clk);
        wait(done == 1'b1);
        #1;
        send_cmd(NOP, 0, 0); // Required: testing that NOP clears the done flag
        if (done === 1'b0) begin
            $display("[PASS] Done flag pulse width (single cycle)");
            pass_count++;
        end else begin
            $display("[FAIL] Done flag stuck high after NOP | done=%0b", done);
            fail_count++;
        end

        // TEST 24: RST_ACC Preserves Status Flags
        send_cmd(RST_ACC, 0, 0);
        send_cmd(ADD_BIAS, 0, 32'd10);
        alu_cmd = MULT32;
        op_B = 32'd2;
        @(posedge clk);
        wait(done == 1'b1);
        #1;
        send_cmd(RST_ACC, 0, 0);
        if (accumulator === 64'd0 && done === 1'b1 && busy === 1'b0) begin
            $display("[PASS] RST_ACC preserves done flag");
            pass_count++;
        end else begin
            $display("[FAIL] RST_ACC disturbed status flags | acc=%0h, done=%0b, busy=%0b",
                     accumulator, done, busy);
            fail_count++;
        end
        send_cmd(NOP, 0, 0); // Required: testing that NOP clears done after RST_ACC
        if (done === 1'b0) begin
            $display("[PASS] NOP clears done flag after RST_ACC");
            pass_count++;
        end else begin
            $display("[FAIL] Done flag stuck high after NOP following RST_ACC | done=%0b", done);
            fail_count++;
        end

        // TEST 25: MULT32 with Nonzero Upper Accumulator Bits
        send_cmd(RST_ACC, 0, 0);
        send_cmd(ADD_BIAS, 0, 32'h7FFF_FFFF);
        alu_cmd = MULT32;
        op_B = 32'd3;
        @(posedge clk);
        wait(done == 1'b1);
        #1;
        check_result("MULT32 Upper Bits Setup", 64'h0000_0001_7FFF_FFFD);
        alu_cmd = MULT32;
        op_B = 32'd2;
        @(posedge clk);
        wait(done == 1'b1);
        #1;
        check_result("MULT32 with Nonzero Upper Bits", 64'h0000_0000_FFFF_FFFA);
        send_cmd(NOP, 0, 0); // Required: flush alu_cmd from MULT32 to prevent state contamination

        // TEST 26: True 64-bit Accumulator Rollover
        // Full async reset required — RST_ACC doesn't flush latched_mult_A or FSM state
        rst = 1'b0;
        alu_cmd = NOP; // Required: safe value during reset
        op_A = 0;
        op_B = 0;
        @(posedge clk);
        rst = 1'b1;
        #1;
        send_cmd(ADD_BIAS, 0, 32'h7FFF_FFFF);
        alu_cmd = MULT32;
        op_B = 32'hFFFF_FFFF;
        @(posedge clk);
        wait(done == 1'b1);
        #1;
        check_result("Rollover MULT32 base", 64'h7FFF_FFFE_8000_0001);
        send_cmd(ADD_BIAS, 0, 32'h7FFF_FFFF);
        send_cmd(ADD_BIAS, 0, 32'h7FFF_FFFF);
        send_cmd(ADD_BIAS, 0, 32'h7FFF_FFFF);
        send_cmd(ADD_BIAS, 0, 32'h0000_0001);
        check_result("True 64-bit Max Positive", 64'h7FFF_FFFF_FFFF_FFFF);
        send_cmd(ADD_BIAS, 0, 32'h0000_0001);
        check_result("True 64-bit Rollover", 64'h8000_0000_0000_0000);

        // =====================================================================
        // FINISH
        // =====================================================================
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
        $stop;
    end
endmodule