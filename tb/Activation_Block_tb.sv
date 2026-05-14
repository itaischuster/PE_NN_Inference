`timescale 1ns/1ps

module tb_Activation_Block;

    // --------------------------------------------------------
    // 1. Signals & Instantiation
    // --------------------------------------------------------
    logic signed [7:0] activation_in;
    logic              mode4x4;
    logic [2:0]        act_fn_sel;
    logic [7:0]        activation_out;

    int pass_count = 0;
    int fail_count = 0;

    Activation_Block dut (
        .activation_in(activation_in),
        .mode4x4(mode4x4),
        .act_fn_sel(act_fn_sel),
        .activation_out(activation_out)
    );

    // --------------------------------------------------------
    // Group 1.1: Golden Reference Model
    // --------------------------------------------------------
    logic [7:0] expected_out;

    function automatic logic [7:0] golden_model(
        input logic signed [7:0] in_val, 
        input logic mode, 
        input logic [2:0] sel
    );
        logic signed [7:0] sig_8 = in_val;
        logic signed [3:0] sig_4 = in_val[3:0];
        logic [7:0] res_8;
        logic [3:0] res_4;

        // INT8 Path Math
        case (sel)
            3'b000: res_8 = sig_8; // Identity
            3'b001: res_8 = sig_8[7] ? 8'b0 : sig_8; // ReLU
            3'b010: res_8 = sig_8[7] ? (sig_8 >>> 6) : sig_8; // LReLU 1
            3'b011: res_8 = sig_8[7] ? (sig_8 >>> 2) : sig_8; // LReLU 2
            // LUTs would normally map here in a full ref model
            default: res_8 = 8'h00;
        endcase

        // INT4 Path Math
        case (sel)
            3'b000: res_4 = sig_4; // Identity
            3'b001: res_4 = sig_4[3] ? 4'b0 : sig_4; // ReLU
            3'b010: res_4 = sig_4[3] ? (sig_4 >>> 6) : sig_4; // LReLU 1
            3'b011: res_4 = sig_4[3] ? (sig_4 >>> 2) : sig_4; // LReLU 2
            default: res_4 = 4'h0;
        endcase

        return mode ? {4'b0000, res_4} : res_8;
    endfunction

    // --------------------------------------------------------
    // Checker Task
    // --------------------------------------------------------
    task check_output(string test_name, logic [7:0] exp_val = 8'hx);
        #1; // Wait for combinational logic to settle
        expected_out = (exp_val === 8'hx) ? golden_model(activation_in, mode4x4, act_fn_sel) : exp_val;
        
        if (activation_out !== expected_out) begin
            $error("[%s] FAIL: in=%0d, mode=%0b, sel=%0b | expected=%b, got=%b", 
                   test_name, activation_in, mode4x4, act_fn_sel, expected_out, activation_out);
            fail_count++;
        end else begin
            pass_count++;
        end
    endtask

    // --------------------------------------------------------
    // Main Test Sequence
    // --------------------------------------------------------
    initial begin
        $display("========================================");
        $display("Starting Activation_Block Verification");
        $display("========================================");

        // ----------------------------------------------------
        // Group 2: Directed Testing – Linear Functions
        // ----------------------------------------------------
        $display("\n--- Running Group 2: Linear Directed Tests ---");
        
        // 2.1 Zero Crossing (INT8 ReLU)
        mode4x4 = 0; act_fn_sel = 3'b001; 
        activation_in = 8'd1;  check_output("INT8 ReLU Pos");
        activation_in = 8'd0;  check_output("INT8 ReLU Zero");
        activation_in = -8'd1; check_output("INT8 ReLU Neg");

        // 2.2 Extrema INT8 (Identity & LReLU)
        act_fn_sel = 3'b000; activation_in = 8'h7F; check_output("INT8 ID Max Pos");
        act_fn_sel = 3'b011; activation_in = 8'h80; check_output("INT8 LReLU2 Max Neg");

        // 2.3 Extrema INT4 (ReLU)
        mode4x4 = 1; act_fn_sel = 3'b001;
        activation_in = 8'b0000_0111; check_output("INT4 ReLU Max Pos");
        activation_in = 8'b1111_1000; check_output("INT4 ReLU Max Neg (-8)");

        // ----------------------------------------------------
        // Group 3: Directed Testing – Non-Linear Functions
        // ----------------------------------------------------
        $display("\n--- Running Group 3: LUT Directed Tests ---");
        
        // 3.1 Boundary checks against hardcoded expected values (Tanh INT8)
        mode4x4 = 0; act_fn_sel = 3'b100;
        activation_in = 8'h80; check_output("INT8 Tanh Neg Max", 8'b10000000);
        activation_in = 8'h00; check_output("INT8 Tanh Zero",    8'b00000000);
        activation_in = 8'h7F; check_output("INT8 Tanh Pos Max", 8'b01111111);

        // 3.2 Boundary checks (Sigmoid INT4)
        mode4x4 = 1; act_fn_sel = 3'b101;
        activation_in = 8'h08; check_output("INT4 Sigm Neg Max (-8)", 8'b0000_0000);
        activation_in = 8'h07; check_output("INT4 Sigm Pos Max (+7)", 8'b0000_0111);

        // ----------------------------------------------------
        // Group 4: Datapath & Control Logic
        // ----------------------------------------------------
        $display("\n--- Running Group 4: Datapath / Control ---");
        
        // 4.2 INT4 Padding Check
        mode4x4 = 1; act_fn_sel = 3'b000; 
        activation_in = 8'hFF; // All 1s input
        check_output("INT4 Output Padding Check", 8'h0F);

        // ----------------------------------------------------
        // Group 5: Constrained Random Testing
        // ----------------------------------------------------
        $display("\n--- Running Group 5: Constrained Random Sweeps ---");
        
        // 5.3 Aggressive Control Toggling
        for (int i = 0; i < 10000; i++) begin
            activation_in = $random;
            act_fn_sel    = $urandom_range(0, 3); // Limiting to 0-3 to test the mathematical models
            mode4x4       = $urandom_range(0, 1);
            
            check_output($sformatf("CRT Iteration %0d", i));
        end

        // ----------------------------------------------------
        // Summary
        // ----------------------------------------------------
        $display("\n========================================");
        $display("Verification Complete!");
        $display("Passes: %0d", pass_count);
        $display("Fails:  %0d", fail_count);
        $display("========================================");
        
        $finish;
    end

endmodule