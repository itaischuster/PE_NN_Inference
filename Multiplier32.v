module Multiplier32(
    input clk,
    input [4:0] controller,
    input rst,
    input [31:0] op_A,
    input [31:0] op_B,
    output reg done,
    output reg busy,
    output reg [63:0] accumulator
);

localparam RST_ACC = 5'd1;
localparam RESCALE = 5'd5;

wire [7:0] byteA0 = acc_val[7:0];
wire [7:0] byteA1 = acc_val[15:8];
wire [7:0] byteA2 = acc_val[23:16];
wire signed [7:0] byteA3 = acc_val[31:24];
wire [7:0] byteB0 = scale_factor[7:0];
wire [7:0] byteB1 = scale_factor[15:8];
wire [7:0] byteB2 = scale_factor[23:16];
wire [7:0] byteB3 = scale_factor[31:24];

reg [7:0] multiplicand;

wire [15:0] mult0;
wire [15:0] mult1;
wire [15:0] mult2;
wire [15:0] mult3;
wire [23:0] adder24_1 = {8'b0, mult0} + {mult1, 8'b0};
wire [23:0] adder24_2 = {8'b0, mult2} + {mult3, 8'b0};
wire [39:0] adder40 = {16'b0, adder24_1} + {adder24_2, 16'b0};

reg [1:0] cycle_counter;

MP_Multiplier mult_0 (.a(byteA0), .b(multiplicand), .mode4x4(1'b0), .a_signed(1'b0), .b_signed(1'b0), .mult8out(mult0), .bottom_mult4out(), .top_mult4out());
MP_Multiplier mult_1 (.a(byteA1), .b(multiplicand), .mode4x4(1'b0), .a_signed(1'b0), .b_signed(1'b0), .mult8out(mult1), .bottom_mult4out(), .top_mult4out());
MP_Multiplier mult_2 (.a(byteA2), .b(multiplicand), .mode4x4(1'b0), .a_signed(1'b0), .b_signed(1'b0), .mult8out(mult2), .bottom_mult4out(), .top_mult4out());
MP_Multiplier mult_3 (.a(byteA3), .b(multiplicand), .mode4x4(1'b0), .a_signed(1'b1), .b_signed(1'b0), .mult8out(mult3), .bottom_mult4out(), .top_mult4out());

always @(*) begin
    if (start) begin
        multiplicand = byteB0;
    end else begin
        case (cycle_counter)
            2'b01: multiplicand = byteB1;
            2'b10: multiplicand = byteB2;
            2'b11: multiplicand = byteB3;
            default: multiplicand = 8'b0;
        endcase
    end
end

always @(posedge clk or posedge rst) begin
    if (rst) begin
        cycle_counter <= 0;
        done <= 0;
        accumulator <= 0;
        busy <= 0;
    end
    else begin
        if (controller == RST_ACC) begin
            accumulator <= 0;
        end
        else begin
            if (controller == RESCALE && ~busy) begin
                busy <= 1;
                cycle_counter <= 1'b1;
                accumulator <= {{24{adder40[39]}}, adder40};
                done <= 0;
            end 
            else if (busy) begin
                cycle_counter <= cycle_counter + 1;
                case (cycle_counter)
                    2'b01: accumulator <= accumulator + {{16{adder40[39]}}, adder40, 8'b0};
                    2'b10: accumulator <= accumulator + {{8{adder40[39]}}, adder40, 16'b0};
                    2'b11: begin
                        accumulator <= accumulator + {adder40, 24'b0};
                        cycle_counter <= 0;
                        busy <= 0;
                        done <= 1;
                    end
                    default: begin
                        cycle_counter <= 0;
                        busy <= 0;
                        done <= 0;
                    end
                endcase
            end
        end
    end
end
endmodule