`timescale 1ns / 1ps

module PPU_tb;

    // ==========================================
    // Signals & Interfaces
    // ==========================================
    logic clk;
    logic rst;
    logic signed [63:0] accumulator; 
    logic [5:0] shamt_data;
    logic shamt_wr_en;
    logic mode4x4;
    logic [2:0] act_fn_sel;
    logic ppu_en;
    logic [7:0] activation_out;

    // Internal grey-box probes
    logic [5:0] stored_shamt;

    // ==========================================
    // DUT Instantiation
    // ==========================================
    PPU dut (
        .clk            (clk),
        .rst            (rst),
        .accumulator    (accumulator),
        .shamt_data     (shamt_data),
        .shamt_wr_en    (shamt_wr_en),
        .mode4x4        (mode4x4),
        .act_fn_sel     (act_fn_sel),
        .ppu_en         (ppu_en),
        .activation_out (activation_out)
    );

    // ==========================================
    // Clock Generation
    // ==========================================
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    // ==========================================
    // SystemVerilog Assertions (SVA)
    // ==========================================
    
    // 1. Gating Enforcement (Grey-box)
    property p_acc_gating;
        @(posedge clk) disable iff (!rst)
        (!ppu_en) |-> (dut.accumulator_g == 64'b0);
    endproperty
    assert property (p_acc_gating) else $error("[SVA] Gating failed: accumulator_g is active while ppu_en is low.");

    // 2. Idle Output Stability
    property p_idle_out;
        @(posedge clk) disable iff (!rst)
        (!ppu_en) |-> (activation_out == model_activation_block(8'b0, mode4x4, act_fn_sel));
    endproperty
    assert property (p_idle_out) else $error("[SVA] Idle output mismatch: Did not evaluate activation at 0.");

    // 3. Shift Register Hold (Grey-box)
    // Assuming the Requantizer instantiated in PPU is named 'u_requantizer' and its register is 'shamt_reg'
    // Adjust hierarchy path if your actual RTL naming differs.
    property p_shamt_hold;
        @(posedge clk) disable iff (!rst)
        (!shamt_wr_en) |=> ($past(dut.u_requantizer.shamt) == dut.u_requantizer.shamt);
    endproperty
    assert property (p_shamt_hold) else $error("[SVA] Shift amount register mutated without shamt_wr_en.");

    // ==========================================
    // Reference Model (Scoreboard Logic)
    // ==========================================
    
    // Mock Requantizer Model
    function logic signed [7:0] model_requantize(logic signed [63:0] acc, logic [5:0] shamt, logic mode_4x4);
        logic signed [63:0] shifted_val;
        logic round_bit;
        logic signed [63:0] rounded_val;
        logic signed [7:0] clamped_val;
        
        if (shamt == 0) begin
            rounded_val = acc;
        end else begin
            shifted_val = acc >>> shamt;
            round_bit = acc[shamt - 1]; // Nearest integer rounding
            rounded_val = shifted_val + round_bit;
        end

        // Saturating Clamp
        if (mode_4x4) begin // INT4 [-8, 7]
            if (rounded_val > 7) clamped_val = 8'sd7;
            else if (rounded_val < -8) clamped_val = -8'sd8;
            else clamped_val = rounded_val[7:0];
        end else begin // INT8 [-128, 127]
            if (rounded_val > 127) clamped_val = 8'sd127;
            else if (rounded_val < -128) clamped_val = -8'sd128;
            else clamped_val = rounded_val[7:0];
        end
        return clamped_val;
    endfunction

    // Mock Activation Model (Replace with actual verified activation logic)
    function logic [7:0] model_activation_block(logic signed [7:0] act_in, logic mode_4x4, logic [2:0] sel);
        // Fallback dummy logic assuming 0 is Identity, 1 is ReLU
        case(sel)
            3'b000: return act_in; // Identity
            3'b001: return (act_in > 0) ? act_in : 8'b0; // ReLU
            default: return act_in; 
        endcase
    endfunction

    // Continuous expected value calculation (Strictly Combinational)
    logic signed [7:0] expected_act_in;
    logic [7:0] expected_out;

    always_comb begin
        expected_act_in = model_requantize(accumulator, stored_shamt, mode4x4);
        expected_out = model_activation_block(expected_act_in, mode4x4, act_fn_sel);
    end

    // Scoreboard Checker (Sampled after combinational logic settles)
    always_ff @(negedge clk) begin
        if (rst && ppu_en) begin
            if (activation_out !== expected_out) begin
                $error("[SCOREBOARD] Mismatch! Acc: %0d, Shamt: %0d, Mode: %b, Sel: %b | Expected: %0d, Got: %0d", 
                       accumulator, stored_shamt, mode4x4, act_fn_sel, expected_out, activation_out);
            end
        end
    end

    // Track stored shift amount for the reference model
    always_ff @(posedge clk or negedge rst) begin
        if (!rst) stored_shamt <= 6'b0;
        else if (shamt_wr_en) stored_shamt <= shamt_data;
    end

    // ==========================================
    // Test Sequences
    // ==========================================
    initial begin
        $display("=== Starting PPU Verification ===");
        
        // Init
        rst = 0;
        accumulator = 64'b0;
        shamt_data = 6'b0;
        shamt_wr_en = 0;
        mode4x4 = 0;
        act_fn_sel = 3'b000;
        ppu_en = 0;
        
        #25; // Offset from clock edge to avoid reset races
        rst = 1;

        // ----------------------------------------------------
        // 2.1. Reset & Initialization
        // ----------------------------------------------------
        $display("[TEST] 2.1 Reset & Initialization");
        @(posedge clk);
        act_fn_sel = 3'b000; 
        
        // ----------------------------------------------------
        // 2.2. Configuration (SCALE Instruction)
        // ----------------------------------------------------
        $display("[TEST] 2.2 Configuration (SCALE)");
        @(posedge clk);
        shamt_data = 6'd14;
        shamt_wr_en = 1;
        
        @(posedge clk); // Hold high across posedge to register
        shamt_wr_en = 0;
        shamt_data = 6'd0; 
        
        // ----------------------------------------------------
        // 2.3. Datapath Gating & Idle States
        // ----------------------------------------------------
        $display("[TEST] 2.3 Datapath Gating");
        @(posedge clk);
        ppu_en = 0;
        for (int i=0; i<10; i++) begin
            @(posedge clk);
            accumulator = $urandom;
            accumulator = {accumulator[31:0], $urandom};
        end

        // ----------------------------------------------------
        // 2.4. Execution (EXEC_PP Instruction)
        // ----------------------------------------------------
        $display("[TEST] 2.4 Execution Datapath");
        @(posedge clk);
        ppu_en = 1;
        for (int i=0; i<50; i++) begin
            @(posedge clk);
            accumulator = $urandom;
            accumulator = {accumulator[31:0], $urandom};
            act_fn_sel = $urandom_range(0, 1); 
            mode4x4 = $urandom_range(0, 1);
        end

        // ----------------------------------------------------
        // 2.5. Corner Cases
        // ----------------------------------------------------
        $display("[TEST] 2.5 Back-to-Back SCALE and EXEC_PP");
        // Cycle N: SCALE
        @(posedge clk);
        ppu_en = 0;
        shamt_data = 6'd5;
        shamt_wr_en = 1;
        
        // Cycle N+1: EXEC_PP
        @(posedge clk);
        shamt_wr_en = 0;
        ppu_en = 1;
        accumulator = 64'd1024; 
        mode4x4 = 0; 
        act_fn_sel = 3'b000; 
        
        @(posedge clk);
        ppu_en = 0;

        #20;
        $display("=== PPU Verification Complete ===");
        $finish;
    end

endmodule