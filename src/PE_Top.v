`timescale 1ns / 1ps

module PE_Top (
    input wire clk,
    input wire rst, 

    // Control & Status Interface
    input wire chp_slct,
    input wire valid_in,
    output wire pe_ready,
    output wire output_valid, 

    // Data Interface
    input wire [4:0] pe_opcode,
    input wire [31:0] operand_A,
    input wire [31:0] operand_B,

    output wire [7:0] data_out 
);

// Input Gating Logic
wire [4:0] internal_opcode;
assign internal_opcode = (chp_slct && valid_in) ? pe_opcode : 5'b00000;

// Internal Routing Wires
wire [4:0] mac_cmd;
wire mac_busy;
wire mac_done;
wire [63:0] accumulator_net;
    
wire quantize_en;
wire activation_en;
wire [7:0] requantized_data;

// Module Instantiations

// PE Controller
PE_Controller u_controller (
    .clk (clk),
    .rst (rst),
    .pe_opcode (internal_opcode),
    .mac_busy (mac_busy),
    .mac_done (mac_done),
    .mac_cmd (mac_cmd),
    .quantize_en (quantize_en),
    .activation_en (activation_en),
    .pe_ready (pe_ready),
    .output_valid (output_valid)
);

// Arithmetic Datapath
ALU u_alu (
    .clk (clk),
    .mac_cmd (mac_cmd),
    .rst (rst),
    .op_A (operand_A),
    .op_B (operand_B),
    .done (mac_done),
    .busy (mac_busy),
    .accumulator (accumulator_net)
);

// Requantizer
Requantizer u_requantizer (
    .clk (clk),
    .rst (rst),
    .quantize_en (quantize_en),
    .acc (accumulator_net),
    .shamt (operand_A[5:0]),
    .activation_in (requantized_data)
    );

// Activation Block Placeholder (Stub)
// Since the final RAM/ROM decision is pending, this acts as a placeholder.
// It  mimics the 1-cycle read latency expected by the controller.
    
reg [7:0] activation_out_reg;
    
always @(posedge clk or negedge rst) begin
    if (!rst) begin
        activation_out_reg <= 8'b0;
    end else if (activation_en) begin
        // In the future, this will be replaced by your memory read logic.
        // For now, it just passes the scaled data through to the output.
        activation_out_reg <= requantized_data;
    end
end

assign data_out = activation_out_reg;

endmodule