`timescale 1ns/1ps

module MAC_and_SCALE_tb;

    logic clk, rst;
    logic [31:0] port_A, port_B;
    logic [63:0] accumulator;
    logic mode4x4, a_is_signed, b_is_signed, scale_mode;
    logic [1:0] scale_phase;
    logic mac4_en, mac8_en;
    logic [1:0] acc_source;
    logic acc_wr_en, acc_load, rst_acc;

    int pass_count, fail_count, test_count;
    logic signed [31:0] expected_lo;
    logic signed [63:0] expected_full;

    MAC_and_SCALE uut (
        .clk(clk), .rst(rst),
        .port_A(port_A), .port_B(port_B),
        .accumulator(accumulator),
        .mode4x4(mode4x4),
        .a_is_signed(a_is_signed), .b_is_signed(b_is_signed),
        .scale_mode(scale_mode),
        .scale_phase(scale_phase),
        .mac4_en(mac4_en), .mac8_en(mac8_en),
        .acc_source(acc_source),
        .acc_wr_en(acc_wr_en), .acc_load(acc_load), .rst_acc(rst_acc)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    // Golden reference

    function automatic logic signed [31:0] golden_mac8(input logic [31:0] A, input logic [31:0] B);
        logic signed [15:0] p0, p1, p2, p3;
        logic signed [17:0] s;
        p0 = $signed(A[7:0])   * $signed(B[7:0]);
        p1 = $signed(A[15:8])  * $signed(B[15:8]);
        p2 = $signed(A[23:16]) * $signed(B[23:16]);
        p3 = $signed(A[31:24]) * $signed(B[31:24]);
        s  = p0 + p1 + p2 + p3;
        return $signed({{14{s[17]}}, s});
    endfunction

    function automatic logic signed [31:0] golden_mac4(input logic [31:0] A, input logic [31:0] B);
        logic signed [3:0]  na, nb;
        logic signed [7:0]  prod;
        logic signed [10:0] s;
        s = '0;
        for (int i = 0; i < 8; i++) begin
            na = A[i*4 +: 4];
            nb = B[i*4 +: 4];
            prod = na * nb;
            s = s + prod;
        end
        return $signed({{21{s[10]}}, s});
    endfunction

    function automatic logic signed [63:0] golden_scale(input logic [31:0] acc_lo, input logic [31:0] B);
        logic signed [63:0] sx, zx;
        sx = $signed({{32{acc_lo[31]}}, acc_lo});
        zx = $signed({32'b0, B});
        return sx * zx;
    endfunction

    function automatic logic [31:0] rand_op();
        logic [31:0] r;
        if ($urandom_range(0,99) < 60) return $urandom();
        for (int b = 0; b < 4; b++) begin
            case ($urandom_range(0,5))
                0: r[b*8 +: 8] = 8'h00;
                1: r[b*8 +: 8] = 8'h01;
                2: r[b*8 +: 8] = 8'hFF;
                3: r[b*8 +: 8] = 8'h7F;
                4: r[b*8 +: 8] = 8'h80;
                default: r[b*8 +: 8] = $urandom();
            endcase
        end
        return r;
    endfunction

    // Driving tasks

    task automatic clear_controls();
        port_A = '0; port_B = '0;
        mode4x4 = 0; a_is_signed = 0; b_is_signed = 0;
        scale_mode = 0; scale_phase = 2'b00;
        mac4_en = 0; mac8_en = 0;
        acc_source = 2'b00; acc_wr_en = 0; acc_load = 0; rst_acc = 0;
    endtask

    task automatic apply_reset();
        @(negedge clk);
        rst = 0;
        clear_controls();
        repeat (2) @(negedge clk);
        rst = 1;
        @(negedge clk);
    endtask

    task automatic drive_idle(input int cycles);
        @(negedge clk);
        clear_controls();
        repeat (cycles) @(posedge clk);
        #1;
    endtask

    task automatic drive_rst_acc();
        @(negedge clk);
        clear_controls();
        rst_acc = 1;
        @(posedge clk); #1;
        rst_acc = 0;
    endtask

    task automatic drive_mac8(input logic [31:0] A, input logic [31:0] B);
        @(negedge clk);
        clear_controls();
        port_A = A; port_B = B;
        mode4x4 = 0; a_is_signed = 1; b_is_signed = 1;
        mac8_en = 1;
        acc_source = 2'b01; acc_wr_en = 1;
        @(posedge clk); #1;
    endtask

    task automatic drive_mac4(input logic [31:0] A, input logic [31:0] B);
        @(negedge clk);
        clear_controls();
        port_A = A; port_B = B;
        mode4x4 = 1; a_is_signed = 1; b_is_signed = 1;
        mac4_en = 1;
        acc_source = 2'b00; acc_wr_en = 1;
        @(posedge clk); #1;
    endtask

    task automatic drive_bias(input logic [31:0] B);
        @(negedge clk);
        clear_controls();
        port_B = B;
        acc_source = 2'b11; acc_wr_en = 1;
        @(posedge clk); #1;
    endtask

    task automatic drive_scale(input logic [31:0] B);
        // Cycle 0
        @(negedge clk);
        clear_controls();
        port_B = B;
        scale_mode = 1; scale_phase = 2'b00;
        acc_source = 2'b10; acc_wr_en = 1; acc_load = 1;
        @(posedge clk); #1;
        // Cycle 1 (SC1)
        @(negedge clk);
        acc_load = 0; scale_phase = 2'b01;
        @(posedge clk); #1;
        // Cycle 2 (SC2)
        @(negedge clk);
        scale_phase = 2'b10;
        @(posedge clk); #1;
        // Cycle 3 (SC3)
        @(negedge clk);
        scale_phase = 2'b11; a_is_signed = 1;
        @(posedge clk); #1;
        @(negedge clk);
        clear_controls();
    endtask

    // Checking tasks

    task automatic check_acc_lo(input string label, input logic signed [31:0] expected);
        if ($signed(accumulator[31:0]) === expected) begin
            $display("[PASS] %s", label); pass_count++;
        end else begin
            $display("[FAIL] %s | got=%0d (%h) exp=%0d (%h)", label,
                     $signed(accumulator[31:0]), accumulator[31:0], expected, expected);
            fail_count++;
        end
        test_count++;
    endtask

    task automatic check_acc_full(input string label, input logic signed [63:0] expected);
        if ($signed(accumulator) === expected) begin
            $display("[PASS] %s", label); pass_count++;
        end else begin
            $display("[FAIL] %s | got=%h exp=%h", label, accumulator, expected);
            fail_count++;
        end
        test_count++;
    endtask

    // Main test

    initial begin
        clear_controls();
        rst = 1;
        pass_count = 0; fail_count = 0; test_count = 0;
        #2;

        // PHASE 1: Reset & Hold
        $display("\n>>> Phase 1: Reset & Hold");
        apply_reset();
        if (accumulator !== 64'b0) begin $display("[FAIL] post-reset acc=%h", accumulator); fail_count++; end
        else begin $display("[PASS] reset clears acc"); pass_count++; end
        test_count++;

        drive_idle(5);
        if (accumulator !== 64'b0) begin $display("[FAIL] hold idle acc=%h", accumulator); fail_count++; end
        else begin $display("[PASS] hold during idle"); pass_count++; end
        test_count++;

        drive_mac8(32'h01010101, 32'h01010101);
        check_acc_lo("preload before rst_acc", 32'd4);
        drive_rst_acc();
        check_acc_lo("rst_acc clears", 32'd0);

        // PHASE 2: MAC8 Directed
        $display("\n>>> Phase 2: MAC8 Directed");
        apply_reset();
        drive_mac8(32'h00000000, 32'hDEADBEEF);
        check_acc_lo("MAC8 zero A", 32'd0);

        apply_reset();
        drive_mac8(32'hDEADBEEF, 32'h00000000);
        check_acc_lo("MAC8 zero B", 32'd0);

        apply_reset();
        drive_mac8(32'h01010101, 32'h01010101);
        check_acc_lo("MAC8 identity (4*1)", 32'd4);

        apply_reset();
        drive_mac8(32'h7F7F7F7F, 32'h7F7F7F7F);
        check_acc_lo("MAC8 max+ (4*127^2)", 32'd64516);

        apply_reset();
        drive_mac8(32'h80808080, 32'h80808080);
        check_acc_lo("MAC8 max- (4*128^2)", 32'd65536);

        apply_reset();
        drive_mac8(32'h7F7F8080, 32'h80807F7F);
        check_acc_lo("MAC8 mixed signs", golden_mac8(32'h7F7F8080, 32'h80807F7F));

        apply_reset();
        expected_lo = 0;
        for (int i = 0; i < 4; i++) begin
            drive_mac8(32'h01010101, 32'h01010101);
            expected_lo += golden_mac8(32'h01010101, 32'h01010101);
        end
        check_acc_lo("MAC8 accumulate 4x", expected_lo);

        apply_reset();
        drive_mac8(32'h7F7F7F7F, 32'h7F7F7F7F);
        drive_mac8(32'h7F7F7F7F, 32'h80808080);
        expected_lo = golden_mac8(32'h7F7F7F7F, 32'h7F7F7F7F)
                    + golden_mac8(32'h7F7F7F7F, 32'h80808080);
        check_acc_lo("MAC8 P+N cancellation", expected_lo);

        // PHASE 3: MAC4 Directed
        $display("\n>>> Phase 3: MAC4 Directed");
        apply_reset();
        drive_mac4(32'h00000000, 32'h12345678);
        check_acc_lo("MAC4 zero A", 32'd0);

        apply_reset();
        drive_mac4(32'h11111111, 32'h11111111);
        check_acc_lo("MAC4 identity (8*1)", 32'd8);

        apply_reset();
        drive_mac4(32'h77777777, 32'h77777777);
        check_acc_lo("MAC4 max+ (8*49)", 32'd392);

        apply_reset();
        drive_mac4(32'h88888888, 32'h88888888);
        check_acc_lo("MAC4 max- (8*64)", 32'd512);

        apply_reset();
        drive_mac4(32'h78787878, 32'h87878787);
        check_acc_lo("MAC4 mixed", golden_mac4(32'h78787878, 32'h87878787));

        apply_reset();
        expected_lo = 0;
        for (int i = 0; i < 8; i++) begin
            drive_mac4(32'h11111111, 32'h11111111);
            expected_lo += golden_mac4(32'h11111111, 32'h11111111);
        end
        check_acc_lo("MAC4 accumulate 8x", expected_lo);

        // PHASE 4: ADD_BIAS Directed
        $display("\n>>> Phase 4: ADD_BIAS Directed");
        apply_reset();
        drive_bias(32'h00000000);
        check_acc_lo("BIAS zero", 32'd0);

        apply_reset();
        for (int i = 0; i < 100; i++) drive_bias(32'd1);
        check_acc_lo("BIAS +1 *100", 32'd100);

        apply_reset();
        drive_bias(32'h80000000);
        check_acc_lo("BIAS most-neg", -32'sd2147483648);

        apply_reset();
        drive_bias(32'h7FFFFFFF);
        drive_bias(32'd1);
        check_acc_lo("BIAS overflow wrap", 32'sh80000000);

        apply_reset();
        drive_bias(32'sd1000000);
        drive_bias(-32'sd500000);
        check_acc_lo("BIAS mixed P+N", 32'sd500000);

        // PHASE 5: SCALE Directed
        $display("\n>>> Phase 5: SCALE Directed");
        apply_reset();
        drive_scale(32'hCAFEBABE);
        check_acc_full("SCALE 0 * any", 64'd0);

        apply_reset();
        drive_bias(32'd1);
        drive_scale(32'd1);
        check_acc_full("SCALE 1 * 1", 64'd1);

        apply_reset();
        drive_bias(32'd1);
        drive_scale(32'hFFFFFFFF);
        check_acc_full("SCALE 1 * max_u", 64'h0000_0000_FFFF_FFFF);

        apply_reset();
        drive_bias(32'hFFFFFFFF);
        drive_scale(32'hFFFFFFFF);
        check_acc_full("SCALE -1 * max_u", 64'hFFFF_FFFF_0000_0001);

        apply_reset();
        drive_bias(32'h7FFFFFFF);
        drive_scale(32'hFFFFFFFF);
        check_acc_full("SCALE max+ * max_u", golden_scale(32'h7FFFFFFF, 32'hFFFFFFFF));

        apply_reset();
        drive_bias(32'h80000000);
        drive_scale(32'hFFFFFFFF);
        check_acc_full("SCALE max- * max_u", golden_scale(32'h80000000, 32'hFFFFFFFF));

        apply_reset();
        drive_bias(32'h01010101);
        drive_scale(32'hFFFFFFFF);
        check_acc_full("SCALE carry-stress", golden_scale(32'h01010101, 32'hFFFFFFFF));

        apply_reset();
        drive_bias(32'hA1B2C3D4);
        drive_scale(32'h11223344);
        check_acc_full("SCALE distinct bytes", golden_scale(32'hA1B2C3D4, 32'h11223344));

        // PHASE 6: Operand Isolation
        $display("\n>>> Phase 6: Operand Isolation");
        apply_reset();
        drive_bias(32'd100);
        @(negedge clk);
        clear_controls();
        port_A = 32'h7F7F7F7F; port_B = 32'h7F7F7F7F;
        mode4x4 = 0; a_is_signed = 1; b_is_signed = 1;
        mac4_en = 0; mac8_en = 0;
        acc_source = 2'b01; acc_wr_en = 1;
        @(posedge clk); #1;
        clear_controls();
        check_acc_lo("MAC8 path with both iso=0 (addend=0)", 32'd100);

        apply_reset();
        drive_bias(32'd200);
        @(negedge clk);
        clear_controls();
        port_A = 32'h77777777; port_B = 32'h77777777;
        mode4x4 = 1; a_is_signed = 1; b_is_signed = 1;
        mac4_en = 0; mac8_en = 0;
        acc_source = 2'b00; acc_wr_en = 1;
        @(posedge clk); #1;
        clear_controls();
        check_acc_lo("MAC4 path with both iso=0 (addend=0)", 32'd200);

        // PHASE 7: Mixed Sequences
        $display("\n>>> Phase 7: Mixed Sequences");
        apply_reset();
        expected_lo = 0;
        drive_mac8(32'h01020304, 32'h05060708);
        expected_lo += golden_mac8(32'h01020304, 32'h05060708);
        drive_mac8(32'h0A0B0C0D, 32'h0E0F1011);
        expected_lo += golden_mac8(32'h0A0B0C0D, 32'h0E0F1011);
        expected_full = golden_scale(expected_lo, 32'h00000010);
        drive_scale(32'h00000010);
        check_acc_full("Seq: 2x MAC8 + SCALE", expected_full);

        apply_reset();
        expected_lo = 0;
        drive_mac4(32'h12345678, 32'h87654321);
        expected_lo += golden_mac4(32'h12345678, 32'h87654321);
        expected_full = golden_scale(expected_lo, 32'h0000000F);
        drive_scale(32'h0000000F);
        check_acc_full("Seq: MAC4 + SCALE", expected_full);

        apply_reset();
        drive_bias(32'sh1234);
        expected_full = golden_scale(32'sh1234, 32'h00010000);
        drive_scale(32'h00010000);
        check_acc_full("Seq: BIAS + SCALE", expected_full);

        apply_reset();
        drive_bias(32'sh4242);
        expected_full = golden_scale(32'sh4242, 32'h00000002);
        drive_scale(32'h00000002);
        check_acc_full("Seq: SCALE #1", expected_full);
        drive_rst_acc();
        drive_bias(32'sh1111);
        expected_full = golden_scale(32'sh1111, 32'h00000003);
        drive_scale(32'h00000003);
        check_acc_full("Seq: SCALE #2 after RST_ACC", expected_full);

        apply_reset();
        drive_mac8(32'h01010101, 32'h01010101);
        drive_mac8(32'h02020202, 32'h02020202);
        drive_rst_acc();
        drive_mac8(32'h03030303, 32'h03030303);
        check_acc_lo("Seq: RST_ACC mid-stream", golden_mac8(32'h03030303, 32'h03030303));

        // PHASE 8: Constrained Random
        $display("\n>>> Phase 8: Constrained Random (10000 ops)");
        apply_reset();
        begin : random_phase
            int p8_pass = 0, p8_fail = 0;
            logic signed [31:0] shadow_lo;
            logic signed [63:0] shadow_full;
            logic [31:0] randA, randB;
            int profile;

            shadow_lo   = '0;
            shadow_full = '0;

            for (int i = 0; i < 10000; i++) begin
                profile = $urandom_range(0, 3);
                randA = rand_op();
                randB = rand_op();

                case (profile)
                    0: begin
                        drive_mac8(randA, randB);
                        shadow_lo = shadow_lo + golden_mac8(randA, randB);
                        if ($signed(accumulator[31:0]) !== shadow_lo) begin
                            $display("[FAIL] R%0d MAC8 A=%h B=%h got=%0d exp=%0d",
                                     i, randA, randB, $signed(accumulator[31:0]), shadow_lo);
                            p8_fail++;
                        end else p8_pass++;
                    end
                    1: begin
                        drive_mac4(randA, randB);
                        shadow_lo = shadow_lo + golden_mac4(randA, randB);
                        if ($signed(accumulator[31:0]) !== shadow_lo) begin
                            $display("[FAIL] R%0d MAC4 A=%h B=%h got=%0d exp=%0d",
                                     i, randA, randB, $signed(accumulator[31:0]), shadow_lo);
                            p8_fail++;
                        end else p8_pass++;
                    end
                    2: begin
                        drive_bias(randB);
                        shadow_lo = shadow_lo + $signed(randB);
                        if ($signed(accumulator[31:0]) !== shadow_lo) begin
                            $display("[FAIL] R%0d BIAS B=%h got=%0d exp=%0d",
                                     i, randB, $signed(accumulator[31:0]), shadow_lo);
                            p8_fail++;
                        end else p8_pass++;
                    end
                    3: begin
                        shadow_full = golden_scale(shadow_lo, randB);
                        drive_scale(randB);
                        if ($signed(accumulator) !== shadow_full) begin
                            $display("[FAIL] R%0d SCALE pre_lo=%h B=%h got=%h exp=%h",
                                     i, shadow_lo, randB, accumulator, shadow_full);
                            p8_fail++;
                        end else p8_pass++;
                        shadow_lo = shadow_full[31:0];
                    end
                endcase
            end

            $display("Phase 8: %0d pass / %0d fail", p8_pass, p8_fail);
            pass_count += p8_pass;
            fail_count += p8_fail;
            test_count += (p8_pass + p8_fail);
        end

        // Summary
        $display("\n==========================================");
        $display("  MAC_SCALE TESTBENCH SUMMARY");
        $display("==========================================");
        $display("  Checks : %0d", test_count);
        $display("  Passes : %0d", pass_count);
        $display("  Fails  : %0d", fail_count);
        if (fail_count == 0) $display("  RESULT : ALL PASSED");
        else                 $display("  RESULT : FAILED");
        $display("==========================================\n");
        $finish;
    end

endmodule
