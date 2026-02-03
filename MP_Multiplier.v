module MP_Multiplier(
    input signed [7:0] a,
    input signed [7:0] b,
    input mode4x4,
    input a_signed,
    input b_signed,
    output signed [15:0] mult8out,
    output signed [7:0] bottom_mult4out,
    output signed [7:0] top_mult4out
);

    wire [3:0] a0 = a[3:0];
    wire [3:0] a1 = a[7:4];
    wire [3:0] b0 = b[3:0];
    wire [3:0] b1 = b[7:4];

    wire mult00_sign = mode4x4;
    wire mult11_sign_a = (mode4x4) ? 1'b1 : a_signed;
    wire mult11_sign_b = (mode4x4) ? 1'b1 : b_signed;

    wire [8:0] mult00;
    wire [8:0] mult01;
    wire [8:0] mult10;
    wire [8:0] mult11;

    wire sign_01 = mult01[8];
    wire sign_10 = mult10[8];

    Multiplier4 mult_00 (.a(a0), .b(b0), .a_signed(mult00_sign), .b_signed(mult00_sign), .mult4out(mult00));
    Multiplier4 mult_01 (.a(a0), .b(b1), .a_signed(1'b0), .b_signed(b_signed), .mult4out(mult01));
    Multiplier4 mult_10 (.a(a1), .b(b0), .a_signed(a_signed), .b_signed(1'b0), .mult4out(mult10));
    Multiplier4 mult_11 (.a(a1), .b(b1), .a_signed(mult11_sign_a), .b_signed(mult11_sign_b), .mult4out(mult11));

    assign mult8out = {8'b0, mult00[7:0]} + {{4{sign_01}}, mult01[7:0], 4'b0} + {{4{sign_10}}, mult10[7:0], 4'b0} + {mult11[7:0], 8'b0};
    assign bottom_mult4out = mult00[7:0];
    assign top_mult4out = mult11[7:0];

endmodule