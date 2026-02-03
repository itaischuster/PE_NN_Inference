module PE(
    input clk,
    input signed [31:0] op_A,
    input signed [31:0] op_B,
    input rst,
    input valid_in,
    input [4:0] opcode,
    input chip_slct,
    output signed [7:0] data_out,
    output busy,
    output valid_out
);

localparam RESCALE = 5'd5;
localparam CFG_ACT = 5'd6;

reg [31:0] reg_A, reg_B;
reg [6:0] cfg_reg;
reg [4:0] controller;
reg [7:0] activation_out;
wire done;
wire signed [63:0] w_accumulator;
wire signed [7:0] w_activation_in;

MAC_and_32x32 ALU (
.clk(clk), 
.controller(controller), 
.rst(rst), 
.op_A(reg_A), 
.op_B(reg_B), 
.done(done), 
.busy(busy), 
.accumulator(w_accumulator)
);

Rescale rescale (
.clk(clk), 
.done(done), 
.rst(rst), 
.acc(w_accumulator), 
.cfg_reg(cfg_reg), 
.activation_in(w_activation_in)
);

Activation activate (
.clk(clk), 
.rst(rst), .controller(controller), 
.cfg_reg(cfg_reg), 
.activation_in(w_activation_in), 
.data_out(data_out), 
.valid_out(valid_out)
);


always @(posedge clk or posedge rst) begin
    if (rst) begin
        reg_A <= 0;
        reg_B <= 0;
        cfg_reg <= 0;
        controller <= 0;
        activation_out <= 0;
    end
    else if (chip_slct) begin
        controller <= opcode;
        if (valid_in) begin
            reg_A <= op_A;
            reg_B <= op_B;
        end
        else if (~busy && (controller == RESCALE)) begin
            reg_A <= w_accumulator[31:0];
            reg_B <= op_B;
        end
        else if (opcode == CFG_ACT) begin
            cfg_reg <= op_B[6:0];
        end
    end
end



endmodule