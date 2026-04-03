`timescale 1ns/1ps

module Shared_MAC_Tree (
    input wire [63:0] in_data,
    input wire mode,
    output wire [17:0] out_int8,
    output wire [10:0] out_int4
);

    wire [15:0] P1, P2, P3, P4;
    assign P1 = in_data[15:0];
    assign P2 = in_data[31:16];
    assign P3 = in_data[47:32];
    assign P4 = in_data[63:48];

    wire [8:0] sum1_L_raw;
    wire [8:0] sum1_H_raw;
    wire c1_mid;
    wire t1_low, t1_high;
    
    // Lower 8-bit Adder
    assign sum1_L_raw = P1[7:0] + P2[7:0]; 
    
    // Carry Blocker
    assign c1_mid = sum1_L_raw[8] & mode; 
    
    // Upper 8-bit Adder
    assign sum1_H_raw = P1[15:8] + P2[15:8] + c1_mid;

    // Sign Recovery (A_MSB ^ B_MSB ^ Cout)
    assign t1_low = P1[7] ^ P2[7] ^ sum1_L_raw[8];
    assign t1_high = P1[15] ^ P2[15] ^ sum1_H_raw[8];

    // ADDER 2 (Sums P3 and P4) 
    wire [8:0] sum2_L_raw;
    wire [8:0] sum2_H_raw;
    wire c2_mid;
    wire t2_low, t2_high;
    
    assign sum2_L_raw = P3[7:0] + P4[7:0]; 
    assign c2_mid = sum2_L_raw[8] & mode; 
    assign sum2_H_raw = P3[15:8] + P4[15:8] + c2_mid;

    assign t2_low = P3[7] ^ P4[7] ^ sum2_L_raw[8];
    assign t2_high = P3[15] ^ P4[15] ^ sum2_H_raw[8];

    // ROUTING MUX (FORMATTER)
    wire [8:0]  mux_A_out, mux_B_out;
    wire [17:0] L2_in_A, L2_in_B;

    assign mux_A_out = mode ? {t1_high, sum1_H_raw[7:0]} : {sum1_H_raw[7:0], t1_low};
    assign mux_B_out = mode ? {t2_high, sum2_H_raw[7:0]} : {sum2_H_raw[7:0], t2_low};

    assign L2_in_A = {t1_high, mux_A_out, sum1_L_raw[7:0]};
    assign L2_in_B = {t2_high, mux_B_out, sum2_L_raw[7:0]};

    // ONE 18-BIT SPLITABLE ADDER
    wire [9:0] sum3_L_raw;
    wire [9:0] sum3_H_raw;
    wire c3_mid;
    wire t3_low, t3_high;

    // Lower 9-bit Adder
    assign sum3_L_raw = L2_in_A[8:0] + L2_in_B[8:0];

    // Carry Blocker (AND gate)
    assign c3_mid = sum3_L_raw[9] & mode;

    // Upper 9-bit Adder
    assign sum3_H_raw = L2_in_A[17:9] + L2_in_B[17:9] + c3_mid;

    // Sign Recovery
    assign t3_low  = L2_in_A[8]  ^ L2_in_B[8]  ^ sum3_L_raw[9];
    assign t3_high = L2_in_A[17] ^ L2_in_B[17] ^ sum3_H_raw[9];

    // INT8 FINAL OUTPUT
    assign out_int8 = {sum3_H_raw[8:0], sum3_L_raw[8:0]};

    // ONE 10-BIT ADDER (INT4 ONLY)
    wire [10:0] sum4_raw;
    wire t4_final;

    wire [9:0] L3_in_A, L3_in_B;
    assign L3_in_A = {t3_low,  sum3_L_raw[8:0]};
    assign L3_in_B = {t3_high, sum3_H_raw[8:0]};

    // 10-bit Addition
    assign sum4_raw = L3_in_A + L3_in_B;

    // Sign Recovery
    assign t4_final = L3_in_A[9] ^ L3_in_B[9] ^ sum4_raw[10];

    // INT4 FINAL OUTPUT
    assign out_int4 = {t4_final, sum4_raw[9:0]};

endmodule