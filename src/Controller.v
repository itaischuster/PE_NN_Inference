`timescale 1ns / 1ps

module Controller (
    input wire clk,
    input wire rst,

    input wire [4:0] pe_opcode,
    input wire chp_slct,
    input wire opcode_valid,

    input wire [3:0] cfg_data_in,

    // MAC & SCALE Datapath Control

    output wire mode4x4,
    output wire a_is_signed,
    output wire b_is_signed,
    output wire scale_mode,
    output wire latch_en,
    output wire [1:0] scale_phase,
    output wire mac_iso_en,
    output wire [1:0] acc_source,
    output wire acc_wr_en,
    output wire acc_load,
    output wire rst_acc,

    // PPU

    output wire ppu_en,
    output wire shamt_wr_en,
    output wire cfg_mode4x4,
    output wire [2:0] act_fn_sel,

    // Output Path

    output wire read_acc_en,
    output wire read_cfg_en,
    output wire [3:0] config_out,

    // Top-Level Status

    output wire scale_done,
    output wire pe_ready,
    output wire output_valid
);

// Opcode Encodings

localparam [4:0] NOP = 5'b00000;
localparam [4:0] RST_ACC = 5'b00001;
localparam [4:0] MAC = 5'b00010;
localparam [4:0] ADD_BIAS = 5'b00011;
localparam [4:0] SCALE = 5'b00100;
localparam [4:0] LOAD_CFG = 5'b00101;
localparam [4:0] EXEC_PP = 5'b00110;
localparam [4:0] READ_ACC_BYTE = 5'b00111;
localparam [4:0] READ_CFG = 5'b01000;

// FSM State Encodings

localparam [1:0] IDLE = 2'b00;
localparam [1:0] SC1 = 2'b01;
localparam [1:0] SC2 = 2'b10;
localparam [1:0] SC3 = 2'b11;

// Instruction Fetch

reg [4:0] opcode_reg;
wire capture_gate = pe_ready & opcode_valid & chp_slct;

always @(posedge clk or negedge rst) begin
    if (!rst)
        opcode_reg <= NOP;
    else
        opcode_reg <= capture_gate ? pe_opcode : NOP;
end

// Opcode Validator

reg [4:0] validated_cmd;

always @(*) begin
    case (opcode_reg)
        NOP,
        RST_ACC,
        MAC,
        ADD_BIAS,
        SCALE,
        LOAD_CFG,
        EXEC_PP,
        READ_ACC_BYTE,
        READ_CFG: validated_cmd = opcode_reg;
        default: validated_cmd = NOP;
    endcase
end

// FSM State Registers

reg [1:0] state, next_state;

reg [3:0] config_reg;

wire cmd_is_load_cfg = (state == IDLE) & (validated_cmd == LOAD_CFG);

always @(posedge clk or negedge rst) begin
    if (!rst)
        config_reg <= 4'b0000;
    else if (cmd_is_load_cfg)
        config_reg <= cfg_data_in;
end

assign cfg_mode4x4 = ~config_reg[3];
assign act_fn_sel = config_reg[2:0];
assign config_out = config_reg[3:0];


// SCALE32 Sequencer (FSM)

always @(posedge clk or negedge rst) begin
    if (!rst)
        state <= IDLE;
    else
        state <= next_state;
end

always @(*) begin
    case (state)
        IDLE: next_state = (validated_cmd == SCALE) ? SC1 : IDLE;
        SC1: next_state = SC2;
        SC2: next_state = SC3;
        SC3: next_state = IDLE;
        default: next_state = IDLE;
    endcase
end

assign pe_ready = rst & (state == IDLE) & (opcode_reg != SCALE);

reg scale_done_reg;

always @(posedge clk or negedge rst) begin
    if (!rst)
        scale_done_reg <= 1'b0;
    else
        scale_done_reg <= (state == SC3);
end

assign scale_done = scale_done_reg;

reg output_valid_reg;

always @(posedge clk or negedge rst) begin
    if (!rst)
        output_valid_reg <= 1'b0;
    else
        output_valid_reg <= (ppu_en | read_acc_en | read_cfg_en);
end

assign output_valid = output_valid_reg;

// Instruction Decoder

wire cmd_is_nop = (state == IDLE) & (validated_cmd == NOP);
wire cmd_is_rst_acc = (state == IDLE) & (validated_cmd == RST_ACC);
wire cmd_is_mac = (state == IDLE) & (validated_cmd == MAC);
wire cmd_is_bias = (state == IDLE) & (validated_cmd == ADD_BIAS);
wire cmd_is_scale0 = (state == IDLE) & (validated_cmd == SCALE);
wire cmd_is_exec_pp = (state == IDLE) & (validated_cmd == EXEC_PP);
wire cmd_is_read_acc = (state == IDLE) & (validated_cmd == READ_ACC_BYTE);
wire cmd_is_read_cfg = (state == IDLE) & (validated_cmd == READ_CFG);

// FSM state decode

wire in_sc1 = (state == SC1);
wire in_sc2 = (state == SC2);
wire in_sc3 = (state == SC3);

wire any_scale = cmd_is_scale0 | in_sc1 | in_sc2 | in_sc3;

assign mode4x4 = cmd_is_mac & ~config_reg[3];
assign a_is_signed = cmd_is_mac | in_sc3;
assign b_is_signed = cmd_is_mac;

// Input Routing

assign scale_mode = any_scale;
assign scale_phase[1] = in_sc2 | in_sc3;
assign scale_phase[0] = in_sc1 | in_sc3;
assign latch_en = cmd_is_scale0;

// Operand Isolation

assign mac_iso_en = cmd_is_mac;

// Accumulator Control

assign acc_source[1] = any_scale | cmd_is_bias;
assign acc_source[0] = (cmd_is_mac & config_reg[3]) | cmd_is_bias;

assign acc_wr_en = cmd_is_mac | cmd_is_bias | any_scale;
assign acc_load = cmd_is_scale0;
assign rst_acc = cmd_is_rst_acc;

// PPU and Output Control

assign ppu_en = cmd_is_exec_pp;
assign shamt_wr_en = cmd_is_scale0;
assign read_acc_en = cmd_is_read_acc;
assign read_cfg_en = cmd_is_read_cfg;

endmodule