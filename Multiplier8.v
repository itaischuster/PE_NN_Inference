module Multiplier8(
    input signed [7:0] a,
    input signed [7:0] b,
    output signed [15:0] out
);

assign out = {{8{a[7]}}, a} * {{8{b[7]}}, b};

endmodule