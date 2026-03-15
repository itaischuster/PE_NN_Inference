`timescale 1ns/1ps

module Requantizer_random_tb;

    logic clk, rst_n, quantize_en;
    logic [63:0] acc;
    logic [5:0] shamt;
    logic signed [7:0] activation_in;

    int pass_count = 0;
    int fail_count = 0;

    Requantizer uut (.*); // Connects all signals with matching names

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Software Golden Model for Requantization
    function logic signed [7:0] golden_model(logic signed [63:0] val, logic [5:0] s);
        logic signed [63:0] rounded;
        logic signed [63:0] clamped;
        
        if (s == 0) begin
            rounded = val;
        end else begin
            // Round-half-up: (val + 2^(s-1)) >>> s
            rounded = (val + (64'sd1 << (s - 1))) >>> s;
        end

        // 8-bit Saturation Logic
        if (rounded > 64'sd127)       clamped = 64'sd127;
        else if (rounded < -64'sd128) clamped = -64'sd128;
        else                          clamped = rounded;
        
        return clamped[7:0];
    endfunction

    initial begin
        rst_n = 0; quantize_en = 1; #20 rst_n = 1;

        $display("Starting 1000 Random Requantization Tests...");
        
        repeat(1000) begin
            // Profiles: 40% Small (near-range), 40% Large (clamping), 20% Pure Random
            int profile;
            profile = $urandom_range(0, 9);
            shamt = $urandom_range(0, 32);

            if (profile < 4)      acc = $signed($urandom()) % (64'sd256 << shamt); // Profile A
            else if (profile < 8) acc = { $urandom(), $urandom() };                // Profile B
            else                  acc = $urandom();                                // Profile C

            @(posedge clk);
            #1; // Wait for register update

            if (activation_in !== golden_model(acc, shamt)) begin
                $display("[FAIL] Acc: %0h | Shamt: %0d | Expected: %0d | Got: %0d", 
                          acc, shamt, golden_model(acc, shamt), activation_in);
                fail_count++;
            end else begin
                pass_count++;
            end
        end

        $display("----------------------------------------");
        $display("Random Testing Complete! Passes: %0d, Fails: %0d", pass_count, fail_count);
        $finish;
    end

endmodule

