module MAC_and_32x32_opcode(
    input clk,
    input [4:0] controller,
    input rst,
    input [31:0] op_A,
    input [31:0] op_B,
    output reg [63:0] accumulator
);

// OP-CODE
localparam RST_ACC = 5'd1;
localparam MAC4 = 5'd2;
localparam MAC8 = 5'd3;
localparam ADD_BIAS = 5'd4;
localparam RESCALE_0 = 5'd5;
localparam RESCALE_1 = 5'd6;
localparam RESCALE_2 = 5'd7;
localparam RESCALE_3 = 5'd8;

// Dividing the operands into bytes 
wire signed [7:0] byteA0 = op_A[7:0];
wire signed [7:0] byteA1 = op_A[15:8];
wire signed [7:0] byteA2 = op_A[23:16];
wire signed [7:0] byteA3 = op_A[31:24];
wire signed [7:0] byteB0 = op_B[7:0];
wire signed [7:0] byteB1 = op_B[15:8];
wire signed [7:0] byteB2 = op_B[23:16];
wire signed [7:0] byteB3 = op_B[31:24];

// Register for multiplication input (B bytes), changes depending on opcode
wire use_broadcast = (controller == RESCALE_0 || controller == RESCALE_1 || controller == RESCALE_2 || controller == RESCALE_3);
wire is_signed = ~use_broadcast;
reg [7:0] broadcast_byte;

// Multiplicand wires (B bytes), value dependent on op-code
wire [7:0] multiplicand0 = use_broadcast ? broadcast_byte : byteB0;
wire [7:0] multiplicand1 = use_broadcast ? broadcast_byte : byteB1;
wire [7:0] multiplicand2 = use_broadcast ? broadcast_byte : byteB2;
wire [7:0] multiplicand3 = use_broadcast ? broadcast_byte : byteB3;

// Wires for multiplication outputs
wire signed [15:0] mult_8_0;
wire signed [15:0] mult_8_1;
wire signed [15:0] mult_8_2;
wire signed [15:0] mult_8_3;
wire signed [7:0] mult_4_0_top;
wire signed [7:0] mult_4_0_bottom;
wire signed [7:0] mult_4_1_top;
wire signed [7:0] mult_4_1_bottom;
wire signed [7:0] mult_4_2_top;
wire signed [7:0] mult_4_2_bottom;
wire signed [7:0] mult_4_3_top;
wire signed [7:0] mult_4_3_bottom;

// 32x32 adders
wire [23:0] adder24_1 = {8'b0, mult_8_0} + {mult_8_1, 8'b0};
wire [23:0] adder24_2 = {8'b0, mult_8_2} + {mult_8_3, 8'b0};
wire [39:0] adder40 = {16'b0, adder24_1} + {adder24_2, 16'b0};

// Multi-Precision multiplier instantiations
MP_Multiplier mult_0 (.a(byteA0), .b(multiplicand0), .mode4x4(controller == MAC4), .a_signed(is_signed), .b_signed(is_signed),
.mult8out(mult_8_0), .bottom_mult4out(mult_4_0_bottom), .top_mult4out(mult_4_0_top)); // Byte0 Multiplications / Rescale stage 0
MP_Multiplier mult_1 (.a(byteA1), .b(multiplicand1), .mode4x4(controller == MAC4), .a_signed(is_signed), .b_signed(is_signed), 
.mult8out(mult_8_1), .bottom_mult4out(mult_4_1_bottom), .top_mult4out(mult_4_1_top)); // Byte1 Multiplications / Rescale stage 1
MP_Multiplier mult_2 (.a(byteA2), .b(multiplicand2), .mode4x4(controller == MAC4), .a_signed(is_signed), .b_signed(is_signed), 
.mult8out(mult_8_2), .bottom_mult4out(mult_4_2_bottom), .top_mult4out(mult_4_2_top)); // Byte2 Multiplications / Rescale stage 2
MP_Multiplier mult_3 (.a(byteA3), .b(multiplicand3), .mode4x4(controller == MAC4), .a_signed(1'b1), .b_signed(is_signed), 
.mult8out(mult_8_3), .bottom_mult4out(mult_4_3_bottom), .top_mult4out(mult_4_3_top)); // Byte3 Multiplications / Rescale stage 3

// Depending on opcode, decides the multiplier's B byte inputs
always @(*) begin
    case (controller)
        RESCALE_0: broadcast_byte = byteB0;
        RESCALE_1: broadcast_byte = byteB1;
        RESCALE_2: broadcast_byte = byteB2;
        RESCALE_3: broadcast_byte = byteB3;
        default: broadcast_byte = 8'b0;
    endcase
end

always @(posedge clk or posedge rst) begin
    if (rst) begin
        accumulator <= 0; // Asynchronous reset (will reset all PE registers) via external reset signal
    end
    else begin
        if (controller == RST_ACC) begin
            accumulator <= 0; // Synchronous accumulator reset via op-code
        end
        else begin
            // Accumulator value depending on opcode
            case (controller)
                MAC8:
                    accumulator <= accumulator + 
                    {{48{mult_8_0[15]}}, mult_8_0} + 
                    {{48{mult_8_1[15]}}, mult_8_1} + 
                    {{48{mult_8_2[15]}}, mult_8_2} + 
                    {{48{mult_8_3[15]}}, mult_8_3};

                MAC4:
                    accumulator <= accumulator + 
                    {{56{mult_4_0_bottom[7]}}, mult_4_0_bottom} + 
                    {{56{mult_4_0_top[7]}}, mult_4_0_top} + 
                    {{56{mult_4_1_bottom[7]}}, mult_4_1_bottom} + 
                    {{56{mult_4_1_top[7]}}, mult_4_1_top} + 
                    {{56{mult_4_2_bottom[7]}}, mult_4_2_bottom} + 
                    {{56{mult_4_2_top[7]}}, mult_4_2_top} + 
                    {{56{mult_4_3_bottom[7]}}, mult_4_3_bottom} + 
                    {{56{mult_4_3_top[7]}}, mult_4_3_top};

                ADD_BIAS:
                    accumulator <= accumulator + {{32{op_B[31]}}, op_B};
                
                RESCALE_0: 
                    accumulator <= {{24{adder40[39]}}, adder40};

                RESCALE_1: 
                    accumulator <= accumulator + {{16{adder40[39]}}, adder40, 8'b0};

                RESCALE_2: 
                    accumulator <= accumulator + {{8{adder40[39]}}, adder40, 16'b0};

                RESCALE_3: 
                    accumulator <= accumulator + {adder40, 24'b0};
                
                default:
                    accumulator <= accumulator;

            endcase
        end
    end
end

endmodule