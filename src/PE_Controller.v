`timescale 1ns / 1ps

module PE_Controller (
    input wire clk,
    input wire rst_n,
    input wire [4:0] pe_opcode,
    
    // MAC Status Interface
    input wire mac_busy,
    input wire mac_done,

    // Datapath Control Signals
    output reg [4:0] mac_cmd,
    output reg quantize_en,
    output reg activation_en,

    // Output Interface (To Top-Level)
    output wire pe_ready,
    output reg output_valid
);

localparam NOP = 5'b00000;
localparam RST_ACC = 5'b00001;
localparam MAC4 = 5'b00010;
localparam MAC8 = 5'b00011;
localparam ADD_BIAS = 5'b00100;
localparam MULT32 = 5'b00101;
localparam SHIFT_RIGHT = 5'b00110;
localparam APPLY_ACT = 5'b00111;
 
// FSM State Definitions
localparam IDLE = 1'b0;
localparam WAIT_MAC = 1'b1;

reg state, next_state;

// FSM State Register
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= IDLE;
    end else begin
        state <= next_state;
    end
end

// FSM Next State
always @(*) begin
    // Default (hold the current state)
    next_state = state;

    case (state)
        IDLE: begin
            // If we receive a MULT32 command, jump to WAIT_MAC to stall the system
            if (pe_opcode == MULT32) begin
                next_state = WAIT_MAC;
            end
        end
            
        WAIT_MAC: begin
            // Wait here until the MAC pulses the done flag
            if (mac_done) begin
                next_state = IDLE;
            end
        end
    endcase
end

// Output pe_ready logic: PE is ready only if FSM is IDLE and reset is NOT active
assign pe_ready = (rst == 1'b1) && (state == IDLE);

// Instruction Decoding & Routing
always @(posedge clk or negedge rst_n) begin
    // Default assignments
    if (!rst_n) begin 
        mac_cmd <= NOP;
        quantize_en <= 1'b0;
        activation_en <= 1'b0;
    end
    else begin
        quantize_en <= 1'b0;
        activation_en <= 1'b0;
         // Only decode and route new instructions if the controller is ready
        if (state == IDLE) begin
            mac_cmd <= NOP;
            case (pe_opcode)
                // Math operations: Route directly to the ALU
                RST_ACC, MAC4, MAC8, ADD_BIAS, MULT32: begin
                    mac_cmd <= pe_opcode;
                end
                
                // Requantize: Intercept and pulse quantize_en
                SHIFT_RIGHT: begin
                    quantize_en <= 1'b1;
                end
                
                // Activation: Intercept and pulse activation_en
                APPLY_ACT: begin
                    activation_en <= 1'b1;
                end

                default: mac_cmd <= NOP;
            endcase
        end
    end
end

// Output Valid Timing: Goes high one cycle after APPLY_ACT is issued
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        output_valid <= 1'b0;
    end else begin
        output_valid <= activation_en;
    end
end


endmodule
