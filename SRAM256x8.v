module SRAM256x8(
    input clk,
    input rst,
    input w_e,
    input r_e,
    input [7:0] address,
    input [7:0] data_in,
    output reg [7:0] data_out,
    output reg busy_clearing
);

reg [7:0] memory [0:255];
reg [7:0] clear_counter = 8'b0;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        busy_clearing <= 1;
        clear_counter <= 8'b0;
    end
    else if (busy_clearing) begin
        if (clear_counter == 8'b11111111) begin
            memory[8'b11111111] <= 8'b0;
            clear_counter <= 8'b0;
            busy_clearing <= 0;
        end
        else begin
            memory[clear_counter] <= 8'b0;
            clear_counter <= clear_counter + 1;
        end
    end
    else begin
        if (r_e)
            data_out <= memory[address];
        if (w_e)
            memory[address] <= data_in;
    end
end

endmodule