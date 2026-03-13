`timescale 1ns / 1ps

module Requantizer (
    input wire clk,
    input wire rst,
    input wire quantize_en,
    input wire signed [63:0] acc,
    input wire [5:0] shamt,

    output reg [7:0] activation_in
);

    // Operand Isolation
    wire signed [63:0] isolated_acc = quantize_en ? acc : 64'sd0;

    // Stage 1: Shift to expose the rounding bit
    // Shift by (s-1) to drop the 0.5 fractional bit into the 0-th index
    wire [5:0] stage1_shamt = (shamt == 6'd0) ? 6'd0 : (shamt - 1'b1);
    wire signed [63:0] pre_rounded_val = $signed(isolated_acc) >>> stage1_shamt;
    wire fractional_round_bit = (shamt == 6'd0) ? 1'b0 : pre_rounded_val[0];

    // Pre-Rounding Bounds Check
    // Verify the upper 56 bits are sign extensions before doing math  
    wire is_pos_in_bounds = ~(|(pre_rounded_val[63:8]));
    wire is_neg_in_bounds =  &(pre_rounded_val[63:8]);
    wire is_raw_val_in_bounds = is_pos_in_bounds | is_neg_in_bounds;

    // Stage 2: 10-bit Addition & Final Scale
    // Slice the bottom 10 bits for a fast addition, then shift by 1 to finish dividing
    wire signed [9:0] rounded_10bit_slice = $signed(pre_rounded_val[9:0]) + fractional_round_bit;
    wire signed [9:0] final_scaled_10bit = (shamt == 6'd0) ? rounded_10bit_slice : (rounded_10bit_slice >>> 1);
    
    // Post-Rounding Bounds Check
    // Catch edge cases where adding the round bit pushed a valid number out of bounds
    wire overflow_after_round = (!final_scaled_10bit[9]) && (|final_scaled_10bit[8:7]);
    wire underflow_after_round = (final_scaled_10bit[9]) && (~&final_scaled_10bit[8:7]);
    
    // Final Clamping Multiplexers
    wire signed [7:0] final_clamped_val = (!is_raw_val_in_bounds) ? ((pre_rounded_val[63] == 1'b0) ? 8'sd127 : -8'sd128) : 
            (overflow_after_round) ? 8'sd127 : 
            (underflow_after_round) ? -8'sd128 : final_scaled_10bit[7:0];

    // Output Register
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            activation_in <= 8'b0;
        end else if (quantize_en) begin
            activation_in <= final_clamped_val;
        end
    end

endmodule