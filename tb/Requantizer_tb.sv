`timescale 1ns/1ps

module Requantizer_tb;

    logic signed [63:0] accumulator;
    logic [5:0] shamt;
    logic mode4x4;
    logic signed [7:0] activation_in;

    int pass_count = 0;
    int fail_count = 0;

    Requantizer uut (
        .accumulator(accumulator),
        .shamt(shamt),
        .mode4x4(mode4x4),
        .activation_in(activation_in)
    );

    // Golden reference models

    function automatic logic signed [7:0] golden_int8(
        input logic signed [63:0] x,
        input logic [5:0] s
    );
        logic signed [63:0] rounded;
        if (s == 0)
            rounded = x;
        else
            rounded = (x + (64'sd1 <<< (s - 1))) >>> s;
        if (rounded > 127)  return 8'sd127;
        if (rounded < -128) return -8'sd128;
        return rounded[7:0];
    endfunction

    function automatic logic signed [7:0] golden_int4(
        input logic signed [63:0] x,
        input logic [5:0] s
    );
        logic signed [63:0] rounded;
        logic signed [3:0]  clamped4;
        if (s == 0)
            rounded = x;
        else
            rounded = (x + (64'sd1 <<< (s - 1))) >>> s;
        if (rounded > 7)  clamped4 = 4'sd7;
        else if (rounded < -8) clamped4 = -4'sd8;
        else clamped4 = rounded[3:0];
        return {{4{clamped4[3]}}, clamped4};
    endfunction

    // Directed-test helper

    task automatic check_result(input string test_name, input logic signed [7:0] expected);
        #10;
        if (activation_in === expected) begin
            $display("[PASS] %s", test_name);
            pass_count++;
        end else begin
            $display("[FAIL] %s | Expected: %0d, Got: %0d", test_name, expected, activation_in);
            fail_count++;
        end
    endtask

    // Main test sequence

    initial begin
        accumulator = '0;
        shamt = '0;
        mode4x4 = 1'b0;

        // PHASE 1 — DIRECTED TESTS

        $display("========================================");
        $display("PHASE 1: Directed Tests");
        $display("========================================");

        // INT8 Mode

        $display("--- INT8 Mode ---");

        // Zero-shift bypass

        accumulator = 64'sd50; shamt = 6'd0; check_result("Zero-Shift Bypass (In Range, +50)", 8'sd50);
        accumulator = 64'sd50000; shamt = 6'd0; check_result("Zero-Shift Bypass (Overflow High)", 8'sd127);
        accumulator = -64'sd50000; shamt = 6'd0; check_result("Zero-Shift Bypass (Overflow Low)", -8'sd128);
        accumulator = 64'sd0; shamt = 6'd0; check_result("Zero-Shift Bypass (Zero)", 8'sd0);

        // Saturation cliff

        accumulator = 64'sd254; shamt = 6'd1; check_result("Saturation Cliff (Exactly +127)", 8'sd127);
        accumulator = 64'sd256; shamt = 6'd1; check_result("Saturation Cliff (+128 clamps to +127)", 8'sd127);
        accumulator = -64'sd256; shamt = 6'd1; check_result("Saturation Cliff (Exactly -128)", -8'sd128);
        accumulator = -64'sd258; shamt = 6'd1; check_result("Saturation Cliff (-129 clamps to -128)",-8'sd128);
        accumulator = 64'sd255; shamt = 6'd1; check_result("Rounding Overflow Cliff (+127.5 -> +127)",8'sd127);

        // Precision rounding

        accumulator = 64'sd3; shamt = 6'd1; check_result("Precision Rounding (+1.5 -> 2)", 8'sd2);
        accumulator = -64'sd3; shamt = 6'd1; check_result("Precision Rounding (-1.5 -> -1)", -8'sd1);
        accumulator = 64'sd5; shamt = 6'd2; check_result("Precision Rounding (+1.25 -> 1)", 8'sd1);
        accumulator = 64'sd11; shamt = 6'd2; check_result("Precision Rounding (+2.75 -> 3)", 8'sd3);
        accumulator = -64'sd11; shamt = 6'd2; check_result("Precision Rounding (-2.75 -> -3)", -8'sd3);

        // Fractional zero traps

        accumulator = 64'sd1; shamt = 6'd1; check_result("Fractional Zero (+0.5 rounds to 1)", 8'sd1);
        accumulator = -64'sd1; shamt = 6'd1; check_result("Fractional Zero (-0.5 rounds to 0)", 8'sd0);

        // 64-bit limits

        accumulator = 64'h7FFF_FFFF_FFFF_FFFF; shamt = 6'd63;
        check_result("Absolute Max Positive (Shift 63 -> 1)", 8'sd1);
        accumulator = 64'h8000_0000_0000_0000; shamt = 6'd63;
        check_result("Absolute Max Negative (Shift 63 -> -1)", -8'sd1);

        // Complete underflow

        accumulator = 64'sd100; shamt = 6'd20; check_result("Complete Underflow to Zero", 8'sd0);
        accumulator = -64'sd100; shamt = 6'd20; check_result("Complete Underflow Negative to Zero", 8'sd0);

        // Large values with moderate shift

        accumulator = 64'sd1000000; shamt = 6'd20;
        check_result("Large Positive Moderate Shift", golden_int8(64'sd1000000, 6'd20));
        accumulator = -64'sd1000000; shamt = 6'd20;
        check_result("Large Negative Moderate Shift", golden_int8(-64'sd1000000, 6'd20));

        // Power-of-two divisions

        accumulator = 64'sd1024; shamt = 6'd10; check_result("Exact Power-of-Two (1024 >> 10)", 8'sd1);
        accumulator = 64'sd1024; shamt = 6'd5; check_result("Power-of-Two (1024 >> 5)", 8'sd32);
        accumulator = 64'sd1024; shamt = 6'd3; check_result("Power-of-Two Overflow (1024 >> 3)", 8'sd127);

        // INT4 Mode

        $display("");
        $display("--- INT4 Mode ---");
        mode4x4 = 1'b1;

        // Zero-shift bypass

        accumulator = 64'sd5; shamt = 6'd0; check_result("INT4 Zero-Shift (In Range, +5)", golden_int4(64'sd5, 6'd0));
        accumulator = -64'sd6; shamt = 6'd0; check_result("INT4 Zero-Shift (In Range, -6)", golden_int4(-64'sd6, 6'd0));
        accumulator = 64'sd50; shamt = 6'd0; check_result("INT4 Zero-Shift (Overflow High -> +7)", golden_int4(64'sd50, 6'd0));
        accumulator = -64'sd50; shamt = 6'd0; check_result("INT4 Zero-Shift (Overflow Low -> -8)", golden_int4(-64'sd50, 6'd0));

        // Saturation cliff

        accumulator = 64'sd14; shamt = 6'd1; check_result("INT4 Saturation Cliff (Exactly +7)", golden_int4(64'sd14, 6'd1));
        accumulator = 64'sd16; shamt = 6'd1; check_result("INT4 Saturation Cliff (+8 clamps to +7)", golden_int4(64'sd16, 6'd1));
        accumulator = -64'sd16; shamt = 6'd1; check_result("INT4 Saturation Cliff (Exactly -8)", golden_int4(-64'sd16, 6'd1));
        accumulator = -64'sd18; shamt = 6'd1; check_result("INT4 Saturation Cliff (-9 clamps to -8)", golden_int4(-64'sd18, 6'd1));

        // Rounding overflow

        accumulator = 64'sd15;  shamt = 6'd1; check_result("INT4 Rounding Overflow (+7.5 -> +7)", golden_int4(64'sd15, 6'd1));

        // Precision rounding

        accumulator = 64'sd3; shamt = 6'd1; check_result("INT4 Precision Rounding (+1.5 -> 2)", golden_int4(64'sd3, 6'd1));
        accumulator = -64'sd3; shamt = 6'd1; check_result("INT4 Precision Rounding (-1.5 -> -1)", golden_int4(-64'sd3, 6'd1));

        // Fractional zero traps

        accumulator = 64'sd1; shamt = 6'd1; check_result("INT4 Fractional Zero (+0.5 -> 1)", golden_int4(64'sd1,  6'd1));
        accumulator = -64'sd1; shamt = 6'd1; check_result("INT4 Fractional Zero (-0.5 -> 0)", golden_int4(-64'sd1, 6'd1));

        // Sign extension

        accumulator = -64'sd4; shamt = 6'd0; check_result("INT4 Sign Extension (-4 -> 8'hFC)", 8'hFC);
        accumulator = 64'sd3; shamt = 6'd0; check_result("INT4 Sign Extension (+3 -> 8'h03)", 8'h03);

        // 64-bit limits

        accumulator = 64'h7FFF_FFFF_FFFF_FFFF; shamt = 6'd63;
        check_result("INT4 Absolute Max Positive (Shift 63)", 8'sd1);
        accumulator = 64'h8000_0000_0000_0000; shamt = 6'd63;
        check_result("INT4 Absolute Max Negative (Shift 63)", golden_int4(64'h8000_0000_0000_0000, 6'd63));

        // Complete underflow

        accumulator = 64'sd3; shamt = 6'd20;
        check_result("INT4 Complete Underflow to Zero", golden_int4(64'sd3, 6'd20));

        // Mode Switching

        $display("");
        $display("--- Mode Switching ---");

        accumulator = 64'sd100; shamt = 6'd0;
        mode4x4 = 1'b0; #10;
        check_result("Same Input INT8 (100)", 8'sd100);
        mode4x4 = 1'b1;
        check_result("Same Input INT4 (100 -> +7)", golden_int4(64'sd100, 6'd0));

        accumulator = 64'sd10; shamt = 6'd0;
        mode4x4 = 1'b0;
        check_result("Fits INT8 Not INT4: INT8 (10)", 8'sd10);
        mode4x4 = 1'b1;
        check_result("Fits INT8 Not INT4: INT4 (+7)", golden_int4(64'sd10, 6'd0));

        $display("");
        $display("Phase 1 complete — Passes: %0d, Fails: %0d", pass_count, fail_count);

        // PHASE 2 — RANDOM TESTS

        $display("");
        $display("========================================");
        $display("PHASE 2: Random Tests (10000 vectors x INT8 + INT4)");
        $display("========================================");

        begin : random_phase
            int p2_pass = 0;
            int p2_fail = 0;
            logic signed [7:0] expected;

            repeat (10000) begin
                int profile;
                profile = $urandom_range(0, 9);
                shamt   = $urandom_range(0, 32);
                mode4x4 = $urandom_range(0, 1);

                // Profile A (40%): values near the representable range
                // Profile B (40%): full 64-bit random
                // Profile C (20%): 32-bit random (small values)

                if (profile < 4) accumulator = $signed($urandom()) % (64'sd256 << shamt);
                else if (profile < 8) accumulator = {$urandom(), $urandom()};
                else accumulator = $signed($urandom());

                #1;

                expected = mode4x4 ? golden_int4(accumulator, shamt)
                                   : golden_int8(accumulator, shamt);

                if (activation_in !== expected) begin
                    $display("[FAIL] mode4x4=%0b acc=%0h shamt=%0d | Expected: %0d, Got: %0d",
                             mode4x4, accumulator, shamt, expected, activation_in);
                    p2_fail++;
                end else begin
                    p2_pass++;
                end
            end

            $display("Phase 2 complete — Passes: %0d, Fails: %0d", p2_pass, p2_fail);
            pass_count += p2_pass;
            fail_count += p2_fail;
        end

        // SUMMARY

        $display("");
        $display("========================================");
        $display("All Tests Complete!");
        $display("Total Passes: %0d", pass_count);
        $display("Total Fails:  %0d", fail_count);
        $display("========================================");
        $stop;
    end

endmodule
