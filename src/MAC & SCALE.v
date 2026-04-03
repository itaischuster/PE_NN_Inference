`timescale 1ns / 1ps

module MAC_and_SCALE (
    input wire clk,
    input wire rst,
    input wire [31:0] port_A,
    input wire [31:0] port_B,
    output reg [63:0] accumulator,

    input wire mode4x4,
    input wire a_is_signed,
    input wire b_is_signed,
    input wire scale_mode,
    input wire latch_en,
    input wire [1:0] scale_phase,
    input wire mac_iso_en,
    input wire scale_iso_en,
    input wire [1:0] acc_source,
    input wire acc_wr_en,
    input wire acc_load,
    input wire rst_acc
);

    // Input Routing

    reg [23:0] holding_reg;

    always @(posedge clk or negedge rst) begin
        if (!rst)
            holding_reg <= 24'b0;
        else if (latch_en)
            holding_reg <= accumulator[31:8];
    end

    // Broadcast Byte Selection

    reg [7:0] broadcast_byte;
    always @(*) begin
        case (scale_phase)
            2'b00: broadcast_byte = accumulator[7:0];
            2'b01: broadcast_byte = holding_reg[7:0];
            2'b10: broadcast_byte = holding_reg[15:8];
            2'b11: broadcast_byte = holding_reg[23:16];
        endcase
    end

    // A_Byte(s): Source Mux and Broadcast/Split

    wire [7:0] byteA0 = scale_mode ? broadcast_byte : port_A[7:0];
    wire [7:0] byteA1 = scale_mode ? broadcast_byte : port_A[15:8];
    wire [7:0] byteA2 = scale_mode ? broadcast_byte : port_A[23:16];
    wire [7:0] byteA3 = scale_mode ? broadcast_byte : port_A[31:24];

    // B_Bytes: Always split

    wire [7:0] byteB0 = port_B[7:0];
    wire [7:0] byteB1 = port_B[15:8];
    wire [7:0] byteB2 = port_B[23:16];
    wire [7:0] byteB3 = port_B[31:24];

    // Compute Core

    // Multiplier Array

    wire signed [15:0] mult_8_0, mult_8_1, mult_8_2, mult_8_3;
    wire signed [7:0] mult_4_0_bottom, mult_4_0_top;
    wire signed [7:0] mult_4_1_bottom, mult_4_1_top;
    wire signed [7:0] mult_4_2_bottom, mult_4_2_top;
    wire signed [7:0] mult_4_3_bottom, mult_4_3_top;

    MP_Multiplier mult_0 (
        .a(byteA0), .b(byteB0), .mode4x4(mode4x4),
        .a_signed(a_is_signed), .b_signed(b_is_signed),
        .mult8out(mult_8_0),
        .bottom_mult4out(mult_4_0_bottom), .top_mult4out(mult_4_0_top)
    );

    MP_Multiplier mult_1 (
        .a(byteA1), .b(byteB1), .mode4x4(mode4x4),
        .a_signed(a_is_signed), .b_signed(b_is_signed),
        .mult8out(mult_8_1),
        .bottom_mult4out(mult_4_1_bottom), .top_mult4out(mult_4_1_top)
    );

    MP_Multiplier mult_2 (
        .a(byteA2), .b(byteB2), .mode4x4(mode4x4),
        .a_signed(a_is_signed), .b_signed(b_is_signed),
        .mult8out(mult_8_2),
        .bottom_mult4out(mult_4_2_bottom), .top_mult4out(mult_4_2_top)
    );

    MP_Multiplier mult_3 (
        .a(byteA3), .b(byteB3), .mode4x4(mode4x4),
        .a_signed(a_is_signed), .b_signed(b_is_signed),
        .mult8out(mult_8_3),
        .bottom_mult4out(mult_4_3_bottom), .top_mult4out(mult_4_3_top)
    );

    // MAC Reduction Tree

    wire mode8x8 = ~mode4x4; 

    wire [7:0] mac_la_a = mac_iso_en ? (mode4x4 ? mult_4_0_bottom : mult_8_0[7:0]) : 8'b0;
    wire [7:0] mac_la_b = mac_iso_en ? (mode4x4 ? mult_4_1_bottom : mult_8_1[7:0]) : 8'b0;
    wire [7:0] mac_ha_a = mac_iso_en ? (mode4x4 ? mult_4_0_top : mult_8_0[15:8]) : 8'b0;
    wire [7:0] mac_ha_b = mac_iso_en ? (mode4x4 ? mult_4_1_top : mult_8_1[15:8]) : 8'b0;

    wire [7:0] mac_lb_a = mac_iso_en ? (mode4x4 ? mult_4_2_bottom : mult_8_2[7:0]) : 8'b0;
    wire [7:0] mac_lb_b = mac_iso_en ? (mode4x4 ? mult_4_3_bottom : mult_8_3[7:0]) : 8'b0;
    wire [7:0] mac_hb_a = mac_iso_en ? (mode4x4 ? mult_4_2_top : mult_8_2[15:8]) : 8'b0;
    wire [7:0] mac_hb_b = mac_iso_en ? (mode4x4 ? mult_4_3_top : mult_8_3[15:8]) : 8'b0;

    // Stage 1: Two 16-bit Splitable Adders

    // Group A

    wire [8:0] sum1_L_raw = {1'b0, mac_la_a} + {1'b0, mac_la_b};
    wire c1_mid = sum1_L_raw[8] & mode8x8;
    wire [8:0] sum1_H_raw = {1'b0, mac_ha_a} + {1'b0, mac_ha_b} + {8'b0, c1_mid};

    wire t1_low = mac_la_a[7] ^ mac_la_b[7] ^ sum1_L_raw[8];
    wire t1_high = mac_ha_a[7] ^ mac_ha_b[7] ^ sum1_H_raw[8];

    // Group B

    wire [8:0] sum2_L_raw = {1'b0, mac_lb_a} + {1'b0, mac_lb_b};
    wire c2_mid = sum2_L_raw[8] & mode8x8;
    wire [8:0] sum2_H_raw = {1'b0, mac_hb_a} + {1'b0, mac_hb_b} + {8'b0, c2_mid};

    wire t2_low = mac_lb_a[7] ^ mac_lb_b[7] ^ sum2_L_raw[8];
    wire t2_high = mac_hb_a[7] ^ mac_hb_b[7] ^ sum2_H_raw[8];

    // Stage 2: Routing MUXes and 18-bit Splitable Adder

    wire [8:0] mux_A_out = mode8x8 ? {t1_high, sum1_H_raw[7:0]} : {sum1_H_raw[7:0], t1_low};
    wire [8:0] mux_B_out = mode8x8 ? {t2_high, sum2_H_raw[7:0]} : {sum2_H_raw[7:0], t2_low};

    wire [17:0] L2_in_A = {t1_high, mux_A_out, sum1_L_raw[7:0]};
    wire [17:0] L2_in_B = {t2_high, mux_B_out, sum2_L_raw[7:0]};

    wire [9:0] sum3_L_raw = {1'b0, L2_in_A[8:0]} + {1'b0, L2_in_B[8:0]};
    wire c3_mid = sum3_L_raw[9] & mode8x8;
    wire [9:0] sum3_H_raw = {1'b0, L2_in_A[17:9]} + {1'b0, L2_in_B[17:9]} + {9'b0, c3_mid};

    wire t3_low = L2_in_A[8] ^ L2_in_B[8] ^ sum3_L_raw[9];
    wire t3_high = L2_in_A[17] ^ L2_in_B[17] ^ sum3_H_raw[9];

    // Stage 3: One 10-bit Adder (INT4 Only)

    wire [9:0] L3_in_A = {t3_low, sum3_L_raw[8:0]};
    wire [9:0] L3_in_B = {t3_high, sum3_H_raw[8:0]};

    wire [10:0] sum4_raw = {1'b0, L3_in_A} + {1'b0, L3_in_B};
    wire t4_final = L3_in_A[9] ^ L3_in_B[9] ^ sum4_raw[10];

    // MAC Tree Outputs

    wire [10:0] mac4_result = {t4_final, sum4_raw[9:0]};
    wire [17:0] mac8_result = {sum3_H_raw[8:0], sum3_L_raw[8:0]};

    // SCALE Stitching Tree

    wire [15:0] scale_iso_0 = scale_iso_en ? mult_8_0 : 16'b0;
    wire [15:0] scale_iso_1 = scale_iso_en ? mult_8_1 : 16'b0;
    wire [15:0] scale_iso_2 = scale_iso_en ? mult_8_2 : 16'b0;
    wire [15:0] scale_iso_3 = scale_iso_en ? mult_8_3 : 16'b0;

    wire [23:0] stitch_ext_0 = a_is_signed ? {{8{scale_iso_0[15]}}, scale_iso_0} : {8'b0, scale_iso_0};
    wire [23:0] stitch_ext_2 = a_is_signed ? {{8{scale_iso_2[15]}}, scale_iso_2} : {8'b0, scale_iso_2};

    wire [23:0] stitch_s1_lo = stitch_ext_0 + {scale_iso_1, 8'b0};
    wire [23:0] stitch_s1_hi = stitch_ext_2 + {scale_iso_3, 8'b0};

    wire [39:0] stitch_lo_ext = a_is_signed ? {{16{stitch_s1_lo[23]}}, stitch_s1_lo} : {16'b0, stitch_s1_lo};
    wire [39:0] stitch_40 = stitch_lo_ext + {stitch_s1_hi, 16'b0};

    // Alignment & Select Unit

    wire [31:0] mac4_addend = {{21{mac4_result[10]}}, mac4_result};
    wire [31:0] mac8_addend = {{14{mac8_result[17]}}, mac8_result};

    reg [63:0] scale_addend;
    always @(*) begin
        case (scale_phase)
            2'b00: scale_addend = {24'b0, stitch_40};
            2'b01: scale_addend = {16'b0, stitch_40, 8'b0};
            2'b10: scale_addend = {8'b0, stitch_40, 16'b0};
            2'b11: scale_addend = {stitch_40, 24'b0};
        endcase
    end

    reg [31:0] addend_lo;
    always @(*) begin
        case (acc_source)
            2'b00: addend_lo = mac4_addend;
            2'b01: addend_lo = mac8_addend;
            2'b10: addend_lo = scale_addend[31:0];
            2'b11: addend_lo = port_B;
        endcase
    end

    wire [31:0] addend_hi = scale_addend[63:32];

    // Accumulation Unit
    
    wire [31:0] gated_lo_feedback = accumulator[31:0] & {32{~acc_load}};
    wire upper_fb_gate = scale_mode & ~acc_load;
    wire [31:0] gated_hi_feedback = accumulator[63:32] & {32{upper_fb_gate}};
    wire [31:0] gated_hi_addend = addend_hi & {32{scale_mode}};

    wire [32:0] lower_sum = {1'b0, addend_lo} + {1'b0, gated_lo_feedback};
    wire lower_cout = lower_sum[32];
    wire [31:0] lower_result = lower_sum[31:0];

    wire gated_carry = lower_cout & scale_mode;
    wire [31:0] upper_result = gated_hi_addend + gated_hi_feedback + {31'b0, gated_carry};

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            accumulator <= 64'b0;
        end
        else if (rst_acc) begin
            accumulator <= 64'b0;
        end
        else if (acc_wr_en) begin
            accumulator[31:0] <= lower_result;
            if (scale_mode)
                accumulator[63:32] <= upper_result;
        end
    end

endmodule