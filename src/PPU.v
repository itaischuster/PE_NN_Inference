module PPU (
    input wire clk,
    input wire rst,
    input wire signed [63:0] accumulator,
    input wire [5:0] shamt_data,
    input wire shamt_wr_en,
    input wire cfg_mode4x4,
    input wire [2:0] act_fn_sel,
    input wire ppu_en,
    output wire [7:0] activation_out
);

    reg [5:0] shamt_reg;

    always @(posedge clk or negedge rst) begin
        if (!rst)
            shamt_reg <= 6'b0;
        else if (shamt_wr_en)
            shamt_reg <= shamt_data;
    end

    wire signed [7:0] activation_in_bus;

    Requantizer u_requantizer (
        .accumulator (accumulator),
        .shamt (shamt_reg),
        .mode4x4 (cfg_mode4x4),
        .activation_in (activation_in_bus)
    );

    Activation_Block u_activation_block (
        .activation_in (activation_in_bus),
        .cfg_mode4x4 (cfg_mode4x4),
        .act_fn_sel (act_fn_sel),
        .ppu_en (ppu_en),
        .activation_out (activation_out)
    );

endmodule