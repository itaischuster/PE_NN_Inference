`timescale 1ns/1ps

module PE(
    input signed [31:0] op_A,
    input signed [31:0] op_B,
    input clk,
    input rst_n,
    input input_valid,
    input chp_slct,
    input act_cfg_valid,
    input [4:0] pe_opcode,
    input [2:0] act_cfg,
    input [5:0] shamt,
    output signed [7:0] data_out,
    output pe_ready,
    output output_valid
);

localparam MULT32 = 5'd5;

reg [31:0] reg_A, reg_B;

wire done;
wire busy;
wire quantize_en;
wire activation_en;
wire pe_ready;
wire signed [63:0] w_accumulator;
wire signed [7:0] w_activation_in;
wire [4:0] alu_cmd;


PE_Controller Controller (
    .clk(clk),
    .rst_n(rst_n),
    .pe_opcode(pe_opcode),
    .alu_busy(busy),
    .alu_done(done),
    .alu_cmd(alu_cmd),
    .quantize_en(quantize_en),
    .activation_en(activation_en),
    .pe_ready(pe_ready),
    .output_valid(output_valid)
);

ALU ALU (
    .clk(clk), 
    .alu_cmd(alu_cmd), 
    .rst_n(rst_n), 
    .op_A(reg_A), 
    .op_B(reg_B), 
    .done(done), 
    .busy(busy), 
    .accumulator(w_accumulator)
);

Requantizer Requantizer (
    .clk(clk), 
    .rst_n(rst_n), 
    .quantize_en(quantize_en), 
    .acc(w_accumulator), 
    .shamt(shamt), 
    .activation_in(w_activation_in)
);

Activation activate (
    .clk(clk), 
    .rst_n(rst_n), 
    .act_cfg(act_cfg),
    .act_cfg_valid(act_cfg_valid),
    .activation_en(activation_en), 
    .activation_in(w_activation_in), 
    .data_out(data_out)
);


always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        reg_A <= 32'b0;
        reg_B <= 32'b0;
    end
    else if (chp_slct && pe_ready) begin
        if (input_valid && pe_opcode != MULT32) begin
            reg_A <= op_A;
            reg_B <= op_B;
        end
        else if (pe_opcode == MULT32) begin
            reg_B <= op_B;
        end
    end
end



endmodule