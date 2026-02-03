module ROM (
    input  wire        clk,
    input  wire        rst,           // Active Low Reset 
    input  wire [4:0]  op_code,         // Operation Code
    input  wire [31:0] operand_A,       // Used for Configuration 
    input  wire [7:0]  activation_in,   // Input from Rescale 
    output reg  [7:0]  data_out         // Final Result 
);

    // -- 1. Constants & Parameters --------------------------------------------
    // Op-Codes defined in Activation ISA 
    localparam OPCODE_CFG_ACT = 5'b00110;
    localparam OPCODE_ACTIVATE = 5'b00111;

    // Configuration Modes [cite: 74, 75]
    localparam MODE_IDENTITY = 3'd0;
    localparam MODE_RELU     = 3'd1;
    localparam MODE_TANH     = 3'd2;
    localparam MODE_SIGMOID  = 3'd3;
    localparam MODE_GELU     = 3'd4;
    localparam MODE_SILU     = 3'd5;

    // -- 2. Configuration Register (ACT_CONFIG) -------------------------------
    // Holds the current activation mode. Updates only on CFG_ACT instruction.
    reg [2:0] act_config;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            act_config <= MODE_IDENTITY; // Default reset state (Identity?) or 0 
        end else if (op_code == OPCODE_CFG_ACT) begin
            act_config <= operand_A[2:0]; // Load 3 LSBs from Operand A 
        end
    end

    // -- 3. Path A: Logic Implementation (Combinational) ----------------------
    // Implements Identity and ReLU directly [cite: 74]
    reg [7:0] logic_path_result;

    always @(*) begin
        case (act_config)
            MODE_IDENTITY: logic_path_result = activation_in;
            MODE_RELU: begin
                // If input is negative (MSB=1), output 0. Else pass input.
                logic_path_result = (activation_in[7]) ? 8'd0 : activation_in;
            end
            default: logic_path_result = 8'd0;
        endcase
    end

    // -- 4. Path B: Memory Implementation (Banked ROMs) -----------------------
    // Generate Enable signals for power gating.
    // Memory is disabled entirely if mode is 0 or 1 [cite: 74]
    
    wire bank0_en = (act_config == MODE_TANH);    // Enable Bank 0 
    wire bank1_en = (act_config == MODE_SIGMOID); // Enable Bank 1 
    wire bank2_en = (act_config == MODE_GELU);    // Enable Bank 2 
    wire bank3_en = (act_config == MODE_SILU);    // Enable Bank 3 

    wire [7:0] rom0_out, rom1_out, rom2_out, rom3_out;

    // Instantiating 4 separate ROM banks with unique initialization files
    // Note: Addresses are shared, but only the enabled bank consumes dynamic power.
    
    single_port_rom #(.INIT_FILE("tanh.hex")) bank0_tanh (
        .clk(clk), .en(bank0_en), .addr(activation_in), .dout(rom0_out)
    );

    single_port_rom #(.INIT_FILE("sigmoid.hex")) bank1_sigmoid (
        .clk(clk), .en(bank1_en), .addr(activation_in), .dout(rom1_out)
    );

    single_port_rom #(.INIT_FILE("gelu.hex")) bank2_gelu (
        .clk(clk), .en(bank2_en), .addr(activation_in), .dout(rom2_out)
    );

    single_port_rom #(.INIT_FILE("silu.hex")) bank3_silu (
        .clk(clk), .en(bank3_en), .addr(activation_in), .dout(rom3_out)
    );

    // -- 5. Final Output Multiplexer ------------------------------------------
    // Selects data source based on ACT_CONFIG register
    always @(*) begin
        case (act_config)
            MODE_IDENTITY: data_out = logic_path_result;
            MODE_RELU:     data_out = logic_path_result;
            MODE_TANH:     data_out = rom0_out;
            MODE_SIGMOID:  data_out = rom1_out;
            MODE_GELU:     data_out = rom2_out;
            MODE_SILU:     data_out = rom3_out;
            default:       data_out = 8'd0; // Default/Reserved
        endcase
    end

endmodule