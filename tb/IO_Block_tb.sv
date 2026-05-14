`timescale 1ns / 1ps

// =============================================================================
// IO_Block_tb.sv
// Unit testbench for the IO Block module.
// Implements the test plan defined in the IO Block Unit Testing Document.
// =============================================================================

module IO_Block_tb;

    // ------------------------------------------------------------------------
    // Parameters
    // ------------------------------------------------------------------------
    localparam int CLK_PERIOD  = 10;
    localparam int RAND_CYCLES = 10_000;

    // ------------------------------------------------------------------------
    // DUT I/O
    // ------------------------------------------------------------------------
    logic        clk;
    logic        rst;
    logic [31:0] operand_A;
    logic [31:0] operand_B;
    logic        valid_A;
    logic        valid_B;
    logic        chp_slct;
    logic        pe_ready;
    logic        ppu_en;
    logic        read_acc_en;
    logic        read_cfg_en;
    logic [63:0] accumulator;
    logic [7:0]  activation_out;
    logic [3:0]  config_out;
    wire  [31:0] operand_A_reg;
    wire  [31:0] operand_B_reg;
    wire  [7:0]  data_out;

    IO_Block uut (
        .clk(clk), .rst(rst),
        .operand_A(operand_A),         .operand_B(operand_B),
        .valid_A(valid_A),             .valid_B(valid_B),
        .chp_slct(chp_slct),           .pe_ready(pe_ready),
        .ppu_en(ppu_en),
        .read_acc_en(read_acc_en),     .read_cfg_en(read_cfg_en),
        .accumulator(accumulator),
        .activation_out(activation_out),
        .config_out(config_out),
        .operand_A_reg(operand_A_reg),
        .operand_B_reg(operand_B_reg),
        .data_out(data_out)
    );

    // Clock
    initial clk = 0;
    always #(CLK_PERIOD/2) clk = ~clk;

    // ------------------------------------------------------------------------
    // Reference model state
    // ------------------------------------------------------------------------
    logic [31:0] op_A_m;
    logic [31:0] op_B_m;
    logic [7:0]  dout_m;

    // Pass / fail tracking
    int pass_count = 0;
    int fail_count = 0;
    int test_count = 0;

    // ------------------------------------------------------------------------
    // Group 7: Protocol Assertions (always-on, boundary-level)
    // ------------------------------------------------------------------------
    property p_no_simul_reads;
        @(posedge clk) disable iff (!rst) !(read_acc_en && read_cfg_en);
    endproperty
    a_mut_excl: assert property (p_no_simul_reads)
        else begin
            $display("  [ASSERT FAIL] simultaneous read enables @ %0t", $time);
            fail_count++;
        end

    // ------------------------------------------------------------------------
    // Reference model update
    //   Mirrors DUT update order: registered reads use OLD register values,
    //   then the new register state is committed.
    // ------------------------------------------------------------------------
    task automatic model_update();
        logic [31:0] new_op_A;
        logic [31:0] new_op_B;
        logic [7:0]  new_dout;
        logic [7:0]  byte_mux_m;
        logic [7:0]  out_src_m;
        if (!rst) begin
            new_op_A = 32'b0;
            new_op_B = 32'b0;
            new_dout = 8'b0;
        end else begin
            // Combinational: byte mux uses OLD op_A_m
            byte_mux_m = read_acc_en ? accumulator[8*op_A_m[2:0] +: 8] : 8'b0;
            if      (read_acc_en) out_src_m = byte_mux_m;
            else if (read_cfg_en) out_src_m = {4'b0, config_out};
            else                  out_src_m = activation_out;
            // Sequential: commit at edge
            new_op_A = (valid_A & pe_ready & chp_slct) ? operand_A : op_A_m;
            new_op_B = (valid_B & pe_ready & chp_slct) ? operand_B : op_B_m;
            new_dout = (ppu_en | read_acc_en | read_cfg_en) ? out_src_m : dout_m;
        end
        op_A_m = new_op_A;
        op_B_m = new_op_B;
        dout_m = new_dout;
    endtask

    // ------------------------------------------------------------------------
    // Output checker — compares DUT against reference model
    // ------------------------------------------------------------------------
    task automatic check_outputs(input string ctx);
        if (operand_A_reg !== op_A_m) begin
            $display("  [FAIL] %s: operand_A_reg got %08h exp %08h",
                     ctx, operand_A_reg, op_A_m);
            fail_count++;
        end else pass_count++;
        test_count++;
        if (operand_B_reg !== op_B_m) begin
            $display("  [FAIL] %s: operand_B_reg got %08h exp %08h",
                     ctx, operand_B_reg, op_B_m);
            fail_count++;
        end else pass_count++;
        test_count++;
        if (data_out !== dout_m) begin
            $display("  [FAIL] %s: data_out got %02h exp %02h",
                     ctx, data_out, dout_m);
            fail_count++;
        end else pass_count++;
        test_count++;
    endtask

    // ------------------------------------------------------------------------
    // Helpers
    // ------------------------------------------------------------------------
    task automatic clear_inputs();
        operand_A = 0; operand_B = 0;
        valid_A   = 0; valid_B   = 0;
        chp_slct  = 0; pe_ready  = 0;
        ppu_en    = 0; read_acc_en = 0; read_cfg_en = 0;
        accumulator = 0; activation_out = 0; config_out = 0;
    endtask

    // Advance one clock; update model; check outputs
    task automatic tick(input string ctx);
        @(posedge clk);
        model_update();
        #1;
        check_outputs(ctx);
    endtask

    // Clean asynchronous reset sequence with model resync
    task automatic apply_reset();
        rst = 1'b0;
        clear_inputs();
        #(CLK_PERIOD * 2);
        op_A_m = 0; op_B_m = 0; dout_m = 0;
        rst = 1'b1;
        @(posedge clk); #1;
    endtask

    // ------------------------------------------------------------------------
    // Main test sequence
    // ------------------------------------------------------------------------
    initial begin
        $display("============================================================");
        $display("   IO BLOCK TESTBENCH");
        $display("============================================================\n");

        rst = 0; clear_inputs();
        op_A_m = 0; op_B_m = 0; dout_m = 0;

        // ====================================================================
        // Group 1 — Asynchronous Reset
        // ====================================================================
        $display(">>> Group 1: Asynchronous Reset");
        apply_reset();
        if (operand_A_reg !== 0 || operand_B_reg !== 0 || data_out !== 0) begin
            $display("  [FAIL] 1.1: post-reset state nonzero"); fail_count++;
        end else begin
            $display("  [PASS] 1.1: Power-on reset"); pass_count++;
        end
        test_count++;

        // 1.2: Populate registers, assert async reset between edges
        clear_inputs();
        operand_A = 32'hAABB_CCDD; valid_A = 1;
        operand_B = 32'h1122_3344; valid_B = 1;
        chp_slct = 1; pe_ready = 1;
        ppu_en = 1; activation_out = 8'h5A;
        tick("1.2 capture");
        clear_inputs();
        rst = 1'b0; #2;
        if (operand_A_reg !== 0 || operand_B_reg !== 0 || data_out !== 0) begin
            $display("  [FAIL] 1.2: async reset incomplete"); fail_count++;
        end else begin
            $display("  [PASS] 1.2: Mid-operation async reset"); pass_count++;
        end
        test_count++;
        apply_reset();

        // 1.3: Reset hold dominates random input traffic
        begin
            int eb = fail_count;
            rst = 1'b0;
            for (int i = 0; i < 10; i++) begin
                operand_A = $urandom; operand_B = $urandom;
                valid_A = $urandom & 1; valid_B = $urandom & 1;
                chp_slct = $urandom & 1; pe_ready = $urandom & 1;
                ppu_en = $urandom & 1;
                read_acc_en = $urandom & 1; read_cfg_en = 0;
                accumulator = {$urandom, $urandom};
                activation_out = $urandom; config_out = $urandom;
                @(posedge clk); #1;
                if (operand_A_reg !== 0 || operand_B_reg !== 0 || data_out !== 0) begin
                    $display("  [FAIL] 1.3 cycle %0d", i); fail_count++; break;
                end
            end
            if (fail_count == eb) begin
                $display("  [PASS] 1.3: Reset hold dominates inputs");
                pass_count++;
            end
            test_count++;
        end
        apply_reset();

        // ====================================================================
        // Group 2 — Input Register Bank: Capture Conditions
        // ====================================================================
        $display("\n>>> Group 2: Input Register Capture Conditions");

        // 2.1: valid_A x pe_ready x chp_slct truth table for operand_A
        begin int eb = fail_count;
            for (int i = 0; i < 8; i++) begin
                clear_inputs();
                operand_A = 32'hCAFE_0000 | i;
                {chp_slct, pe_ready, valid_A} = i[2:0];
                tick($sformatf("2.1 i=%0d", i));
            end
            if (fail_count == eb)
                $display("  [PASS] 2.1: operand_A capture truth table");
        end

        // 2.2: same for operand_B
        begin int eb = fail_count;
            for (int i = 0; i < 8; i++) begin
                clear_inputs();
                operand_B = 32'hBEEF_0000 | i;
                {chp_slct, pe_ready, valid_B} = i[2:0];
                tick($sformatf("2.2 i=%0d", i));
            end
            if (fail_count == eb)
                $display("  [PASS] 2.2: operand_B capture truth table");
        end

        // 2.3: Channel independence
        begin int eb = fail_count;
            clear_inputs();
            chp_slct = 1; pe_ready = 1;
            for (int i = 0; i < 4; i++) begin
                operand_A = 32'hA000_0000 | i;
                operand_B = 32'hB000_0000 | i;
                valid_A = 1; valid_B = 0;
                tick($sformatf("2.3 onlyA[%0d]", i));
            end
            for (int i = 0; i < 4; i++) begin
                operand_A = 32'hA111_0000 | i;
                operand_B = 32'hB111_0000 | i;
                valid_A = 0; valid_B = 1;
                tick($sformatf("2.3 onlyB[%0d]", i));
            end
            if (fail_count == eb)
                $display("  [PASS] 2.3: Channel independence");
        end

        // 2.4: Continuous streaming
        begin int eb = fail_count;
            clear_inputs();
            chp_slct = 1; pe_ready = 1; valid_A = 1; valid_B = 1;
            for (int i = 0; i < 32; i++) begin
                operand_A = 32'h1000_0000 + i;
                operand_B = 32'h2000_0000 + i;
                tick($sformatf("2.4 stream[%0d]", i));
            end
            if (fail_count == eb)
                $display("  [PASS] 2.4: Continuous streaming");
        end

        // 2.5: Mid-stream gating via chp_slct
        begin int eb = fail_count;
            clear_inputs();
            chp_slct = 1; pe_ready = 1; valid_A = 1; valid_B = 1;
            operand_A = 32'hABCD_0001; operand_B = 32'hDCBA_0001;
            tick("2.5 pre-gate");
            chp_slct = 0;
            for (int i = 0; i < 5; i++) begin
                operand_A = $urandom; operand_B = $urandom;
                tick($sformatf("2.5 gated[%0d]", i));
            end
            chp_slct = 1;
            operand_A = 32'hABCD_0002; operand_B = 32'hDCBA_0002;
            tick("2.5 post-gate");
            if (fail_count == eb)
                $display("  [PASS] 2.5: Mid-stream gating");
        end
        apply_reset();

        // ====================================================================
        // Group 3 — Byte-Select Multiplexer Encoding
        // ====================================================================
        $display("\n>>> Group 3: Byte-Select Multiplexer Encoding");

        // 3.1: All 8 select positions over a known accumulator pattern
        begin int eb = fail_count;
            for (int i = 0; i < 8; i++) begin
                clear_inputs();
                operand_A = 32'h0000_0000 | i;
                valid_A = 1; chp_slct = 1; pe_ready = 1;
                tick($sformatf("3.1 load[%0d]", i));
                clear_inputs();
                accumulator = 64'hFEDC_BA98_7654_3210;
                read_acc_en = 1;
                tick($sformatf("3.1 read[%0d]", i));
            end
            if (fail_count == eb)
                $display("  [PASS] 3.1: All 8 byte indices");
        end

        // 3.2: Boundary byte values across all positions
        begin int eb = fail_count;
            logic [63:0] patterns [2] = '{
                64'h8000_0000_0000_007F,
                64'h7F00_0000_0000_0080
            };
            foreach (patterns[p]) begin
                for (int i = 0; i < 8; i++) begin
                    clear_inputs();
                    operand_A = 32'h0000_0000 | i;
                    valid_A = 1; chp_slct = 1; pe_ready = 1;
                    tick($sformatf("3.2 p%0d load[%0d]", p, i));
                    clear_inputs();
                    accumulator = patterns[p];
                    read_acc_en = 1;
                    tick($sformatf("3.2 p%0d read[%0d]", p, i));
                end
            end
            if (fail_count == eb)
                $display("  [PASS] 3.2: Boundary byte patterns");
        end
        apply_reset();

        // ====================================================================
        // Group 4 — Byte-Select Path: Data-Side Isolation
        // ====================================================================
        $display("\n>>> Group 4: Byte-Select Path Isolation");

        // 4.1: Hold read_acc_en = 0 while accumulator and op_A_reg toggle
        begin int eb = fail_count;
            clear_inputs();
            operand_A = 32'h0000_0003;
            valid_A = 1; chp_slct = 1; pe_ready = 1;
            tick("4.1 setup");
            for (int i = 0; i < 16; i++) begin
                clear_inputs();
                accumulator = {$urandom, $urandom};
                operand_A = $urandom;
                valid_A = 1; chp_slct = 1; pe_ready = 1;
                tick($sformatf("4.1 idle[%0d]", i));
            end
            if (fail_count == eb)
                $display("  [PASS] 4.1: Output stable under isolation");
        end

        // 4.2: Isolation handover from idle → active → idle
        begin int eb = fail_count;
            clear_inputs();
            operand_A = 32'h0000_0005;
            valid_A = 1; chp_slct = 1; pe_ready = 1;
            tick("4.2 load-idx");
            clear_inputs();
            accumulator = 64'hFFFF_FFFF_FFFF_FFFF;
            tick("4.2 idle1");
            clear_inputs();
            accumulator = 64'hFFFF_FFFF_FFFF_FFFF;
            read_acc_en = 1;
            tick("4.2 read-pulse");
            clear_inputs();
            accumulator = 64'h0000_0000_0000_0000;
            tick("4.2 idle2");
            if (fail_count == eb)
                $display("  [PASS] 4.2: Isolation handover");
        end
        apply_reset();

        // ====================================================================
        // Group 5 — Output Multiplexer: Source Selection
        // ====================================================================
        $display("\n>>> Group 5: Output Multiplexer Source Selection");

        // 5.1: Default (activation) path — sweep 16 values
        begin int eb = fail_count;
            clear_inputs();
            for (int i = 0; i < 16; i++) begin
                clear_inputs();
                activation_out = i * 17;
                ppu_en = 1;
                tick($sformatf("5.1 act[%0d]", i));
            end
            if (fail_count == eb)
                $display("  [PASS] 5.1: Default activation path");
        end

        // 5.2: read_acc_en path with activation decoy
        begin int eb = fail_count;
            clear_inputs();
            operand_A = 32'h0000_0002;
            valid_A = 1; chp_slct = 1; pe_ready = 1;
            tick("5.2 load-idx");
            clear_inputs();
            accumulator = 64'h1122_3344_5566_7788;
            activation_out = 8'hAA;  // decoy — must be overridden
            read_acc_en = 1;
            tick("5.2 read-acc");     // expected byte[2] = 0x44
            if (fail_count == eb)
                $display("  [PASS] 5.2: read_acc_en override");
        end

        // 5.3: read_cfg_en zero-pad
        begin int eb = fail_count;
            clear_inputs();
            config_out = 4'hC;
            activation_out = 8'hAA;   // decoy
            read_cfg_en = 1;
            tick("5.3 read-cfg");     // expected 0x0C
            if (fail_count == eb)
                $display("  [PASS] 5.3: read_cfg_en zero-pad");
        end

        // 5.4: Source override sequence
        apply_reset();
        begin int eb = fail_count;
            clear_inputs();
            operand_A = 32'h0000_0001;
            valid_A = 1; chp_slct = 1; pe_ready = 1;
            tick("5.4 idx");
            clear_inputs();
            activation_out = 8'hAA;
            accumulator = 64'h0000_0000_0000_BBCC;
            config_out = 4'h7;
            read_acc_en = 1;
            tick("5.4 acc-override");  // expected 0xBB
            clear_inputs();
            activation_out = 8'hAA;
            config_out = 4'h7;
            read_cfg_en = 1;
            tick("5.4 cfg-override");  // expected 0x07
            clear_inputs();
            activation_out = 8'hDD;
            ppu_en = 1;
            tick("5.4 default-back");  // expected 0xDD
            if (fail_count == eb)
                $display("  [PASS] 5.4: Source override sequence");
        end
        apply_reset();

        // ====================================================================
        // Group 6 — Output Register Write-Enable Composition
        // ====================================================================
        $display("\n>>> Group 6: Output Register Write Enable");

        // 6.1: Each enable pulses individually
        begin int eb = fail_count;
            clear_inputs();
            activation_out = 8'h11; ppu_en = 1;
            tick("6.1 ppu");
            clear_inputs();
            operand_A = 32'h0000_0000;
            valid_A = 1; chp_slct = 1; pe_ready = 1;
            tick("6.1 idx");
            clear_inputs();
            accumulator = 64'h0000_0000_0000_0022;
            read_acc_en = 1;
            tick("6.1 racc");
            clear_inputs();
            config_out = 4'h3; read_cfg_en = 1;
            tick("6.1 rcfg");
            if (fail_count == eb)
                $display("  [PASS] 6.1: Each enable pulse");
        end

        // 6.2: No-enable hold across 16 cycles with random data inputs
        begin int eb = fail_count;
            clear_inputs();
            activation_out = 8'h99; ppu_en = 1;
            tick("6.2 prime");
            for (int i = 0; i < 16; i++) begin
                clear_inputs();
                accumulator = {$urandom, $urandom};
                activation_out = $urandom;
                config_out = $urandom;
                tick($sformatf("6.2 hold[%0d]", i));
            end
            if (fail_count == eb)
                $display("  [PASS] 6.2: No-enable hold");
        end

        // 6.3: Reset clears held output
        clear_inputs();
        activation_out = 8'h77; ppu_en = 1;
        tick("6.3 prime");
        clear_inputs();
        tick("6.3 hold");
        rst = 1'b0; #2;
        if (data_out !== 0) begin
            $display("  [FAIL] 6.3: reset did not clear data_out"); fail_count++;
        end else begin
            $display("  [PASS] 6.3: Reset clears held output"); pass_count++;
        end
        test_count++;
        apply_reset();

        // ====================================================================
        // Group 8 — Mode-Agnostic Output Propagation
        // ====================================================================
        $display("\n>>> Group 8: Mode-Agnostic Output Propagation");

        // 8.1: INT4 sign-extended patterns from PPU
        begin int eb = fail_count;
            logic [7:0] int4_patterns [4] = '{8'hF8, 8'h07, 8'hFC, 8'h03};
            foreach (int4_patterns[i]) begin
                clear_inputs();
                activation_out = int4_patterns[i]; ppu_en = 1;
                tick($sformatf("8.1 int4[%0d]", i));
            end
            if (fail_count == eb)
                $display("  [PASS] 8.1: INT4 sign-extended pass-through");
        end

        // 8.2: INT8 full-range
        begin int eb = fail_count;
            logic [7:0] int8_patterns [4] = '{8'h00, 8'h7F, 8'h80, 8'hFF};
            foreach (int8_patterns[i]) begin
                clear_inputs();
                activation_out = int8_patterns[i]; ppu_en = 1;
                tick($sformatf("8.2 int8[%0d]", i));
            end
            if (fail_count == eb)
                $display("  [PASS] 8.2: INT8 full-range pass-through");
        end
        apply_reset();

        // ====================================================================
        // Group 9 — Cross-Functional Sequences
        // ====================================================================
        $display("\n>>> Group 9: Cross-Functional Sequences");

        // 9.1: EXEC_PP -> READ_ACC_BYTE -> READ_CFG
        begin int eb = fail_count;
            clear_inputs();
            operand_A = 32'h0000_0004;
            valid_A = 1; chp_slct = 1; pe_ready = 1;
            tick("9.1 idx-load");
            clear_inputs();
            activation_out = 8'h42; ppu_en = 1;
            tick("9.1 ppu-pulse");          // expected 0x42
            clear_inputs();
            accumulator = 64'h0011_2233_4455_6677;
            read_acc_en = 1;
            tick("9.1 racc-pulse");         // expected byte[4] = 0x33
            clear_inputs();
            config_out = 4'hF; read_cfg_en = 1;
            tick("9.1 rcfg-pulse");         // expected 0x0F
            if (fail_count == eb)
                $display("  [PASS] 9.1: EXEC_PP -> READ_ACC -> READ_CFG");
        end

        // 9.2: Same-edge race — operand load concurrent with read
        begin int eb = fail_count;
            clear_inputs();
            operand_A = 32'h0000_0006;
            valid_A = 1; chp_slct = 1; pe_ready = 1;
            tick("9.2 idx-pre");            // op_A_reg = 6
            // New operand_A and read_acc_en assert on the same edge.
            // Byte mux uses the OLD op_A_reg (=6); new value commits at edge.
            clear_inputs();
            operand_A = 32'h0000_0001;
            valid_A = 1; chp_slct = 1; pe_ready = 1;
            accumulator = 64'h0011_2233_4455_6677;
            read_acc_en = 1;
            tick("9.2 race");                // expected byte[6] = 0x11
            if (fail_count == eb)
                $display("  [PASS] 9.2: Same-edge race resolved correctly");
        end

        // 9.3: Mid-read async reset
        apply_reset();
        clear_inputs();
        operand_A = 32'h0000_0000;
        valid_A = 1; chp_slct = 1; pe_ready = 1;
        tick("9.3 idx");
        clear_inputs();
        accumulator = 64'hFFFF_FFFF_FFFF_FFFF; read_acc_en = 1;
        @(posedge clk);                    // edge captures the read
        rst = 1'b0; #2;                    // async reset wipes
        if (data_out !== 0) begin
            $display("  [FAIL] 9.3: data_out not cleared mid-read"); fail_count++;
        end else begin
            $display("  [PASS] 9.3: Mid-read reset clears output"); pass_count++;
        end
        test_count++;
        apply_reset();

        // ====================================================================
        // Group 10 — Constrained Random Stress
        // ====================================================================
        $display("\n>>> Group 10: Constrained Random Stress (%0d cycles)",
                 RAND_CYCLES);
        begin
            int eb = fail_count;
            int reset_active = 0;
            for (int i = 0; i < RAND_CYCLES; i++) begin
                // Reset injection: ~1% per cycle, 1-3 cycles wide
                if (reset_active == 0 && ($urandom % 100) == 0) begin
                    reset_active = 1 + ($urandom % 3);
                    rst = 0;
                end else if (reset_active > 0) begin
                    reset_active--;
                    if (reset_active == 0) rst = 1;
                end

                // Data buses — uniform random
                operand_A      = $urandom;
                operand_B      = $urandom;
                accumulator    = {$urandom, $urandom};
                activation_out = $urandom;
                config_out     = $urandom;

                // Operand pipeline qualifiers — 80% asserted
                valid_A  = ($urandom % 100) < 80;
                valid_B  = ($urandom % 100) < 80;
                chp_slct = ($urandom % 100) < 80;
                pe_ready = ($urandom % 100) < 80;

                // One-hot output enables: 70% none, 10% each
                case ($urandom % 10)
                    0:       begin ppu_en = 1; read_acc_en = 0; read_cfg_en = 0; end
                    1:       begin ppu_en = 0; read_acc_en = 1; read_cfg_en = 0; end
                    2:       begin ppu_en = 0; read_acc_en = 0; read_cfg_en = 1; end
                    default: begin ppu_en = 0; read_acc_en = 0; read_cfg_en = 0; end
                endcase

                tick($sformatf("R%0d", i));
            end
            if (fail_count == eb)
                $display("  [PASS] Group 10: %0d cycles clean", RAND_CYCLES);
            else
                $display("  [INFO] Group 10: %0d failures",
                         fail_count - eb);
        end

        // ====================================================================
        // Summary
        // ====================================================================
        $display("\n============================================================");
        $display("   IO BLOCK TESTBENCH SUMMARY");
        $display("============================================================");
        $display("Checks: %0d  Passes: %0d  Failures: %0d",
                 test_count, pass_count, fail_count);
        if (fail_count == 0) $display("RESULT: ALL PASSED");
        else                 $display("RESULT: FAILED");
        $display("============================================================\n");
        $finish;
    end

endmodule