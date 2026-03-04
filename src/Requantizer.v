`timescale 1ns / 1ps

module Requantizer (
    input wire clk,
    input wire rst,
    input wire quantize_en,
    input wire [63:0] acc,
    input wire [5:0] shamt,

    output reg [7:0] activation_in
);

    // Operand Isolation
    wire signed [63:0] isolated_acc = quantize_en ? acc : 64'sd0;

    // Shifting & Rounding
    wire [5:0] shift_minus_one = (shamt == 6'd0) ? 6'd0 : (shamt - 1'b1);
    wire signed [63:0] shifted_acc = $signed(isolated_acc) >>> shift_minus_one;    
    wire signed [63:0] plus_one = shifted_acc + 64'sd1;

    // Scale Adjustment
    wire signed [63:0] scaled_val;
    assign scaled_val = (shamt == 6'd0) ? isolated_acc : ($signed(plus_one) >>> 1);

    // Saturation & Clamping Logic
    wire upper_bits_all_0 = ~(|(scaled_val[63:7]));
    wire upper_bits_all_1 =  &(scaled_val[63:7]);
    wire in_range = upper_bits_all_0 | upper_bits_all_1;

    wire [7:0] clamped_val;
    assign clamped_val = in_range ? scaled_val[7:0] :
                         (scaled_val[63] == 1'b0) ? 8'sd127 : -8'sd128;

    // Output Register
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            activation_in <= 8'b0;
        end else if (quantize_en) begin
            activation_in <= clamped_val;
        end
    end

endmodule