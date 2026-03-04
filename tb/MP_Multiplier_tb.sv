`timescale 1ns/1ps

module MP_Multiplier_tb;
    logic signed [7:0] a;
    logic signed [7:0] b;
    logic mode4x4;
    logic a_signed;
    logic b_signed;

    logic signed [15:0] mult8out;
    logic signed [7:0] bottom_mult4out;
    logic signed [7:0] top_mult4out;

    logic signed [8:0] check_8a, check_8b;
    logic signed [15:0] expected_8out;

    logic signed [4:0] check_4a0, check_4b0;
    logic signed [4:0] check_4a1, check_4b1;
    logic signed [8:0] expected_bottom;
    logic signed [8:0] expected_top;

    integer log_file;
    int pass_count = 0;
    int fail_count = 0;
    
    MP_Multiplier uut (
        .a(a),
        .b(b),
        .mode4x4(mode4x4),
        .a_signed(a_signed),
        .b_signed(b_signed),
        .mult8out(mult8out),
        .bottom_mult4out(bottom_mult4out),
        .top_mult4out(top_mult4out)
    );

    initial begin
        log_file = $fopen("MP_Multiplier_results.log", "w");

        $display("Starting MP_Multiplier Self-Checking Tests...");
        $display("----------------------------------------------");

        for (int i = 0; i < 500; i++) begin 
            a = $random;
            b = $random;
            a_signed = $urandom % 2;
            b_signed = $urandom % 2;
            mode4x4  = $urandom % 2;
            #10; 
            // Self-Checker
            if (mode4x4 == 1'b0) begin
                // MODE 0: 8x8 Multiplier
                check_8a = a_signed ? {a[7], a} : {1'b0, a};
                check_8b = b_signed ? {b[7], b} : {1'b0, b};
                expected_8out = check_8a * check_8b;
                if (mult8out == expected_8out) begin
                    pass_count++;
                end else begin
                    $display("[FAIL 8x8] Test %0d: a=%0d, b=%0d | Expected %0d, Got %0d", 
                              i, a, b, expected_8out, mult8out);
                    fail_count++;
                end

            end else begin
                // MODE 1: Two 4x4 Multipliers
                check_4a0 = {a[3], a[3:0]}; 
                check_4b0 = {b[3], b[3:0]};
                expected_bottom = check_4a0 * check_4b0;
                check_4a1 = {a[7], a[7:4]}; 
                check_4b1 = {b[7], b[7:4]};
                expected_top = check_4a1 * check_4b1;
                if (bottom_mult4out == expected_bottom[7:0] && top_mult4out == expected_top[7:0]) begin
                    pass_count++;
                end else begin
                    $display("[FAIL 4x4] Test %0d: Expected Top=%0d, Bot=%0d | Got Top=%0d, Bot=%0d", 
                              i, expected_top[7:0], expected_bottom[7:0], top_mult4out, bottom_mult4out);
                    fail_count++;
                end
            end
        end

        $display("----------------------------------------------");
        $display("Simulation Complete!");
        $display("Total Passes: %0d", pass_count);
        $display("Total Fails:  %0d", fail_count);

        if (fail_count == 0) begin
            $fwrite(log_file, "STATUS: PASSED | Module: MP_Multiplier | Tests: %0d\n", pass_count);
        end else begin
            $fwrite(log_file, "STATUS: FAILED | Module: MP_Multiplier | Errors: %0d\n", fail_count);
        end

        $fclose(log_file);
        $finish;
    end
endmodule