`timescale 1ns/1ps

module Multiplier4_tb;
    logic signed [3:0] a;
    logic signed [3:0] b;
    logic a_signed;
    logic b_signed;

    logic signed [8:0] mult4out;

    logic signed [4:0] check_a;
    logic signed [4:0] check_b;
    logic signed [8:0] expected_result;
    
    integer log_file;
    int pass_count = 0;
    int fail_count = 0;

    Multiplier4 uut (
        .a(a),
        .b(b),
        .a_signed(a_signed),
        .b_signed(b_signed),
        .mult4out(mult4out)
    );

    initial begin
        log_file = $fopen("Multiplier4_results.log", "w");

        $display("Starting Self-Checking Random Tests...");
        $display("--------------------------------------");

        for (int i = 0; i < 500; i++) begin 
            a = $random; 
            b = $random; 
            a_signed = $urandom % 2; 
            b_signed = $urandom % 2; 
            #10;

            // Self-Checker
            check_a = a_signed ? {a[3], a} : {1'b0, a};
            check_b = b_signed ? {b[3], b} : {1'b0, b};
            expected_result = check_a * check_b;

            if (mult4out == expected_result) begin
                $display("[PASS] Test %0d", i);
                pass_count++;
            end else begin
                $display("[FAIL] Test %0d: Expected %0d, but hardware output %0d", 
                          i, expected_result, mult4out);
                fail_count++;
            end
        end

        $display("--------------------------------------");
        $display("Simulation Complete!");
        $display("Total Passes: %0d", pass_count);
        $display("Total Fails:  %0d", fail_count);

        if (fail_count == 0) begin
            $fwrite(log_file, "STATUS: PASSED | Module: Multiplier4 | Tests: %0d\n", pass_count);
        end else begin
            $fwrite(log_file, "STATUS: FAILED | Module: Multiplier4 | Errors: %0d\n", fail_count);
        end

        $fclose(log_file);
        $finish;
    end
endmodule