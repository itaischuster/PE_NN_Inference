module Requantizer (
    input wire signed [63:0] accumulator,
    input wire [5:0] shamt,
    input wire mode4x4,
    output reg signed [7:0] activation_in
);

    // Pad the input for the default round bit
    wire signed [64:0] padded_data = {accumulator, 1'b0};

    // Two-Stage Barrel Shifter (Coarse and Fine)
    wire signed [64:0] coarse_shifted = padded_data >>> {shamt[5:3], 3'b000};
    wire signed [64:0] fine_shifted = coarse_shifted >>> shamt[2:0];

    // Extract base components
    wire round_bit = fine_shifted[0];
    wire [7:0] pre_round_8bit = fine_shifted[8:1]; 

    // Shared Incrementer
    wire [7:0] rounded_8bit = pre_round_8bit + round_bit;

    // Shared Overflow Trees (Cascaded)
    wire [56:0] upper_57 = fine_shifted[64:8];
    wire nor_tree_57 = ~|upper_57;
    wire and_tree_57 =  &upper_57;

    // Build the 4-bit extension for the 4-bit mode
    wire [3:0] mid_4 = fine_shifted[7:4];
    wire nor_tree_mid = ~|mid_4;
    wire and_tree_mid =  &mid_4;

    // Cascade them to create the 61-bit checks
    wire nor_tree_61 = nor_tree_57 & nor_tree_mid;
    wire and_tree_61 = and_tree_57 & and_tree_mid;

    // Truncation flags
    wire trunc_ovf_8 = ~(nor_tree_57 | and_tree_57);
    wire trunc_ovf_4 = ~(nor_tree_61 | and_tree_61);

    // Optimized Rounding Overflow (Sign-Toggle Trick)
    // A rounding overflow only happens if a positive number wraps to a negative number.
    wire round_ovf_8 = (~pre_round_8bit[7]) & rounded_8bit[7];
    wire round_ovf_4 = (~pre_round_8bit[3]) & rounded_8bit[3];

    // Merged Clamping Conditions: out-of-bounds AND positive OR rounding overflowed / out-of-bounds AND negative
    wire clamp_max_pos_8 = (trunc_ovf_8 & ~accumulator[63]) | round_ovf_8;
    wire clamp_min_neg_8 = (trunc_ovf_8 & accumulator[63]);

    wire clamp_max_pos_4 = (trunc_ovf_4 & ~accumulator[63]) | round_ovf_4;
    wire clamp_min_neg_4 = (trunc_ovf_4 & accumulator[63]);

    always @(*) begin
        if (mode4x4) begin
            if (clamp_max_pos_4) begin
                activation_in = 8'd7;
            end else if (clamp_min_neg_4) begin
                activation_in = -8'd8;
            end else begin
                activation_in = {{4{rounded_8bit[3]}}, rounded_8bit[3:0]};
            end
        end else begin
            if (clamp_max_pos_8) begin
                activation_in = 8'd127;
            end else if (clamp_min_neg_8) begin
                activation_in = -8'd128;
            end else begin
                activation_in = rounded_8bit;
            end
        end
    end

endmodule