`timescale 1ns/1ps

module Requantizer_tb;

    // 1. Signals matching the Requantizer interface
    logic clk;
    logic rst_n;
    logic quantize_en;
    logic signed [63:0] acc;
    logic [5:0] shamt;
    
    logic signed [7:0] activation_in;

    // Log counters
    int pass_count = 0;
    int fail_count = 0;

    // 2. Instantiate the Design Under Test (DUT)
    Requantizer uut (
        .clk(clk),
        .rst(rst),
        .quantize_en(quantize_en),
        .acc(acc),
        .shamt(shamt),
        .activation_in(activation_in)
    );

    // 3. Clock Generation (10ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Helper Task to check the output exactly one cycle later
    task check_result(input string test_name, input logic signed [7:0] expected);
        @(posedge clk);
        #1; // Wait a fraction of a nanosecond for the output register to settle
        if (activation_in === expected) begin
            $display("[PASS] %s", test_name);
            pass_count++;
        end else begin
            $display("[FAIL] %s | Expected: %0d, Got: %0d", test_name, expected, activation_in);
            fail_count++;
        end
    endtask

    // 4. Main Directed Test Sequence
    initial begin
        $display("Starting Requantizer Directed Tests...");
        $display("----------------------------------------");

        // Initialization
        rst = 1'b0;
        quantize_en = 1'b0;
        acc = 64'sd0;
        shamt = 6'd0;
        @(posedge clk);
        @(posedge clk);
        rst = 1'b1;
        #1;

        // TEST 1: Output Isolation & Clock Enable
        // Send data but keep quantize_en = 0. Output should remain 0.
        acc = 64'sd100;
        shamt = 6'd0;
        check_result("Output Isolation (quantize_en=0)", 8'sd0);

        // Turn on enable for the rest of the tests
        quantize_en = 1'b1;

        // TEST 2: Zero-Shift Bypass (shamt = 0)
        acc = 64'sd50;
        shamt = 6'd0;
        check_result("Zero-Shift Bypass (In Range)", 8'sd50);

        acc = 64'sd50000;
        shamt = 6'd0;
        check_result("Zero-Shift Bypass (Overflow High)", 8'sd127);

        acc = -64'sd50000;
        shamt = 6'd0;
        check_result("Zero-Shift Bypass (Overflow Low)", -8'sd128);

        // TEST 3: Precision Rounding (The Half-Way Tiebreaker)
        // 3 shifted right by 1 is 1.5. Hardware should round to 2.
        acc = 64'sd3;
        shamt = 6'd1;
        check_result("Precision Rounding (+1.5 -> 2)", 8'sd2);

        // -3 shifted right by 1 is -1.5. Hardware should round to -1.
        acc = -64'sd3;
        shamt = 6'd1;
        check_result("Precision Rounding (-1.5 -> -1)", -8'sd1);

        // 5 shifted right by 2 is 1.25. Hardware should truncate to 1.
        acc = 64'sd5;
        shamt = 6'd2;
        check_result("Precision Rounding (+1.25 -> 1)", 8'sd1);

        // TEST 4: The Saturation Cliff (Boundary Testing)
        // Target: Exactly 127
        acc = 64'sd254; 
        shamt = 6'd1; // 254 / 2 = 127
        check_result("Saturation Cliff (Exactly +127)", 8'sd127);

        // Target: Exactly 128 (Must clamp to 127)
        acc = 64'sd256;
        shamt = 6'd1; // 256 / 2 = 128
        check_result("Saturation Cliff (+128 clamps to +127)", 8'sd127);

        // Target: Exactly -128 
        acc = -64'sd256;
        shamt = 6'd1; // -256 / 2 = -128
        check_result("Saturation Cliff (Exactly -128)", -8'sd128);

        // Target: Exactly -129 (Must clamp to -128)
        acc = -64'sd258;
        shamt = 6'd1; // -258 / 2 = -129
        check_result("Saturation Cliff (-129 clamps to -128)", -8'sd128);

        // TEST 5: The Absolute 64-bit Limits (Max Shift)
        acc = 64'h7FFF_FFFF_FFFF_FFFF; // Max positive 64-bit number
        shamt = 6'd63; // Divide by 2^63
        // Result is approx 0.5, which rounds up to 1
        check_result("Absolute Max Positive (Shift 63 -> 1)", 8'sd1);

        acc = 64'h8000_0000_0000_0000; // Max negative 64-bit number
        shamt = 6'd63; // Divide by 2^63
        // Result is exactly -1
        check_result("Absolute Max Negative (Shift 63 -> -1)", -8'sd1);

        // TEST 6: The Fractional Zero Traps (+0.5 vs -0.5)
        acc = 64'sd1;
        shamt = 6'd1; // 1 / 2 = 0.5
        check_result("Fractional Zero (+0.5 rounds to 1)", 8'sd1);

        acc = -64'sd1;
        shamt = 6'd1; // -1 / 2 = -0.5
        check_result("Fractional Zero (-0.5 rounds to 0)", 8'sd0);

        // TEST 7: Complete Underflow
        acc = 64'sd100;
        shamt = 6'd20; // Shifted into oblivion
        check_result("Complete Underflow to Zero", 8'sd0);

        // TEST 8: Sequential Clock Enable Stress
        // Load a clean value
        quantize_en = 1'b1;
        acc = 64'sd42;
        shamt = 6'd0;
        check_result("Sequential Enable (Load 42)", 8'sd42);

        // Drop enable, change inputs entirely
        quantize_en = 1'b0;
        acc = -64'sd99;
        shamt = 6'd2;
        // Output should ignore the new inputs and hold 42
        check_result("Sequential Enable (Hold State)", 8'sd42);

        // Re-assert enable to capture new inputs (-99 / 4 = -24.75 -> -25)
        quantize_en = 1'b1;
        check_result("Sequential Enable (Capture New Data)", -8'sd25);

        // 5. Finish and Log Results
        $display("----------------------------------------");
        $display("Directed Simulation Complete!");
        $display("Total Passes: %0d", pass_count);
        $display("Total Fails:  %0d", fail_count);
        $finish;
    end

endmodule
