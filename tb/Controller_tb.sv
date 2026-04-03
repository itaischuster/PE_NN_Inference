`timescale 1ns / 1ps

module Controller_tb;

    // ============================================================
    // 1. Parameters & Opcode/State Encodings
    // ============================================================
    localparam CLK_PERIOD = 10;

    localparam [4:0] NOP           = 5'b00000;
    localparam [4:0] RST_ACC       = 5'b00001;
    localparam [4:0] MAC           = 5'b00010;
    localparam [4:0] ADD_BIAS      = 5'b00011;
    localparam [4:0] SCALE32       = 5'b00100;
    localparam [4:0] LOAD_CFG      = 5'b00101;
    localparam [4:0] EXEC_PPU      = 5'b00110;
    localparam [4:0] READ_ACC_BYTE = 5'b00111;
    localparam [4:0] READ_CFG_OP   = 5'b01000;

    localparam [1:0] IDLE = 2'b00;
    localparam [1:0] SC1  = 2'b01;
    localparam [1:0] SC2  = 2'b10;
    localparam [1:0] SC3  = 2'b11;

    // ============================================================
    // 2. DUT Signals
    // ============================================================
    logic        clk, rst;
    logic [4:0]  pe_opcode;
    logic        chp_slct, opcode_valid;
    logic [3:0]  cfg_data_in;

    logic        mode4x4, a_is_signed, b_is_signed, scale32_mode, latch_en;
    logic [1:0]  scale_phase;
    logic        mac_iso_en;
    logic [1:0]  acc_source;
    logic        acc_wr_en, acc_load, rst_acc;
    logic        ppu_en, shamt_wr_en, cfg_mode4x4;
    logic [2:0]  act_fn_sel;
    logic        read_acc_en, read_cfg_en;
    logic [3:0]  config_out;
    logic        scale32_done, pe_ready, output_valid;

    // ============================================================
    // 3. DUT Instantiation
    // ============================================================
    Controller uut (.*);

    // ============================================================
    // 4. Clock Generation
    // ============================================================
    initial clk = 0;
    always #(CLK_PERIOD/2) clk = ~clk;

    // ============================================================
    // 5. Golden Reference Model State
    // ============================================================
    logic [4:0] mdl_opcode_reg, mdl_validated_cmd;
    logic [3:0] mdl_config_reg;
    logic [1:0] mdl_state;
    logic       mdl_scale32_done_reg, mdl_output_valid_reg;
    logic       mdl_prev_ppu_en, mdl_prev_read_acc_en, mdl_prev_read_cfg_en;

    // Expected combinational outputs
    logic       exp_mode4x4, exp_a_is_signed, exp_b_is_signed;
    logic       exp_scale32_mode, exp_latch_en;
    logic [1:0] exp_scale_phase;
    logic       exp_mac_iso_en;
    logic [1:0] exp_acc_source;
    logic       exp_acc_wr_en, exp_acc_load, exp_rst_acc;
    logic       exp_ppu_en, exp_shamt_wr_en, exp_cfg_mode4x4;
    logic [2:0] exp_act_fn_sel;
    logic       exp_read_acc_en, exp_read_cfg_en;
    logic [3:0] exp_config_out;
    logic       exp_scale32_done, exp_pe_ready, exp_output_valid;

    // Model: update sequential state (call after posedge clk)
    task automatic model_update_sequential();
        logic       capture_gate;
        logic [4:0] new_opcode_reg, new_validated_cmd;
        logic [1:0] new_state;
        logic       old_cmd_is_load_cfg;

        if (!rst) begin
            mdl_opcode_reg = NOP; mdl_validated_cmd = NOP;
            mdl_config_reg = 4'b0000; mdl_state = IDLE;
            mdl_scale32_done_reg = 0; mdl_output_valid_reg = 0;
            mdl_prev_ppu_en = 0; mdl_prev_read_acc_en = 0; mdl_prev_read_cfg_en = 0;
            return;
        end

        // Step 1: New opcode register (uses OLD pe_ready via exp_pe_ready)
        capture_gate = exp_pe_ready & opcode_valid & chp_slct;
        new_opcode_reg = capture_gate ? pe_opcode : NOP;
        case (new_opcode_reg)
            NOP, RST_ACC, MAC, ADD_BIAS, SCALE32,
            LOAD_CFG, EXEC_PPU, READ_ACC_BYTE, READ_CFG_OP:
                new_validated_cmd = new_opcode_reg;
            default: new_validated_cmd = NOP;
        endcase

        // Step 2: All other registers use OLD state and OLD validated_cmd
        old_cmd_is_load_cfg = (mdl_state == IDLE) & (mdl_validated_cmd == LOAD_CFG);
        if (old_cmd_is_load_cfg)
            mdl_config_reg = cfg_data_in;

        mdl_scale32_done_reg = (mdl_state == SC3);
        mdl_output_valid_reg = (mdl_prev_ppu_en | mdl_prev_read_acc_en | mdl_prev_read_cfg_en);

        case (mdl_state)
            IDLE:    new_state = (mdl_validated_cmd == SCALE32) ? SC1 : IDLE;
            SC1:     new_state = SC2;
            SC2:     new_state = SC3;
            SC3:     new_state = IDLE;
            default: new_state = IDLE;
        endcase

        // Step 3: Commit
        mdl_opcode_reg    = new_opcode_reg;
        mdl_validated_cmd = new_validated_cmd;
        mdl_state         = new_state;
    endtask

    // Model: compute expected combinational outputs from committed state
    task automatic model_compute_outputs();
        logic cmd_mac, cmd_rst, cmd_bias, cmd_s0, cmd_ppu, cmd_racc, cmd_rcfg;
        logic sc1, sc2, sc3, any_s;

        cmd_rst  = (mdl_state == IDLE) & (mdl_validated_cmd == RST_ACC);
        cmd_mac  = (mdl_state == IDLE) & (mdl_validated_cmd == MAC);
        cmd_bias = (mdl_state == IDLE) & (mdl_validated_cmd == ADD_BIAS);
        cmd_s0   = (mdl_state == IDLE) & (mdl_validated_cmd == SCALE32);
        cmd_ppu  = (mdl_state == IDLE) & (mdl_validated_cmd == EXEC_PPU);
        cmd_racc = (mdl_state == IDLE) & (mdl_validated_cmd == READ_ACC_BYTE);
        cmd_rcfg = (mdl_state == IDLE) & (mdl_validated_cmd == READ_CFG_OP);

        sc1 = (mdl_state == SC1); sc2 = (mdl_state == SC2); sc3 = (mdl_state == SC3);
        any_s = cmd_s0 | sc1 | sc2 | sc3;

        exp_mode4x4      = cmd_mac & ~mdl_config_reg[3];
        exp_a_is_signed  = cmd_mac | sc3;
        exp_b_is_signed  = cmd_mac;
        exp_scale32_mode = any_s;
        exp_scale_phase  = {(sc2 | sc3), (sc1 | sc3)};
        exp_latch_en     = cmd_s0;
        exp_mac_iso_en   = cmd_mac;
        exp_acc_source   = {(any_s | cmd_bias), ((cmd_mac & mdl_config_reg[3]) | cmd_bias)};
        exp_acc_wr_en    = cmd_mac | cmd_bias | any_s;
        exp_acc_load     = cmd_s0;
        exp_rst_acc      = cmd_rst;
        exp_ppu_en       = cmd_ppu;
        exp_shamt_wr_en  = cmd_s0;
        exp_read_acc_en  = cmd_racc;
        exp_read_cfg_en  = cmd_rcfg;
        exp_cfg_mode4x4  = ~mdl_config_reg[3];
        exp_act_fn_sel   = mdl_config_reg[2:0];
        exp_config_out   = mdl_config_reg[3:0];
        exp_pe_ready     = rst & (mdl_state == IDLE) & (mdl_opcode_reg != SCALE32);
        exp_scale32_done = mdl_scale32_done_reg;
        exp_output_valid = mdl_output_valid_reg;

        mdl_prev_ppu_en      = exp_ppu_en;
        mdl_prev_read_acc_en = exp_read_acc_en;
        mdl_prev_read_cfg_en = exp_read_cfg_en;
    endtask

    // ============================================================
    // 6. Checking Infrastructure
    // ============================================================
    int pass_count = 0, fail_count = 0, test_count = 0;
    string current_group;

    task automatic check_signal(string name, logic [3:0] actual, logic [3:0] expected, int width);
        logic [3:0] mask = (1 << width) - 1;
        if ((actual & mask) !== (expected & mask)) begin
            $display("  [FAIL] %s: %s | Exp:%0b Got:%0b", current_group, name, expected & mask, actual & mask);
            fail_count++;
        end else pass_count++;
        test_count++;
    endtask

    task automatic check_all_outputs(string test_name);
        current_group = test_name;
        model_update_sequential();
        model_compute_outputs();
        check_signal("mode4x4",     {3'b0,mode4x4},     {3'b0,exp_mode4x4},     1);
        check_signal("a_is_signed", {3'b0,a_is_signed}, {3'b0,exp_a_is_signed}, 1);
        check_signal("b_is_signed", {3'b0,b_is_signed}, {3'b0,exp_b_is_signed}, 1);
        check_signal("scale32_mode",{3'b0,scale32_mode},{3'b0,exp_scale32_mode},1);
        check_signal("latch_en",    {3'b0,latch_en},    {3'b0,exp_latch_en},    1);
        check_signal("scale_phase", {2'b0,scale_phase}, {2'b0,exp_scale_phase}, 2);
        check_signal("mac_iso_en",  {3'b0,mac_iso_en},  {3'b0,exp_mac_iso_en},  1);
        check_signal("acc_source",  {2'b0,acc_source},  {2'b0,exp_acc_source},  2);
        check_signal("acc_wr_en",   {3'b0,acc_wr_en},   {3'b0,exp_acc_wr_en},   1);
        check_signal("acc_load",    {3'b0,acc_load},    {3'b0,exp_acc_load},    1);
        check_signal("rst_acc",     {3'b0,rst_acc},     {3'b0,exp_rst_acc},     1);
        check_signal("ppu_en",      {3'b0,ppu_en},      {3'b0,exp_ppu_en},      1);
        check_signal("shamt_wr_en", {3'b0,shamt_wr_en}, {3'b0,exp_shamt_wr_en}, 1);
        check_signal("cfg_mode4x4", {3'b0,cfg_mode4x4}, {3'b0,exp_cfg_mode4x4}, 1);
        check_signal("act_fn_sel",  {1'b0,act_fn_sel},  {1'b0,exp_act_fn_sel},  3);
        check_signal("read_acc_en", {3'b0,read_acc_en}, {3'b0,exp_read_acc_en}, 1);
        check_signal("read_cfg_en", {3'b0,read_cfg_en}, {3'b0,exp_read_cfg_en}, 1);
        check_signal("config_out",  config_out,         exp_config_out,         4);
        check_signal("scale32_done",{3'b0,scale32_done},{3'b0,exp_scale32_done},1);
        check_signal("pe_ready",    {3'b0,pe_ready},    {3'b0,exp_pe_ready},    1);
        check_signal("output_valid",{3'b0,output_valid},{3'b0,exp_output_valid},1);
    endtask

    task automatic check_invariants(string ctx);
        if (mac_iso_en && scale32_mode)
            begin $display("  [INV FAIL] %s: mac+scale", ctx); fail_count++; end
        else pass_count++;
        test_count++;
        if ((ppu_en + read_acc_en + read_cfg_en) > 1)
            begin $display("  [INV FAIL] %s: multi-select", ctx); fail_count++; end
        else pass_count++;
        test_count++;
        if (acc_load && !scale32_mode)
            begin $display("  [INV FAIL] %s: acc_load w/o scale", ctx); fail_count++; end
        else pass_count++;
        test_count++;
    endtask

    // ============================================================
    // 7. Stimulus Tasks
    // ============================================================
    task automatic send_and_check(input [4:0] opcode, input valid, input cs,
                                   input [3:0] cfg, input string name);
        pe_opcode = opcode; opcode_valid = valid; chp_slct = cs; cfg_data_in = cfg;
        @(posedge clk); #1;
        check_all_outputs(name);
    endtask

    task automatic wait_and_check(input string name, input [3:0] hold_cfg = 4'b0000);
        send_and_check(NOP, 1'b0, 1'b0, hold_cfg, name);
    endtask

    // Issue LOAD_CFG and wait for config register to capture (two-edge pipeline).
    task automatic issue_load_cfg(input [3:0] cfg_val, input string name);
        send_and_check(LOAD_CFG, 1'b1, 1'b1, cfg_val, {name, " issue"});
        send_and_check(NOP, 1'b1, 1'b1, cfg_val, {name, " capture"});
    endtask

    task automatic apply_reset();
        rst = 1'b0; pe_opcode = NOP; opcode_valid = 1'b0; chp_slct = 1'b0; cfg_data_in = 4'b0;
        #(CLK_PERIOD * 2);
        mdl_opcode_reg = NOP; mdl_validated_cmd = NOP; mdl_config_reg = 4'b0; mdl_state = IDLE;
        mdl_scale32_done_reg = 0; mdl_output_valid_reg = 0;
        mdl_prev_ppu_en = 0; mdl_prev_read_acc_en = 0; mdl_prev_read_cfg_en = 0;
        rst = 1'b1;
        @(posedge clk); #1;
        model_compute_outputs();
    endtask

    // ============================================================
    // 8. Test Sequences
    // ============================================================
    initial begin
        $display("==========================================================");
        $display("   CONTROLLER TESTBENCH                                   ");
        $display("==========================================================\n");
        rst=1; pe_opcode=NOP; opcode_valid=0; chp_slct=0; cfg_data_in=0;
        mdl_opcode_reg=NOP; mdl_validated_cmd=NOP; mdl_config_reg=0; mdl_state=IDLE;
        mdl_scale32_done_reg=0; mdl_output_valid_reg=0;
        mdl_prev_ppu_en=0; mdl_prev_read_acc_en=0; mdl_prev_read_cfg_en=0;

        // ===================== GROUP 1: RESET =====================
        $display(">>> Group 1: Asynchronous Reset");
        apply_reset();
        if (pe_ready!==1 || config_out!==0 || scale32_done!==0 || output_valid!==0)
            begin $display("  [FAIL] 1.1"); fail_count++; end
        else begin $display("  [PASS] 1.1: Power-on reset"); pass_count++; end
        test_count++;

        apply_reset();
        send_and_check(SCALE32,1,1,0,"1.2 issue"); wait_and_check("1.2 SC1");
        rst=0; #1;
        if (pe_ready!==0) begin $display("  [FAIL] 1.2 rst active"); fail_count++; end
        else pass_count++;
        test_count++;
        apply_reset();
        send_and_check(NOP,1,1,0,"1.2 post");
        if (scale32_done!==0) begin $display("  [FAIL] 1.2 residual"); fail_count++; end
        else begin $display("  [PASS] 1.2: Mid-op reset"); pass_count++; end
        test_count++;

        apply_reset(); issue_load_cfg(4'b1101,"1.3");
        apply_reset();
        if (config_out!==0) begin $display("  [FAIL] 1.3"); fail_count++; end
        else begin $display("  [PASS] 1.3: Reset clears config"); pass_count++; end
        test_count++;

        // ===================== GROUP 2: GATING =====================
        $display("\n>>> Group 2: Opcode Gating");
        apply_reset();
        send_and_check(MAC,1,1,0,"2.1");
        if (mac_iso_en!==1) begin $display("  [FAIL] 2.1"); fail_count++; end
        else begin $display("  [PASS] 2.1: Normal capture"); pass_count++; end
        test_count++;

        apply_reset();
        send_and_check(MAC,0,1,0,"2.2");
        if (mac_iso_en!==0) begin $display("  [FAIL] 2.2"); fail_count++; end
        else begin $display("  [PASS] 2.2: valid low"); pass_count++; end
        test_count++;

        apply_reset();
        send_and_check(MAC,1,0,0,"2.3");
        if (mac_iso_en!==0) begin $display("  [FAIL] 2.3"); fail_count++; end
        else begin $display("  [PASS] 2.3: cs low"); pass_count++; end
        test_count++;

        apply_reset();
        send_and_check(SCALE32,1,1,0,"2.4 S32");
        send_and_check(MAC,1,1,0,"2.4 MAC@SC1");
        if (mac_iso_en!==0) begin $display("  [FAIL] 2.4"); fail_count++; end
        else begin $display("  [PASS] 2.4: pe_ready low"); pass_count++; end
        test_count++;
        wait_and_check("2.4 SC2"); wait_and_check("2.4 SC3"); wait_and_check("2.4 drain");

        apply_reset();
        send_and_check(MAC,0,0,0,"2.5");
        if (mac_iso_en!==0) begin $display("  [FAIL] 2.5"); fail_count++; end
        else begin $display("  [PASS] 2.5: All low"); pass_count++; end
        test_count++;

        apply_reset();
        send_and_check(5'b11111,1,1,0,"2.6");
        if (acc_wr_en!==0) begin $display("  [FAIL] 2.6"); fail_count++; end
        else begin $display("  [PASS] 2.6: Invalid→NOP"); pass_count++; end
        test_count++;

        // ===================== GROUP 3: TRUTH TABLE =====================
        $display("\n>>> Group 3: Single-Cycle Truth Table");
        apply_reset(); send_and_check(NOP,1,1,0,"3.1 NOP");
        $display("  [INFO] 3.1: NOP (model-checked)");

        apply_reset(); send_and_check(RST_ACC,1,1,0,"3.2");
        if (rst_acc!==1) begin $display("  [FAIL] 3.2"); fail_count++; end
        else begin $display("  [PASS] 3.2: RST_ACC"); pass_count++; end
        test_count++;

        apply_reset(); issue_load_cfg(4'b0000,"3.3");
        send_and_check(MAC,1,1,0,"3.3 MAC4");
        if (mode4x4!==1||acc_source!==2'b00||mac_iso_en!==1||a_is_signed!==1||b_is_signed!==1)
            begin $display("  [FAIL] 3.3"); fail_count++; end
        else begin $display("  [PASS] 3.3: MAC INT4"); pass_count++; end
        test_count++;

        apply_reset(); issue_load_cfg(4'b1000,"3.4");
        send_and_check(MAC,1,1,0,"3.4 MAC8");
        if (mode4x4!==0||acc_source!==2'b01||mac_iso_en!==1)
            begin $display("  [FAIL] 3.4"); fail_count++; end
        else begin $display("  [PASS] 3.4: MAC INT8"); pass_count++; end
        test_count++;

        apply_reset(); send_and_check(ADD_BIAS,1,1,0,"3.5");
        if (acc_source!==2'b11||acc_wr_en!==1) begin $display("  [FAIL] 3.5"); fail_count++; end
        else begin $display("  [PASS] 3.5: ADD_BIAS"); pass_count++; end
        test_count++;

        apply_reset(); send_and_check(EXEC_PPU,1,1,0,"3.6");
        if (ppu_en!==1||acc_wr_en!==0) begin $display("  [FAIL] 3.6"); fail_count++; end
        else begin $display("  [PASS] 3.6: EXEC_PPU"); pass_count++; end
        test_count++;

        apply_reset(); send_and_check(READ_ACC_BYTE,1,1,0,"3.7");
        if (read_acc_en!==1||acc_wr_en!==0) begin $display("  [FAIL] 3.7"); fail_count++; end
        else begin $display("  [PASS] 3.7: READ_ACC"); pass_count++; end
        test_count++;

        apply_reset(); send_and_check(READ_CFG_OP,1,1,0,"3.8");
        if (read_cfg_en!==1||acc_wr_en!==0) begin $display("  [FAIL] 3.8"); fail_count++; end
        else begin $display("  [PASS] 3.8: READ_CFG"); pass_count++; end
        test_count++;

        apply_reset(); issue_load_cfg(4'b1010,"3.9");
        if (config_out!==4'b1010) begin $display("  [FAIL] 3.9"); fail_count++; end
        else begin $display("  [PASS] 3.9: LOAD_CFG"); pass_count++; end
        test_count++;

        // ===================== GROUP 4: CONFIG REGISTER =====================
        $display("\n>>> Group 4: Configuration Register");
        begin int ce=0;
            for (int i=0;i<16;i++) begin
                apply_reset(); issue_load_cfg(i[3:0],$sformatf("4.1 %04b",i[3:0]));
                if (config_out!==i[3:0]) begin $display("  [FAIL] 4.1 %04b",i[3:0]); fail_count++; ce++; end
                else pass_count++;
                test_count++;
            end
            if (ce==0) $display("  [PASS] 4.1: All 16 values");
        end

        apply_reset(); issue_load_cfg(4'b1101,"4.2");
        send_and_check(MAC,1,1,0,"4.2 MAC"); send_and_check(ADD_BIAS,1,1,0,"4.2 BIAS");
        send_and_check(RST_ACC,1,1,0,"4.2 RST");
        if (config_out!==4'b1101) begin $display("  [FAIL] 4.2"); fail_count++; end
        else begin $display("  [PASS] 4.2: Persistence"); pass_count++; end
        test_count++;

        apply_reset(); issue_load_cfg(4'b1010,"4.3a"); issue_load_cfg(4'b0101,"4.3b");
        if (config_out!==4'b0101) begin $display("  [FAIL] 4.3"); fail_count++; end
        else begin $display("  [PASS] 4.3: Overwrite"); pass_count++; end
        test_count++;

        apply_reset(); issue_load_cfg(4'b0000,"4.4a");
        if (cfg_mode4x4!==1) begin $display("  [FAIL] 4.4a"); fail_count++; test_count++; end
        else begin pass_count++; test_count++; end
        issue_load_cfg(4'b1000,"4.4b");
        if (cfg_mode4x4!==0) begin $display("  [FAIL] 4.4b"); fail_count++; end
        else begin $display("  [PASS] 4.4: Inversion"); pass_count++; end
        test_count++;

        apply_reset(); issue_load_cfg(4'b0000,"4.5 INT4");
        send_and_check(MAC,1,1,0,"4.5 MAC4");
        if (mode4x4!==1||acc_source!==2'b00) begin $display("  [FAIL] 4.5a"); fail_count++; test_count++; end
        else begin pass_count++; test_count++; end
        issue_load_cfg(4'b1000,"4.5 INT8");
        send_and_check(MAC,1,1,0,"4.5 MAC8");
        if (mode4x4!==0||acc_source!==2'b01) begin $display("  [FAIL] 4.5b"); fail_count++; end
        else begin $display("  [PASS] 4.5: Config→MAC"); pass_count++; end
        test_count++;

        // ===================== GROUP 5: SCALE32 =====================
        $display("\n>>> Group 5: SCALE32 Full Sequence");
        apply_reset();
        send_and_check(SCALE32,1,1,0,"5.1 c0");
        if (scale32_mode!==1||scale_phase!==2'b00||latch_en!==1||acc_load!==1||
            shamt_wr_en!==1||a_is_signed!==0||b_is_signed!==0||acc_source!==2'b10||acc_wr_en!==1)
            begin $display("  [FAIL] 5.1 c0"); fail_count++; end
        else begin $display("  [PASS] 5.1: Cycle 0"); pass_count++; end
        test_count++;
        wait_and_check("5.1 SC1");
        if (scale_phase!==2'b01||latch_en!==0||acc_load!==0||shamt_wr_en!==0||a_is_signed!==0)
            begin $display("  [FAIL] 5.1 SC1"); fail_count++; end
        else begin $display("  [PASS] 5.1: SC1"); pass_count++; end
        test_count++;
        wait_and_check("5.1 SC2");
        if (scale_phase!==2'b10||a_is_signed!==0) begin $display("  [FAIL] 5.1 SC2"); fail_count++; end
        else begin $display("  [PASS] 5.1: SC2"); pass_count++; end
        test_count++;
        wait_and_check("5.1 SC3");
        if (scale_phase!==2'b11||a_is_signed!==1) begin $display("  [FAIL] 5.1 SC3"); fail_count++; end
        else begin $display("  [PASS] 5.1: SC3 (sign)"); pass_count++; end
        test_count++;
        wait_and_check("5.1 IDLE");

        apply_reset();
        send_and_check(SCALE32,1,1,0,"5.2");
        if (pe_ready!==0) begin $display("  [FAIL] 5.2 drop"); fail_count++; test_count++; end
        else begin pass_count++; test_count++; end
        wait_and_check("5.2 SC1"); wait_and_check("5.2 SC2"); wait_and_check("5.2 SC3");
        wait_and_check("5.2 rise");
        if (pe_ready!==1) begin $display("  [FAIL] 5.2 rise"); fail_count++; end
        else begin $display("  [PASS] 5.2: pe_ready"); pass_count++; end
        test_count++;

        apply_reset();
        send_and_check(SCALE32,1,1,0,"5.3");
        wait_and_check("5.3 SC1"); wait_and_check("5.3 SC2"); wait_and_check("5.3 SC3");
        wait_and_check("5.3 pulse");
        if (scale32_done!==1) begin $display("  [FAIL] 5.3 no pulse"); fail_count++; test_count++; end
        else begin pass_count++; test_count++; end
        wait_and_check("5.3 end");
        if (scale32_done!==0) begin $display("  [FAIL] 5.3 stuck"); fail_count++; end
        else begin $display("  [PASS] 5.3: scale32_done"); pass_count++; end
        test_count++;

        apply_reset();
        send_and_check(SCALE32,1,1,0,"5.4");
        send_and_check(MAC,1,1,0,"5.4 MAC@SC1");
        if (mac_iso_en!==0) begin $display("  [FAIL] 5.4 SC1"); fail_count++; test_count++; end
        else begin pass_count++; test_count++; end
        send_and_check(ADD_BIAS,1,1,0,"5.4 BIAS@SC2");
        send_and_check(EXEC_PPU,1,1,0,"5.4 PPU@SC3");
        if (ppu_en!==0) begin $display("  [FAIL] 5.4 SC3"); fail_count++; end
        else begin $display("  [PASS] 5.4: Rejected during S32"); pass_count++; end
        test_count++;
        wait_and_check("5.4 drain");

        apply_reset();
        send_and_check(SCALE32,1,1,0,"5.5 first");
        wait_and_check("5.5 SC1"); wait_and_check("5.5 SC2"); wait_and_check("5.5 SC3");
        send_and_check(SCALE32,1,1,0,"5.5 second c0");
        if (scale32_mode!==1||latch_en!==1||acc_load!==1)
            begin $display("  [FAIL] 5.5"); fail_count++; end
        else begin $display("  [PASS] 5.5: Back-to-back"); pass_count++; end
        test_count++;
        wait_and_check("5.5 SC1"); wait_and_check("5.5 SC2"); wait_and_check("5.5 SC3");
        wait_and_check("5.5 drain");

        // ===================== GROUP 6: OUTPUT_VALID =====================
        $display("\n>>> Group 6: output_valid Generation");
        apply_reset();
        send_and_check(EXEC_PPU,1,1,0,"6.1 dec");
        if (output_valid!==0) begin $display("  [FAIL] 6.1 early"); fail_count++; test_count++; end
        else begin pass_count++; test_count++; end
        send_and_check(NOP,1,1,0,"6.1 +1");
        if (output_valid!==1) begin $display("  [FAIL] 6.1 miss"); fail_count++; test_count++; end
        else begin pass_count++; test_count++; end
        send_and_check(NOP,1,1,0,"6.1 +2");
        if (output_valid!==0) begin $display("  [FAIL] 6.1 stuck"); fail_count++; end
        else begin $display("  [PASS] 6.1: EXEC_PPU ov"); pass_count++; end
        test_count++;

        apply_reset(); send_and_check(READ_ACC_BYTE,1,1,0,"6.2");
        send_and_check(NOP,1,1,0,"6.2 +1");
        if (output_valid!==1) begin $display("  [FAIL] 6.2"); fail_count++; end
        else begin $display("  [PASS] 6.2: READ_ACC ov"); pass_count++; end
        test_count++;

        apply_reset(); send_and_check(READ_CFG_OP,1,1,0,"6.3");
        send_and_check(NOP,1,1,0,"6.3 +1");
        if (output_valid!==1) begin $display("  [FAIL] 6.3"); fail_count++; end
        else begin $display("  [PASS] 6.3: READ_CFG ov"); pass_count++; end
        test_count++;

        apply_reset();
        send_and_check(MAC,1,1,0,"6.4 MAC"); send_and_check(NOP,1,1,0,"6.4 MAC+1");
        if (output_valid!==0) begin $display("  [FAIL] 6.4 MAC"); fail_count++; test_count++; end
        else begin pass_count++; test_count++; end
        send_and_check(RST_ACC,1,1,0,"6.4 RST"); send_and_check(NOP,1,1,0,"6.4 RST+1");
        if (output_valid!==0) begin $display("  [FAIL] 6.4 RST"); fail_count++; end
        else begin $display("  [PASS] 6.4: No spurious ov"); pass_count++; end
        test_count++;

        apply_reset();
        send_and_check(EXEC_PPU,1,1,0,"6.5 PPU");
        send_and_check(READ_ACC_BYTE,1,1,0,"6.5 RAB");
        if (output_valid!==1) begin $display("  [FAIL] 6.5 first"); fail_count++; test_count++; end
        else begin pass_count++; test_count++; end
        send_and_check(NOP,1,1,0,"6.5 +1");
        if (output_valid!==1) begin $display("  [FAIL] 6.5 second"); fail_count++; test_count++; end
        else begin pass_count++; test_count++; end
        send_and_check(NOP,1,1,0,"6.5 +2");
        if (output_valid!==0) begin $display("  [FAIL] 6.5 stuck"); fail_count++; end
        else begin $display("  [PASS] 6.5: Back-to-back ov"); pass_count++; end
        test_count++;

        // ===================== GROUP 7: SEQUENCES =====================
        $display("\n>>> Group 7: Instruction Sequences");
        apply_reset(); issue_load_cfg(4'b1011,"7.1 cfg");
        send_and_check(MAC,1,1,0,"7.1 M1"); send_and_check(MAC,1,1,0,"7.1 M2");
        send_and_check(MAC,1,1,0,"7.1 M3"); send_and_check(ADD_BIAS,1,1,0,"7.1 B");
        send_and_check(SCALE32,1,1,0,"7.1 S"); wait_and_check("7.1 SC1");
        wait_and_check("7.1 SC2"); wait_and_check("7.1 SC3");
        send_and_check(EXEC_PPU,1,1,0,"7.1 PPU"); send_and_check(NOP,1,1,0,"7.1 ov");
        if (output_valid!==1) begin $display("  [FAIL] 7.1"); fail_count++; end
        else begin $display("  [PASS] 7.1: Full pipeline"); pass_count++; end
        test_count++;

        apply_reset(); issue_load_cfg(4'b1000,"7.2 L1");
        send_and_check(MAC,1,1,0,"7.2 M"); send_and_check(ADD_BIAS,1,1,0,"7.2 B");
        send_and_check(SCALE32,1,1,0,"7.2 S"); wait_and_check("7.2 SC1");
        wait_and_check("7.2 SC2"); wait_and_check("7.2 SC3");
        send_and_check(EXEC_PPU,1,1,0,"7.2 PPU"); send_and_check(NOP,1,1,0,"7.2 ov");
        send_and_check(RST_ACC,1,1,0,"7.2 RST");
        issue_load_cfg(4'b0110,"7.2 L2");
        send_and_check(MAC,1,1,0,"7.2 L2 MAC");
        if (mode4x4!==1||acc_source!==2'b00)
            begin $display("  [FAIL] 7.2 L2 precision"); fail_count++; end
        else begin $display("  [PASS] 7.2: Layer transition"); pass_count++; end
        test_count++;

        apply_reset(); issue_load_cfg(4'b1000,"7.3 cfg");
        send_and_check(MAC,1,1,0,"7.3 M1"); send_and_check(MAC,1,1,0,"7.3 M2");
        send_and_check(READ_ACC_BYTE,1,1,0,"7.3 RAB");
        if (acc_wr_en!==0) begin $display("  [FAIL] 7.3 RAB acc"); fail_count++; test_count++; end
        else begin pass_count++; test_count++; end
        send_and_check(MAC,1,1,0,"7.3 M3"); send_and_check(SCALE32,1,1,0,"7.3 S");
        wait_and_check("7.3 SC1"); wait_and_check("7.3 SC2"); wait_and_check("7.3 SC3");
        send_and_check(EXEC_PPU,1,1,0,"7.3 PPU"); send_and_check(NOP,1,1,0,"7.3 ov");
        send_and_check(READ_CFG_OP,1,1,0,"7.3 RCFG");
        if (acc_wr_en!==0) begin $display("  [FAIL] 7.3 RCFG acc"); fail_count++; end
        else begin $display("  [PASS] 7.3: Debug safe"); pass_count++; end
        test_count++;

        // ===================== GROUP 8: RANDOM =====================
        $display("\n>>> Group 8: Constrained Random (10000 cycles)");
        apply_reset();
        begin
            logic [4:0] ro; logic rv, rc; logic [3:0] rcfg;
            int eb = fail_count;
            for (int i=0; i<10000; i++) begin
                if ($urandom%100<70) case ($urandom%9)
                    0:ro=NOP; 1:ro=RST_ACC; 2:ro=MAC; 3:ro=ADD_BIAS; 4:ro=SCALE32;
                    5:ro=LOAD_CFG; 6:ro=EXEC_PPU; 7:ro=READ_ACC_BYTE; 8:ro=READ_CFG_OP;
                    default:ro=NOP;
                endcase else ro=$urandom%32;
                rv=($urandom%100<85); rc=($urandom%100<90); rcfg=$urandom%16;
                send_and_check(ro,rv,rc,rcfg,$sformatf("R%0d",i));
                check_invariants($sformatf("R%0d",i));
            end
            if (fail_count==eb) $display("  [PASS] Group 8: 10000 cycles clean");
            else $display("  [INFO] Group 8: %0d failures",fail_count-eb);
        end

        // ===================== SUMMARY =====================
        $display("\n==========================================================");
        $display("   TESTBENCH SUMMARY                                      ");
        $display("==========================================================");
        $display("Checks: %0d  Passes: %0d  Failures: %0d", test_count, pass_count, fail_count);
        if (fail_count==0) $display("RESULT: ALL PASSED");
        else $display("RESULT: FAILED");
        $display("==========================================================\n");
        $finish;
    end
endmodule