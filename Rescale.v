module Rescale(
    input clk,
    input done,
    input rst,
    input signed [63:0] acc,
    input [6:0] cfg_reg,
    output reg signed [7:0] activation_in
);

wire signed [63:0] shifted_acc = (cfg_reg > 0) ? acc >>> (cfg_reg - 1) : acc;
wire signed [63:0] plus_one = shifted_acc + 64'sd1;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        activation_in <= 0;
    end
    else begin
        if (done) begin
            if (cfg_reg == 0) begin
                if (acc > 64'sd127) 
                    activation_in <= 8'sd127;
                else if (acc < -64'sd128)
                    activation_in <= -8'sd128;
                else
                    activation_in <= acc[7:0];
            end
            else begin
                if (plus_one > 64'sd255) 
                    activation_in <= 8'sd127;
                else if (plus_one < -64'sd256)
                    activation_in <= -8'sd128;
                else
                    activation_in <= plus_one[8:1];
            end 
        end
    end
end
endmodule
