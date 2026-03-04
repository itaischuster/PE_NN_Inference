`timescale 1ns/1ps

module ALU_random_tb;

    logic clk;
    logic rst;
    logic [4:0]  mac_cmd;
    logic [31:0] op_A;
    logic [31:0] op_B;
    
    logic done;
    logic busy;
    logic [63:0] accumulator;

    localparam NOP      = 5'd0;
    localparam RST_ACC  = 5'd1;
    localparam MAC4     = 5'd2;
    localparam MAC8     = 5'd3;
    localparam ADD_BIAS = 5'd4;
    localparam MULT32   = 5'd5;

    integer log_file;
    int pass_count = 0;
    int fail_count = 0;

    ALU uut (
        .clk(clk),
        .mac_cmd(mac_cmd),
        .rst(rst),
        .op_A(op_A),
        .op_B(op_B),
        .done(done),
        .busy(busy),
        .accumulator(accumulator)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Task to apply a single-cycle command
    task send_cmd(input [4:0] cmd, input [31:0] a, input [31:0] b);
        mac_cmd = cmd;
        op_A = a;
        op_B = b;
        @(posedge clk);
        #1; 
    endtask

    // Main Random Test Sequence
    initial begin
        log_file = $fopen("ALU_random_results.log", "w");

        $display("Starting ALU Constrained Random Verification...");
        $display("---------------------------------------------");

        // Initialization
        rst = 1'b0; 
        mac_cmd = NOP;
        op_A = 0;
        op_B = 0;
        @(posedge clk);
        @(posedge clk);
        rst = 1'b1; 
        #1;

        begin : random_test_block
            logic [4:0] rand_cmd;
            logic [31:0] rand_a;
            logic [31:0] rand_b;
            logic signed [63:0] software_acc;
            
            software_acc = 64'd0; 

            for (int i = 0; i < 1000; i++) begin
                // Pick a random command from 1 to 5
                rand_cmd = $urandom_range(1, 5);
                rand_a = $urandom();
                rand_b = $urandom();

                // Calculate the expected result in software using direct casting
                if (rand_cmd == RST_ACC) begin
                    software_acc = 64'd0;
                end
                else if (rand_cmd == ADD_BIAS) begin
                    software_acc = software_acc + $signed(rand_b);
                end
                else if (rand_cmd == MAC8) begin
                    software_acc = software_acc + 
                        ($signed(rand_a[7:0])   * $signed(rand_b[7:0])) +
                        ($signed(rand_a[15:8])  * $signed(rand_b[15:8])) +
                        ($signed(rand_a[23:16]) * $signed(rand_b[23:16])) +
                        ($signed(rand_a[31:24]) * $signed(rand_b[31:24]));
                end
                else if (rand_cmd == MAC4) begin
                    software_acc = software_acc + 
                        ($signed(rand_a[3:0])   * $signed(rand_b[3:0])) +
                        ($signed(rand_a[7:4])   * $signed(rand_b[7:4])) +
                        ($signed(rand_a[11:8])  * $signed(rand_b[11:8])) +
                        ($signed(rand_a[15:12]) * $signed(rand_b[15:12])) +
                        ($signed(rand_a[19:16]) * $signed(rand_b[19:16])) +
                        ($signed(rand_a[23:20]) * $signed(rand_b[23:20])) +
                        ($signed(rand_a[27:24]) * $signed(rand_b[27:24])) +
                        ($signed(rand_a[31:28]) * $signed(rand_b[31:28]));
                end
                else if (rand_cmd == MULT32) begin
                    software_acc = $signed(software_acc[31:0]) * $signed({1'b0, rand_b});
                end

                // Drive the hardware
                if (rand_cmd == MULT32) begin
                    mac_cmd = MULT32;
                    op_B = rand_b;
                    @(posedge clk);
                    #1; // Let the hardware start the sequence and drop 'done' to 0
                    
                    wait(done == 1'b1);
                    send_cmd(NOP, 0, 0); // Drop command and wait a cycle to settle
                end else begin
                    send_cmd(rand_cmd, rand_a, rand_b);
                    send_cmd(NOP, 0, 0); // Give it a cycle to settle
                end

                // Compare Hardware vs Software
                if (accumulator !== software_acc) begin
                    $display("[FAIL] Random Test %0d | CMD: %0d", i, rand_cmd);
                    $display("       Expected: %0h", software_acc);
                    $display("       Got:      %0h", accumulator);
                    fail_count++;
                end else begin
                    pass_count++;
                end
            end
        end

        $display("---------------------------------------------");
        $display("Random Simulation Complete!");
        $display("Total Passes: %0d", pass_count);
        $display("Total Fails:  %0d", fail_count);
        
        if (fail_count == 0) begin
            $fwrite(log_file, "STATUS: PASSED | Module: ALU_random | Tests: %0d\n", pass_count);
        end else begin
            $fwrite(log_file, "STATUS: FAILED | Module: ALU_random | Errors: %0d\n", fail_count);
        end
        
        $fclose(log_file);
        $finish;
    end
endmodule