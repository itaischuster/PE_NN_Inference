`timescale 1ns / 1ps

module ALU(
    input wire clk,
    input wire [4:0] alu_cmd,
    input wire rst_n,
    input wire [31:0] op_A,
    input wire [31:0] op_B,
    
    output reg done,
    output reg busy,
    output reg [63:0] accumulator
);

    // Local Parameters for Opcodes
    localparam NOP = 5'd0;
    localparam RST_ACC = 5'd1;
    localparam MAC4 = 5'd2;
    localparam MAC8 = 5'd3;
    localparam ADD_BIAS = 5'd4;
    localparam MULT32 = 5'd5;

    // Input Splitting
    reg [31:0] latched_mult_A;
    wire [31:0] internal_op_A = (alu_cmd == MULT32 && ~busy) ? accumulator[31:0] : 
                            (busy ? latched_mult_A : op_A);

    wire signed [7:0] byteA0 = internal_op_A[7:0];
    wire signed [7:0] byteA1 = internal_op_A[15:8];
    wire signed [7:0] byteA2 = internal_op_A[23:16];
    wire signed [7:0] byteA3 = internal_op_A[31:24];
    
    wire signed [7:0] byteB0 = op_B[7:0];
    wire signed [7:0] byteB1 = op_B[15:8];
    wire signed [7:0] byteB2 = op_B[23:16];
    wire signed [7:0] byteB3 = op_B[31:24];

    // Broadcast & Mode Control
    wire use_broadcast = (alu_cmd == MULT32 || busy);

    // Sign Control for op_A
    wire a_is_signed_msb = 1'b1; // The top byte (byteA3) is always signed
    wire a_is_signed_lower = (alu_cmd == MULT32 || busy) ? 1'b0 : 1'b1; // Lower bytes are unsigned during MULT32, but signed during ALUs
    
    wire b_is_signed = ~use_broadcast; // op_B is signed during MACs, but unsigned during MULT32 (scaling factor)
    
    reg [7:0] broadcast_byte;
    wire [7:0] multiplicand0 = use_broadcast ? broadcast_byte : byteB0;
    wire [7:0] multiplicand1 = use_broadcast ? broadcast_byte : byteB1;
    wire [7:0] multiplicand2 = use_broadcast ? broadcast_byte : byteB2;
    wire [7:0] multiplicand3 = use_broadcast ? broadcast_byte : byteB3;

    // Multiplier Array Instantiations
    wire signed [15:0] mult_8_0, mult_8_1, mult_8_2, mult_8_3;
    wire signed [7:0]  mult_4_0_top, mult_4_0_bottom;
    wire signed [7:0]  mult_4_1_top, mult_4_1_bottom;
    wire signed [7:0]  mult_4_2_top, mult_4_2_bottom;
    wire signed [7:0]  mult_4_3_top, mult_4_3_bottom;

    MP_Multiplier mult_0 (.a(byteA0), .b(multiplicand0), .mode4x4(mac_cmd == MAC4), .a_signed(a_is_signed_lower), .b_signed(b_is_signed),
                          .mult8out(mult_8_0), .bottom_mult4out(mult_4_0_bottom), .top_mult4out(mult_4_0_top));
    
    MP_Multiplier mult_1 (.a(byteA1), .b(multiplicand1), .mode4x4(mac_cmd == MAC4), .a_signed(a_is_signed_lower), .b_signed(b_is_signed), 
                          .mult8out(mult_8_1), .bottom_mult4out(mult_4_1_bottom), .top_mult4out(mult_4_1_top));
    
    MP_Multiplier mult_2 (.a(byteA2), .b(multiplicand2), .mode4x4(mac_cmd == MAC4), .a_signed(a_is_signed_lower), .b_signed(b_is_signed), 
                          .mult8out(mult_8_2), .bottom_mult4out(mult_4_2_bottom), .top_mult4out(mult_4_2_top));
    
    MP_Multiplier mult_3 (.a(byteA3), .b(multiplicand3), .mode4x4(mac_cmd == MAC4), .a_signed(a_is_signed_msb), .b_signed(b_is_signed), 
                          .mult8out(mult_8_3), .bottom_mult4out(mult_4_3_bottom), .top_mult4out(mult_4_3_top));

    // Operand Isolation Logic: Enable the adder tree only during a 32x32 multiplication sequence
    wire op_iso_en = (alu_cmd == MULT32) || busy;

    wire [15:0] iso_mult_8_0 = op_iso_en ? mult_8_0 : 16'b0;
    wire [15:0] iso_mult_8_1 = op_iso_en ? mult_8_1 : 16'b0;
    wire [15:0] iso_mult_8_2 = op_iso_en ? mult_8_2 : 16'b0;
    wire [15:0] iso_mult_8_3 = op_iso_en ? mult_8_3 : 16'b0;

    // Intermediate 32x8 Adder Tree
    wire [23:0] adder24_1 = {8'b0, iso_mult_8_0} + {iso_mult_8_1, 8'b0};
    wire [23:0] adder24_2 = {8'b0, iso_mult_8_2} + {iso_mult_8_3, 8'b0};
    wire [39:0] adder40 = {16'b0, adder24_1} + {adder24_2, 16'b0};

    // FSM & Broadcast Byte Selection
    reg [1:0] cycle_counter;

    always @(*) begin
        if (~busy && alu_cmd == MULT32) begin
            broadcast_byte = byteB0;
        end 
        else if (busy) begin
            case (cycle_counter)
                2'b01: broadcast_byte = byteB1;
                2'b10: broadcast_byte = byteB2;
                2'b11: broadcast_byte = byteB3;
                default: broadcast_byte = 8'b0;
            endcase
        end
        else begin
            broadcast_byte = 8'b0;
        end
    end

    // Main Accumulator & State Control
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cycle_counter <= 2'b00;
            busy <= 1'b0;
            done <= 1'b0;
            accumulator <= 64'b0;
            latched_mult_A <= 32'b0;
        end
        else begin
            if (alu_cmd == RST_ACC) begin
                accumulator <= 64'b0;
            end
            else begin
                    if (alu_cmd != MULT32 && ~busy) begin
                        done <= 1'b0; // Clear done flag for non-MULT32 commands
                    
                        if (alu_cmd == MAC8) begin
                            accumulator <= accumulator + 
                                           {{48{mult_8_0[15]}}, mult_8_0} + 
                                           {{48{mult_8_1[15]}}, mult_8_1} + 
                                           {{48{mult_8_2[15]}}, mult_8_2} + 
                                           {{48{mult_8_3[15]}}, mult_8_3};
                        end
                        else if (alu_cmd == MAC4) begin
                            accumulator <= accumulator + 
                                           {{56{mult_4_0_bottom[7]}}, mult_4_0_bottom} + 
                                           {{56{mult_4_0_top[7]}},    mult_4_0_top} + 
                                           {{56{mult_4_1_bottom[7]}}, mult_4_1_bottom} + 
                                           {{56{mult_4_1_top[7]}},    mult_4_1_top} + 
                                           {{56{mult_4_2_bottom[7]}}, mult_4_2_bottom} + 
                                           {{56{mult_4_2_top[7]}},    mult_4_2_top} + 
                                           {{56{mult_4_3_bottom[7]}}, mult_4_3_bottom} + 
                                           {{56{mult_4_3_top[7]}},    mult_4_3_top};
                        end
                        else if (alu_cmd == ADD_BIAS) begin
                            accumulator <= accumulator + {{32{op_B[31]}}, op_B};
                        end
                        // NOP does nothing here, holding state
                    end
                    else if (alu_cmd == MULT32 && ~busy) begin
                        // Trigger MULT32 sequence
                        busy <= 1'b1;
                        cycle_counter <= 2'b01;
                        accumulator <= {{24{adder40[39]}}, adder40};
                        done <= 1'b0;
                        latched_mult_A <= accumulator[31:0];  
                    end 
                    else if (busy) begin
                        // Execute MULT32 multi-cycle shifts
                        cycle_counter <= cycle_counter + 1'b1;
                        case (cycle_counter)
                            2'b01: accumulator <= accumulator + {{16{adder40[39]}}, adder40, 8'b0};
                            2'b10: accumulator <= accumulator + {{8{adder40[39]}},  adder40, 16'b0};
                            2'b11: begin
                                accumulator <= accumulator + {adder40, 24'b0};
                                cycle_counter <= 2'b00;
                                busy <= 1'b0;
                                done <= 1'b1;
                            end
                            default: begin
                                cycle_counter <= 2'b00;
                                busy <= 1'b0;
                                done <= 1'b0;
                            end
                        endcase
                    end
                end
            end
        end

endmodule
