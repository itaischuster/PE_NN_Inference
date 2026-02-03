module single_port_rom #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 8,
    parameter INIT_FILE  = "default.hex" // Filename to load [cite: 83]
)(
    input  wire                  clk,
    input  wire                  en,   // Chip Select / Power Gate
    input  wire [ADDR_WIDTH-1:0] addr,
    output reg  [DATA_WIDTH-1:0] dout
);

    // 256 rows x 8 bits
    reg [DATA_WIDTH-1:0] rom_array [0:(1<<ADDR_WIDTH)-1];

    // Initialize memory from file [cite: 83]
    initial begin
        $readmemh(INIT_FILE, rom_array);
    end

    // Synchronous Read with Enable
    always @(posedge clk) begin
        if (en) begin
            dout <= rom_array[addr];
        end
        // If en is 0, dout holds previous value (or could be 0 depending on synthesis library)
        // For power gating, ensuring internal switching stops is key.
    end

endmodule