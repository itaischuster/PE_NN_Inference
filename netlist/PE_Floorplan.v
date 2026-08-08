// Fusion Compiler Version V-2023.12-SP3 Verilog Writer
// Generated on 5/24/2026 at 18:34:44
// Library Name: PE.dlib
// Block Name: PE
// User Label: 
// Write Command: write_verilog -hierarchy all ./netlist/PE_Floorplan.v
module PE ( clk , rst , chp_slct , valid_opcode , pe_opcode , valid_A , 
    valid_B , operand_A , operand_B , data_out , pe_ready , valid_output ) ;
input  clk ;
input  rst ;
input  chp_slct ;
input  valid_opcode ;
input  [4:0] pe_opcode ;
input  valid_A ;
input  valid_B ;
input  [31:0] operand_A ;
input  [31:0] operand_B ;
output [7:0] data_out ;
output pe_ready ;
output valid_output ;

wire [31:0] operand_A_reg ;
wire [2:0] act_fn_sel ;
wire [31:0] operand_B_reg ;
wire [63:0] accumulator ;
wire [7:0] \u_io_block/output_mux_result ;
wire [4:0] \u_controller/opcode_reg ;
wire [1:0] \u_controller/state ;
wire [0:0] \u_controller/next_state ;
wire [23:0] \u_mac_and_scale/holding_reg ;
wire [7:0] \u_mac_and_scale/mult_4_0_top ;
wire [7:1] \u_mac_and_scale/mult_4_1_bottom ;
wire [5:0] \u_mac_and_scale/mult_4_1_top ;
wire [5:0] \u_mac_and_scale/mult_4_2_top ;
wire [7:0] \u_mac_and_scale/mult_4_3_bottom ;
wire [5:0] \u_mac_and_scale/mult_4_3_top ;
wire [14:11] \u_mac_and_scale/mac8_in_0 ;
wire [15:0] \u_mac_and_scale/scale_iso_2 ;
wire [31:0] \u_mac_and_scale/addend_lo ;
wire [31:0] \u_mac_and_scale/gated_lo_feedback ;
wire [32:1] \u_mac_and_scale/lower_sum ;
wire [31:0] \u_mac_and_scale/gated_hi_addend ;
wire [31:0] \u_mac_and_scale/gated_hi_feedback ;
wire [8:0] \u_mac_and_scale/mult_0/mult01 ;
wire [7:0] \u_mac_and_scale/mult_0/mult10 ;
wire [8:0] \u_mac_and_scale/mult_1/mult01 ;
wire [7:0] \u_mac_and_scale/mult_1/mult10 ;
wire [8:0] \u_mac_and_scale/mult_2/mult01 ;
wire [7:0] \u_mac_and_scale/mult_2/mult10 ;
wire [8:0] \u_mac_and_scale/mult_3/mult01 ;
wire [7:0] \u_mac_and_scale/mult_3/mult10 ;
wire [5:0] \u_ppu/u_requantizer/shamt ;

SDFCNQD0BWP30P140HVT \u_mac_and_scale/holding_reg_reg[22] ( 
    .D ( accumulator[30] ) , .SI ( optlc_net_4017 ) , .SE ( optlc_net_4017 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/holding_reg_reg ) , 
    .CDN ( HFSNET_32 ) , .Q ( \u_mac_and_scale/holding_reg [22] ) ) ;
SDFCND0BWP30P140HVT \u_controller/config_reg_reg[3] ( 
    .D ( operand_A_reg[3] ) , .SI ( optlc_net_4001 ) , 
    .SE ( optlc_net_4001 ) , 
    .CP ( \clk_clock_gate_u_controller/config_reg_reg ) , .CDN ( HFSNET_33 ) , 
    .Q ( \config_out[3] ) , .QN ( ctmn_13330 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[63] ( 
    .D ( \u_mac_and_scale/N14 ) , .SI ( optlc_net_4016 ) , 
    .SE ( optlc_net_4016 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_31 ) , .Q ( accumulator[63] ) , .QN ( ctmn_13364 ) ) ;
SDFCNQD0BWP30P140HVT \u_controller/opcode_reg_reg[3] ( 
    .D ( \u_controller/N2 ) , .SI ( optlc_net_4013 ) , 
    .SE ( optlc_net_4013 ) , .CP ( clk ) , .CDN ( sync_rst ) , 
    .Q ( \u_controller/opcode_reg [3] ) ) ;
SDFCNQD0BWP30P140HVT \u_io_block/operand_A_reg_r_reg[30] ( 
    .D ( operand_A[30] ) , .SI ( optlc_net_4011 ) , .SE ( optlc_net_4011 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_A_reg_r_reg ) , 
    .CDN ( sync_rst ) , .Q ( operand_A_reg[30] ) ) ;
OR2D1BWP30P140HVT ctmTdsLR_1_3551 ( .A1 ( ctmn_13325 ) , .A2 ( ctmn_13321 ) , 
    .Z ( phfnn_2357 ) ) ;
SDFCNQARD1BWP30P140HVT \u_controller/valid_output_reg_reg ( 
    .D ( \u_controller/N47 ) , .SI ( optlc_net_4012 ) , 
    .SE ( optlc_net_4012 ) , .CP ( clk ) , .CDN ( sync_rst ) , 
    .Q ( valid_output ) ) ;
SDFCND0BWP30P140HVT \u_io_block/operand_B_reg_r_reg[31] ( 
    .D ( operand_B[31] ) , .SI ( optlc_net_4007 ) , .SE ( optlc_net_4007 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_B_reg_r_reg ) , 
    .CDN ( HFSNET_29 ) , .Q ( operand_B_reg[31] ) , .QN ( ctmn_13511 ) ) ;
SDFCNQD0BWP30P140HVT \u_io_block/operand_A_reg_r_reg[29] ( 
    .D ( operand_A[29] ) , .SI ( optlc_net_4011 ) , .SE ( optlc_net_4011 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_A_reg_r_reg ) , 
    .CDN ( sync_rst ) , .Q ( operand_A_reg[29] ) ) ;
SDFCNQD0BWP30P140HVT \u_io_block/operand_A_reg_r_reg[28] ( 
    .D ( operand_A[28] ) , .SI ( optlc_net_4011 ) , .SE ( optlc_net_4011 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_A_reg_r_reg ) , 
    .CDN ( sync_rst ) , .Q ( operand_A_reg[28] ) ) ;
SDFCNQD0BWP30P140HVT \u_io_block/operand_A_reg_r_reg[27] ( 
    .D ( operand_A[27] ) , .SI ( optlc_net_3995 ) , .SE ( optlc_net_3995 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_A_reg_r_reg ) , 
    .CDN ( sync_rst ) , .Q ( operand_A_reg[27] ) ) ;
SDFCNQD0BWP30P140HVT \u_io_block/operand_A_reg_r_reg[26] ( 
    .D ( operand_A[26] ) , .SI ( optlc_net_4011 ) , .SE ( optlc_net_4011 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_A_reg_r_reg ) , 
    .CDN ( sync_rst ) , .Q ( operand_A_reg[26] ) ) ;
SDFCNQD0BWP30P140HVT \u_io_block/operand_A_reg_r_reg[25] ( 
    .D ( operand_A[25] ) , .SI ( optlc_net_3995 ) , .SE ( optlc_net_3995 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_A_reg_r_reg ) , 
    .CDN ( sync_rst ) , .Q ( operand_A_reg[25] ) ) ;
SDFCNQD0BWP30P140HVT \u_io_block/operand_A_reg_r_reg[24] ( 
    .D ( operand_A[24] ) , .SI ( optlc_net_3995 ) , .SE ( optlc_net_3995 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_A_reg_r_reg ) , 
    .CDN ( sync_rst ) , .Q ( operand_A_reg[24] ) ) ;
SDFCNQD0BWP30P140HVT \u_io_block/operand_A_reg_r_reg[23] ( 
    .D ( operand_A[23] ) , .SI ( optlc_net_4011 ) , .SE ( optlc_net_4011 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_A_reg_r_reg ) , 
    .CDN ( sync_rst ) , .Q ( operand_A_reg[23] ) ) ;
SDFCNQD0BWP30P140HVT \u_io_block/operand_A_reg_r_reg[22] ( 
    .D ( operand_A[22] ) , .SI ( optlc_net_3995 ) , .SE ( optlc_net_3995 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_A_reg_r_reg ) , 
    .CDN ( sync_rst ) , .Q ( operand_A_reg[22] ) ) ;
SDFCNQD0BWP30P140HVT \u_io_block/operand_A_reg_r_reg[21] ( 
    .D ( operand_A[21] ) , .SI ( optlc_net_3995 ) , .SE ( optlc_net_3995 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_A_reg_r_reg ) , 
    .CDN ( sync_rst ) , .Q ( operand_A_reg[21] ) ) ;
SDFCNQD0BWP30P140HVT \u_io_block/operand_A_reg_r_reg[20] ( 
    .D ( operand_A[20] ) , .SI ( optlc_net_4006 ) , .SE ( optlc_net_4006 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_A_reg_r_reg ) , 
    .CDN ( HFSNET_31 ) , .Q ( operand_A_reg[20] ) ) ;
SDFCNQD0BWP30P140HVT \u_io_block/operand_A_reg_r_reg[19] ( 
    .D ( operand_A[19] ) , .SI ( optlc_net_4006 ) , .SE ( optlc_net_4006 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_A_reg_r_reg ) , 
    .CDN ( HFSNET_31 ) , .Q ( operand_A_reg[19] ) ) ;
SDFCNQD0BWP30P140HVT \u_io_block/operand_A_reg_r_reg[18] ( 
    .D ( operand_A[18] ) , .SI ( optlc_net_4006 ) , .SE ( optlc_net_4006 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_A_reg_r_reg ) , 
    .CDN ( HFSNET_31 ) , .Q ( operand_A_reg[18] ) ) ;
SDFCNQD0BWP30P140HVT \u_io_block/operand_A_reg_r_reg[17] ( 
    .D ( operand_A[17] ) , .SI ( optlc_net_4006 ) , .SE ( optlc_net_4006 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_A_reg_r_reg ) , 
    .CDN ( HFSNET_31 ) , .Q ( operand_A_reg[17] ) ) ;
SDFCNQD0BWP30P140HVT \u_io_block/operand_A_reg_r_reg[16] ( 
    .D ( operand_A[16] ) , .SI ( optlc_net_4006 ) , .SE ( optlc_net_4006 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_A_reg_r_reg ) , 
    .CDN ( HFSNET_31 ) , .Q ( operand_A_reg[16] ) ) ;
SDFCNQD0BWP30P140HVT \u_io_block/operand_A_reg_r_reg[15] ( 
    .D ( operand_A[15] ) , .SI ( optlc_net_4006 ) , .SE ( optlc_net_4006 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_A_reg_r_reg ) , 
    .CDN ( HFSNET_31 ) , .Q ( operand_A_reg[15] ) ) ;
SDFCNQD0BWP30P140HVT \u_io_block/operand_A_reg_r_reg[14] ( 
    .D ( operand_A[14] ) , .SI ( optlc_net_4004 ) , .SE ( optlc_net_4004 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_A_reg_r_reg ) , 
    .CDN ( HFSNET_31 ) , .Q ( operand_A_reg[14] ) ) ;
SDFCNQD0BWP30P140HVT \u_io_block/operand_A_reg_r_reg[13] ( 
    .D ( operand_A[13] ) , .SI ( optlc_net_4004 ) , .SE ( optlc_net_4004 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_A_reg_r_reg ) , 
    .CDN ( HFSNET_31 ) , .Q ( operand_A_reg[13] ) ) ;
SDFCNQD0BWP30P140HVT \u_io_block/operand_A_reg_r_reg[12] ( 
    .D ( operand_A[12] ) , .SI ( optlc_net_4004 ) , .SE ( optlc_net_4004 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_A_reg_r_reg ) , 
    .CDN ( HFSNET_31 ) , .Q ( operand_A_reg[12] ) ) ;
SDFCNQD0BWP30P140HVT \u_io_block/operand_A_reg_r_reg[11] ( 
    .D ( operand_A[11] ) , .SI ( optlc_net_4004 ) , .SE ( optlc_net_4004 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_A_reg_r_reg ) , 
    .CDN ( HFSNET_31 ) , .Q ( operand_A_reg[11] ) ) ;
SDFCNQD0BWP30P140HVT \u_io_block/operand_A_reg_r_reg[10] ( 
    .D ( operand_A[10] ) , .SI ( optlc_net_4004 ) , .SE ( optlc_net_4004 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_A_reg_r_reg ) , 
    .CDN ( HFSNET_31 ) , .Q ( operand_A_reg[10] ) ) ;
SDFCNQD0BWP30P140HVT \u_io_block/operand_A_reg_r_reg[9] ( 
    .D ( operand_A[9] ) , .SI ( optlc_net_4004 ) , .SE ( optlc_net_4004 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_A_reg_r_reg ) , 
    .CDN ( HFSNET_31 ) , .Q ( operand_A_reg[9] ) ) ;
SDFCNQD0BWP30P140HVT \u_io_block/operand_A_reg_r_reg[8] ( 
    .D ( operand_A[8] ) , .SI ( optlc_net_4004 ) , .SE ( optlc_net_4004 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_A_reg_r_reg ) , 
    .CDN ( HFSNET_31 ) , .Q ( operand_A_reg[8] ) ) ;
SDFCNQD0BWP30P140HVT \u_io_block/operand_A_reg_r_reg[7] ( 
    .D ( operand_A[7] ) , .SI ( optlc_net_4004 ) , .SE ( optlc_net_4015 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_A_reg_r_reg ) , 
    .CDN ( HFSNET_31 ) , .Q ( operand_A_reg[7] ) ) ;
SDFCNQD0BWP30P140HVT \u_io_block/operand_A_reg_r_reg[6] ( 
    .D ( operand_A[6] ) , .SI ( optlc_net_4016 ) , .SE ( optlc_net_4016 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_A_reg_r_reg ) , 
    .CDN ( HFSNET_31 ) , .Q ( operand_A_reg[6] ) ) ;
SDFCNQD0BWP30P140HVT \u_io_block/operand_A_reg_r_reg[5] ( 
    .D ( operand_A[5] ) , .SI ( optlc_net_4009 ) , .SE ( optlc_net_4009 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_A_reg_r_reg ) , 
    .CDN ( HFSNET_30 ) , .Q ( operand_A_reg[5] ) ) ;
SDFCNQD0BWP30P140HVT \u_io_block/operand_A_reg_r_reg[4] ( 
    .D ( operand_A[4] ) , .SI ( optlc_net_4005 ) , .SE ( optlc_net_4005 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_A_reg_r_reg ) , 
    .CDN ( HFSNET_30 ) , .Q ( operand_A_reg[4] ) ) ;
SDFCNQD0BWP30P140HVT \u_io_block/operand_A_reg_r_reg[3] ( 
    .D ( operand_A[3] ) , .SI ( optlc_net_4005 ) , .SE ( optlc_net_4005 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_A_reg_r_reg ) , 
    .CDN ( HFSNET_30 ) , .Q ( operand_A_reg[3] ) ) ;
SDFCNQD0BWP30P140HVT \u_io_block/operand_A_reg_r_reg[2] ( 
    .D ( operand_A[2] ) , .SI ( optlc_net_4005 ) , .SE ( optlc_net_4005 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_A_reg_r_reg ) , 
    .CDN ( HFSNET_30 ) , .Q ( operand_A_reg[2] ) ) ;
CKND0BWP30P140HVT phfnr_buf_5128 ( .I ( ctmn_14321 ) , .ZN ( phfnn_3658 ) ) ;
SDFCND0BWP30P140HVT \u_io_block/operand_A_reg_r_reg[0] ( .D ( operand_A[0] ) , 
    .SI ( optlc_net_4009 ) , .SE ( optlc_net_4009 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_A_reg_r_reg ) , 
    .CDN ( HFSNET_30 ) , .Q ( operand_A_reg[0] ) , .QN ( ctmn_14312 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[31] ( 
    .D ( \u_mac_and_scale/N46 ) , .SI ( optlc_net_4021 ) , 
    .SE ( optlc_net_4021 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_32 ) , .Q ( accumulator[31] ) , .QN ( ctmn_13332 ) ) ;
SDFCND0BWP30P140HVT \u_io_block/operand_B_reg_r_reg[30] ( 
    .D ( operand_B[30] ) , .SI ( optlc_net_4007 ) , .SE ( optlc_net_4007 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_B_reg_r_reg ) , 
    .CDN ( HFSNET_29 ) , .Q ( operand_B_reg[30] ) , .QN ( ctmn_13505 ) ) ;
SDFCND0BWP30P140HVT \u_io_block/operand_B_reg_r_reg[29] ( 
    .D ( operand_B[29] ) , .SI ( optlc_net_4007 ) , .SE ( optlc_net_4007 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_B_reg_r_reg ) , 
    .CDN ( HFSNET_29 ) , .Q ( operand_B_reg[29] ) , .QN ( ctmn_13499 ) ) ;
SDFCNQD0BWP30P140HVT \u_reset_sync/rst_meta_reg ( .D ( optlc_net_4022 ) , 
    .SI ( optlc_net_4012 ) , .SE ( optlc_net_4012 ) , .CP ( clk ) , 
    .CDN ( rst ) , .Q ( \u_reset_sync/rst_meta ) ) ;
SDFCND0BWP30P140HVT \u_io_block/operand_B_reg_r_reg[27] ( 
    .D ( operand_B[27] ) , .SI ( optlc_net_4007 ) , .SE ( optlc_net_4007 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_B_reg_r_reg ) , 
    .CDN ( HFSNET_29 ) , .Q ( operand_B_reg[27] ) , .QN ( ctmn_13903 ) ) ;
SDFCND0BWP30P140HVT \u_io_block/operand_B_reg_r_reg[26] ( 
    .D ( operand_B[26] ) , .SI ( optlc_net_4007 ) , .SE ( optlc_net_4007 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_B_reg_r_reg ) , 
    .CDN ( HFSNET_29 ) , .Q ( operand_B_reg[26] ) , .QN ( ctmn_13901 ) ) ;
SDFCND0BWP30P140HVT \u_io_block/operand_B_reg_r_reg[25] ( 
    .D ( operand_B[25] ) , .SI ( optlc_net_4007 ) , .SE ( optlc_net_4007 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_B_reg_r_reg ) , 
    .CDN ( HFSNET_29 ) , .Q ( operand_B_reg[25] ) , .QN ( ctmn_13898 ) ) ;
SDFCND0BWP30P140HVT \u_io_block/operand_B_reg_r_reg[24] ( 
    .D ( operand_B[24] ) , .SI ( optlc_net_4007 ) , .SE ( optlc_net_4007 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_B_reg_r_reg ) , 
    .CDN ( HFSNET_29 ) , .Q ( operand_B_reg[24] ) , .QN ( ctmn_13919 ) ) ;
SDFCND0BWP30P140HVT \u_io_block/operand_B_reg_r_reg[23] ( 
    .D ( operand_B[23] ) , .SI ( optlc_net_4007 ) , .SE ( optlc_net_4007 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_B_reg_r_reg ) , 
    .CDN ( HFSNET_29 ) , .Q ( operand_B_reg[23] ) , .QN ( ctmn_13457 ) ) ;
SDFCND0BWP30P140HVT \u_io_block/operand_B_reg_r_reg[22] ( 
    .D ( operand_B[22] ) , .SI ( optlc_net_4008 ) , .SE ( optlc_net_4008 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_B_reg_r_reg ) , 
    .CDN ( HFSNET_29 ) , .Q ( operand_B_reg[22] ) , .QN ( ctmn_13445 ) ) ;
SDFCND0BWP30P140HVT \u_io_block/operand_B_reg_r_reg[21] ( 
    .D ( operand_B[21] ) , .SI ( optlc_net_4008 ) , .SE ( optlc_net_4008 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_B_reg_r_reg ) , 
    .CDN ( HFSNET_29 ) , .Q ( operand_B_reg[21] ) , .QN ( ctmn_13431 ) ) ;
SDFCND0BWP30P140HVT \u_io_block/operand_B_reg_r_reg[20] ( 
    .D ( operand_B[20] ) , .SI ( optlc_net_4008 ) , .SE ( optlc_net_4008 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_B_reg_r_reg ) , 
    .CDN ( HFSNET_29 ) , .Q ( operand_B_reg[20] ) , .QN ( ctmn_13885 ) ) ;
SDFCND0BWP30P140HVT \u_io_block/operand_B_reg_r_reg[19] ( 
    .D ( operand_B[19] ) , .SI ( optlc_net_3999 ) , .SE ( optlc_net_3999 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_B_reg_r_reg ) , 
    .CDN ( HFSNET_29 ) , .Q ( operand_B_reg[19] ) , .QN ( ctmn_13846 ) ) ;
SDFCND0BWP30P140HVT \u_io_block/operand_B_reg_r_reg[18] ( 
    .D ( operand_B[18] ) , .SI ( optlc_net_3999 ) , .SE ( optlc_net_3999 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_B_reg_r_reg ) , 
    .CDN ( HFSNET_29 ) , .Q ( operand_B_reg[18] ) , .QN ( ctmn_13844 ) ) ;
SDFCND0BWP30P140HVT \u_io_block/operand_B_reg_r_reg[17] ( 
    .D ( operand_B[17] ) , .SI ( optlc_net_3999 ) , .SE ( optlc_net_3999 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_B_reg_r_reg ) , 
    .CDN ( HFSNET_29 ) , .Q ( operand_B_reg[17] ) , .QN ( ctmn_13841 ) ) ;
SDFCND0BWP30P140HVT \u_io_block/operand_B_reg_r_reg[16] ( 
    .D ( operand_B[16] ) , .SI ( optlc_net_3999 ) , .SE ( optlc_net_3999 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_B_reg_r_reg ) , 
    .CDN ( HFSNET_29 ) , .Q ( operand_B_reg[16] ) , .QN ( ctmn_13862 ) ) ;
SDFCND0BWP30P140HVT \u_io_block/operand_B_reg_r_reg[15] ( 
    .D ( operand_B[15] ) , .SI ( optlc_net_3999 ) , .SE ( optlc_net_3999 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_B_reg_r_reg ) , 
    .CDN ( HFSNET_29 ) , .Q ( operand_B_reg[15] ) , .QN ( ctmn_13565 ) ) ;
SDFCND0BWP30P140HVT \u_io_block/operand_B_reg_r_reg[14] ( 
    .D ( operand_B[14] ) , .SI ( optlc_net_3999 ) , .SE ( optlc_net_3999 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_B_reg_r_reg ) , 
    .CDN ( HFSNET_29 ) , .Q ( operand_B_reg[14] ) , .QN ( ctmn_13559 ) ) ;
SDFCND0BWP30P140HVT \u_io_block/operand_B_reg_r_reg[13] ( 
    .D ( operand_B[13] ) , .SI ( optlc_net_3999 ) , .SE ( optlc_net_3999 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_B_reg_r_reg ) , 
    .CDN ( HFSNET_29 ) , .Q ( operand_B_reg[13] ) , .QN ( ctmn_13553 ) ) ;
SDFCND0BWP30P140HVT \u_io_block/operand_B_reg_r_reg[12] ( 
    .D ( operand_B[12] ) , .SI ( optlc_net_4000 ) , .SE ( optlc_net_4000 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_B_reg_r_reg ) , 
    .CDN ( HFSNET_29 ) , .Q ( operand_B_reg[12] ) , .QN ( ctmn_13827 ) ) ;
SDFCND0BWP30P140HVT \u_io_block/operand_B_reg_r_reg[11] ( 
    .D ( operand_B[11] ) , .SI ( optlc_net_4000 ) , .SE ( optlc_net_4000 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_B_reg_r_reg ) , 
    .CDN ( HFSNET_29 ) , .Q ( operand_B_reg[11] ) , .QN ( ctmn_13790 ) ) ;
SDFCND0BWP30P140HVT \u_io_block/operand_B_reg_r_reg[10] ( 
    .D ( operand_B[10] ) , .SI ( optlc_net_4000 ) , .SE ( optlc_net_4000 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_B_reg_r_reg ) , 
    .CDN ( HFSNET_29 ) , .Q ( operand_B_reg[10] ) , .QN ( ctmn_13788 ) ) ;
SDFCND0BWP30P140HVT \u_io_block/operand_B_reg_r_reg[9] ( .D ( operand_B[9] ) , 
    .SI ( optlc_net_4000 ) , .SE ( optlc_net_4000 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_B_reg_r_reg ) , 
    .CDN ( HFSNET_29 ) , .Q ( operand_B_reg[9] ) , .QN ( ctmn_13785 ) ) ;
SDFCND0BWP30P140HVT \u_io_block/operand_B_reg_r_reg[8] ( .D ( operand_B[8] ) , 
    .SI ( optlc_net_3998 ) , .SE ( optlc_net_3998 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_B_reg_r_reg ) , 
    .CDN ( HFSNET_29 ) , .Q ( operand_B_reg[8] ) , .QN ( ctmn_13804 ) ) ;
SDFCND0BWP30P140HVT \u_io_block/operand_B_reg_r_reg[7] ( .D ( operand_B[7] ) , 
    .SI ( optlc_net_3998 ) , .SE ( optlc_net_3998 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_B_reg_r_reg ) , 
    .CDN ( HFSNET_29 ) , .Q ( operand_B_reg[7] ) , .QN ( ctmn_13620 ) ) ;
SDFCND0BWP30P140HVT \u_io_block/operand_B_reg_r_reg[6] ( .D ( operand_B[6] ) , 
    .SI ( optlc_net_3998 ) , .SE ( optlc_net_3998 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_B_reg_r_reg ) , 
    .CDN ( HFSNET_29 ) , .Q ( operand_B_reg[6] ) , .QN ( ctmn_13614 ) ) ;
SDFCND0BWP30P140HVT \u_io_block/operand_B_reg_r_reg[5] ( .D ( operand_B[5] ) , 
    .SI ( optlc_net_3998 ) , .SE ( optlc_net_3998 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_B_reg_r_reg ) , 
    .CDN ( HFSNET_29 ) , .Q ( operand_B_reg[5] ) , .QN ( ctmn_13608 ) ) ;
SDFCND0BWP30P140HVT \u_io_block/operand_B_reg_r_reg[4] ( .D ( operand_B[4] ) , 
    .SI ( optlc_net_3998 ) , .SE ( optlc_net_3998 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_B_reg_r_reg ) , 
    .CDN ( HFSNET_29 ) , .Q ( operand_B_reg[4] ) , .QN ( ctmn_13724 ) ) ;
SDFCND0BWP30P140HVT \u_io_block/operand_B_reg_r_reg[3] ( .D ( operand_B[3] ) , 
    .SI ( optlc_net_3997 ) , .SE ( optlc_net_3997 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_B_reg_r_reg ) , 
    .CDN ( HFSNET_29 ) , .Q ( operand_B_reg[3] ) , .QN ( ctmn_13676 ) ) ;
SDFCND0BWP30P140HVT \u_io_block/operand_B_reg_r_reg[2] ( .D ( operand_B[2] ) , 
    .SI ( optlc_net_3997 ) , .SE ( optlc_net_3997 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_B_reg_r_reg ) , 
    .CDN ( HFSNET_29 ) , .Q ( operand_B_reg[2] ) , .QN ( ctmn_13674 ) ) ;
SDFCND0BWP30P140HVT \u_io_block/operand_B_reg_r_reg[1] ( .D ( operand_B[1] ) , 
    .SI ( optlc_net_3997 ) , .SE ( optlc_net_3997 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_B_reg_r_reg ) , 
    .CDN ( HFSNET_29 ) , .Q ( operand_B_reg[1] ) , .QN ( ctmn_13671 ) ) ;
SDFCND0BWP30P140HVT \u_io_block/operand_B_reg_r_reg[0] ( .D ( operand_B[0] ) , 
    .SI ( optlc_net_3993 ) , .SE ( optlc_net_3993 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_B_reg_r_reg ) , 
    .CDN ( HFSNET_29 ) , .Q ( operand_B_reg[0] ) , .QN ( ctmn_13701 ) ) ;
SDFCND0BWP30P140HVT \u_controller/config_reg_reg[2] ( 
    .D ( operand_A_reg[2] ) , .SI ( optlc_net_4001 ) , 
    .SE ( optlc_net_4001 ) , 
    .CP ( \clk_clock_gate_u_controller/config_reg_reg ) , .CDN ( sync_rst ) , 
    .Q ( act_fn_sel[2] ) , .QN ( ctmn_14782 ) ) ;
AN2D0BWP30P140HVT ctmi_14596 ( .A1 ( pe_opcode[0] ) , .A2 ( ctmn_13318 ) , 
    .Z ( \u_controller/N5 ) ) ;
SDFCND0BWP30P140HVT \u_io_block/operand_B_reg_r_reg[28] ( 
    .D ( operand_B[28] ) , .SI ( optlc_net_4007 ) , .SE ( optlc_net_4007 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_B_reg_r_reg ) , 
    .CDN ( HFSNET_29 ) , .Q ( operand_B_reg[28] ) , .QN ( ctmn_13942 ) ) ;
SDFCND0BWP30P140HVT \u_controller/config_reg_reg[1] ( 
    .D ( operand_A_reg[1] ) , .SI ( optlc_net_4001 ) , 
    .SE ( optlc_net_4001 ) , 
    .CP ( \clk_clock_gate_u_controller/config_reg_reg ) , .CDN ( HFSNET_33 ) , 
    .Q ( act_fn_sel[1] ) , .QN ( ctmn_14748 ) ) ;
SDFCNQARD1BWP30P140HVT \u_io_block/data_out_r_reg[7] ( 
    .D ( \u_io_block/output_mux_result [7] ) , .SI ( optlc_net_3997 ) , 
    .SE ( optlc_net_3997 ) , 
    .CP ( \clk_clock_gate_u_io_block/data_out_r_reg ) , .CDN ( HFSNET_29 ) , 
    .Q ( data_out[7] ) ) ;
SDFCNQARD1BWP30P140HVT \u_io_block/data_out_r_reg[6] ( 
    .D ( \u_io_block/output_mux_result [6] ) , .SI ( optlc_net_3997 ) , 
    .SE ( optlc_net_3997 ) , 
    .CP ( \clk_clock_gate_u_io_block/data_out_r_reg ) , .CDN ( HFSNET_29 ) , 
    .Q ( data_out[6] ) ) ;
SDFCNQARD1BWP30P140HVT \u_io_block/data_out_r_reg[5] ( 
    .D ( \u_io_block/output_mux_result [5] ) , .SI ( optlc_net_3993 ) , 
    .SE ( optlc_net_3993 ) , 
    .CP ( \clk_clock_gate_u_io_block/data_out_r_reg ) , .CDN ( HFSNET_29 ) , 
    .Q ( data_out[5] ) ) ;
SDFCNQARD1BWP30P140HVT \u_io_block/data_out_r_reg[4] ( 
    .D ( \u_io_block/output_mux_result [4] ) , .SI ( optlc_net_3993 ) , 
    .SE ( optlc_net_3993 ) , 
    .CP ( \clk_clock_gate_u_io_block/data_out_r_reg ) , .CDN ( HFSNET_29 ) , 
    .Q ( data_out[4] ) ) ;
SDFCNQARD1BWP30P140HVT \u_io_block/data_out_r_reg[3] ( 
    .D ( \u_io_block/output_mux_result [3] ) , .SI ( optlc_net_3993 ) , 
    .SE ( optlc_net_3993 ) , 
    .CP ( \clk_clock_gate_u_io_block/data_out_r_reg ) , .CDN ( HFSNET_29 ) , 
    .Q ( data_out[3] ) ) ;
SDFCNQARD1BWP30P140HVT \u_io_block/data_out_r_reg[2] ( 
    .D ( \u_io_block/output_mux_result [2] ) , .SI ( optlc_net_3993 ) , 
    .SE ( optlc_net_3993 ) , 
    .CP ( \clk_clock_gate_u_io_block/data_out_r_reg ) , .CDN ( HFSNET_29 ) , 
    .Q ( data_out[2] ) ) ;
SDFCNQARD1BWP30P140HVT \u_io_block/data_out_r_reg[1] ( 
    .D ( \u_io_block/output_mux_result [1] ) , .SI ( optlc_net_3993 ) , 
    .SE ( optlc_net_3993 ) , 
    .CP ( \clk_clock_gate_u_io_block/data_out_r_reg ) , .CDN ( HFSNET_29 ) , 
    .Q ( data_out[1] ) ) ;
SDFCNQARD1BWP30P140HVT \u_io_block/data_out_r_reg[0] ( 
    .D ( \u_io_block/output_mux_result [0] ) , .SI ( optlc_net_3993 ) , 
    .SE ( optlc_net_3993 ) , 
    .CP ( \clk_clock_gate_u_io_block/data_out_r_reg ) , .CDN ( HFSNET_29 ) , 
    .Q ( data_out[0] ) ) ;
SDFCNQD0BWP30P140HVT \u_controller/opcode_reg_reg[4] ( 
    .D ( \u_controller/N1 ) , .SI ( optlc_net_4013 ) , 
    .SE ( optlc_net_4013 ) , .CP ( clk ) , .CDN ( sync_rst ) , 
    .Q ( \u_controller/opcode_reg [4] ) ) ;
SDFCNQD0BWP30P140HVT \u_controller/opcode_reg_reg[2] ( 
    .D ( \u_controller/N3 ) , .SI ( optlc_net_4012 ) , 
    .SE ( optlc_net_4012 ) , .CP ( clk ) , .CDN ( sync_rst ) , 
    .Q ( \u_controller/opcode_reg [2] ) ) ;
SDFCNQD0BWP30P140HVT \u_controller/opcode_reg_reg[1] ( 
    .D ( \u_controller/N4 ) , .SI ( optlc_net_4012 ) , 
    .SE ( optlc_net_4012 ) , .CP ( clk ) , .CDN ( sync_rst ) , 
    .Q ( \u_controller/opcode_reg [1] ) ) ;
SDFCNQD0BWP30P140HVT \u_controller/opcode_reg_reg[0] ( 
    .D ( \u_controller/N5 ) , .SI ( optlc_net_4012 ) , 
    .SE ( optlc_net_4012 ) , .CP ( clk ) , .CDN ( sync_rst ) , 
    .Q ( \u_controller/opcode_reg [0] ) ) ;
SDFCND0BWP30P140HVT \u_controller/config_reg_reg[0] ( 
    .D ( operand_A_reg[0] ) , .SI ( optlc_net_4001 ) , 
    .SE ( optlc_net_4001 ) , 
    .CP ( \clk_clock_gate_u_controller/config_reg_reg ) , .CDN ( HFSNET_33 ) , 
    .Q ( act_fn_sel[0] ) , .QN ( ctmn_14697 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5129 ( .I ( ctmn_13313 ) , .ZN ( phfnn_3659 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[60] ( 
    .D ( \u_mac_and_scale/N17 ) , .SI ( optlc_net_4005 ) , 
    .SE ( optlc_net_4005 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_30 ) , .Q ( accumulator[60] ) , .QN ( ctmn_13365 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[56] ( 
    .D ( \u_mac_and_scale/N21 ) , .SI ( optlc_net_4005 ) , 
    .SE ( optlc_net_4005 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_30 ) , .Q ( accumulator[56] ) , .QN ( ctmn_13366 ) ) ;
SDFCNQD0BWP30P140HVT \u_controller/state_reg[0] ( 
    .D ( \u_controller/next_state [0] ) , .SI ( optlc_net_4013 ) , 
    .SE ( optlc_net_4013 ) , .CP ( clk ) , .CDN ( sync_rst ) , 
    .Q ( \u_controller/state [0] ) ) ;
SDFCNQD0BWP30P140HVT \u_mac_and_scale/holding_reg_reg[23] ( 
    .D ( accumulator[31] ) , .SI ( optlc_net_4017 ) , .SE ( optlc_net_4017 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/holding_reg_reg ) , 
    .CDN ( HFSNET_32 ) , .Q ( \u_mac_and_scale/holding_reg [23] ) ) ;
SDFCNQD0BWP30P140HVT \u_mac_and_scale/holding_reg_reg[21] ( 
    .D ( accumulator[29] ) , .SI ( optlc_net_4018 ) , .SE ( optlc_net_4018 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/holding_reg_reg ) , 
    .CDN ( HFSNET_32 ) , .Q ( \u_mac_and_scale/holding_reg [21] ) ) ;
SDFCNQD0BWP30P140HVT \u_mac_and_scale/holding_reg_reg[20] ( 
    .D ( accumulator[28] ) , .SI ( optlc_net_4017 ) , .SE ( optlc_net_4017 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/holding_reg_reg ) , 
    .CDN ( HFSNET_32 ) , .Q ( \u_mac_and_scale/holding_reg [20] ) ) ;
SDFCNQD0BWP30P140HVT \u_mac_and_scale/holding_reg_reg[19] ( 
    .D ( accumulator[27] ) , .SI ( optlc_net_4017 ) , .SE ( optlc_net_4017 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/holding_reg_reg ) , 
    .CDN ( HFSNET_32 ) , .Q ( \u_mac_and_scale/holding_reg [19] ) ) ;
SDFCNQD0BWP30P140HVT \u_mac_and_scale/holding_reg_reg[18] ( 
    .D ( accumulator[26] ) , .SI ( optlc_net_4010 ) , .SE ( optlc_net_4010 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/holding_reg_reg ) , 
    .CDN ( HFSNET_32 ) , .Q ( \u_mac_and_scale/holding_reg [18] ) ) ;
SDFCNQD0BWP30P140HVT \u_mac_and_scale/holding_reg_reg[17] ( 
    .D ( accumulator[25] ) , .SI ( optlc_net_4019 ) , .SE ( optlc_net_4019 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/holding_reg_reg ) , 
    .CDN ( HFSNET_32 ) , .Q ( \u_mac_and_scale/holding_reg [17] ) ) ;
SDFCNQD0BWP30P140HVT \u_mac_and_scale/holding_reg_reg[16] ( 
    .D ( accumulator[24] ) , .SI ( optlc_net_4019 ) , .SE ( optlc_net_4019 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/holding_reg_reg ) , 
    .CDN ( HFSNET_32 ) , .Q ( \u_mac_and_scale/holding_reg [16] ) ) ;
SDFCNQD0BWP30P140HVT \u_mac_and_scale/holding_reg_reg[15] ( 
    .D ( accumulator[23] ) , .SI ( optlc_net_4010 ) , .SE ( optlc_net_4010 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/holding_reg_reg ) , 
    .CDN ( HFSNET_32 ) , .Q ( \u_mac_and_scale/holding_reg [15] ) ) ;
SDFCNQD0BWP30P140HVT \u_mac_and_scale/holding_reg_reg[14] ( 
    .D ( accumulator[22] ) , .SI ( optlc_net_3996 ) , .SE ( optlc_net_3996 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/holding_reg_reg ) , 
    .CDN ( HFSNET_33 ) , .Q ( \u_mac_and_scale/holding_reg [14] ) ) ;
SDFCNQD0BWP30P140HVT \u_mac_and_scale/holding_reg_reg[13] ( 
    .D ( accumulator[21] ) , .SI ( optlc_net_4018 ) , .SE ( optlc_net_4018 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/holding_reg_reg ) , 
    .CDN ( HFSNET_32 ) , .Q ( \u_mac_and_scale/holding_reg [13] ) ) ;
SDFCNQD0BWP30P140HVT \u_mac_and_scale/holding_reg_reg[12] ( 
    .D ( accumulator[20] ) , .SI ( optlc_net_4010 ) , .SE ( optlc_net_4010 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/holding_reg_reg ) , 
    .CDN ( sync_rst ) , .Q ( \u_mac_and_scale/holding_reg [12] ) ) ;
SDFCNQD0BWP30P140HVT \u_mac_and_scale/holding_reg_reg[11] ( 
    .D ( accumulator[19] ) , .SI ( optlc_net_4002 ) , .SE ( optlc_net_4002 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/holding_reg_reg ) , 
    .CDN ( HFSNET_33 ) , .Q ( \u_mac_and_scale/holding_reg [11] ) ) ;
SDFCNQD0BWP30P140HVT \u_mac_and_scale/holding_reg_reg[10] ( 
    .D ( accumulator[18] ) , .SI ( optlc_net_4010 ) , .SE ( optlc_net_4010 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/holding_reg_reg ) , 
    .CDN ( sync_rst ) , .Q ( \u_mac_and_scale/holding_reg [10] ) ) ;
AO21D0BWP30P140HVT ctmi_17000 ( .A1 ( N265 ) , .A2 ( HFSNET_26 ) , 
    .B ( ctmn_14973 ) , .Z ( \u_mac_and_scale/N15 ) ) ;
XOR2UD0BWP30P140HVT ctmi_17131 ( .A1 ( ctmn_15267 ) , .A2 ( ctmn_15270 ) , 
    .Z ( \u_mac_and_scale/mult_4_3_bottom [7] ) ) ;
AN2D0BWP30P140HVT ctmTdsLR_1_3539 ( .A1 ( ctmn_14490 ) , .A2 ( ctmn_14488 ) , 
    .Z ( phfnn_2514 ) ) ;
SDFSND0BWP30P140HVT \u_controller/state_reg[1] ( .D ( phfnn_643 ) , 
    .SI ( optlc_net_4013 ) , .SE ( optlc_net_4013 ) , .CP ( clk ) , 
    .SDN ( sync_rst ) , .Q ( ctmn_13308 ) , .QN ( \u_controller/state [1] ) ) ;
XOR4D0BWP30P140HVT ctmi_15894 ( .A1 ( ctmn_14121 ) , .A2 ( ctmn_14126 ) , 
    .A3 ( ctmn_14148 ) , .A4 ( ctmn_14149 ) , 
    .Z ( \u_mac_and_scale/mult_4_2_bottom[6] ) ) ;
OAI21D0BWP30P140HVT ctmi_15895 ( .A1 ( phfnn_3152 ) , .A2 ( ctmn_14119 ) , 
    .B ( ctmn_14120 ) , .ZN ( ctmn_14121 ) ) ;
CKND0BWP30P140HVT HFSINV_743_5411 ( .I ( HFSNET_14 ) , .ZN ( HFSNET_13 ) ) ;
OAI21D0BWP30P140HVT ctmi_14826 ( .A1 ( N157 ) , 
    .A2 ( \u_controller/state [0] ) , .B ( HFSNET_9 ) , 
    .ZN ( \u_controller/next_state [0] ) ) ;
INR2D1BWP30P140HVT ctmi_14604 ( .A1 ( valid_B ) , .B1 ( ctmn_13317 ) , 
    .ZN ( \u_io_block/wr_en_B ) ) ;
NR2D1BWP30P140HVT ctmi_14605 ( .A1 ( HFSNET_14 ) , .A2 ( N157 ) , 
    .ZN ( acc_load ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[55] ( 
    .D ( \u_mac_and_scale/N22 ) , .SI ( optlc_net_4014 ) , 
    .SE ( optlc_net_4014 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_30 ) , .Q ( accumulator[55] ) , .QN ( ctmn_13367 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5130 ( .I ( ctmn_13327 ) , .ZN ( phfnn_3660 ) ) ;
AN2D0BWP30P140HVT ctmi_14611 ( .A1 ( phfnn_645 ) , 
    .A2 ( \u_mac_and_scale/lower_sum [31] ) , .Z ( \u_mac_and_scale/N46 ) ) ;
NR2D0BWP30P140HVT ctmi_14858 ( .A1 ( phfnn_675 ) , .A2 ( ctmn_13438 ) , 
    .ZN ( N9349 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5131 ( .I ( ctmn_14058 ) , .ZN ( phfnn_3661 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5132 ( .I ( ctmn_14333 ) , .ZN ( phfnn_3662 ) ) ;
SDFCNQD0BWP30P140HVT \u_mac_and_scale/holding_reg_reg[9] ( 
    .D ( accumulator[17] ) , .SI ( optlc_net_4003 ) , .SE ( optlc_net_4003 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/holding_reg_reg ) , 
    .CDN ( HFSNET_33 ) , .Q ( \u_mac_and_scale/holding_reg [9] ) ) ;
SDFCNQD0BWP30P140HVT \u_mac_and_scale/holding_reg_reg[8] ( 
    .D ( accumulator[16] ) , .SI ( optlc_net_4010 ) , .SE ( optlc_net_4010 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/holding_reg_reg ) , 
    .CDN ( sync_rst ) , .Q ( \u_mac_and_scale/holding_reg [8] ) ) ;
SDFCNQD0BWP30P140HVT \u_mac_and_scale/holding_reg_reg[7] ( 
    .D ( accumulator[15] ) , .SI ( optlc_net_4019 ) , .SE ( optlc_net_4019 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/holding_reg_reg ) , 
    .CDN ( HFSNET_32 ) , .Q ( \u_mac_and_scale/holding_reg [7] ) ) ;
SDFCNQD0BWP30P140HVT \u_mac_and_scale/holding_reg_reg[6] ( 
    .D ( accumulator[14] ) , .SI ( optlc_net_3996 ) , .SE ( optlc_net_3996 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/holding_reg_reg ) , 
    .CDN ( HFSNET_33 ) , .Q ( \u_mac_and_scale/holding_reg [6] ) ) ;
SDFCNQD0BWP30P140HVT \u_mac_and_scale/holding_reg_reg[5] ( 
    .D ( accumulator[13] ) , .SI ( optlc_net_4003 ) , .SE ( optlc_net_4003 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/holding_reg_reg ) , 
    .CDN ( HFSNET_33 ) , .Q ( \u_mac_and_scale/holding_reg [5] ) ) ;
SDFCNQD0BWP30P140HVT \u_mac_and_scale/holding_reg_reg[4] ( 
    .D ( accumulator[12] ) , .SI ( optlc_net_4010 ) , .SE ( optlc_net_4010 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/holding_reg_reg ) , 
    .CDN ( sync_rst ) , .Q ( \u_mac_and_scale/holding_reg [4] ) ) ;
SDFCNQD0BWP30P140HVT \u_mac_and_scale/holding_reg_reg[3] ( 
    .D ( accumulator[11] ) , .SI ( optlc_net_4002 ) , .SE ( optlc_net_4002 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/holding_reg_reg ) , 
    .CDN ( HFSNET_33 ) , .Q ( \u_mac_and_scale/holding_reg [3] ) ) ;
SDFCNQD0BWP30P140HVT \u_mac_and_scale/holding_reg_reg[2] ( 
    .D ( accumulator[10] ) , .SI ( optlc_net_4011 ) , .SE ( optlc_net_4011 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/holding_reg_reg ) , 
    .CDN ( sync_rst ) , .Q ( \u_mac_and_scale/holding_reg [2] ) ) ;
XOR4D0BWP30P140HVT ctmi_17031 ( .A1 ( ctmn_13468 ) , .A2 ( N158 ) , 
    .A3 ( ctmn_15193 ) , .A4 ( ctmn_13493 ) , 
    .Z ( \u_mac_and_scale/mult_2/mult01 [6] ) ) ;
OAI22D0BWP30P140HVT ctmi_16776 ( .A1 ( ctmn_14977 ) , .A2 ( phfnn_2357 ) , 
    .B1 ( phfnn_3691 ) , .B2 ( ctmn_14984 ) , 
    .ZN ( \u_io_block/output_mux_result [7] ) ) ;
AOI221D0BWP30P140HVT ctmi_16777 ( .A1 ( accumulator[63] ) , 
    .A2 ( ctmn_14314 ) , .B1 ( accumulator[31] ) , .B2 ( ctmn_14316 ) , 
    .C ( ctmn_14976 ) , .ZN ( ctmn_14977 ) ) ;
AO21D0BWP30P140HVT ctmTdsLR_1_3540 ( .A1 ( N209 ) , .A2 ( HFSNET_22 ) , 
    .B ( \RS_OP_250_54632_65499_J1/ctmn_154 ) , .Z ( N272 ) ) ;
AO21D0BWP30P140HVT ctmi_17001 ( .A1 ( N266 ) , .A2 ( HFSNET_26 ) , 
    .B ( ctmn_14973 ) , .Z ( \u_mac_and_scale/N16 ) ) ;
AO21D0BWP30P140HVT ctmi_17002 ( .A1 ( N267 ) , .A2 ( HFSNET_26 ) , 
    .B ( ctmn_14973 ) , .Z ( \u_mac_and_scale/N17 ) ) ;
AO21D0BWP30P140HVT ctmi_17003 ( .A1 ( N277 ) , .A2 ( HFSNET_26 ) , 
    .B ( ctmn_14973 ) , .Z ( \u_mac_and_scale/N18 ) ) ;
AO21D0BWP30P140HVT ctmi_17004 ( .A1 ( N278 ) , .A2 ( HFSNET_26 ) , 
    .B ( ctmn_14973 ) , .Z ( \u_mac_and_scale/N19 ) ) ;
OAI22D0BWP30P140HVT ctmi_16788 ( .A1 ( ctmn_14988 ) , .A2 ( phfnn_2357 ) , 
    .B1 ( phfnn_3691 ) , .B2 ( ctmn_14998 ) , 
    .ZN ( \u_io_block/output_mux_result [6] ) ) ;
AO21D0BWP30P140HVT ctmi_17005 ( .A1 ( N279 ) , .A2 ( HFSNET_26 ) , 
    .B ( ctmn_14973 ) , .Z ( \u_mac_and_scale/N20 ) ) ;
AO21D0BWP30P140HVT ctmi_17006 ( .A1 ( N280 ) , .A2 ( HFSNET_26 ) , 
    .B ( ctmn_14973 ) , .Z ( \u_mac_and_scale/N21 ) ) ;
AOI221D0BWP30P140HVT ctmi_16789 ( .A1 ( accumulator[62] ) , 
    .A2 ( ctmn_14314 ) , .B1 ( accumulator[30] ) , .B2 ( ctmn_14316 ) , 
    .C ( ctmn_14987 ) , .ZN ( ctmn_14988 ) ) ;
AO21D0BWP30P140HVT ctmi_17007 ( .A1 ( N281 ) , .A2 ( HFSNET_26 ) , 
    .B ( ctmn_14973 ) , .Z ( \u_mac_and_scale/N22 ) ) ;
OAI211D0BWP30P140HVT ctmi_16790 ( .A1 ( ctmn_13373 ) , .A2 ( ctmn_14317 ) , 
    .B ( ctmn_14985 ) , .C ( ctmn_14986 ) , .ZN ( ctmn_14987 ) ) ;
AO21D0BWP30P140HVT ctmi_17008 ( .A1 ( N282 ) , .A2 ( HFSNET_26 ) , 
    .B ( ctmn_14973 ) , .Z ( \u_mac_and_scale/N23 ) ) ;
AO21D0BWP30P140HVT ctmi_17009 ( .A1 ( N283 ) , .A2 ( HFSNET_26 ) , 
    .B ( ctmn_14973 ) , .Z ( \u_mac_and_scale/N24 ) ) ;
AOI22D0BWP30P140HVT ctmi_16791 ( .A1 ( ctmn_14318 ) , 
    .A2 ( accumulator[54] ) , .B1 ( accumulator[38] ) , .B2 ( ctmn_14319 ) , 
    .ZN ( ctmn_14985 ) ) ;
AO21D0BWP30P140HVT ctmi_17010 ( .A1 ( N284 ) , .A2 ( HFSNET_26 ) , 
    .B ( ctmn_14973 ) , .Z ( \u_mac_and_scale/N25 ) ) ;
AOI222D0BWP30P140HVT ctmi_16792 ( .A1 ( ctmn_14321 ) , 
    .A2 ( accumulator[22] ) , .B1 ( ctmn_14322 ) , .B2 ( accumulator[14] ) , 
    .C1 ( ctmn_14323 ) , .C2 ( accumulator[6] ) , .ZN ( ctmn_14986 ) ) ;
AO21D0BWP30P140HVT ctmi_17011 ( .A1 ( N285 ) , .A2 ( HFSNET_26 ) , 
    .B ( ctmn_14973 ) , .Z ( \u_mac_and_scale/N26 ) ) ;
AOI221D0BWP30P140HVT ctmi_16793 ( .A1 ( act_fn_sel[2] ) , .A2 ( ctmn_14997 ) , 
    .B1 ( phfnn_2546 ) , .B2 ( ctmn_14760 ) , .C ( ctmn_14761 ) , 
    .ZN ( ctmn_14998 ) ) ;
AO21D0BWP30P140HVT ctmi_17012 ( .A1 ( N286 ) , .A2 ( HFSNET_26 ) , 
    .B ( ctmn_14973 ) , .Z ( \u_mac_and_scale/N27 ) ) ;
AO21D0BWP30P140HVT ctmi_17013 ( .A1 ( N287 ) , .A2 ( HFSNET_26 ) , 
    .B ( ctmn_14973 ) , .Z ( \u_mac_and_scale/N28 ) ) ;
OAI22D0BWP30P140HVT ctmi_16794 ( .A1 ( act_fn_sel[0] ) , .A2 ( ctmn_14989 ) , 
    .B1 ( phfnn_3830 ) , .B2 ( ctmn_14996 ) , .ZN ( ctmn_14997 ) ) ;
AO21D0BWP30P140HVT ctmi_17014 ( .A1 ( N288 ) , .A2 ( HFSNET_26 ) , 
    .B ( ctmn_14973 ) , .Z ( \u_mac_and_scale/N29 ) ) ;
OAI211D0BWP30P140HVT ctmi_16795 ( .A1 ( phfnn_3836 ) , .A2 ( ctmn_14751 ) , 
    .B ( ctmn_14732 ) , .C ( phfnn_1420 ) , .ZN ( ctmn_14989 ) ) ;
AOI211D0BWP30P140HVT ctmi_16796 ( .A1 ( ctmn_14697 ) , .A2 ( ctmn_14990 ) , 
    .B ( ctmn_14991 ) , .C ( ctmn_14995 ) , .ZN ( ctmn_14996 ) ) ;
AO21D0BWP30P140HVT ctmi_17015 ( .A1 ( N289 ) , .A2 ( HFSNET_27 ) , 
    .B ( ctmn_14973 ) , .Z ( \u_mac_and_scale/N30 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[52] ( 
    .D ( \u_mac_and_scale/N25 ) , .SI ( optlc_net_4020 ) , 
    .SE ( optlc_net_4020 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_30 ) , .Q ( accumulator[52] ) , .QN ( ctmn_13368 ) ) ;
AO21D0BWP30P140HVT ctmi_17016 ( .A1 ( N290 ) , .A2 ( HFSNET_26 ) , 
    .B ( ctmn_14973 ) , .Z ( \u_mac_and_scale/N31 ) ) ;
CKND0BWP30P140HVT HFSINV_708_5418 ( .I ( phfnn_648 ) , .ZN ( HFSNET_21 ) ) ;
AO21D0BWP30P140HVT ctmi_17017 ( .A1 ( N291 ) , .A2 ( HFSNET_26 ) , 
    .B ( ctmn_14973 ) , .Z ( \u_mac_and_scale/N32 ) ) ;
AO21D0BWP30P140HVT ctmi_17018 ( .A1 ( N292 ) , .A2 ( HFSNET_27 ) , 
    .B ( ctmn_14973 ) , .Z ( \u_mac_and_scale/N33 ) ) ;
AO21D0BWP30P140HVT ctmi_17019 ( .A1 ( N293 ) , .A2 ( HFSNET_26 ) , 
    .B ( ctmn_14973 ) , .Z ( \u_mac_and_scale/N34 ) ) ;
AO21D0BWP30P140HVT ctmi_17020 ( .A1 ( N294 ) , .A2 ( HFSNET_27 ) , 
    .B ( ctmn_14973 ) , .Z ( \u_mac_and_scale/N35 ) ) ;
AO21D0BWP30P140HVT ctmi_17021 ( .A1 ( N295 ) , .A2 ( HFSNET_27 ) , 
    .B ( ctmn_14973 ) , .Z ( \u_mac_and_scale/N36 ) ) ;
AO21D0BWP30P140HVT ctmi_17022 ( .A1 ( N296 ) , .A2 ( HFSNET_27 ) , 
    .B ( ctmn_14973 ) , .Z ( \u_mac_and_scale/N37 ) ) ;
AO21D0BWP30P140HVT ctmi_17023 ( .A1 ( N297 ) , .A2 ( HFSNET_26 ) , 
    .B ( ctmn_14973 ) , .Z ( \u_mac_and_scale/N38 ) ) ;
AO21D0BWP30P140HVT ctmi_17024 ( .A1 ( N298 ) , .A2 ( HFSNET_26 ) , 
    .B ( ctmn_14973 ) , .Z ( \u_mac_and_scale/N39 ) ) ;
AO21D0BWP30P140HVT ctmi_17025 ( .A1 ( N299 ) , .A2 ( HFSNET_26 ) , 
    .B ( ctmn_14973 ) , .Z ( \u_mac_and_scale/N40 ) ) ;
AO21D0BWP30P140HVT ctmi_17026 ( .A1 ( N300 ) , .A2 ( HFSNET_26 ) , 
    .B ( ctmn_14973 ) , .Z ( \u_mac_and_scale/N41 ) ) ;
AO21D0BWP30P140HVT ctmi_17027 ( .A1 ( N301 ) , .A2 ( HFSNET_26 ) , 
    .B ( ctmn_14973 ) , .Z ( \u_mac_and_scale/N42 ) ) ;
AO21D0BWP30P140HVT ctmi_17028 ( .A1 ( N302 ) , .A2 ( HFSNET_26 ) , 
    .B ( ctmn_14973 ) , .Z ( \u_mac_and_scale/N43 ) ) ;
AO21D0BWP30P140HVT ctmi_17029 ( .A1 ( N303 ) , .A2 ( HFSNET_26 ) , 
    .B ( ctmn_14973 ) , .Z ( \u_mac_and_scale/N44 ) ) ;
AO21D0BWP30P140HVT ctmi_17030 ( .A1 ( N304 ) , .A2 ( HFSNET_26 ) , 
    .B ( ctmn_14973 ) , .Z ( \u_mac_and_scale/N45 ) ) ;
AOI21D0BWP30P140HVT ctmi_17032 ( .A1 ( ctmn_13479 ) , .A2 ( ctmn_13489 ) , 
    .B ( ctmn_13490 ) , .ZN ( ctmn_15193 ) ) ;
XOR2UD0BWP30P140HVT ctmi_17033 ( .A1 ( ctmn_15195 ) , .A2 ( ctmn_13488 ) , 
    .Z ( \u_mac_and_scale/mult_2/mult01 [5] ) ) ;
OAI21D0BWP30P140HVT ctmi_17034 ( .A1 ( ctmn_13487 ) , .A2 ( ctmn_13481 ) , 
    .B ( ctmn_15194 ) , .ZN ( ctmn_15195 ) ) ;
ND2D0BWP30P140HVT ctmi_17035 ( .A1 ( ctmn_13481 ) , .A2 ( ctmn_13487 ) , 
    .ZN ( ctmn_15194 ) ) ;
MUX2ND0BWP30P140HVT ctmi_17036 ( .I0 ( ctmn_13482 ) , .I1 ( phfnn_3796 ) , 
    .S ( ctmn_15197 ) , .ZN ( \u_mac_and_scale/mult_2/mult01 [4] ) ) ;
AOI21D0BWP30P140HVT ctmi_17037 ( .A1 ( ctmn_13486 ) , .A2 ( N11353 ) , 
    .B ( ctmn_15196 ) , .ZN ( ctmn_15197 ) ) ;
NR2D0BWP30P140HVT ctmi_17038 ( .A1 ( ctmn_13486 ) , .A2 ( N11353 ) , 
    .ZN ( ctmn_15196 ) ) ;
XOR4D0BWP30P140HVT ctmi_17039 ( .A1 ( ctmn_13522 ) , .A2 ( N159 ) , 
    .A3 ( ctmn_15198 ) , .A4 ( ctmn_13547 ) , 
    .Z ( \u_mac_and_scale/mult_3/mult01 [6] ) ) ;
AOI21D0BWP30P140HVT ctmi_17040 ( .A1 ( ctmn_13533 ) , .A2 ( ctmn_13543 ) , 
    .B ( ctmn_13544 ) , .ZN ( ctmn_15198 ) ) ;
XOR2UD0BWP30P140HVT ctmi_17041 ( .A1 ( ctmn_15200 ) , .A2 ( ctmn_13542 ) , 
    .Z ( \u_mac_and_scale/mult_3/mult01 [5] ) ) ;
OAI21D0BWP30P140HVT ctmi_17042 ( .A1 ( ctmn_13541 ) , .A2 ( ctmn_13535 ) , 
    .B ( ctmn_15199 ) , .ZN ( ctmn_15200 ) ) ;
ND2D0BWP30P140HVT ctmi_17043 ( .A1 ( ctmn_13535 ) , .A2 ( ctmn_13541 ) , 
    .ZN ( ctmn_15199 ) ) ;
MUX2ND0BWP30P140HVT ctmi_17044 ( .I0 ( ctmn_13536 ) , .I1 ( phfnn_3798 ) , 
    .S ( ctmn_15202 ) , .ZN ( \u_mac_and_scale/mult_3/mult01 [4] ) ) ;
AOI21D0BWP30P140HVT ctmi_17045 ( .A1 ( ctmn_13540 ) , .A2 ( N11382 ) , 
    .B ( ctmn_15201 ) , .ZN ( ctmn_15202 ) ) ;
NR2D0BWP30P140HVT ctmi_17046 ( .A1 ( ctmn_13540 ) , .A2 ( N11382 ) , 
    .ZN ( ctmn_15201 ) ) ;
XOR4D0BWP30P140HVT ctmi_17047 ( .A1 ( ctmn_13575 ) , .A2 ( N160 ) , 
    .A3 ( ctmn_13601 ) , .A4 ( ctmn_15203 ) , 
    .Z ( \u_mac_and_scale/mult_1/mult01 [6] ) ) ;
AOI21D0BWP30P140HVT ctmi_17048 ( .A1 ( ctmn_13586 ) , .A2 ( ctmn_13597 ) , 
    .B ( ctmn_13598 ) , .ZN ( ctmn_15203 ) ) ;
XOR2UD0BWP30P140HVT ctmi_17049 ( .A1 ( ctmn_15205 ) , .A2 ( ctmn_13596 ) , 
    .Z ( \u_mac_and_scale/mult_1/mult01 [5] ) ) ;
OAI21D0BWP30P140HVT ctmi_17050 ( .A1 ( ctmn_13595 ) , .A2 ( ctmn_13589 ) , 
    .B ( ctmn_15204 ) , .ZN ( ctmn_15205 ) ) ;
ND2D0BWP30P140HVT ctmi_17051 ( .A1 ( ctmn_13589 ) , .A2 ( ctmn_13595 ) , 
    .ZN ( ctmn_15204 ) ) ;
MUX2ND0BWP30P140HVT ctmi_17052 ( .I0 ( ctmn_13590 ) , .I1 ( phfnn_3799 ) , 
    .S ( ctmn_15207 ) , .ZN ( \u_mac_and_scale/mult_1/mult01 [4] ) ) ;
AOI21D0BWP30P140HVT ctmi_17053 ( .A1 ( ctmn_13594 ) , .A2 ( N11411 ) , 
    .B ( ctmn_15206 ) , .ZN ( ctmn_15207 ) ) ;
NR2D0BWP30P140HVT ctmi_17054 ( .A1 ( ctmn_13594 ) , .A2 ( N11411 ) , 
    .ZN ( ctmn_15206 ) ) ;
XOR4D0BWP30P140HVT ctmi_17055 ( .A1 ( ctmn_13631 ) , .A2 ( N161 ) , 
    .A3 ( ctmn_13657 ) , .A4 ( ctmn_15208 ) , 
    .Z ( \u_mac_and_scale/mult_0/mult01 [6] ) ) ;
AOI21D0BWP30P140HVT ctmi_17056 ( .A1 ( ctmn_13642 ) , .A2 ( ctmn_13653 ) , 
    .B ( ctmn_13654 ) , .ZN ( ctmn_15208 ) ) ;
XOR2UD0BWP30P140HVT ctmi_17057 ( .A1 ( ctmn_15210 ) , .A2 ( ctmn_13652 ) , 
    .Z ( \u_mac_and_scale/mult_0/mult01 [5] ) ) ;
OAI21D0BWP30P140HVT ctmi_17058 ( .A1 ( ctmn_13651 ) , .A2 ( ctmn_13645 ) , 
    .B ( ctmn_15209 ) , .ZN ( ctmn_15210 ) ) ;
ND2D0BWP30P140HVT ctmi_17059 ( .A1 ( ctmn_13645 ) , .A2 ( ctmn_13651 ) , 
    .ZN ( ctmn_15209 ) ) ;
MUX2ND0BWP30P140HVT ctmi_17060 ( .I0 ( ctmn_13646 ) , .I1 ( phfnn_3800 ) , 
    .S ( ctmn_15212 ) , .ZN ( \u_mac_and_scale/mult_0/mult01 [4] ) ) ;
AOI21D0BWP30P140HVT ctmi_17061 ( .A1 ( ctmn_13650 ) , .A2 ( N11440 ) , 
    .B ( ctmn_15211 ) , .ZN ( ctmn_15212 ) ) ;
NR2D0BWP30P140HVT ctmi_17062 ( .A1 ( ctmn_13650 ) , .A2 ( N11440 ) , 
    .ZN ( ctmn_15211 ) ) ;
XNR2UD0BWP30P140HVT ctmi_17063 ( .A1 ( N9818 ) , .A2 ( ctmn_15213 ) , 
    .ZN ( \u_mac_and_scale/mult_0/mult10 [6] ) ) ;
AOI21D0BWP30P140HVT ctmi_17064 ( .A1 ( phfnn_3807 ) , .A2 ( ctmn_13719 ) , 
    .B ( ctmn_13720 ) , .ZN ( ctmn_15213 ) ) ;
MUX2ND0BWP30P140HVT ctmi_17065 ( .I0 ( ctmn_13709 ) , .I1 ( phfnn_3783 ) , 
    .S ( ctmn_15215 ) , .ZN ( \u_mac_and_scale/mult_0/mult10 [4] ) ) ;
AOI21D0BWP30P140HVT ctmi_17066 ( .A1 ( ctmn_13716 ) , .A2 ( N11464 ) , 
    .B ( ctmn_15214 ) , .ZN ( ctmn_15215 ) ) ;
NR2D0BWP30P140HVT ctmi_17067 ( .A1 ( ctmn_13716 ) , .A2 ( N11464 ) , 
    .ZN ( ctmn_15214 ) ) ;
XNR2UD0BWP30P140HVT ctmi_17068 ( .A1 ( N10028 ) , .A2 ( ctmn_15216 ) , 
    .ZN ( \u_mac_and_scale/mult_1/mult10 [6] ) ) ;
AOI21D0BWP30P140HVT ctmi_17069 ( .A1 ( phfnn_3808 ) , .A2 ( ctmn_13822 ) , 
    .B ( ctmn_13823 ) , .ZN ( ctmn_15216 ) ) ;
MUX2ND0BWP30P140HVT ctmi_17070 ( .I0 ( ctmn_13812 ) , .I1 ( phfnn_3778 ) , 
    .S ( ctmn_15218 ) , .ZN ( \u_mac_and_scale/mult_1/mult10 [4] ) ) ;
AOI21D0BWP30P140HVT ctmi_17071 ( .A1 ( ctmn_13819 ) , .A2 ( N11599 ) , 
    .B ( ctmn_15217 ) , .ZN ( ctmn_15218 ) ) ;
NR2D0BWP30P140HVT ctmi_17072 ( .A1 ( ctmn_13819 ) , .A2 ( N11599 ) , 
    .ZN ( ctmn_15217 ) ) ;
AOI221D0BWP30P140HVT ctmTdsLR_1_3560 ( .A1 ( N57 ) , .A2 ( HFSNET_20 ) , 
    .B1 ( \RS_OP_250_54632_65499_J1/N99 ) , .B2 ( phfnn_648 ) , 
    .C ( \RS_OP_250_54632_65499_J1/ctmn_152 ) , .ZN ( ctmn_14087 ) ) ;
OAI21D0BWP30P140HVT ctmTdsLR_1_3527 ( .A1 ( \u_mac_and_scale/addend_lo [0] ) , 
    .A2 ( \u_mac_and_scale/gated_lo_feedback [0] ) , .B ( phfnn_645 ) , 
    .ZN ( tmp_net2641 ) ) ;
NR2D0BWP30P140HVT ctmTdsLR_2_3528 ( .A1 ( \u_mac_and_scale/add_188/N_67 ) , 
    .A2 ( tmp_net2641 ) , .ZN ( \u_mac_and_scale/N77 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5135 ( .I ( ctmn_14334 ) , .ZN ( phfnn_3665 ) ) ;
AO21D0BWP30P140HVT ctmTdsLR_1_3529 ( .A1 ( N208 ) , .A2 ( HFSNET_22 ) , 
    .B ( \RS_OP_250_54632_65499_J1/ctmn_154 ) , .Z ( N275 ) ) ;
MAOI222D0BWP30P140HVT ctmi_17078 ( .A ( ctmn_14198 ) , .B ( ctmn_14228 ) , 
    .C ( ctmn_14230 ) , .ZN ( ctmn_15223 ) ) ;
AOI211D0BWP30P140HVT ctmi_17079 ( .A1 ( ctmn_14225 ) , .A2 ( ctmn_14227 ) , 
    .B ( ctmn_15224 ) , .C ( ctmn_15225 ) , .ZN ( ctmn_15226 ) ) ;
NR3D0BWP30P140HVT ctmi_17080 ( .A1 ( phfnn_3741 ) , .A2 ( ctmn_13793 ) , 
    .A3 ( ctmn_14197 ) , .ZN ( ctmn_15224 ) ) ;
NR3D0BWP30P140HVT ctmi_17081 ( .A1 ( ctmn_13565 ) , .A2 ( phfnn_3754 ) , 
    .A3 ( ctmn_14193 ) , .ZN ( ctmn_15225 ) ) ;
XNR2UD0BWP30P140HVT ctmTdsLR_1_4525 ( .A1 ( N930 ) , .A2 ( ctmn_13692 ) , 
    .ZN ( N9753 ) ) ;
AOI21D0BWP30P140HVT ctmi_17083 ( .A1 ( ctmn_14222 ) , .A2 ( N11651 ) , 
    .B ( ctmn_15227 ) , .ZN ( ctmn_15228 ) ) ;
NR2D0BWP30P140HVT ctmi_17084 ( .A1 ( ctmn_14222 ) , .A2 ( N11651 ) , 
    .ZN ( ctmn_15227 ) ) ;
XNR2UD0BWP30P140HVT ctmi_17085 ( .A1 ( N10234 ) , .A2 ( ctmn_15229 ) , 
    .ZN ( \u_mac_and_scale/mult_2/mult10 [6] ) ) ;
AOI21D0BWP30P140HVT ctmi_17086 ( .A1 ( phfnn_3809 ) , .A2 ( ctmn_13880 ) , 
    .B ( ctmn_13881 ) , .ZN ( ctmn_15229 ) ) ;
MUX2ND0BWP30P140HVT ctmi_17087 ( .I0 ( ctmn_13870 ) , .I1 ( phfnn_3779 ) , 
    .S ( ctmn_15231 ) , .ZN ( \u_mac_and_scale/mult_2/mult10 [4] ) ) ;
AOI21D0BWP30P140HVT ctmi_17088 ( .A1 ( ctmn_13877 ) , .A2 ( N11732 ) , 
    .B ( ctmn_15230 ) , .ZN ( ctmn_15231 ) ) ;
NR2D0BWP30P140HVT ctmi_17089 ( .A1 ( ctmn_13877 ) , .A2 ( N11732 ) , 
    .ZN ( ctmn_15230 ) ) ;
CKND0BWP30P140HVT HFSINV_547_5405 ( .I ( HFSNET_8 ) , .ZN ( HFSNET_6 ) ) ;
AO21D0BWP30P140HVT ctmTdsLR_1_3530 ( .A1 ( N224 ) , .A2 ( phfnn_648 ) , 
    .B ( \RS_OP_250_54632_65499_J1/ctmn_155 ) , .Z ( N276 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5136 ( .I ( ctmn_14336 ) , .ZN ( phfnn_3666 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5137 ( .I ( ctmn_14350 ) , .ZN ( phfnn_3667 ) ) ;
MAOI222D0BWP30P140HVT ctmTdsLR_2_3532 ( .A ( ctmn_14191 ) , 
    .B ( ctmn_14190 ) , .C ( tmp_net2642 ) , .ZN ( ctmn_15267 ) ) ;
MAOI222D0BWP30P140HVT ctmi_17095 ( .A ( ctmn_14238 ) , .B ( ctmn_14268 ) , 
    .C ( ctmn_14270 ) , .ZN ( ctmn_15236 ) ) ;
SDFCNQD0BWP30P140HVT \u_mac_and_scale/holding_reg_reg[1] ( 
    .D ( accumulator[9] ) , .SI ( optlc_net_4003 ) , .SE ( optlc_net_4003 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/holding_reg_reg ) , 
    .CDN ( HFSNET_33 ) , .Q ( \u_mac_and_scale/holding_reg [1] ) ) ;
SDFCNQD0BWP30P140HVT \u_mac_and_scale/holding_reg_reg[0] ( 
    .D ( accumulator[8] ) , .SI ( optlc_net_4010 ) , .SE ( optlc_net_4010 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/holding_reg_reg ) , 
    .CDN ( sync_rst ) , .Q ( \u_mac_and_scale/holding_reg [0] ) ) ;
SDFCNQD0BWP30P140HVT \u_mac_and_scale/accumulator_reg[62] ( 
    .D ( \u_mac_and_scale/N15 ) , .SI ( optlc_net_4016 ) , 
    .SE ( optlc_net_4016 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_31 ) , .Q ( accumulator[62] ) ) ;
SDFCNQD0BWP30P140HVT \u_mac_and_scale/accumulator_reg[61] ( 
    .D ( \u_mac_and_scale/N16 ) , .SI ( optlc_net_4014 ) , 
    .SE ( optlc_net_4014 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_30 ) , .Q ( accumulator[61] ) ) ;
AOI211D0BWP30P140HVT ctmi_17096 ( .A1 ( ctmn_14265 ) , .A2 ( ctmn_14267 ) , 
    .B ( ctmn_15237 ) , .C ( ctmn_15238 ) , .ZN ( ctmn_15239 ) ) ;
NR3D0BWP30P140HVT ctmi_17097 ( .A1 ( phfnn_3742 ) , .A2 ( ctmn_13849 ) , 
    .A3 ( ctmn_14237 ) , .ZN ( ctmn_15237 ) ) ;
NR3D0BWP30P140HVT ctmi_17098 ( .A1 ( ctmn_13457 ) , .A2 ( phfnn_3756 ) , 
    .A3 ( ctmn_14233 ) , .ZN ( ctmn_15238 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5138 ( .I ( ctmn_14358 ) , .ZN ( phfnn_3668 ) ) ;
AOI21D0BWP30P140HVT ctmi_17100 ( .A1 ( ctmn_14262 ) , .A2 ( N11784 ) , 
    .B ( ctmn_15240 ) , .ZN ( ctmn_15241 ) ) ;
NR2D0BWP30P140HVT ctmi_17101 ( .A1 ( ctmn_14262 ) , .A2 ( N11784 ) , 
    .ZN ( ctmn_15240 ) ) ;
XNR2UD0BWP30P140HVT ctmTdsLR_1_4526 ( .A1 ( ctmn_13853 ) , 
    .A2 ( ctmn_13856 ) , .ZN ( N10180 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5139 ( .I ( ctmn_14365 ) , .ZN ( phfnn_3669 ) ) ;
AOI21D0BWP30P140HVT ctmTdsLR_1_4527 ( .A1 ( phfnn_648 ) , .A2 ( N221 ) , 
    .B ( \RS_OP_250_54632_65499_J1/ctmn_155 ) , .ZN ( N314 ) ) ;
XNR2UD0BWP30P140HVT ctmTdsLR_2_3845 ( .A1 ( tmp_net2747 ) , 
    .A2 ( ctmn_14230 ) , .ZN ( tmp_net2635 ) ) ;
ND3D0BWP30P140HVT ctmTdsLR_1_3535 ( .A1 ( \u_mac_and_scale/N7 ) , 
    .A2 ( ctmn_13952 ) , .A3 ( N263 ) , .ZN ( tmp_net2644 ) ) ;
AOI211D0BWP30P140HVT ctmi_17107 ( .A1 ( phfnn_3761 ) , .A2 ( phfnn_3114 ) , 
    .B ( ctmn_14126 ) , .C ( ctmn_15247 ) , .ZN ( ctmn_15248 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5140 ( .I ( ctmn_14376 ) , .ZN ( phfnn_3670 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5141 ( .I ( ctmn_14443 ) , .ZN ( phfnn_3671 ) ) ;
XNR3UD0BWP30P140HVT ctmi_17110 ( .A1 ( ctmn_14141 ) , .A2 ( ctmn_14147 ) , 
    .A3 ( ctmn_14140 ) , .ZN ( \u_mac_and_scale/mult_4_2_bottom[5] ) ) ;
ND3D0BWP30P140HVT ctmTdsLR_1_3561 ( .A1 ( N256 ) , 
    .A2 ( \u_mac_and_scale/N7 ) , .A3 ( ctmn_13952 ) , .ZN ( tmp_net2649 ) ) ;
AOI21D0BWP30P140HVT ctmi_17112 ( .A1 ( ctmn_14139 ) , .A2 ( N11835 ) , 
    .B ( ctmn_15249 ) , .ZN ( ctmn_15250 ) ) ;
NR2D0BWP30P140HVT ctmi_17113 ( .A1 ( ctmn_14139 ) , .A2 ( N11835 ) , 
    .ZN ( ctmn_15249 ) ) ;
XNR2UD0BWP30P140HVT ctmi_17114 ( .A1 ( N10440 ) , .A2 ( ctmn_15251 ) , 
    .ZN ( \u_mac_and_scale/mult_3/mult10 [6] ) ) ;
AOI21D0BWP30P140HVT ctmi_17115 ( .A1 ( phfnn_3801 ) , .A2 ( ctmn_13936 ) , 
    .B ( ctmn_13937 ) , .ZN ( ctmn_15251 ) ) ;
MUX2ND0BWP30P140HVT ctmi_17116 ( .I0 ( ctmn_13926 ) , .I1 ( phfnn_3781 ) , 
    .S ( ctmn_15253 ) , .ZN ( \u_mac_and_scale/mult_3/mult10 [4] ) ) ;
AOI21D0BWP30P140HVT ctmi_17117 ( .A1 ( ctmn_13933 ) , .A2 ( N11862 ) , 
    .B ( ctmn_15252 ) , .ZN ( ctmn_15253 ) ) ;
NR2D0BWP30P140HVT ctmi_17118 ( .A1 ( ctmn_13933 ) , .A2 ( N11862 ) , 
    .ZN ( ctmn_15252 ) ) ;
CKND0BWP30P140HVT HFSINV_397_5407 ( .I ( ctmn_13309 ) , .ZN ( HFSNET_9 ) ) ;
OAI21D0BWP30P140HVT ctmTdsLR_2_3536 ( .A1 ( phfnn_1320 ) , .A2 ( HFSNET_21 ) , 
    .B ( tmp_net2644 ) , .ZN ( \RS_OP_250_54632_65499_J1/N15 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5134 ( .I ( ctmn_14979 ) , .ZN ( phfnn_3664 ) ) ;
AOI221D0BWP30P140HVT ctmTdsLR_1_3587 ( .A1 ( phfnn_2590 ) , 
    .A2 ( ctmn_15092 ) , .B1 ( phfnn_3887 ) , .B2 ( ctmn_14827 ) , 
    .C ( ctmn_15096 ) , .ZN ( ctmn_15097_CDR1 ) ) ;
CKND0BWP30P140HVT HFSINV_402_5403 ( .I ( phfnn_639 ) , .ZN ( HFSNET_4 ) ) ;
MAOI222D0BWP30P140HVT ctmi_17124 ( .A ( ctmn_14278 ) , .B ( ctmn_14308 ) , 
    .C ( ctmn_14310 ) , .ZN ( ctmn_15258 ) ) ;
AOI211D0BWP30P140HVT ctmi_17125 ( .A1 ( ctmn_14305 ) , .A2 ( ctmn_14307 ) , 
    .B ( ctmn_15259 ) , .C ( ctmn_15260 ) , .ZN ( ctmn_15261 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[50] ( 
    .D ( \u_mac_and_scale/N27 ) , .SI ( optlc_net_4020 ) , 
    .SE ( optlc_net_4020 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_30 ) , .Q ( accumulator[50] ) , .QN ( ctmn_13369 ) ) ;
SDFCNQD0BWP30P140HVT \u_mac_and_scale/accumulator_reg[59] ( 
    .D ( \u_mac_and_scale/N18 ) , .SI ( optlc_net_4014 ) , 
    .SE ( optlc_net_4014 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_30 ) , .Q ( accumulator[59] ) ) ;
SDFCNQD0BWP30P140HVT \u_mac_and_scale/accumulator_reg[58] ( 
    .D ( \u_mac_and_scale/N19 ) , .SI ( optlc_net_4014 ) , 
    .SE ( optlc_net_4014 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_30 ) , .Q ( accumulator[58] ) ) ;
SDFCNQD0BWP30P140HVT \u_mac_and_scale/accumulator_reg[57] ( 
    .D ( \u_mac_and_scale/N20 ) , .SI ( optlc_net_4014 ) , 
    .SE ( optlc_net_4014 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_30 ) , .Q ( accumulator[57] ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[49] ( 
    .D ( \u_mac_and_scale/N28 ) , .SI ( optlc_net_4020 ) , 
    .SE ( optlc_net_4020 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_30 ) , .Q ( accumulator[49] ) , .QN ( ctmn_13370 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[48] ( 
    .D ( \u_mac_and_scale/N29 ) , .SI ( optlc_net_4020 ) , 
    .SE ( optlc_net_4020 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_30 ) , .Q ( accumulator[48] ) , .QN ( ctmn_13371 ) ) ;
NR3D0BWP30P140HVT ctmi_17126 ( .A1 ( phfnn_3743 ) , .A2 ( ctmn_13906 ) , 
    .A3 ( ctmn_14277 ) , .ZN ( ctmn_15259 ) ) ;
NR3D0BWP30P140HVT ctmi_17127 ( .A1 ( ctmn_13511 ) , .A2 ( phfnn_3758 ) , 
    .A3 ( ctmn_14273 ) , .ZN ( ctmn_15260 ) ) ;
AOI221D0BWP30P140HVT ctmTdsLR_1_3588 ( .A1 ( N59 ) , .A2 ( HFSNET_20 ) , 
    .B1 ( \RS_OP_250_54632_65499_J1/N101 ) , .B2 ( phfnn_648 ) , 
    .C ( \RS_OP_250_54632_65499_J1/ctmn_152 ) , .ZN ( ctmn_14091 ) ) ;
AOI21D0BWP30P140HVT ctmi_17129 ( .A1 ( ctmn_14302 ) , .A2 ( N11914 ) , 
    .B ( ctmn_15262 ) , .ZN ( ctmn_15263 ) ) ;
NR2D0BWP30P140HVT ctmi_17130 ( .A1 ( ctmn_14302 ) , .A2 ( N11914 ) , 
    .ZN ( ctmn_15262 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5143 ( .I ( ctmn_14399 ) , .ZN ( phfnn_3673 ) ) ;
AO21D0BWP30P140HVT ctmTdsLR_1_3541 ( .A1 ( N225 ) , .A2 ( phfnn_648 ) , 
    .B ( \RS_OP_250_54632_65499_J1/ctmn_155 ) , .Z ( N273 ) ) ;
AOI211D0BWP30P140HVT ctmi_17136 ( .A1 ( phfnn_3762 ) , .A2 ( phfnn_3115 ) , 
    .B ( ctmn_14168 ) , .C ( ctmn_15269 ) , .ZN ( ctmn_15270 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5321 ( .I ( ctmn_14773 ) , .ZN ( phfnn_3851 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5144 ( .I ( ctmn_14536 ) , .ZN ( phfnn_3674 ) ) ;
XNR3UD0BWP30P140HVT ctmi_17139 ( .A1 ( ctmn_14183 ) , .A2 ( ctmn_14189 ) , 
    .A3 ( ctmn_14182 ) , .ZN ( \u_mac_and_scale/mult_4_3_bottom [5] ) ) ;
CKND0BWP30P140HVT phfnr_buf_5145 ( .I ( ctmn_14345 ) , .ZN ( phfnn_3675 ) ) ;
AOI21D0BWP30P140HVT ctmi_17141 ( .A1 ( ctmn_14181 ) , .A2 ( N11965 ) , 
    .B ( ctmn_15271 ) , .ZN ( ctmn_15272 ) ) ;
NR2D0BWP30P140HVT ctmi_17142 ( .A1 ( ctmn_14181 ) , .A2 ( N11965 ) , 
    .ZN ( ctmn_15271 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[47] ( 
    .D ( \u_mac_and_scale/N30 ) , .SI ( optlc_net_4016 ) , 
    .SE ( optlc_net_4016 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_31 ) , .QN ( ctmn_13372 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[46] ( 
    .D ( \u_mac_and_scale/N31 ) , .SI ( optlc_net_4005 ) , 
    .SE ( optlc_net_4005 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_30 ) , .Q ( accumulator[46] ) , .QN ( ctmn_13373 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[45] ( 
    .D ( \u_mac_and_scale/N32 ) , .SI ( optlc_net_4014 ) , 
    .SE ( optlc_net_4014 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_30 ) , .Q ( accumulator[45] ) , .QN ( ctmn_13374 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[44] ( 
    .D ( \u_mac_and_scale/N33 ) , .SI ( optlc_net_4015 ) , 
    .SE ( optlc_net_4015 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_31 ) , .QN ( ctmn_13375 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[43] ( 
    .D ( \u_mac_and_scale/N34 ) , .SI ( optlc_net_4020 ) , 
    .SE ( optlc_net_4020 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_30 ) , .Q ( accumulator[43] ) , .QN ( ctmn_13376 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[42] ( 
    .D ( \u_mac_and_scale/N35 ) , .SI ( optlc_net_4015 ) , 
    .SE ( optlc_net_4015 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_31 ) , .QN ( ctmn_13377 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[41] ( 
    .D ( \u_mac_and_scale/N36 ) , .SI ( optlc_net_4015 ) , 
    .SE ( optlc_net_4015 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_31 ) , .QN ( ctmn_13378 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[40] ( 
    .D ( \u_mac_and_scale/N37 ) , .SI ( optlc_net_4015 ) , 
    .SE ( optlc_net_4015 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_31 ) , .QN ( ctmn_13379 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[39] ( 
    .D ( \u_mac_and_scale/N38 ) , .SI ( optlc_net_4021 ) , 
    .SE ( optlc_net_4021 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_32 ) , .Q ( accumulator[39] ) , .QN ( ctmn_13380 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[38] ( 
    .D ( \u_mac_and_scale/N39 ) , .SI ( optlc_net_4021 ) , 
    .SE ( optlc_net_4021 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_32 ) , .Q ( accumulator[38] ) , .QN ( ctmn_13381 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[37] ( 
    .D ( \u_mac_and_scale/N40 ) , .SI ( optlc_net_4021 ) , 
    .SE ( optlc_net_4021 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_32 ) , .Q ( accumulator[37] ) , .QN ( ctmn_13382 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[36] ( 
    .D ( \u_mac_and_scale/N41 ) , .SI ( optlc_net_4021 ) , 
    .SE ( optlc_net_4021 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_32 ) , .Q ( accumulator[36] ) , .QN ( ctmn_13383 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[35] ( 
    .D ( \u_mac_and_scale/N42 ) , .SI ( optlc_net_4021 ) , 
    .SE ( optlc_net_4021 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_32 ) , .Q ( accumulator[35] ) , .QN ( ctmn_13384 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[34] ( 
    .D ( \u_mac_and_scale/N43 ) , .SI ( optlc_net_4021 ) , 
    .SE ( optlc_net_4021 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_32 ) , .Q ( accumulator[34] ) , .QN ( ctmn_13385 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[33] ( 
    .D ( \u_mac_and_scale/N44 ) , .SI ( optlc_net_4021 ) , 
    .SE ( optlc_net_4021 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_32 ) , .Q ( accumulator[33] ) , .QN ( ctmn_13386 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[32] ( 
    .D ( \u_mac_and_scale/N45 ) , .SI ( optlc_net_4017 ) , 
    .SE ( optlc_net_4017 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_32 ) , .Q ( accumulator[32] ) , .QN ( ctmn_13387 ) ) ;
SDFCND0BWP30P140HVT \u_ppu/u_requantizer/shamt_reg[5] ( 
    .D ( operand_A_reg[5] ) , .SI ( optlc_net_4005 ) , 
    .SE ( optlc_net_4005 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/holding_reg_reg ) , 
    .CDN ( HFSNET_30 ) , .Q ( \u_ppu/u_requantizer/shamt [5] ) , 
    .QN ( ctmn_14415 ) ) ;
SDFCND0BWP30P140HVT \u_ppu/u_requantizer/shamt_reg[4] ( 
    .D ( operand_A_reg[4] ) , .SI ( optlc_net_4005 ) , 
    .SE ( optlc_net_4005 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/holding_reg_reg ) , 
    .CDN ( HFSNET_30 ) , .Q ( \u_ppu/u_requantizer/shamt [4] ) , 
    .QN ( ctmn_14335 ) ) ;
SDFCND0BWP30P140HVT \u_ppu/u_requantizer/shamt_reg[3] ( 
    .D ( operand_A_reg[3] ) , .SI ( optlc_net_4005 ) , 
    .SE ( optlc_net_4005 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/holding_reg_reg ) , 
    .CDN ( HFSNET_30 ) , .Q ( \u_ppu/u_requantizer/shamt [3] ) , 
    .QN ( ctmn_14331 ) ) ;
SDFCND0BWP30P140HVT \u_ppu/u_requantizer/shamt_reg[2] ( 
    .D ( operand_A_reg[2] ) , .SI ( optlc_net_4011 ) , 
    .SE ( optlc_net_4011 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/holding_reg_reg ) , 
    .CDN ( sync_rst ) , .Q ( \u_ppu/u_requantizer/shamt [2] ) , 
    .QN ( ctmn_14407 ) ) ;
SDFCND0BWP30P140HVT \u_ppu/u_requantizer/shamt_reg[1] ( 
    .D ( operand_A_reg[1] ) , .SI ( optlc_net_4009 ) , 
    .SE ( optlc_net_4009 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/holding_reg_reg ) , 
    .CDN ( HFSNET_30 ) , .Q ( \u_ppu/u_requantizer/shamt [1] ) , 
    .QN ( ctmn_14329 ) ) ;
SDFCND0BWP30P140HVT \u_ppu/u_requantizer/shamt_reg[0] ( 
    .D ( operand_A_reg[0] ) , .SI ( optlc_net_4009 ) , 
    .SE ( optlc_net_4009 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/holding_reg_reg ) , 
    .CDN ( HFSNET_30 ) , .Q ( \u_ppu/u_requantizer/shamt [0] ) , 
    .QN ( ctmn_14330 ) ) ;
SDFCND0BWP30P140HVT \u_io_block/operand_A_reg_r_reg[1] ( .D ( operand_A[1] ) , 
    .SI ( optlc_net_4009 ) , .SE ( optlc_net_4009 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_A_reg_r_reg ) , 
    .CDN ( HFSNET_30 ) , .Q ( operand_A_reg[1] ) , .QN ( ctmn_14315 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[30] ( 
    .D ( \u_mac_and_scale/N47 ) , .SI ( optlc_net_4019 ) , 
    .SE ( optlc_net_4019 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_32 ) , .Q ( accumulator[30] ) , .QN ( ctmn_13333 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[29] ( 
    .D ( \u_mac_and_scale/N48 ) , .SI ( optlc_net_4018 ) , 
    .SE ( optlc_net_4018 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_32 ) , .Q ( accumulator[29] ) , .QN ( ctmn_13334 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[28] ( 
    .D ( \u_mac_and_scale/N49 ) , .SI ( optlc_net_4017 ) , 
    .SE ( optlc_net_4017 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_32 ) , .Q ( accumulator[28] ) , .QN ( ctmn_13335 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[27] ( 
    .D ( \u_mac_and_scale/N50 ) , .SI ( optlc_net_4018 ) , 
    .SE ( optlc_net_4018 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_32 ) , .Q ( accumulator[27] ) , .QN ( ctmn_13336 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[26] ( 
    .D ( \u_mac_and_scale/N51 ) , .SI ( optlc_net_4017 ) , 
    .SE ( optlc_net_4017 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_32 ) , .Q ( accumulator[26] ) , .QN ( ctmn_13337 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[25] ( 
    .D ( \u_mac_and_scale/N52 ) , .SI ( optlc_net_4018 ) , 
    .SE ( optlc_net_4018 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_32 ) , .Q ( accumulator[25] ) , .QN ( ctmn_13338 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[24] ( 
    .D ( \u_mac_and_scale/N53 ) , .SI ( optlc_net_4019 ) , 
    .SE ( optlc_net_4019 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_32 ) , .Q ( accumulator[24] ) , .QN ( ctmn_13339 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[23] ( 
    .D ( \u_mac_and_scale/N54 ) , .SI ( optlc_net_4019 ) , 
    .SE ( optlc_net_4019 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_32 ) , .Q ( accumulator[23] ) , .QN ( ctmn_13340 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[22] ( 
    .D ( \u_mac_and_scale/N55 ) , .SI ( optlc_net_4002 ) , 
    .SE ( optlc_net_4002 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_33 ) , .Q ( accumulator[22] ) , .QN ( ctmn_13341 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[21] ( 
    .D ( \u_mac_and_scale/N56 ) , .SI ( optlc_net_4018 ) , 
    .SE ( optlc_net_4018 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_32 ) , .Q ( accumulator[21] ) , .QN ( ctmn_13342 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[20] ( 
    .D ( \u_mac_and_scale/N57 ) , .SI ( optlc_net_4002 ) , 
    .SE ( optlc_net_4002 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( sync_rst ) , .Q ( accumulator[20] ) , .QN ( ctmn_13343 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[19] ( 
    .D ( \u_mac_and_scale/N58 ) , .SI ( optlc_net_4002 ) , 
    .SE ( optlc_net_4002 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_33 ) , .Q ( accumulator[19] ) , .QN ( ctmn_13344 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[18] ( 
    .D ( \u_mac_and_scale/N59 ) , .SI ( optlc_net_4001 ) , 
    .SE ( optlc_net_4001 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( sync_rst ) , .Q ( accumulator[18] ) , .QN ( ctmn_13345 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[17] ( 
    .D ( \u_mac_and_scale/N60 ) , .SI ( optlc_net_4003 ) , 
    .SE ( optlc_net_4003 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_33 ) , .Q ( accumulator[17] ) , .QN ( ctmn_13346 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[16] ( 
    .D ( \u_mac_and_scale/N61 ) , .SI ( optlc_net_4002 ) , 
    .SE ( optlc_net_4002 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( sync_rst ) , .Q ( accumulator[16] ) , .QN ( ctmn_13347 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[15] ( 
    .D ( \u_mac_and_scale/N62 ) , .SI ( optlc_net_4002 ) , 
    .SE ( optlc_net_4002 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_33 ) , .Q ( accumulator[15] ) , .QN ( ctmn_13348 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[14] ( 
    .D ( \u_mac_and_scale/N63 ) , .SI ( optlc_net_3996 ) , 
    .SE ( optlc_net_3996 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_33 ) , .Q ( accumulator[14] ) , .QN ( ctmn_13349 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[13] ( 
    .D ( \u_mac_and_scale/N64 ) , .SI ( optlc_net_4003 ) , 
    .SE ( optlc_net_4003 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_33 ) , .Q ( accumulator[13] ) , .QN ( ctmn_13350 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[12] ( 
    .D ( \u_mac_and_scale/N65 ) , .SI ( optlc_net_3996 ) , 
    .SE ( optlc_net_3996 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_33 ) , .Q ( accumulator[12] ) , .QN ( ctmn_13351 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[11] ( 
    .D ( \u_mac_and_scale/N66 ) , .SI ( optlc_net_3994 ) , 
    .SE ( optlc_net_3994 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_33 ) , .Q ( accumulator[11] ) , .QN ( ctmn_13352 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[10] ( 
    .D ( \u_mac_and_scale/N67 ) , .SI ( optlc_net_4001 ) , 
    .SE ( optlc_net_4001 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_33 ) , .Q ( accumulator[10] ) , .QN ( ctmn_13353 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[9] ( 
    .D ( \u_mac_and_scale/N68 ) , .SI ( optlc_net_4003 ) , 
    .SE ( optlc_net_4003 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_33 ) , .Q ( accumulator[9] ) , .QN ( ctmn_13354 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[8] ( 
    .D ( \u_mac_and_scale/N69 ) , .SI ( optlc_net_3996 ) , 
    .SE ( optlc_net_3996 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_33 ) , .Q ( accumulator[8] ) , .QN ( ctmn_13355 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[7] ( 
    .D ( \u_mac_and_scale/N70 ) , .SI ( optlc_net_3994 ) , 
    .SE ( optlc_net_3994 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_33 ) , .Q ( accumulator[7] ) , .QN ( ctmn_13356 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[6] ( 
    .D ( \u_mac_and_scale/N71 ) , .SI ( optlc_net_3996 ) , 
    .SE ( optlc_net_3996 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_33 ) , .Q ( accumulator[6] ) , .QN ( ctmn_13357 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[5] ( 
    .D ( \u_mac_and_scale/N72 ) , .SI ( optlc_net_3994 ) , 
    .SE ( optlc_net_3994 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_33 ) , .Q ( accumulator[5] ) , .QN ( ctmn_13358 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[4] ( 
    .D ( \u_mac_and_scale/N73 ) , .SI ( optlc_net_3996 ) , 
    .SE ( optlc_net_3996 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_33 ) , .Q ( accumulator[4] ) , .QN ( ctmn_13359 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[3] ( 
    .D ( \u_mac_and_scale/N74 ) , .SI ( optlc_net_3996 ) , 
    .SE ( optlc_net_3996 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_33 ) , .Q ( accumulator[3] ) , .QN ( ctmn_13360 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[2] ( 
    .D ( \u_mac_and_scale/N75 ) , .SI ( optlc_net_4001 ) , 
    .SE ( optlc_net_4001 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_33 ) , .Q ( accumulator[2] ) , .QN ( ctmn_13361 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[1] ( 
    .D ( \u_mac_and_scale/N76 ) , .SI ( optlc_net_3996 ) , 
    .SE ( optlc_net_3996 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_33 ) , .Q ( accumulator[1] ) , .QN ( ctmn_13362 ) ) ;
SDFCND0BWP30P140HVT \u_mac_and_scale/accumulator_reg[0] ( 
    .D ( \u_mac_and_scale/N77 ) , .SI ( optlc_net_4001 ) , 
    .SE ( optlc_net_4001 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_33 ) , .Q ( accumulator[0] ) , .QN ( ctmn_13363 ) ) ;
SDFCNQD0BWP30P140HVT \u_mac_and_scale/accumulator_reg[54] ( 
    .D ( \u_mac_and_scale/N23 ) , .SI ( optlc_net_4014 ) , 
    .SE ( optlc_net_4014 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_30 ) , .Q ( accumulator[54] ) ) ;
SDFCNQD0BWP30P140HVT \u_mac_and_scale/accumulator_reg[53] ( 
    .D ( \u_mac_and_scale/N24 ) , .SI ( optlc_net_4016 ) , 
    .SE ( optlc_net_4016 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_31 ) , .Q ( accumulator[53] ) ) ;
SDFCNQD0BWP30P140HVT \u_mac_and_scale/accumulator_reg[51] ( 
    .D ( \u_mac_and_scale/N26 ) , .SI ( optlc_net_4016 ) , 
    .SE ( optlc_net_4016 ) , 
    .CP ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) , 
    .CDN ( HFSNET_31 ) , .Q ( accumulator[51] ) ) ;
CKND0BWP30P140HVT phfnr_buf_5146 ( .I ( ctmn_14346 ) , .ZN ( phfnn_3676 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5334 ( .I ( ctmn_14740 ) , .ZN ( phfnn_3864 ) ) ;
DFCND1BWP30P140HVT \u_reset_sync/rst_sync_reg ( 
    .D ( \u_reset_sync/rst_meta ) , .CP ( clk ) , .CDN ( rst ) , 
    .Q ( sync_rst ) , .QN ( phfnn_634 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5345 ( .I ( ctmn_14720 ) , .ZN ( phfnn_3875 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5147 ( .I ( ctmn_14373 ) , .ZN ( phfnn_3677 ) ) ;
OAI22D0BWP30P140HVT ctmi_16798 ( .A1 ( ctmn_14725 ) , .A2 ( ctmn_14707 ) , 
    .B1 ( phfnn_867 ) , .B2 ( ctmn_14686 ) , .ZN ( ctmn_14991 ) ) ;
OAI222D0BWP30P140HVT ctmi_16854 ( .A1 ( ctmn_13327 ) , .A2 ( ctmn_14782 ) , 
    .B1 ( ctmn_15052 ) , .B2 ( phfnn_2357 ) , .C1 ( ctmn_14979 ) , 
    .C2 ( ctmn_15106 ) , .ZN ( \u_io_block/output_mux_result [2] ) ) ;
OAI211D0BWP30P140HVT ctmi_16799 ( .A1 ( act_fn_sel[1] ) , .A2 ( ctmn_14992 ) , 
    .B ( ctmn_14994 ) , .C ( phfnn_3859 ) , .ZN ( ctmn_14995 ) ) ;
AOI21D0BWP30P140HVT ctmi_16800 ( .A1 ( ctmn_14802 ) , .A2 ( phfnn_3836 ) , 
    .B ( act_fn_sel[0] ) , .ZN ( ctmn_14992 ) ) ;
AOI22D0BWP30P140HVT ctmi_16801 ( .A1 ( phfnn_1420 ) , .A2 ( ctmn_14993 ) , 
    .B1 ( ctmn_14751 ) , .B2 ( ctmn_14819 ) , .ZN ( ctmn_14994 ) ) ;
OAI221D0BWP30P140HVT ctmi_16802 ( .A1 ( phfnn_3831 ) , .A2 ( HFSNET_1 ) , 
    .B1 ( ctmn_14693 ) , .B2 ( ctmn_14719 ) , .C ( phfnn_3840 ) , 
    .ZN ( ctmn_14993 ) ) ;
OAI221D0BWP30P140HVT ctmi_16803 ( .A1 ( ctmn_13330 ) , .A2 ( ctmn_13327 ) , 
    .B1 ( phfnn_2357 ) , .B2 ( ctmn_15002 ) , .C ( ctmn_15048 ) , 
    .ZN ( \u_io_block/output_mux_result [3] ) ) ;
AOI221D0BWP30P140HVT ctmi_16804 ( .A1 ( ctmn_14314 ) , 
    .A2 ( accumulator[59] ) , .B1 ( ctmn_14316 ) , .B2 ( accumulator[27] ) , 
    .C ( ctmn_15001 ) , .ZN ( ctmn_15002 ) ) ;
OAI211D0BWP30P140HVT ctmi_16805 ( .A1 ( ctmn_14317 ) , .A2 ( ctmn_13376 ) , 
    .B ( ctmn_14999 ) , .C ( ctmn_15000 ) , .ZN ( ctmn_15001 ) ) ;
AOI22D0BWP30P140HVT ctmi_16806 ( .A1 ( ctmn_14318 ) , 
    .A2 ( accumulator[51] ) , .B1 ( ctmn_14319 ) , .B2 ( accumulator[35] ) , 
    .ZN ( ctmn_14999 ) ) ;
AOI222D0BWP30P140HVT ctmi_16807 ( .A1 ( ctmn_14321 ) , 
    .A2 ( accumulator[19] ) , .B1 ( ctmn_14322 ) , .B2 ( accumulator[11] ) , 
    .C1 ( ctmn_14323 ) , .C2 ( accumulator[3] ) , .ZN ( ctmn_15000 ) ) ;
AOI32D0BWP30P140HVT ctmi_16808 ( .A1 ( HFSNET_18 ) , .A2 ( phfnn_3664 ) , 
    .A3 ( ctmn_15004 ) , .B1 ( ctmn_15047 ) , .B2 ( ctmn_14980 ) , 
    .ZN ( ctmn_15048 ) ) ;
OAI21D0BWP30P140HVT ctmi_16809 ( .A1 ( ctmn_14748 ) , .A2 ( ctmn_15003 ) , 
    .B ( phfnn_3844 ) , .ZN ( ctmn_15004 ) ) ;
AOI21D0BWP30P140HVT ctmi_16810 ( .A1 ( act_fn_sel[2] ) , .A2 ( HFSNET_0 ) , 
    .B ( ctmn_14707 ) , .ZN ( ctmn_15003 ) ) ;
OAI31D0BWP30P140HVT ctmi_16811 ( .A1 ( ctmn_15013 ) , .A2 ( ctmn_15029 ) , 
    .A3 ( ctmn_14790 ) , .B ( ctmn_15046 ) , .ZN ( ctmn_15047 ) ) ;
NR4D0BWP30P140HVT ctmi_16812 ( .A1 ( ctmn_15005 ) , .A2 ( ctmn_15007 ) , 
    .A3 ( ctmn_15012 ) , .A4 ( ctmn_14848 ) , .ZN ( ctmn_15013 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5304 ( .I ( ctmn_14783 ) , .ZN ( phfnn_3834 ) ) ;
OAI22D0BWP30P140HVT ctmi_16814 ( .A1 ( ctmn_15006 ) , .A2 ( phfnn_3838 ) , 
    .B1 ( phfnn_3857 ) , .B2 ( ctmn_14924 ) , .ZN ( ctmn_15007 ) ) ;
AOI22D0BWP30P140HVT ctmi_16815 ( .A1 ( ctmn_14885 ) , .A2 ( phfnn_3882 ) , 
    .B1 ( phfnn_3865 ) , .B2 ( ctmn_14873 ) , .ZN ( ctmn_15006 ) ) ;
OAI211D0BWP30P140HVT ctmi_16816 ( .A1 ( ctmn_14808 ) , .A2 ( ctmn_14769 ) , 
    .B ( ctmn_15008 ) , .C ( ctmn_15011 ) , .ZN ( ctmn_15012 ) ) ;
AOI22D0BWP30P140HVT ctmi_16817 ( .A1 ( ctmn_14740 ) , .A2 ( ctmn_14812 ) , 
    .B1 ( ctmn_14806 ) , .B2 ( ctmn_14808 ) , .ZN ( ctmn_15008 ) ) ;
AOI211D0BWP30P140HVT ctmi_16818 ( .A1 ( phfnn_899 ) , .A2 ( phfnn_3243 ) , 
    .B ( ctmn_15009 ) , .C ( ctmn_15010 ) , .ZN ( ctmn_15011 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5303 ( .I ( ctmn_14761 ) , .ZN ( phfnn_3833 ) ) ;
OAI21D0BWP30P140HVT ctmi_16913 ( .A1 ( ctmn_15179 ) , .A2 ( phfnn_3691 ) , 
    .B ( ctmn_15192 ) , .ZN ( \u_io_block/output_mux_result [0] ) ) ;
NR2D0BWP30P140HVT ctmi_16820 ( .A1 ( phfnn_3867 ) , .A2 ( ctmn_14890 ) , 
    .ZN ( ctmn_15010 ) ) ;
AOI211D0BWP30P140HVT ctmi_16821 ( .A1 ( ctmn_15022 ) , .A2 ( phfnn_3840 ) , 
    .B ( ctmn_15023 ) , .C ( ctmn_15028 ) , .ZN ( ctmn_15029 ) ) ;
OAI211D0BWP30P140HVT ctmi_16822 ( .A1 ( HFSNET_0 ) , .A2 ( phfnn_3220 ) , 
    .B ( ctmn_15017 ) , .C ( ctmn_15021 ) , .ZN ( ctmn_15022 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5315 ( .I ( ctmn_14787 ) , .ZN ( phfnn_3845 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5352 ( .I ( ctmn_14795 ) , .ZN ( phfnn_3882 ) ) ;
AOI22D0BWP30P140HVT ctmi_16825 ( .A1 ( ctmn_14726 ) , .A2 ( ctmn_15016 ) , 
    .B1 ( phfnn_3887 ) , .B2 ( ctmn_14747 ) , .ZN ( ctmn_15017 ) ) ;
AOI211D0BWP30P140HVT ctmi_16826 ( .A1 ( phfnn_3853 ) , .A2 ( ctmn_14740 ) , 
    .B ( ctmn_14693 ) , .C ( ctmn_14725 ) , .ZN ( ctmn_15016 ) ) ;
AOI221D0BWP30P140HVT ctmi_16827 ( .A1 ( ctmn_14812 ) , .A2 ( ctmn_14720 ) , 
    .B1 ( phfnn_2014 ) , .B2 ( ctmn_14795 ) , .C ( ctmn_15020 ) , 
    .ZN ( ctmn_15021 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5148 ( .I ( ctmn_14427 ) , .ZN ( phfnn_3678 ) ) ;
NR2D0BWP30P140HVT ctmi_16829 ( .A1 ( phfnn_3853 ) , .A2 ( ctmn_14879 ) , 
    .ZN ( ctmn_15018 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5149 ( .I ( ctmn_14475 ) , .ZN ( phfnn_3679 ) ) ;
OAI31D0BWP30P140HVT ctmi_16831 ( .A1 ( ctmn_14808 ) , .A2 ( phfnn_3840 ) , 
    .A3 ( phfnn_3861 ) , .B ( act_fn_sel[1] ) , .ZN ( ctmn_15023 ) ) ;
OAI22D0BWP30P140HVT ctmi_16832 ( .A1 ( ctmn_15025 ) , .A2 ( ctmn_14896 ) , 
    .B1 ( HFSNET_0 ) , .B2 ( ctmn_15027 ) , .ZN ( ctmn_15028 ) ) ;
AOI221D0BWP30P140HVT ctmi_16833 ( .A1 ( phfnn_2546 ) , .A2 ( ctmn_14725 ) , 
    .B1 ( phfnn_3840 ) , .B2 ( ctmn_15024 ) , .C ( phfnn_899 ) , 
    .ZN ( ctmn_15025 ) ) ;
OAI22D0BWP30P140HVT ctmi_16834 ( .A1 ( ctmn_14697 ) , .A2 ( ctmn_14725 ) , 
    .B1 ( phfnn_3844 ) , .B2 ( phfnn_1416 ) , .ZN ( ctmn_15024 ) ) ;
OAI22D0BWP30P140HVT ctmi_16562 ( .A1 ( ctmn_14766 ) , .A2 ( phfnn_2357 ) , 
    .B1 ( HFSNET_18 ) , .B2 ( ctmn_14839 ) , 
    .ZN ( \u_io_block/output_mux_result [4] ) ) ;
AOI221D0BWP30P140HVT ctmi_16563 ( .A1 ( ctmn_14314 ) , 
    .A2 ( accumulator[60] ) , .B1 ( ctmn_14316 ) , .B2 ( accumulator[28] ) , 
    .C ( ctmn_14765 ) , .ZN ( ctmn_14766 ) ) ;
OAI211D0BWP30P140HVT ctmi_16564 ( .A1 ( ctmn_14317 ) , .A2 ( ctmn_13375 ) , 
    .B ( ctmn_14763 ) , .C ( ctmn_14764 ) , .ZN ( ctmn_14765 ) ) ;
AOI22D0BWP30P140HVT ctmi_16565 ( .A1 ( ctmn_14318 ) , 
    .A2 ( accumulator[52] ) , .B1 ( ctmn_14319 ) , .B2 ( accumulator[36] ) , 
    .ZN ( ctmn_14763 ) ) ;
AOI222D0BWP30P140HVT ctmi_16566 ( .A1 ( ctmn_14321 ) , 
    .A2 ( accumulator[20] ) , .B1 ( ctmn_14322 ) , .B2 ( accumulator[12] ) , 
    .C1 ( ctmn_14323 ) , .C2 ( accumulator[4] ) , .ZN ( ctmn_14764 ) ) ;
AOI211D0BWP30P140HVT ctmi_16567 ( .A1 ( ctmn_14732 ) , .A2 ( ctmn_14785 ) , 
    .B ( ctmn_14837 ) , .C ( ctmn_14838 ) , .ZN ( ctmn_14839 ) ) ;
AOI31D0BWP30P140HVT ctmi_16568 ( .A1 ( ctmn_14769 ) , .A2 ( ctmn_14779 ) , 
    .A3 ( ctmn_14781 ) , .B ( phfnn_3834 ) , .ZN ( ctmn_14785 ) ) ;
NR2D0BWP30P140HVT ctmi_16569 ( .A1 ( ctmn_14767 ) , .A2 ( ctmn_14768 ) , 
    .ZN ( ctmn_14769 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5150 ( .I ( ctmn_14499 ) , .ZN ( phfnn_3680 ) ) ;
OAI211D0BWP30P140HVT ctmi_16640 ( .A1 ( ctmn_14841 ) , .A2 ( ctmn_14842 ) , 
    .B ( ctmn_14964 ) , .C ( ctmn_14972 ) , 
    .ZN ( \u_io_block/output_mux_result [1] ) ) ;
NR2D0BWP30P140HVT ctmi_16571 ( .A1 ( phfnn_3844 ) , .A2 ( phfnn_3841 ) , 
    .ZN ( ctmn_14768 ) ) ;
AOI211D0BWP30P140HVT ctmi_16572 ( .A1 ( ctmn_14697 ) , .A2 ( ctmn_14772 ) , 
    .B ( ctmn_14776 ) , .C ( ctmn_14778 ) , .ZN ( ctmn_14779 ) ) ;
AOI211D0BWP30P140HVT ctmi_16914 ( .A1 ( act_fn_sel[1] ) , .A2 ( ctmn_15120 ) , 
    .B ( ctmn_15177 ) , .C ( ctmn_15178 ) , .ZN ( ctmn_15179 ) ) ;
FA1D0BWP30P140HVT \DP_OP_249_24682_65499_J1/U_2 ( 
    .A ( \u_mac_and_scale/gated_hi_feedback [0] ) , 
    .B ( \u_mac_and_scale/gated_carry ) , 
    .CI ( \u_mac_and_scale/gated_hi_addend [0] ) , 
    .CO ( \DP_OP_249_24682_65499_J1/N_3 ) , .S ( N304 ) ) ;
AN2D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/ctmi_274 ( 
    .A1 ( \RS_OP_250_54632_65499_J1/N15 ) , 
    .A2 ( \RS_OP_250_54632_65499_J1/N31 ) , 
    .Z ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_5 ) ) ;
AO22D0BWP30P140HVT ctmTdsLR_1_3542 ( .A1 ( N21 ) , 
    .A2 ( \u_mac_and_scale/N7 ) , .B1 ( N242 ) , .B2 ( phfnn_648 ) , 
    .Z ( \RS_OP_250_54632_65499_J1/N5 ) ) ;
CKND0BWP30P140HVT HFSINV_905_5420 ( .I ( HFSNET_25 ) , .ZN ( HFSNET_23 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5346 ( .I ( ctmn_14808 ) , .ZN ( phfnn_3876 ) ) ;
INVD1BWP30P140HVT HFSINV_577_5414 ( .I ( HFSNET_15 ) , .ZN ( HFSNET_18 ) ) ;
AOI32D0BWP30P140HVT ctmi_16576 ( .A1 ( phfnn_3881 ) , .A2 ( phfnn_3851 ) , 
    .A3 ( phfnn_3870 ) , .B1 ( phfnn_2590 ) , .B2 ( ctmn_14775 ) , 
    .ZN ( ctmn_14776 ) ) ;
NR2D0BWP30P140HVT ctmi_16577 ( .A1 ( ctmn_14697 ) , .A2 ( phfnn_867 ) , 
    .ZN ( ctmn_14773 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5152 ( .I ( ctmn_14339 ) , .ZN ( phfnn_3682 ) ) ;
ND2D0BWP30P140HVT ctmi_16579 ( .A1 ( phfnn_2014 ) , .A2 ( ctmn_14720 ) , 
    .ZN ( ctmn_14775 ) ) ;
AOI21D0BWP30P140HVT ctmTdsLR_1_3609 ( .A1 ( HFSNET_22 ) , .A2 ( N205 ) , 
    .B ( \RS_OP_250_54632_65499_J1/ctmn_154 ) , .ZN ( N313 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5153 ( .I ( ctmn_14384 ) , .ZN ( phfnn_3683 ) ) ;
AOI211D0BWP30P140HVT ctmi_16582 ( .A1 ( phfnn_3875 ) , .A2 ( ctmn_14747 ) , 
    .B ( phfnn_878 ) , .C ( ctmn_14745 ) , .ZN ( ctmn_14781 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5154 ( .I ( ctmn_14392 ) , .ZN ( phfnn_3684 ) ) ;
NR2D0BWP30P140HVT ctmi_16584 ( .A1 ( ctmn_14782 ) , .A2 ( ctmn_14734 ) , 
    .ZN ( ctmn_14783 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5155 ( .I ( phfnn_3064 ) , .ZN ( phfnn_3685 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5160 ( .I ( ctmn_13902 ) , .ZN ( phfnn_3690 ) ) ;
OAI222D0BWP30P140HVT ctmi_16587 ( .A1 ( phfnn_3845 ) , .A2 ( phfnn_3840 ) , 
    .B1 ( phfnn_1416 ) , .B2 ( N162 ) , .C1 ( ctmn_14790 ) , 
    .C2 ( ctmn_14836 ) , .ZN ( ctmn_14837 ) ) ;
NR2D0BWP30P140HVT ctmi_16588 ( .A1 ( ctmn_14697 ) , .A2 ( phfnn_3833 ) , 
    .ZN ( ctmn_14787 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5157 ( .I ( ctmn_13506 ) , .ZN ( phfnn_3687 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5330 ( .I ( ctmn_14860 ) , .ZN ( phfnn_3860 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5319 ( .I ( ctmn_14862 ) , .ZN ( phfnn_3849 ) ) ;
ND2D0BWP30P140HVT ctmi_16592 ( .A1 ( act_fn_sel[2] ) , .A2 ( ctmn_14734 ) , 
    .ZN ( ctmn_14790 ) ) ;
AOI221D0BWP30P140HVT ctmi_16641 ( .A1 ( phfnn_2590 ) , .A2 ( ctmn_14726 ) , 
    .B1 ( act_fn_sel[0] ) , .B2 ( ctmn_14751 ) , .C ( phfnn_3886 ) , 
    .ZN ( ctmn_14841 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5158 ( .I ( ctmn_13512 ) , .ZN ( phfnn_3688 ) ) ;
ND3D0BWP30P140HVT ctmi_16643 ( .A1 ( HFSNET_18 ) , .A2 ( act_fn_sel[2] ) , 
    .A3 ( ctmn_14748 ) , .ZN ( ctmn_14842 ) ) ;
AOI221D0BWP30P140HVT ctmi_16644 ( .A1 ( HFSNET_15 ) , .A2 ( ctmn_14956 ) , 
    .B1 ( act_fn_sel[1] ) , .B2 ( phfnn_3660 ) , .C ( ctmn_14963 ) , 
    .ZN ( ctmn_14964 ) ) ;
OAI22D0BWP30P140HVT ctmi_16645 ( .A1 ( ctmn_14782 ) , .A2 ( ctmn_14955 ) , 
    .B1 ( phfnn_3845 ) , .B2 ( phfnn_3831 ) , .ZN ( ctmn_14956 ) ) ;
OAI33D0BWP30P140HVT ctmi_16646 ( .A1 ( ctmn_14847 ) , .A2 ( ctmn_14871 ) , 
    .A3 ( ctmn_14910 ) , .B1 ( ctmn_14920 ) , .B2 ( ctmn_14941 ) , 
    .B3 ( ctmn_14954 ) , .ZN ( ctmn_14955 ) ) ;
OAI31D0BWP30P140HVT ctmi_16647 ( .A1 ( ctmn_14748 ) , .A2 ( phfnn_3843 ) , 
    .A3 ( ctmn_14846 ) , .B ( phfnn_3830 ) , .ZN ( ctmn_14847 ) ) ;
AOI22D0BWP30P140HVT ctmi_16648 ( .A1 ( phfnn_3882 ) , .A2 ( ctmn_14844 ) , 
    .B1 ( ctmn_14691 ) , .B2 ( ctmn_14845 ) , .ZN ( ctmn_14846 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5159 ( .I ( ctmn_13904 ) , .ZN ( phfnn_3689 ) ) ;
NR2D0BWP30P140HVT ctmi_16650 ( .A1 ( phfnn_3853 ) , .A2 ( ctmn_14725 ) , 
    .ZN ( ctmn_14844 ) ) ;
AO21D0BWP30P140HVT ctmi_16774 ( .A1 ( N264 ) , .A2 ( HFSNET_26 ) , 
    .B ( ctmn_14973 ) , .Z ( \u_mac_and_scale/N14 ) ) ;
NR2D0BWP30P140HVT ctmi_16651 ( .A1 ( ctmn_14725 ) , .A2 ( ctmn_14686 ) , 
    .ZN ( ctmn_14845 ) ) ;
OAI22D0BWP30P140HVT ctmi_16652 ( .A1 ( ctmn_14859 ) , .A2 ( phfnn_3860 ) , 
    .B1 ( phfnn_3849 ) , .B2 ( ctmn_14870 ) , .ZN ( ctmn_14871 ) ) ;
AOI211D0BWP30P140HVT ctmi_16653 ( .A1 ( ctmn_14848 ) , .A2 ( phfnn_903 ) , 
    .B ( ctmn_14854 ) , .C ( ctmn_14858 ) , .ZN ( ctmn_14859 ) ) ;
NR2D0BWP30P140HVT ctmi_16654 ( .A1 ( ctmn_14725 ) , .A2 ( phfnn_3844 ) , 
    .ZN ( ctmn_14848 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5172 ( .I ( ctmn_13621 ) , .ZN ( phfnn_3702 ) ) ;
AN2D0BWP30P140HVT ctmi_16775 ( .A1 ( \u_mac_and_scale/N46 ) , 
    .A2 ( HFSNET_25 ) , .Z ( ctmn_14973 ) ) ;
AOI31D0BWP30P140HVT ctmi_16915 ( .A1 ( ctmn_15110 ) , .A2 ( ctmn_15116 ) , 
    .A3 ( ctmn_15119 ) , .B ( ctmn_14790 ) , .ZN ( ctmn_15120 ) ) ;
AOI221D0BWP30P140HVT ctmi_16916 ( .A1 ( ctmn_15098 ) , .A2 ( phfnn_3878 ) , 
    .B1 ( ctmn_15107 ) , .B2 ( ctmn_14856 ) , .C ( ctmn_15109 ) , 
    .ZN ( ctmn_15110 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5166 ( .I ( ctmn_13845 ) , .ZN ( phfnn_3696 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5164 ( .I ( ctmn_13847 ) , .ZN ( phfnn_3694 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5162 ( .I ( phfnn_1254 ) , .ZN ( phfnn_3692 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5359 ( .I ( ctmn_15074 ) , .ZN ( phfnn_3889 ) ) ;
OAI211D0BWP30P140HVT ctmi_16778 ( .A1 ( ctmn_13372 ) , .A2 ( ctmn_14317 ) , 
    .B ( ctmn_14974 ) , .C ( ctmn_14975 ) , .ZN ( ctmn_14976 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5353 ( .I ( ctmn_14890 ) , .ZN ( phfnn_3883 ) ) ;
OAI211D0BWP30P140HVT ctmi_16661 ( .A1 ( phfnn_3864 ) , .A2 ( phfnn_3861 ) , 
    .B ( ctmn_14857 ) , .C ( phfnn_3858 ) , .ZN ( ctmn_14858 ) ) ;
ND2D0BWP30P140HVT ctmi_16917 ( .A1 ( phfnn_3853 ) , .A2 ( phfnn_3864 ) , 
    .ZN ( ctmn_15107 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5156 ( .I ( phfnn_3048 ) , .ZN ( phfnn_3686 ) ) ;
AOI22D0BWP30P140HVT ctmi_16662 ( .A1 ( ctmn_14745 ) , .A2 ( ctmn_14720 ) , 
    .B1 ( phfnn_3243 ) , .B2 ( ctmn_14856 ) , .ZN ( ctmn_14857 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5163 ( .I ( ctmn_13446 ) , .ZN ( phfnn_3693 ) ) ;
NR2D0BWP30P140HVT ctmi_16664 ( .A1 ( phfnn_1420 ) , .A2 ( phfnn_3839 ) , 
    .ZN ( ctmn_14856 ) ) ;
NR2D0BWP30P140HVT ctmi_16665 ( .A1 ( ctmn_14748 ) , .A2 ( phfnn_3840 ) , 
    .ZN ( ctmn_14860 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5165 ( .I ( ctmn_13458 ) , .ZN ( phfnn_3695 ) ) ;
NR2D0BWP30P140HVT ctmi_16667 ( .A1 ( phfnn_2546 ) , .A2 ( act_fn_sel[1] ) , 
    .ZN ( ctmn_14862 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5161 ( .I ( ctmn_14980 ) , .ZN ( phfnn_3691 ) ) ;
AOI221D0BWP30P140HVT ctmi_16669 ( .A1 ( ctmn_14864 ) , .A2 ( phfnn_3843 ) , 
    .B1 ( ctmn_14714 ) , .B2 ( ctmn_14751 ) , .C ( ctmn_14869 ) , 
    .ZN ( ctmn_14870 ) ) ;
AOI221D0BWP30P140HVT ctmi_16855 ( .A1 ( ctmn_14314 ) , 
    .A2 ( accumulator[58] ) , .B1 ( ctmn_14316 ) , .B2 ( accumulator[26] ) , 
    .C ( ctmn_15051 ) , .ZN ( ctmn_15052 ) ) ;
NR2D0BWP30P140HVT ctmi_16670 ( .A1 ( ctmn_14725 ) , .A2 ( phfnn_3243 ) , 
    .ZN ( ctmn_14864 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5167 ( .I ( ctmn_13863 ) , .ZN ( phfnn_3697 ) ) ;
NR2D0BWP30P140HVT ctmi_16672 ( .A1 ( phfnn_3843 ) , .A2 ( phfnn_867 ) , 
    .ZN ( ctmn_14865 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5168 ( .I ( ctmn_13566 ) , .ZN ( phfnn_3698 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5169 ( .I ( ctmn_13791 ) , .ZN ( phfnn_3699 ) ) ;
OAI211D0BWP30P140HVT ctmi_16856 ( .A1 ( ctmn_14317 ) , .A2 ( ctmn_13377 ) , 
    .B ( ctmn_15049 ) , .C ( ctmn_15050 ) , .ZN ( ctmn_15051 ) ) ;
AOI22D0BWP30P140HVT ctmi_16857 ( .A1 ( ctmn_14318 ) , 
    .A2 ( accumulator[50] ) , .B1 ( ctmn_14319 ) , .B2 ( accumulator[34] ) , 
    .ZN ( ctmn_15049 ) ) ;
AOI222D0BWP30P140HVT ctmi_16858 ( .A1 ( ctmn_14321 ) , 
    .A2 ( accumulator[18] ) , .B1 ( ctmn_14322 ) , .B2 ( accumulator[10] ) , 
    .C1 ( ctmn_14323 ) , .C2 ( accumulator[2] ) , .ZN ( ctmn_15050 ) ) ;
AOI211D0BWP30P140HVT ctmi_16859 ( .A1 ( phfnn_3854 ) , .A2 ( ctmn_14967 ) , 
    .B ( ctmn_14971 ) , .C ( ctmn_15105 ) , .ZN ( ctmn_15106 ) ) ;
OAI222D0BWP30P140HVT ctmi_16860 ( .A1 ( HFSNET_18 ) , .A2 ( ctmn_15103 ) , 
    .B1 ( ctmn_15104 ) , .B2 ( ctmn_14842 ) , .C1 ( HFSNET_0 ) , 
    .C2 ( ctmn_14965 ) , .ZN ( ctmn_15105 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5170 ( .I ( ctmn_13805 ) , .ZN ( phfnn_3700 ) ) ;
AOI32D0BWP30P140HVT ctmi_16861 ( .A1 ( act_fn_sel[2] ) , .A2 ( ctmn_15076 ) , 
    .A3 ( ctmn_15102 ) , .B1 ( phfnn_3836 ) , .B2 ( ctmn_14787 ) , 
    .ZN ( ctmn_15103 ) ) ;
OAI32D0BWP30P140HVT ctmi_16920 ( .A1 ( phfnn_3840 ) , .A2 ( phfnn_3847 ) , 
    .A3 ( ctmn_15112 ) , .B1 ( phfnn_2546 ) , .B2 ( ctmn_15115 ) , 
    .ZN ( ctmn_15116 ) ) ;
OAI211D0BWP30P140HVT ctmi_16862 ( .A1 ( phfnn_3849 ) , .A2 ( ctmn_15053 ) , 
    .B ( ctmn_15073 ) , .C ( phfnn_3889 ) , .ZN ( ctmn_15076 ) ) ;
AOI21D0BWP30P140HVT ctmi_16863 ( .A1 ( phfnn_3243 ) , .A2 ( ctmn_14727 ) , 
    .B ( ctmn_14767 ) , .ZN ( ctmn_15053 ) ) ;
AOI211D0BWP30P140HVT ctmi_16864 ( .A1 ( ctmn_15067 ) , .A2 ( ctmn_14732 ) , 
    .B ( ctmn_14734 ) , .C ( ctmn_15072 ) , .ZN ( ctmn_15073 ) ) ;
OAI211D0BWP30P140HVT ctmi_16865 ( .A1 ( phfnn_3869 ) , .A2 ( phfnn_3885 ) , 
    .B ( ctmn_15064 ) , .C ( ctmn_15066 ) , .ZN ( ctmn_15067 ) ) ;
AOI211D0BWP30P140HVT ctmi_16866 ( .A1 ( phfnn_3887 ) , .A2 ( phfnn_878 ) , 
    .B ( ctmn_15057 ) , .C ( ctmn_15063 ) , .ZN ( ctmn_15064 ) ) ;
OAI32D0BWP30P140HVT ctmi_16921 ( .A1 ( phfnn_1420 ) , .A2 ( ctmn_14707 ) , 
    .A3 ( phfnn_3876 ) , .B1 ( ctmn_15111 ) , .B2 ( ctmn_14725 ) , 
    .ZN ( ctmn_15112 ) ) ;
AOI211D0BWP30P140HVT ctmi_16922 ( .A1 ( ctmn_14697 ) , .A2 ( phfnn_2590 ) , 
    .B ( ctmn_14707 ) , .C ( phfnn_3243 ) , .ZN ( ctmn_15111 ) ) ;
AOI21D0BWP30P140HVT ctmi_16923 ( .A1 ( ctmn_15113 ) , .A2 ( ctmn_15114 ) , 
    .B ( phfnn_1416 ) , .ZN ( ctmn_15115 ) ) ;
AOI221D0BWP30P140HVT ctmi_16924 ( .A1 ( phfnn_3881 ) , .A2 ( ctmn_14736 ) , 
    .B1 ( ctmn_14721 ) , .B2 ( phfnn_3252 ) , .C ( ctmn_14751 ) , 
    .ZN ( ctmn_15113 ) ) ;
ND3D0BWP30P140HVT ctmi_16867 ( .A1 ( ctmn_15055 ) , .A2 ( ctmn_15056 ) , 
    .A3 ( ctmn_15040 ) , .ZN ( ctmn_15057 ) ) ;
AOI221D0BWP30P140HVT ctmi_16868 ( .A1 ( ctmn_14745 ) , .A2 ( HFSNET_1 ) , 
    .B1 ( ctmn_14865 ) , .B2 ( ctmn_15018 ) , .C ( ctmn_15054 ) , 
    .ZN ( ctmn_15055 ) ) ;
OAI33D0BWP30P140HVT ctmi_16869 ( .A1 ( act_fn_sel[0] ) , .A2 ( phfnn_2590 ) , 
    .A3 ( ctmn_14792 ) , .B1 ( phfnn_867 ) , .B2 ( phfnn_3229 ) , 
    .B3 ( ctmn_14800 ) , .ZN ( ctmn_15054 ) ) ;
OAI21D0BWP30P140HVT ctmi_16870 ( .A1 ( ctmn_14845 ) , .A2 ( phfnn_3847 ) , 
    .B ( ctmn_14726 ) , .ZN ( ctmn_15056 ) ) ;
OAI211D0BWP30P140HVT ctmi_16871 ( .A1 ( phfnn_3844 ) , .A2 ( ctmn_15059 ) , 
    .B ( ctmn_15061 ) , .C ( ctmn_15062 ) , .ZN ( ctmn_15063 ) ) ;
AOI221D0BWP30P140HVT ctmi_16872 ( .A1 ( HFSNET_0 ) , .A2 ( ctmn_14845 ) , 
    .B1 ( ctmn_14740 ) , .B2 ( ctmn_14844 ) , .C ( ctmn_15058 ) , 
    .ZN ( ctmn_15059 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5171 ( .I ( ctmn_13702 ) , .ZN ( phfnn_3701 ) ) ;
AOI22D0BWP30P140HVT ctmi_16925 ( .A1 ( HFSNET_1 ) , .A2 ( ctmn_14726 ) , 
    .B1 ( phfnn_2542 ) , .B2 ( ctmn_14740 ) , .ZN ( ctmn_15114 ) ) ;
AOI221D0BWP30P140HVT ctmi_16926 ( .A1 ( phfnn_3840 ) , .A2 ( ctmn_15118 ) , 
    .B1 ( phfnn_3864 ) , .B2 ( ctmn_14747 ) , .C ( ctmn_14848 ) , 
    .ZN ( ctmn_15119 ) ) ;
AOI22D0BWP30P140HVT ctmi_16874 ( .A1 ( phfnn_3888 ) , .A2 ( ctmn_14767 ) , 
    .B1 ( phfnn_899 ) , .B2 ( ctmn_14889 ) , .ZN ( ctmn_15061 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5173 ( .I ( ctmn_14579 ) , .ZN ( phfnn_3703 ) ) ;
OAI21D0BWP30P140HVT ctmi_16876 ( .A1 ( ctmn_15032 ) , .A2 ( phfnn_3872 ) , 
    .B ( ctmn_14879 ) , .ZN ( ctmn_15062 ) ) ;
AOI211D0BWP30P140HVT ctmi_16877 ( .A1 ( ctmn_14829 ) , .A2 ( phfnn_903 ) , 
    .B ( ctmn_14883 ) , .C ( ctmn_15065 ) , .ZN ( ctmn_15066 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5174 ( .I ( ctmn_14432 ) , .ZN ( phfnn_3704 ) ) ;
AOI31D0BWP30P140HVT ctmi_16879 ( .A1 ( ctmn_15069 ) , .A2 ( ctmn_15071 ) , 
    .A3 ( ctmn_14792 ) , .B ( phfnn_3860 ) , .ZN ( ctmn_15072 ) ) ;
AOI32D0BWP30P140HVT ctmi_16880 ( .A1 ( phfnn_1416 ) , .A2 ( ctmn_14726 ) , 
    .A3 ( ctmn_14808 ) , .B1 ( ctmn_14740 ) , .B2 ( ctmn_15068 ) , 
    .ZN ( ctmn_15069 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5175 ( .I ( ctmn_14459 ) , .ZN ( phfnn_3705 ) ) ;
AOI221D0BWP30P140HVT ctmi_16928 ( .A1 ( ctmn_14693 ) , .A2 ( ctmn_14952 ) , 
    .B1 ( phfnn_3881 ) , .B2 ( ctmn_14723 ) , .C ( phfnn_899 ) , 
    .ZN ( ctmn_15117 ) ) ;
OAI22D0BWP30P140HVT ctmi_16929 ( .A1 ( ctmn_15144 ) , .A2 ( ctmn_14790 ) , 
    .B1 ( phfnn_3834 ) , .B2 ( ctmn_15176 ) , .ZN ( ctmn_15177 ) ) ;
AOI22D0BWP30P140HVT ctmi_16930 ( .A1 ( ctmn_14732 ) , .A2 ( ctmn_15126 ) , 
    .B1 ( ctmn_15143 ) , .B2 ( ctmn_14862 ) , .ZN ( ctmn_15144 ) ) ;
NR2D0BWP30P140HVT ctmi_16881 ( .A1 ( phfnn_3844 ) , .A2 ( phfnn_1416 ) , 
    .ZN ( ctmn_15068 ) ) ;
OAI211D0BWP30P140HVT ctmi_16931 ( .A1 ( ctmn_14792 ) , .A2 ( ctmn_14917 ) , 
    .B ( ctmn_15124 ) , .C ( ctmn_15125 ) , .ZN ( ctmn_15126 ) ) ;
AOI221D0BWP30P140HVT ctmi_16932 ( .A1 ( ctmn_14745 ) , .A2 ( phfnn_3864 ) , 
    .B1 ( phfnn_3876 ) , .B2 ( ctmn_14827 ) , .C ( ctmn_15123 ) , 
    .ZN ( ctmn_15124 ) ) ;
AOI22D0BWP30P140HVT ctmi_16882 ( .A1 ( phfnn_3835 ) , .A2 ( ctmn_15070 ) , 
    .B1 ( ctmn_15016 ) , .B2 ( phfnn_2542 ) , .ZN ( ctmn_15071 ) ) ;
OAI21D0BWP30P140HVT ctmi_16883 ( .A1 ( phfnn_3243 ) , .A2 ( ctmn_14707 ) , 
    .B ( act_fn_sel[0] ) , .ZN ( ctmn_15070 ) ) ;
NR2D0BWP30P140HVT ctmi_16884 ( .A1 ( phfnn_3848 ) , .A2 ( ctmn_15042 ) , 
    .ZN ( ctmn_15074 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5176 ( .I ( ctmn_14498 ) , .ZN ( phfnn_3706 ) ) ;
OAI21D0BWP30P140HVT ctmi_16886 ( .A1 ( ctmn_15085 ) , .A2 ( ctmn_14748 ) , 
    .B ( ctmn_15101 ) , .ZN ( ctmn_15102 ) ) ;
AOI221D0BWP30P140HVT ctmi_16887 ( .A1 ( phfnn_2546 ) , .A2 ( ctmn_15077 ) , 
    .B1 ( phfnn_3840 ) , .B2 ( ctmn_15083 ) , .C ( ctmn_15084 ) , 
    .ZN ( ctmn_15085 ) ) ;
OAI32D0BWP30P140HVT ctmi_16888 ( .A1 ( phfnn_3863 ) , .A2 ( phfnn_3839 ) , 
    .A3 ( ctmn_14795 ) , .B1 ( ctmn_14691 ) , .B2 ( phfnn_3874 ) , 
    .ZN ( ctmn_15077 ) ) ;
OAI211D0BWP30P140HVT ctmi_16889 ( .A1 ( phfnn_874 ) , .A2 ( ctmn_14922 ) , 
    .B ( ctmn_15081 ) , .C ( ctmn_15082 ) , .ZN ( ctmn_15083 ) ) ;
AOI221D0BWP30P140HVT ctmi_16890 ( .A1 ( ctmn_14876 ) , .A2 ( phfnn_3854 ) , 
    .B1 ( phfnn_3883 ) , .B2 ( ctmn_14747 ) , .C ( ctmn_15080 ) , 
    .ZN ( ctmn_15081 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5177 ( .I ( phfnn_1311 ) , .ZN ( phfnn_3707 ) ) ;
OAI22D0BWP30P140HVT ctmi_16892 ( .A1 ( ctmn_15079 ) , .A2 ( phfnn_3853 ) , 
    .B1 ( phfnn_3838 ) , .B2 ( ctmn_14846 ) , .ZN ( ctmn_15080 ) ) ;
AOI222D0BWP30P140HVT ctmi_16893 ( .A1 ( phfnn_3877 ) , .A2 ( phfnn_878 ) , 
    .B1 ( phfnn_874 ) , .B2 ( phfnn_2014 ) , .C1 ( phfnn_3854 ) , 
    .C2 ( ctmn_14825 ) , .ZN ( ctmn_15079 ) ) ;
AOI222D0BWP30P140HVT ctmi_16894 ( .A1 ( phfnn_3888 ) , .A2 ( ctmn_14793 ) , 
    .B1 ( ctmn_14691 ) , .B2 ( ctmn_15032 ) , .C1 ( ctmn_14812 ) , 
    .C2 ( phfnn_3884 ) , .ZN ( ctmn_15082 ) ) ;
OAI22D0BWP30P140HVT ctmi_16895 ( .A1 ( ctmn_15025 ) , .A2 ( phfnn_3883 ) , 
    .B1 ( ctmn_14691 ) , .B2 ( ctmn_15027 ) , .ZN ( ctmn_15084 ) ) ;
AOI221D0BWP30P140HVT ctmi_16896 ( .A1 ( ctmn_14732 ) , .A2 ( ctmn_15086 ) , 
    .B1 ( ctmn_15100 ) , .B2 ( ctmn_14862 ) , .C ( phfnn_3830 ) , 
    .ZN ( ctmn_15101 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5178 ( .I ( phfnn_2442 ) , .ZN ( phfnn_3708 ) ) ;
ND4D0BWP30P140HVT ctmi_16898 ( .A1 ( ctmn_15089_CDR1 ) , 
    .A2 ( ctmn_15091_CDR1 ) , .A3 ( ctmn_15097_CDR1 ) , .A4 ( ctmn_15099 ) , 
    .ZN ( ctmn_15100 ) ) ;
AOI221D0BWP30P140HVT ctmi_16899 ( .A1 ( HFSNET_1 ) , .A2 ( ctmn_15087 ) , 
    .B1 ( ctmn_14808 ) , .B2 ( ctmn_14767 ) , .C ( ctmn_15088 ) , 
    .ZN ( ctmn_15089_CDR1 ) ) ;
AO21D0BWP30P140HVT ctmi_16900 ( .A1 ( ctmn_14873 ) , .A2 ( ctmn_14707 ) , 
    .B ( ctmn_14745 ) , .Z ( ctmn_15087 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5179 ( .I ( ctmn_13686 ) , .ZN ( phfnn_3709 ) ) ;
AOI221D0BWP30P140HVT ctmi_16902 ( .A1 ( ctmn_14726 ) , .A2 ( ctmn_15058 ) , 
    .B1 ( phfnn_3243 ) , .B2 ( phfnn_878 ) , .C ( ctmn_15090_CDR1 ) , 
    .ZN ( ctmn_15091_CDR1 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5180 ( .I ( ctmn_13794 ) , .ZN ( phfnn_3710 ) ) ;
MOAI22D0BWP30P140HVT ctmTdsLR_1_3597 ( .A1 ( ctmn_14451 ) , 
    .A2 ( ctmn_14415 ) , .B1 ( ctmn_14341 ) , .B2 ( ctmn_14452 ) , 
    .ZN ( tmp_net2663 ) ) ;
NR2D0BWP30P140HVT ctmi_16905 ( .A1 ( ctmn_14725 ) , .A2 ( ctmn_14707 ) , 
    .ZN ( ctmn_15092 ) ) ;
AOI221D0BWP30P140HVT ctmTdsLR_2_3598 ( .A1 ( accumulator[16] ) , 
    .A2 ( phfnn_3675 ) , .B1 ( accumulator[8] ) , .B2 ( phfnn_3676 ) , 
    .C ( tmp_net2663 ) , .ZN ( ctmn_14454 ) ) ;
AOI31D0BWP30P140HVT ctmi_16907 ( .A1 ( ctmn_15094 ) , .A2 ( phfnn_3867 ) , 
    .A3 ( ctmn_15095 ) , .B ( phfnn_3853 ) , .ZN ( ctmn_15096 ) ) ;
AOI22D0BWP30P140HVT ctmi_16908 ( .A1 ( HFSNET_1 ) , .A2 ( ctmn_14943 ) , 
    .B1 ( phfnn_899 ) , .B2 ( ctmn_14795 ) , .ZN ( ctmn_15094 ) ) ;
OAI21D0BWP30P140HVT ctmi_16909 ( .A1 ( phfnn_3868 ) , .A2 ( ctmn_14799 ) , 
    .B ( phfnn_3854 ) , .ZN ( ctmn_15095 ) ) ;
OAI21D0BWP30P140HVT ctmi_16910 ( .A1 ( ctmn_15098 ) , .A2 ( phfnn_2014 ) , 
    .B ( HFSNET_0 ) , .ZN ( ctmn_15099 ) ) ;
NR2D0BWP30P140HVT ctmi_16911 ( .A1 ( phfnn_3857 ) , .A2 ( ctmn_14686 ) , 
    .ZN ( ctmn_15098 ) ) ;
AOI221D0BWP30P140HVT ctmi_16912 ( .A1 ( ctmn_14751 ) , .A2 ( ctmn_14697 ) , 
    .B1 ( phfnn_3878 ) , .B2 ( phfnn_3831 ) , .C ( ctmn_14736 ) , 
    .ZN ( ctmn_15104 ) ) ;
OAI211D0BWP30P140HVT ctmi_16933 ( .A1 ( ctmn_14795 ) , .A2 ( phfnn_3858 ) , 
    .B ( ctmn_15121 ) , .C ( ctmn_15122 ) , .ZN ( ctmn_15123 ) ) ;
AOI32D0BWP30P140HVT ctmi_16934 ( .A1 ( ctmn_14693 ) , .A2 ( phfnn_2563 ) , 
    .A3 ( ctmn_14726 ) , .B1 ( phfnn_3878 ) , .B2 ( ctmn_14876 ) , 
    .ZN ( ctmn_15121 ) ) ;
NR3D0BWP30P140HVT ctmi_16935 ( .A1 ( ctmn_14723 ) , .A2 ( ctmn_14767 ) , 
    .A3 ( ctmn_14778 ) , .ZN ( ctmn_15122 ) ) ;
OAI211D0BWP30P140HVT ctmi_16936 ( .A1 ( phfnn_3836 ) , .A2 ( phfnn_3876 ) , 
    .B ( ctmn_14697 ) , .C ( phfnn_1420 ) , .ZN ( ctmn_15125 ) ) ;
OAI211D0BWP30P140HVT ctmi_16937 ( .A1 ( ctmn_15128 ) , .A2 ( phfnn_3838 ) , 
    .B ( ctmn_15061 ) , .C ( ctmn_15142 ) , .ZN ( ctmn_15143 ) ) ;
AOI221D0BWP30P140HVT ctmi_16938 ( .A1 ( ctmn_14845 ) , .A2 ( phfnn_3854 ) , 
    .B1 ( phfnn_3864 ) , .B2 ( ctmn_14885 ) , .C ( ctmn_15127 ) , 
    .ZN ( ctmn_15128 ) ) ;
NR2D0BWP30P140HVT ctmi_16939 ( .A1 ( phfnn_3874 ) , .A2 ( phfnn_874 ) , 
    .ZN ( ctmn_15127 ) ) ;
NR4D0BWP30P140HVT ctmi_16940 ( .A1 ( ctmn_15132 ) , .A2 ( ctmn_15133 ) , 
    .A3 ( ctmn_15137 ) , .A4 ( ctmn_15141 ) , .ZN ( ctmn_15142 ) ) ;
OAI22D0BWP30P140HVT ctmi_16941 ( .A1 ( ctmn_15130 ) , .A2 ( phfnn_3853 ) , 
    .B1 ( HFSNET_0 ) , .B2 ( ctmn_15131 ) , .ZN ( ctmn_15132 ) ) ;
AOI221D0BWP30P140HVT ctmi_16942 ( .A1 ( HFSNET_1 ) , .A2 ( phfnn_878 ) , 
    .B1 ( ctmn_14691 ) , .B2 ( ctmn_14806 ) , .C ( ctmn_15129 ) , 
    .ZN ( ctmn_15130 ) ) ;
IOA21D0BWP30P140HVT ctmTdsLR_2_3562 ( .A1 ( N245 ) , .A2 ( phfnn_648 ) , 
    .B ( tmp_net2649 ) , .ZN ( \RS_OP_250_54632_65499_J1/N8 ) ) ;
AOI21D0BWP30P140HVT ctmi_16944 ( .A1 ( phfnn_3831 ) , .A2 ( ctmn_14873 ) , 
    .B ( ctmn_14793 ) , .ZN ( ctmn_15131 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5183 ( .I ( ctmn_13697 ) , .ZN ( phfnn_3713 ) ) ;
OAI22D0BWP30P140HVT ctmi_16946 ( .A1 ( ctmn_15134 ) , .A2 ( phfnn_3844 ) , 
    .B1 ( phfnn_3839 ) , .B2 ( ctmn_15136 ) , .ZN ( ctmn_15137 ) ) ;
AOI222D0BWP30P140HVT ctmi_16947 ( .A1 ( ctmn_14896 ) , .A2 ( phfnn_2563 ) , 
    .B1 ( ctmn_14795 ) , .B2 ( ctmn_14844 ) , .C1 ( ctmn_14879 ) , 
    .C2 ( ctmn_14845 ) , .ZN ( ctmn_15134 ) ) ;
AOI221D0BWP30P140HVT ctmi_16948 ( .A1 ( ctmn_14691 ) , .A2 ( ctmn_14844 ) , 
    .B1 ( ctmn_14795 ) , .B2 ( ctmn_14885 ) , .C ( ctmn_15135 ) , 
    .ZN ( ctmn_15136 ) ) ;
NR2D0BWP30P140HVT ctmi_16949 ( .A1 ( phfnn_3882 ) , .A2 ( phfnn_3863 ) , 
    .ZN ( ctmn_15135 ) ) ;
AOI21D0BWP30P140HVT ctmi_16950 ( .A1 ( ctmn_15138 ) , .A2 ( ctmn_15140 ) , 
    .B ( ctmn_14686 ) , .ZN ( ctmn_15141 ) ) ;
OAI21D0BWP30P140HVT ctmi_16951 ( .A1 ( phfnn_899 ) , .A2 ( ctmn_14824 ) , 
    .B ( phfnn_3882 ) , .ZN ( ctmn_15138 ) ) ;
AOI221D0BWP30P140HVT ctmi_16952 ( .A1 ( ctmn_14865 ) , .A2 ( phfnn_3865 ) , 
    .B1 ( HFSNET_0 ) , .B2 ( phfnn_878 ) , .C ( ctmn_15139 ) , 
    .ZN ( ctmn_15140 ) ) ;
OAI32D0BWP30P140HVT ctmi_16953 ( .A1 ( phfnn_3854 ) , .A2 ( phfnn_3856 ) , 
    .A3 ( ctmn_14792 ) , .B1 ( ctmn_14740 ) , .B2 ( phfnn_3869 ) , 
    .ZN ( ctmn_15139 ) ) ;
AOI211D0BWP30P140HVT ctmi_16954 ( .A1 ( ctmn_14732 ) , .A2 ( ctmn_15160 ) , 
    .B ( ctmn_15175 ) , .C ( ctmn_15074 ) , .ZN ( ctmn_15176 ) ) ;
OAI211D0BWP30P140HVT ctmi_16955 ( .A1 ( ctmn_15146 ) , .A2 ( phfnn_3853 ) , 
    .B ( ctmn_15150 ) , .C ( ctmn_15159 ) , .ZN ( ctmn_15160 ) ) ;
AOI221D0BWP30P140HVT ctmi_16956 ( .A1 ( ctmn_14806 ) , .A2 ( phfnn_3854 ) , 
    .B1 ( HFSNET_0 ) , .B2 ( ctmn_14865 ) , .C ( phfnn_3879 ) , 
    .ZN ( ctmn_15146 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5184 ( .I ( ctmn_13801 ) , .ZN ( phfnn_3714 ) ) ;
AOI22D0BWP30P140HVT ctmi_16958 ( .A1 ( ctmn_14736 ) , .A2 ( ctmn_15148 ) , 
    .B1 ( ctmn_15149 ) , .B2 ( ctmn_14795 ) , .ZN ( ctmn_15150 ) ) ;
OAI31D0BWP30P140HVT ctmi_16959 ( .A1 ( ctmn_14933 ) , .A2 ( ctmn_14889 ) , 
    .A3 ( phfnn_3841 ) , .B ( ctmn_15147 ) , .ZN ( ctmn_15148 ) ) ;
AOI22D0BWP30P140HVT ctmi_16960 ( .A1 ( phfnn_3877 ) , .A2 ( ctmn_14844 ) , 
    .B1 ( ctmn_14795 ) , .B2 ( ctmn_14845 ) , .ZN ( ctmn_15147 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5185 ( .I ( ctmn_13858 ) , .ZN ( phfnn_3715 ) ) ;
NR4D0BWP30P140HVT ctmi_16962 ( .A1 ( ctmn_15088 ) , .A2 ( ctmn_15153 ) , 
    .A3 ( ctmn_15157 ) , .A4 ( ctmn_15158 ) , .ZN ( ctmn_15159 ) ) ;
AO21D0BWP30P140HVT ctmTdsLR_1_3832 ( .A1 ( N79 ) , .A2 ( phfnn_648 ) , 
    .B ( \RS_OP_250_54632_65499_J1/ctmn_156 ) , .Z ( N219 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5186 ( .I ( ctmn_13915 ) , .ZN ( phfnn_3716 ) ) ;
AO21D0BWP30P140HVT ctmTdsLR_1_3833 ( .A1 ( N78 ) , .A2 ( phfnn_648 ) , 
    .B ( \RS_OP_250_54632_65499_J1/ctmn_156 ) , .Z ( N268 ) ) ;
OAI22D0BWP30P140HVT ctmi_16966 ( .A1 ( ctmn_15154 ) , .A2 ( phfnn_3843 ) , 
    .B1 ( phfnn_3838 ) , .B2 ( ctmn_15156 ) , .ZN ( ctmn_15157 ) ) ;
AOI22D0BWP30P140HVT ctmi_16967 ( .A1 ( phfnn_3882 ) , .A2 ( ctmn_14885 ) , 
    .B1 ( HFSNET_0 ) , .B2 ( ctmn_14873 ) , .ZN ( ctmn_15154 ) ) ;
AOI221D0BWP30P140HVT ctmi_16968 ( .A1 ( phfnn_3878 ) , .A2 ( phfnn_3862 ) , 
    .B1 ( ctmn_14693 ) , .B2 ( ctmn_14873 ) , .C ( ctmn_15155 ) , 
    .ZN ( ctmn_15156 ) ) ;
NR2D0BWP30P140HVT ctmi_16969 ( .A1 ( phfnn_3854 ) , .A2 ( phfnn_3863 ) , 
    .ZN ( ctmn_15155 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5205 ( .I ( ctmn_13668 ) , .ZN ( phfnn_3735 ) ) ;
OAI22D0BWP30P140HVT ctmi_16971 ( .A1 ( ctmn_15169 ) , .A2 ( phfnn_3860 ) , 
    .B1 ( phfnn_3849 ) , .B2 ( ctmn_15174 ) , .ZN ( ctmn_15175 ) ) ;
AOI211D0BWP30P140HVT ctmi_16972 ( .A1 ( phfnn_899 ) , .A2 ( phfnn_3884 ) , 
    .B ( ctmn_15167 ) , .C ( ctmn_15168 ) , .ZN ( ctmn_15169 ) ) ;
OAI211D0BWP30P140HVT ctmi_16973 ( .A1 ( ctmn_15161 ) , .A2 ( phfnn_3843 ) , 
    .B ( ctmn_15164 ) , .C ( ctmn_15166 ) , .ZN ( ctmn_15167 ) ) ;
AOI221D0BWP30P140HVT ctmi_16974 ( .A1 ( phfnn_3882 ) , .A2 ( ctmn_14873 ) , 
    .B1 ( ctmn_14693 ) , .B2 ( ctmn_14845 ) , .C ( ctmn_14927 ) , 
    .ZN ( ctmn_15161 ) ) ;
AOI211D0BWP30P140HVT ctmi_16975 ( .A1 ( phfnn_3881 ) , .A2 ( ctmn_14745 ) , 
    .B ( ctmn_15162 ) , .C ( ctmn_15163 ) , .ZN ( ctmn_15164 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5181 ( .I ( ctmn_13850 ) , .ZN ( phfnn_3711 ) ) ;
AOI211D0BWP30P140HVT ctmi_16977 ( .A1 ( phfnn_3836 ) , .A2 ( HFSNET_1 ) , 
    .B ( phfnn_1420 ) , .C ( act_fn_sel[0] ) , .ZN ( ctmn_15163 ) ) ;
AOI211D0BWP30P140HVT ctmi_16978 ( .A1 ( ctmn_14795 ) , .A2 ( ctmn_14829 ) , 
    .B ( ctmn_15165 ) , .C ( ctmn_14943 ) , .ZN ( ctmn_15166 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5182 ( .I ( ctmn_13907 ) , .ZN ( phfnn_3712 ) ) ;
OA21D0BWP30P140HVT ctmi_16980 ( .A1 ( ctmn_15155 ) , .A2 ( ctmn_14898 ) , 
    .B ( ctmn_14721 ) , .Z ( ctmn_15168 ) ) ;
AOI221D0BWP30P140HVT ctmi_16981 ( .A1 ( ctmn_14800 ) , .A2 ( ctmn_14864 ) , 
    .B1 ( ctmn_14767 ) , .B2 ( phfnn_3884 ) , .C ( ctmn_15173 ) , 
    .ZN ( ctmn_15174 ) ) ;
OAI211D0BWP30P140HVT ctmi_16982 ( .A1 ( phfnn_3850 ) , .A2 ( ctmn_14751 ) , 
    .B ( ctmn_15171 ) , .C ( ctmn_15172 ) , .ZN ( ctmn_15173 ) ) ;
AOI211D0BWP30P140HVT ctmi_16983 ( .A1 ( ctmn_14824 ) , .A2 ( phfnn_3876 ) , 
    .B ( ctmn_15170 ) , .C ( ctmn_14747 ) , .ZN ( ctmn_15171 ) ) ;
OAI22D0BWP30P140HVT ctmi_16984 ( .A1 ( ctmn_14720 ) , .A2 ( phfnn_881 ) , 
    .B1 ( phfnn_3855 ) , .B2 ( phfnn_3876 ) , .ZN ( ctmn_15170 ) ) ;
OAI21D0BWP30P140HVT ctmi_16985 ( .A1 ( ctmn_14865 ) , .A2 ( ctmn_14768 ) , 
    .B ( ctmn_14740 ) , .ZN ( ctmn_15172 ) ) ;
OAI222D0BWP30P140HVT ctmi_16986 ( .A1 ( phfnn_3846 ) , .A2 ( phfnn_3840 ) , 
    .B1 ( ctmn_14686 ) , .B2 ( N162 ) , .C1 ( phfnn_3845 ) , 
    .C2 ( HFSNET_0 ) , .ZN ( ctmn_15178 ) ) ;
AOI221D0BWP30P140HVT ctmi_16987 ( .A1 ( ctmn_15186 ) , .A2 ( phfnn_3664 ) , 
    .B1 ( act_fn_sel[0] ) , .B2 ( phfnn_3660 ) , .C ( ctmn_15191 ) , 
    .ZN ( ctmn_15192 ) ) ;
OAI31D0BWP30P140HVT ctmi_16988 ( .A1 ( phfnn_3853 ) , .A2 ( phfnn_3864 ) , 
    .A3 ( ctmn_14842 ) , .B ( ctmn_15185 ) , .ZN ( ctmn_15186 ) ) ;
AOI22D0BWP30P140HVT ctmi_16989 ( .A1 ( ctmn_15180 ) , .A2 ( HFSNET_1 ) , 
    .B1 ( ctmn_15184 ) , .B2 ( HFSNET_18 ) , .ZN ( ctmn_15185 ) ) ;
OAI21D0BWP30P140HVT ctmi_16990 ( .A1 ( ctmn_14707 ) , .A2 ( ctmn_14842 ) , 
    .B ( ctmn_14970 ) , .ZN ( ctmn_15180 ) ) ;
OAI22D0BWP30P140HVT ctmi_16991 ( .A1 ( ctmn_14748 ) , .A2 ( ctmn_15182 ) , 
    .B1 ( ctmn_14686 ) , .B2 ( ctmn_15183 ) , .ZN ( ctmn_15184 ) ) ;
OAI22D0BWP30P140HVT ctmi_16992 ( .A1 ( act_fn_sel[2] ) , .A2 ( ctmn_14721 ) , 
    .B1 ( ctmn_14782 ) , .B2 ( ctmn_15181 ) , .ZN ( ctmn_15182 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5187 ( .I ( ctmn_13682 ) , .ZN ( phfnn_3717 ) ) ;
AOI221D0BWP30P140HVT ctmi_16994 ( .A1 ( phfnn_3843 ) , .A2 ( ctmn_14782 ) , 
    .B1 ( ctmn_14748 ) , .B2 ( phfnn_3831 ) , .C ( phfnn_3886 ) , 
    .ZN ( ctmn_15183 ) ) ;
AOI31D0BWP30P140HVT ctmi_16995 ( .A1 ( ctmn_15188 ) , .A2 ( ctmn_15189 ) , 
    .A3 ( ctmn_15190 ) , .B ( phfnn_2357 ) , .ZN ( ctmn_15191 ) ) ;
AOI221D0BWP30P140HVT ctmi_16996 ( .A1 ( ctmn_14322 ) , 
    .A2 ( accumulator[8] ) , .B1 ( ctmn_14323 ) , .B2 ( accumulator[0] ) , 
    .C ( ctmn_15187 ) , .ZN ( ctmn_15188 ) ) ;
OAI22D0BWP30P140HVT ctmi_16997 ( .A1 ( ctmn_14317 ) , .A2 ( ctmn_13379 ) , 
    .B1 ( phfnn_3658 ) , .B2 ( ctmn_13347 ) , .ZN ( ctmn_15187 ) ) ;
AOI22D0BWP30P140HVT ctmi_16998 ( .A1 ( ctmn_14318 ) , 
    .A2 ( accumulator[48] ) , .B1 ( ctmn_14319 ) , .B2 ( accumulator[32] ) , 
    .ZN ( ctmn_15189 ) ) ;
AOI22D0BWP30P140HVT ctmi_16999 ( .A1 ( ctmn_14314 ) , 
    .A2 ( accumulator[56] ) , .B1 ( ctmn_14316 ) , .B2 ( accumulator[24] ) , 
    .ZN ( ctmn_15190 ) ) ;
AOI22D0BWP30P140HVT ctmi_16779 ( .A1 ( accumulator[55] ) , 
    .A2 ( ctmn_14318 ) , .B1 ( accumulator[39] ) , .B2 ( ctmn_14319 ) , 
    .ZN ( ctmn_14974 ) ) ;
AOI222D0BWP30P140HVT ctmi_16780 ( .A1 ( accumulator[23] ) , 
    .A2 ( ctmn_14321 ) , .B1 ( accumulator[15] ) , .B2 ( ctmn_14322 ) , 
    .C1 ( accumulator[7] ) , .C2 ( ctmn_14323 ) , .ZN ( ctmn_14975 ) ) ;
NR2D0BWP30P140HVT ctmi_16781 ( .A1 ( ctmn_14979 ) , .A2 ( HFSNET_18 ) , 
    .ZN ( ctmn_14980 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5188 ( .I ( ctmn_13793 ) , .ZN ( phfnn_3718 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5206 ( .I ( ctmn_13782 ) , .ZN ( phfnn_3736 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5199 ( .I ( ctmn_13456 ) , .ZN ( phfnn_3729 ) ) ;
AOI32D0BWP30P140HVT ctmi_16785 ( .A1 ( ctmn_14982 ) , .A2 ( act_fn_sel[2] ) , 
    .A3 ( ctmn_14749 ) , .B1 ( ctmn_14983 ) , .B2 ( phfnn_3830 ) , 
    .ZN ( ctmn_14984 ) ) ;
ND2D0BWP30P140HVT ctmi_16786 ( .A1 ( phfnn_3852 ) , .A2 ( ctmn_14751 ) , 
    .ZN ( ctmn_14982 ) ) ;
ND2D0BWP30P140HVT ctmi_16787 ( .A1 ( act_fn_sel[0] ) , .A2 ( ctmn_14748 ) , 
    .ZN ( ctmn_14983 ) ) ;
AOI32D0BWP30P140HVT ctmi_16835 ( .A1 ( phfnn_2546 ) , .A2 ( phfnn_3852 ) , 
    .A3 ( phfnn_3839 ) , .B1 ( phfnn_3840 ) , .B2 ( ctmn_15026 ) , 
    .ZN ( ctmn_15027 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5203 ( .I ( ctmn_13556 ) , .ZN ( phfnn_3733 ) ) ;
AOI211D0BWP30P140HVT ctmi_16837 ( .A1 ( ctmn_14783 ) , .A2 ( ctmn_15044 ) , 
    .B ( ctmn_15045 ) , .C ( ctmn_14838 ) , .ZN ( ctmn_15046 ) ) ;
OAI31D0BWP30P140HVT ctmi_16838 ( .A1 ( ctmn_14697 ) , .A2 ( phfnn_3860 ) , 
    .A3 ( ctmn_14982 ) , .B ( ctmn_15043 ) , .ZN ( ctmn_15044 ) ) ;
AOI22D0BWP30P140HVT ctmi_16839 ( .A1 ( ctmn_15041 ) , .A2 ( ctmn_14732 ) , 
    .B1 ( ctmn_14749 ) , .B2 ( ctmn_15042 ) , .ZN ( ctmn_15043 ) ) ;
OAI211D0BWP30P140HVT ctmi_16840 ( .A1 ( phfnn_3870 ) , .A2 ( ctmn_15030 ) , 
    .B ( ctmn_15039 ) , .C ( ctmn_15040 ) , .ZN ( ctmn_15041 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5204 ( .I ( ctmn_13611 ) , .ZN ( phfnn_3734 ) ) ;
AOI221D0BWP30P140HVT ctmi_16842 ( .A1 ( ctmn_14768 ) , .A2 ( HFSNET_1 ) , 
    .B1 ( ctmn_14721 ) , .B2 ( ctmn_14898 ) , .C ( ctmn_15038 ) , 
    .ZN ( ctmn_15039 ) ) ;
OAI211D0BWP30P140HVT ctmi_16843 ( .A1 ( ctmn_14792 ) , .A2 ( ctmn_15031 ) , 
    .B ( ctmn_15036 ) , .C ( ctmn_15037 ) , .ZN ( ctmn_15038 ) ) ;
ND2D0BWP30P140HVT ctmi_16844 ( .A1 ( act_fn_sel[0] ) , .A2 ( ctmn_14740 ) , 
    .ZN ( ctmn_15031 ) ) ;
AOI211D0BWP30P140HVT ctmi_16845 ( .A1 ( phfnn_874 ) , .A2 ( ctmn_15032 ) , 
    .B ( ctmn_15034 ) , .C ( ctmn_15035 ) , .ZN ( ctmn_15036 ) ) ;
NR2D0BWP30P140HVT ctmi_16846 ( .A1 ( phfnn_3869 ) , .A2 ( ctmn_14686 ) , 
    .ZN ( ctmn_15032 ) ) ;
OAI22D0BWP30P140HVT ctmi_16847 ( .A1 ( ctmn_14740 ) , .A2 ( phfnn_3861 ) , 
    .B1 ( ctmn_14691 ) , .B2 ( ctmn_15033 ) , .ZN ( ctmn_15034 ) ) ;
AOI21D0BWP30P140HVT ctmi_16848 ( .A1 ( ctmn_14697 ) , .A2 ( ctmn_14845 ) , 
    .B ( phfnn_3871 ) , .ZN ( ctmn_15033 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5191 ( .I ( ctmn_13450 ) , .ZN ( phfnn_3721 ) ) ;
AOI222D0BWP30P140HVT ctmi_16850 ( .A1 ( phfnn_3876 ) , .A2 ( ctmn_14767 ) , 
    .B1 ( phfnn_3881 ) , .B2 ( ctmn_14825 ) , .C1 ( phfnn_2014 ) , 
    .C2 ( ctmn_15018 ) , .ZN ( ctmn_15037 ) ) ;
AOI33D0BWP30P140HVT ctmi_16851 ( .A1 ( phfnn_2563 ) , .A2 ( ctmn_14736 ) , 
    .A3 ( ctmn_14720 ) , .B1 ( phfnn_2563 ) , .B2 ( ctmn_14726 ) , 
    .B3 ( phfnn_3880 ) , .ZN ( ctmn_15040 ) ) ;
AOI21D0BWP30P140HVT ctmi_16852 ( .A1 ( phfnn_3852 ) , .A2 ( ctmn_14802 ) , 
    .B ( ctmn_14697 ) , .ZN ( ctmn_15042 ) ) ;
OAI22D0BWP30P140HVT ctmi_16853 ( .A1 ( phfnn_3835 ) , .A2 ( phfnn_3845 ) , 
    .B1 ( N162 ) , .B2 ( phfnn_3831 ) , .ZN ( ctmn_15045 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5192 ( .I ( ctmn_13507 ) , .ZN ( phfnn_3722 ) ) ;
INR2D1BWP30P140HVT ctmi_14620 ( .A1 ( ctmn_13312 ) , .B1 ( ctmn_13328 ) , 
    .ZN ( ctmn_13329 ) ) ;
NR3D0BWP30P140HVT ctmi_14622 ( .A1 ( ctmn_13321 ) , .A2 ( ctmn_13313 ) , 
    .A3 ( \u_controller/opcode_reg [1] ) , .ZN ( \u_controller/N40 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5193 ( .I ( ctmn_13561 ) , .ZN ( phfnn_3723 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5194 ( .I ( ctmn_13616 ) , .ZN ( phfnn_3724 ) ) ;
ND2D0BWP30P140HVT ctmi_14615 ( .A1 ( ctmn_13325 ) , .A2 ( ctmn_13327 ) , 
    .ZN ( \u_controller/N47 ) ) ;
NR2D0BWP30P140HVT ctmi_1484 ( .A1 ( ctmn_13309 ) , .A2 ( HFSNET_7 ) , 
    .ZN ( phfnn_643 ) ) ;
NR2D0BWP30P140HVT ctmi_14626 ( .A1 ( ctmn_13332 ) , .A2 ( acc_load ) , 
    .ZN ( \u_mac_and_scale/gated_lo_feedback [31] ) ) ;
NR2D0BWP30P140HVT ctmi_14628 ( .A1 ( ctmn_13333 ) , .A2 ( acc_load ) , 
    .ZN ( \u_mac_and_scale/gated_lo_feedback [30] ) ) ;
NR2D0BWP30P140HVT ctmi_14630 ( .A1 ( ctmn_13334 ) , .A2 ( HFSNET_20 ) , 
    .ZN ( \u_mac_and_scale/gated_lo_feedback [29] ) ) ;
NR2D0BWP30P140HVT ctmi_14632 ( .A1 ( ctmn_13335 ) , .A2 ( acc_load ) , 
    .ZN ( \u_mac_and_scale/gated_lo_feedback [28] ) ) ;
NR2D0BWP30P140HVT ctmi_14634 ( .A1 ( ctmn_13336 ) , .A2 ( HFSNET_20 ) , 
    .ZN ( \u_mac_and_scale/gated_lo_feedback [27] ) ) ;
NR2D0BWP30P140HVT ctmi_14636 ( .A1 ( ctmn_13337 ) , .A2 ( acc_load ) , 
    .ZN ( \u_mac_and_scale/gated_lo_feedback [26] ) ) ;
NR2D0BWP30P140HVT ctmi_14638 ( .A1 ( ctmn_13338 ) , .A2 ( HFSNET_20 ) , 
    .ZN ( \u_mac_and_scale/gated_lo_feedback [25] ) ) ;
NR2D0BWP30P140HVT ctmi_14640 ( .A1 ( ctmn_13339 ) , .A2 ( acc_load ) , 
    .ZN ( \u_mac_and_scale/gated_lo_feedback [24] ) ) ;
NR2D0BWP30P140HVT ctmi_14642 ( .A1 ( ctmn_13340 ) , .A2 ( acc_load ) , 
    .ZN ( \u_mac_and_scale/gated_lo_feedback [23] ) ) ;
NR2D0BWP30P140HVT ctmi_14644 ( .A1 ( ctmn_13341 ) , .A2 ( acc_load ) , 
    .ZN ( \u_mac_and_scale/gated_lo_feedback [22] ) ) ;
NR2D0BWP30P140HVT ctmi_14646 ( .A1 ( ctmn_13342 ) , .A2 ( HFSNET_20 ) , 
    .ZN ( \u_mac_and_scale/gated_lo_feedback [21] ) ) ;
NR2D0BWP30P140HVT ctmi_14648 ( .A1 ( ctmn_13343 ) , .A2 ( acc_load ) , 
    .ZN ( \u_mac_and_scale/gated_lo_feedback [20] ) ) ;
NR2D0BWP30P140HVT ctmi_14650 ( .A1 ( ctmn_13344 ) , .A2 ( HFSNET_20 ) , 
    .ZN ( \u_mac_and_scale/gated_lo_feedback [19] ) ) ;
NR2D0BWP30P140HVT ctmi_14652 ( .A1 ( ctmn_13345 ) , .A2 ( acc_load ) , 
    .ZN ( \u_mac_and_scale/gated_lo_feedback [18] ) ) ;
NR2D0BWP30P140HVT ctmi_14654 ( .A1 ( ctmn_13346 ) , .A2 ( HFSNET_20 ) , 
    .ZN ( \u_mac_and_scale/gated_lo_feedback [17] ) ) ;
NR2D0BWP30P140HVT ctmi_14656 ( .A1 ( ctmn_13347 ) , .A2 ( acc_load ) , 
    .ZN ( \u_mac_and_scale/gated_lo_feedback [16] ) ) ;
NR2D0BWP30P140HVT ctmi_14658 ( .A1 ( ctmn_13348 ) , .A2 ( acc_load ) , 
    .ZN ( \u_mac_and_scale/gated_lo_feedback [15] ) ) ;
NR2D0BWP30P140HVT ctmi_14660 ( .A1 ( ctmn_13349 ) , .A2 ( acc_load ) , 
    .ZN ( \u_mac_and_scale/gated_lo_feedback [14] ) ) ;
NR2D0BWP30P140HVT ctmi_14662 ( .A1 ( ctmn_13350 ) , .A2 ( acc_load ) , 
    .ZN ( \u_mac_and_scale/gated_lo_feedback [13] ) ) ;
NR2D0BWP30P140HVT ctmi_14664 ( .A1 ( ctmn_13351 ) , .A2 ( acc_load ) , 
    .ZN ( \u_mac_and_scale/gated_lo_feedback [12] ) ) ;
NR2D0BWP30P140HVT ctmi_14666 ( .A1 ( ctmn_13352 ) , .A2 ( acc_load ) , 
    .ZN ( \u_mac_and_scale/gated_lo_feedback [11] ) ) ;
NR2D0BWP30P140HVT ctmi_14668 ( .A1 ( ctmn_13353 ) , .A2 ( acc_load ) , 
    .ZN ( \u_mac_and_scale/gated_lo_feedback [10] ) ) ;
NR2D0BWP30P140HVT ctmi_14670 ( .A1 ( ctmn_13354 ) , .A2 ( acc_load ) , 
    .ZN ( \u_mac_and_scale/gated_lo_feedback [9] ) ) ;
NR2D0BWP30P140HVT ctmi_14672 ( .A1 ( ctmn_13355 ) , .A2 ( acc_load ) , 
    .ZN ( \u_mac_and_scale/gated_lo_feedback [8] ) ) ;
NR2D0BWP30P140HVT ctmi_14674 ( .A1 ( ctmn_13356 ) , .A2 ( acc_load ) , 
    .ZN ( \u_mac_and_scale/gated_lo_feedback [7] ) ) ;
NR2D0BWP30P140HVT ctmi_14676 ( .A1 ( ctmn_13357 ) , .A2 ( acc_load ) , 
    .ZN ( \u_mac_and_scale/gated_lo_feedback [6] ) ) ;
NR2D0BWP30P140HVT ctmi_14678 ( .A1 ( ctmn_13358 ) , .A2 ( acc_load ) , 
    .ZN ( \u_mac_and_scale/gated_lo_feedback [5] ) ) ;
NR2D0BWP30P140HVT ctmi_14680 ( .A1 ( ctmn_13359 ) , .A2 ( acc_load ) , 
    .ZN ( \u_mac_and_scale/gated_lo_feedback [4] ) ) ;
NR2D0BWP30P140HVT ctmi_14682 ( .A1 ( ctmn_13360 ) , .A2 ( acc_load ) , 
    .ZN ( \u_mac_and_scale/gated_lo_feedback [3] ) ) ;
NR2D0BWP30P140HVT ctmi_14684 ( .A1 ( ctmn_13361 ) , .A2 ( acc_load ) , 
    .ZN ( \u_mac_and_scale/gated_lo_feedback [2] ) ) ;
NR2D0BWP30P140HVT ctmi_14686 ( .A1 ( ctmn_13362 ) , .A2 ( acc_load ) , 
    .ZN ( \u_mac_and_scale/gated_lo_feedback [1] ) ) ;
NR2D0BWP30P140HVT ctmi_14688 ( .A1 ( ctmn_13363 ) , .A2 ( acc_load ) , 
    .ZN ( \u_mac_and_scale/gated_lo_feedback [0] ) ) ;
NR2D0BWP30P140HVT ctmi_14690 ( .A1 ( ctmn_13364 ) , .A2 ( HFSNET_13 ) , 
    .ZN ( \u_mac_and_scale/gated_hi_feedback [31] ) ) ;
AN2D0BWP30P140HVT ctmi_14692 ( .A1 ( HFSNET_14 ) , .A2 ( accumulator[62] ) , 
    .Z ( \u_mac_and_scale/gated_hi_feedback [30] ) ) ;
AN2D0BWP30P140HVT ctmi_14693 ( .A1 ( HFSNET_14 ) , .A2 ( accumulator[61] ) , 
    .Z ( \u_mac_and_scale/gated_hi_feedback [29] ) ) ;
NR2D0BWP30P140HVT ctmi_14694 ( .A1 ( ctmn_13365 ) , .A2 ( HFSNET_13 ) , 
    .ZN ( \u_mac_and_scale/gated_hi_feedback [28] ) ) ;
AN2D0BWP30P140HVT ctmi_14696 ( .A1 ( HFSNET_14 ) , .A2 ( accumulator[59] ) , 
    .Z ( \u_mac_and_scale/gated_hi_feedback [27] ) ) ;
AN2D0BWP30P140HVT ctmi_14697 ( .A1 ( HFSNET_14 ) , .A2 ( accumulator[58] ) , 
    .Z ( \u_mac_and_scale/gated_hi_feedback [26] ) ) ;
AN2D0BWP30P140HVT ctmi_14698 ( .A1 ( HFSNET_14 ) , .A2 ( accumulator[57] ) , 
    .Z ( \u_mac_and_scale/gated_hi_feedback [25] ) ) ;
NR2D0BWP30P140HVT ctmi_14699 ( .A1 ( ctmn_13366 ) , .A2 ( HFSNET_13 ) , 
    .ZN ( \u_mac_and_scale/gated_hi_feedback [24] ) ) ;
NR2D0BWP30P140HVT ctmi_14701 ( .A1 ( ctmn_13367 ) , .A2 ( HFSNET_13 ) , 
    .ZN ( \u_mac_and_scale/gated_hi_feedback [23] ) ) ;
AN2D0BWP30P140HVT ctmi_14703 ( .A1 ( HFSNET_14 ) , .A2 ( accumulator[54] ) , 
    .Z ( \u_mac_and_scale/gated_hi_feedback [22] ) ) ;
AN2D0BWP30P140HVT ctmi_14704 ( .A1 ( HFSNET_14 ) , .A2 ( accumulator[53] ) , 
    .Z ( \u_mac_and_scale/gated_hi_feedback [21] ) ) ;
NR2D0BWP30P140HVT ctmi_14705 ( .A1 ( ctmn_13368 ) , .A2 ( HFSNET_13 ) , 
    .ZN ( \u_mac_and_scale/gated_hi_feedback [20] ) ) ;
AN2D0BWP30P140HVT ctmi_14707 ( .A1 ( HFSNET_14 ) , .A2 ( accumulator[51] ) , 
    .Z ( \u_mac_and_scale/gated_hi_feedback [19] ) ) ;
NR2D0BWP30P140HVT ctmi_14708 ( .A1 ( ctmn_13369 ) , .A2 ( HFSNET_13 ) , 
    .ZN ( \u_mac_and_scale/gated_hi_feedback [18] ) ) ;
NR2D0BWP30P140HVT ctmi_14710 ( .A1 ( ctmn_13370 ) , .A2 ( HFSNET_13 ) , 
    .ZN ( \u_mac_and_scale/gated_hi_feedback [17] ) ) ;
NR2D0BWP30P140HVT ctmi_14712 ( .A1 ( ctmn_13371 ) , .A2 ( HFSNET_13 ) , 
    .ZN ( \u_mac_and_scale/gated_hi_feedback [16] ) ) ;
NR2D0BWP30P140HVT ctmi_14714 ( .A1 ( ctmn_13372 ) , .A2 ( HFSNET_13 ) , 
    .ZN ( \u_mac_and_scale/gated_hi_feedback [15] ) ) ;
NR2D0BWP30P140HVT ctmi_14716 ( .A1 ( ctmn_13373 ) , .A2 ( HFSNET_13 ) , 
    .ZN ( \u_mac_and_scale/gated_hi_feedback [14] ) ) ;
NR2D0BWP30P140HVT ctmi_14718 ( .A1 ( ctmn_13374 ) , .A2 ( HFSNET_13 ) , 
    .ZN ( \u_mac_and_scale/gated_hi_feedback [13] ) ) ;
NR2D0BWP30P140HVT ctmi_14720 ( .A1 ( ctmn_13375 ) , .A2 ( HFSNET_13 ) , 
    .ZN ( \u_mac_and_scale/gated_hi_feedback [12] ) ) ;
NR2D0BWP30P140HVT ctmi_14722 ( .A1 ( ctmn_13376 ) , .A2 ( HFSNET_13 ) , 
    .ZN ( \u_mac_and_scale/gated_hi_feedback [11] ) ) ;
NR2D0BWP30P140HVT ctmi_14724 ( .A1 ( ctmn_13377 ) , .A2 ( HFSNET_13 ) , 
    .ZN ( \u_mac_and_scale/gated_hi_feedback [10] ) ) ;
NR2D0BWP30P140HVT ctmi_14726 ( .A1 ( ctmn_13378 ) , .A2 ( HFSNET_13 ) , 
    .ZN ( \u_mac_and_scale/gated_hi_feedback [9] ) ) ;
NR2D0BWP30P140HVT ctmi_14728 ( .A1 ( ctmn_13379 ) , .A2 ( HFSNET_13 ) , 
    .ZN ( \u_mac_and_scale/gated_hi_feedback [8] ) ) ;
NR2D0BWP30P140HVT ctmi_14730 ( .A1 ( ctmn_13380 ) , .A2 ( HFSNET_13 ) , 
    .ZN ( \u_mac_and_scale/gated_hi_feedback [7] ) ) ;
NR2D0BWP30P140HVT ctmi_14732 ( .A1 ( ctmn_13381 ) , .A2 ( HFSNET_13 ) , 
    .ZN ( \u_mac_and_scale/gated_hi_feedback [6] ) ) ;
NR2D0BWP30P140HVT ctmi_14734 ( .A1 ( ctmn_13382 ) , .A2 ( HFSNET_13 ) , 
    .ZN ( \u_mac_and_scale/gated_hi_feedback [5] ) ) ;
NR2D0BWP30P140HVT ctmi_14736 ( .A1 ( ctmn_13383 ) , .A2 ( HFSNET_13 ) , 
    .ZN ( \u_mac_and_scale/gated_hi_feedback [4] ) ) ;
NR2D0BWP30P140HVT ctmi_14738 ( .A1 ( ctmn_13384 ) , .A2 ( HFSNET_13 ) , 
    .ZN ( \u_mac_and_scale/gated_hi_feedback [3] ) ) ;
NR2D0BWP30P140HVT ctmi_14740 ( .A1 ( ctmn_13385 ) , .A2 ( HFSNET_13 ) , 
    .ZN ( \u_mac_and_scale/gated_hi_feedback [2] ) ) ;
NR2D0BWP30P140HVT ctmi_14742 ( .A1 ( ctmn_13386 ) , .A2 ( HFSNET_13 ) , 
    .ZN ( \u_mac_and_scale/gated_hi_feedback [1] ) ) ;
NR2D0BWP30P140HVT ctmi_14744 ( .A1 ( ctmn_13387 ) , .A2 ( HFSNET_13 ) , 
    .ZN ( \u_mac_and_scale/gated_hi_feedback [0] ) ) ;
NR2D0BWP30P140HVT ctmi_14746 ( .A1 ( phfnn_924 ) , .A2 ( HFSNET_4 ) , 
    .ZN ( \u_mac_and_scale/gated_hi_addend [31] ) ) ;
CKND0BWP30P140HVT phfnr_buf_5200 ( .I ( ctmn_13510 ) , .ZN ( phfnn_3730 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5201 ( .I ( ctmn_13564 ) , .ZN ( phfnn_3731 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5202 ( .I ( ctmn_13619 ) , .ZN ( phfnn_3732 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5207 ( .I ( ctmn_13838 ) , .ZN ( phfnn_3737 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5208 ( .I ( ctmn_13895 ) , .ZN ( phfnn_3738 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5189 ( .I ( ctmn_13849 ) , .ZN ( phfnn_3719 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5190 ( .I ( ctmn_13906 ) , .ZN ( phfnn_3720 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5369 ( .I ( N48 ) , .ZN ( phfnn_3899 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5195 ( .I ( phfnn_2415 ) , .ZN ( phfnn_3725 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5368 ( .I ( N49 ) , .ZN ( phfnn_3898 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5196 ( .I ( phfnn_2416 ) , .ZN ( phfnn_3726 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5367 ( .I ( N50 ) , .ZN ( phfnn_3897 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5198 ( .I ( phfnn_2418 ) , .ZN ( phfnn_3728 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5366 ( .I ( N51 ) , .ZN ( phfnn_3896 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5197 ( .I ( phfnn_2417 ) , .ZN ( phfnn_3727 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5365 ( .I ( N52 ) , .ZN ( phfnn_3895 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5209 ( .I ( ctmn_14583 ) , .ZN ( phfnn_3739 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5364 ( .I ( N53 ) , .ZN ( phfnn_3894 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5210 ( .I ( ctmn_14514 ) , .ZN ( phfnn_3740 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5362 ( .I ( N54 ) , .ZN ( phfnn_3892 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5211 ( .I ( ctmn_14193 ) , .ZN ( phfnn_3741 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5212 ( .I ( ctmn_14233 ) , .ZN ( phfnn_3742 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5213 ( .I ( ctmn_14273 ) , .ZN ( phfnn_3743 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5214 ( .I ( ctmn_13524 ) , .ZN ( phfnn_3744 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5215 ( .I ( ctmn_13470 ) , .ZN ( phfnn_3745 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5216 ( .I ( phfnn_748 ) , .ZN ( phfnn_3746 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5217 ( .I ( phfnn_3124 ) , .ZN ( phfnn_3747 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5218 ( .I ( phfnn_3110 ) , .ZN ( phfnn_3748 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5224 ( .I ( ctmn_14201 ) , .ZN ( phfnn_3754 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5226 ( .I ( ctmn_14241 ) , .ZN ( phfnn_3756 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5228 ( .I ( ctmn_14281 ) , .ZN ( phfnn_3758 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5219 ( .I ( phfnn_3120 ) , .ZN ( phfnn_3749 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5222 ( .I ( ctmn_13743 ) , .ZN ( phfnn_3752 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5223 ( .I ( ctmn_14198 ) , .ZN ( phfnn_3753 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5220 ( .I ( phfnn_3114 ) , .ZN ( phfnn_3750 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5221 ( .I ( phfnn_3115 ) , .ZN ( phfnn_3751 ) ) ;
CKND0BWP30P140HVT HFSINV_809_5416 ( .I ( acc_load ) , .ZN ( HFSNET_19 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5225 ( .I ( ctmn_14238 ) , .ZN ( phfnn_3755 ) ) ;
AOI21D0BWP30P140HVT ctmi_14795 ( .A1 ( ctmn_13414 ) , .A2 ( ctmn_13416 ) , 
    .B ( HFSNET_25 ) , .ZN ( \u_mac_and_scale/gated_hi_addend [7] ) ) ;
AOI22D0BWP30P140HVT ctmi_14796 ( .A1 ( HFSNET_10 ) , .A2 ( N48 ) , 
    .B1 ( N56 ) , .B2 ( HFSNET_5 ) , .ZN ( ctmn_13414 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5266 ( .I ( ctmn_13482 ) , .ZN ( phfnn_3796 ) ) ;
AOI22D0BWP30P140HVT ctmi_14798 ( .A1 ( HFSNET_8 ) , .A2 ( N40 ) , 
    .B1 ( HFSNET_13 ) , .B2 ( phfnn_3907 ) , .ZN ( ctmn_13416 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5227 ( .I ( ctmn_14278 ) , .ZN ( phfnn_3757 ) ) ;
AOI21D0BWP30P140HVT ctmi_14800 ( .A1 ( ctmn_13417 ) , .A2 ( ctmn_13418 ) , 
    .B ( HFSNET_25 ) , .ZN ( \u_mac_and_scale/gated_hi_addend [6] ) ) ;
AOI22D0BWP30P140HVT ctmi_14801 ( .A1 ( HFSNET_10 ) , .A2 ( N49 ) , 
    .B1 ( N57 ) , .B2 ( HFSNET_5 ) , .ZN ( ctmn_13417 ) ) ;
AOI22D0BWP30P140HVT ctmi_14802 ( .A1 ( HFSNET_8 ) , .A2 ( N41 ) , 
    .B1 ( HFSNET_13 ) , .B2 ( N33 ) , .ZN ( ctmn_13418 ) ) ;
AOI21D0BWP30P140HVT ctmi_14803 ( .A1 ( ctmn_13419 ) , .A2 ( ctmn_13420 ) , 
    .B ( HFSNET_25 ) , .ZN ( \u_mac_and_scale/gated_hi_addend [5] ) ) ;
AOI22D0BWP30P140HVT ctmi_14804 ( .A1 ( HFSNET_10 ) , .A2 ( N50 ) , 
    .B1 ( N58 ) , .B2 ( HFSNET_5 ) , .ZN ( ctmn_13419 ) ) ;
AOI22D0BWP30P140HVT ctmi_14805 ( .A1 ( HFSNET_8 ) , .A2 ( N42 ) , 
    .B1 ( HFSNET_13 ) , .B2 ( N34 ) , .ZN ( ctmn_13420 ) ) ;
AOI21D0BWP30P140HVT ctmi_14806 ( .A1 ( ctmn_13421 ) , .A2 ( ctmn_13422 ) , 
    .B ( HFSNET_25 ) , .ZN ( \u_mac_and_scale/gated_hi_addend [4] ) ) ;
AOI22D0BWP30P140HVT ctmi_14807 ( .A1 ( HFSNET_10 ) , .A2 ( N51 ) , 
    .B1 ( N59 ) , .B2 ( HFSNET_5 ) , .ZN ( ctmn_13421 ) ) ;
AOI22D0BWP30P140HVT ctmi_14808 ( .A1 ( HFSNET_8 ) , .A2 ( N43 ) , 
    .B1 ( HFSNET_13 ) , .B2 ( N35 ) , .ZN ( ctmn_13422 ) ) ;
AOI21D0BWP30P140HVT ctmi_14809 ( .A1 ( ctmn_13423 ) , .A2 ( ctmn_13424 ) , 
    .B ( HFSNET_25 ) , .ZN ( \u_mac_and_scale/gated_hi_addend [3] ) ) ;
AOI22D0BWP30P140HVT ctmi_14810 ( .A1 ( HFSNET_10 ) , .A2 ( N52 ) , 
    .B1 ( N60 ) , .B2 ( HFSNET_5 ) , .ZN ( ctmn_13423 ) ) ;
AOI22D0BWP30P140HVT ctmi_14811 ( .A1 ( HFSNET_8 ) , .A2 ( N44 ) , 
    .B1 ( HFSNET_13 ) , .B2 ( N36 ) , .ZN ( ctmn_13424 ) ) ;
AOI21D0BWP30P140HVT ctmi_14812 ( .A1 ( ctmn_13425 ) , .A2 ( ctmn_13426 ) , 
    .B ( HFSNET_25 ) , .ZN ( \u_mac_and_scale/gated_hi_addend [2] ) ) ;
AOI22D0BWP30P140HVT ctmi_14813 ( .A1 ( HFSNET_10 ) , .A2 ( N53 ) , 
    .B1 ( N61 ) , .B2 ( phfnn_639 ) , .ZN ( ctmn_13425 ) ) ;
AOI22D0BWP30P140HVT ctmi_14814 ( .A1 ( HFSNET_8 ) , .A2 ( N45 ) , 
    .B1 ( HFSNET_13 ) , .B2 ( N37 ) , .ZN ( ctmn_13426 ) ) ;
AOI21D0BWP30P140HVT ctmi_14815 ( .A1 ( ctmn_13427 ) , .A2 ( ctmn_13428 ) , 
    .B ( HFSNET_25 ) , .ZN ( \u_mac_and_scale/gated_hi_addend [1] ) ) ;
AOI22D0BWP30P140HVT ctmi_14816 ( .A1 ( HFSNET_10 ) , .A2 ( N54 ) , 
    .B1 ( N62 ) , .B2 ( phfnn_639 ) , .ZN ( ctmn_13427 ) ) ;
AOI22D0BWP30P140HVT ctmi_14817 ( .A1 ( HFSNET_8 ) , .A2 ( N46 ) , 
    .B1 ( HFSNET_13 ) , .B2 ( N38 ) , .ZN ( ctmn_13428 ) ) ;
AOI21D0BWP30P140HVT ctmi_14818 ( .A1 ( ctmn_13429 ) , .A2 ( ctmn_13430 ) , 
    .B ( HFSNET_25 ) , .ZN ( \u_mac_and_scale/gated_hi_addend [0] ) ) ;
AOI22D0BWP30P140HVT ctmi_14819 ( .A1 ( HFSNET_10 ) , .A2 ( phfnn_3891 ) , 
    .B1 ( N63 ) , .B2 ( phfnn_639 ) , .ZN ( ctmn_13429 ) ) ;
AOI22D0BWP30P140HVT ctmi_14820 ( .A1 ( HFSNET_8 ) , .A2 ( N47 ) , 
    .B1 ( HFSNET_13 ) , .B2 ( N39 ) , .ZN ( ctmn_13430 ) ) ;
AN2D0BWP30P140HVT ctmi_14821 ( .A1 ( HFSNET_26 ) , 
    .A2 ( \u_mac_and_scale/lower_sum [32] ) , 
    .Z ( \u_mac_and_scale/gated_carry ) ) ;
AN2D0BWP30P140HVT ctmi_14822 ( .A1 ( ctmn_13318 ) , .A2 ( pe_opcode[1] ) , 
    .Z ( \u_controller/N4 ) ) ;
AN2D0BWP30P140HVT ctmi_14823 ( .A1 ( ctmn_13318 ) , .A2 ( pe_opcode[2] ) , 
    .Z ( \u_controller/N3 ) ) ;
AN2D0BWP30P140HVT ctmi_14824 ( .A1 ( ctmn_13318 ) , .A2 ( pe_opcode[3] ) , 
    .Z ( \u_controller/N2 ) ) ;
AN2D0BWP30P140HVT ctmi_14825 ( .A1 ( ctmn_13318 ) , .A2 ( pe_opcode[4] ) , 
    .Z ( \u_controller/N1 ) ) ;
AN2D0BWP30P140HVT ctmi_14827 ( .A1 ( phfnn_645 ) , 
    .A2 ( \u_mac_and_scale/lower_sum [30] ) , .Z ( \u_mac_and_scale/N47 ) ) ;
AN2D0BWP30P140HVT ctmi_14828 ( .A1 ( phfnn_645 ) , 
    .A2 ( \u_mac_and_scale/lower_sum [29] ) , .Z ( \u_mac_and_scale/N48 ) ) ;
AN2D0BWP30P140HVT ctmi_14829 ( .A1 ( phfnn_645 ) , 
    .A2 ( \u_mac_and_scale/lower_sum [28] ) , .Z ( \u_mac_and_scale/N49 ) ) ;
AN2D0BWP30P140HVT ctmi_14830 ( .A1 ( phfnn_645 ) , 
    .A2 ( \u_mac_and_scale/lower_sum [27] ) , .Z ( \u_mac_and_scale/N50 ) ) ;
AN2D0BWP30P140HVT ctmi_14831 ( .A1 ( phfnn_645 ) , 
    .A2 ( \u_mac_and_scale/lower_sum [26] ) , .Z ( \u_mac_and_scale/N51 ) ) ;
AN2D0BWP30P140HVT ctmi_14832 ( .A1 ( phfnn_645 ) , 
    .A2 ( \u_mac_and_scale/lower_sum [25] ) , .Z ( \u_mac_and_scale/N52 ) ) ;
AN2D0BWP30P140HVT ctmi_14833 ( .A1 ( phfnn_645 ) , 
    .A2 ( \u_mac_and_scale/lower_sum [24] ) , .Z ( \u_mac_and_scale/N53 ) ) ;
AN2D0BWP30P140HVT ctmi_14834 ( .A1 ( phfnn_645 ) , 
    .A2 ( \u_mac_and_scale/lower_sum [23] ) , .Z ( \u_mac_and_scale/N54 ) ) ;
CKLNQD1BWP30P140 \clock_gate_u_controller/config_reg_reg ( .CP ( clk ) , 
    .E ( \u_controller/N40 ) , .TE ( optlc_net_4013 ) , 
    .Q ( \clk_clock_gate_u_controller/config_reg_reg ) ) ;
AN2D0BWP30P140HVT ctmi_14835 ( .A1 ( phfnn_645 ) , 
    .A2 ( \u_mac_and_scale/lower_sum [22] ) , .Z ( \u_mac_and_scale/N55 ) ) ;
AN2D0BWP30P140HVT ctmi_14836 ( .A1 ( phfnn_645 ) , 
    .A2 ( \u_mac_and_scale/lower_sum [21] ) , .Z ( \u_mac_and_scale/N56 ) ) ;
AN2D0BWP30P140HVT ctmi_14837 ( .A1 ( phfnn_645 ) , 
    .A2 ( \u_mac_and_scale/lower_sum [20] ) , .Z ( \u_mac_and_scale/N57 ) ) ;
AN2D0BWP30P140HVT ctmi_14838 ( .A1 ( phfnn_645 ) , 
    .A2 ( \u_mac_and_scale/lower_sum [19] ) , .Z ( \u_mac_and_scale/N58 ) ) ;
AN2D0BWP30P140HVT ctmi_14839 ( .A1 ( phfnn_645 ) , 
    .A2 ( \u_mac_and_scale/lower_sum [18] ) , .Z ( \u_mac_and_scale/N59 ) ) ;
AN2D0BWP30P140HVT ctmi_14840 ( .A1 ( phfnn_645 ) , 
    .A2 ( \u_mac_and_scale/lower_sum [17] ) , .Z ( \u_mac_and_scale/N60 ) ) ;
AN2D0BWP30P140HVT ctmi_14841 ( .A1 ( phfnn_645 ) , 
    .A2 ( \u_mac_and_scale/lower_sum [16] ) , .Z ( \u_mac_and_scale/N61 ) ) ;
AN2D0BWP30P140HVT ctmi_14842 ( .A1 ( phfnn_645 ) , 
    .A2 ( \u_mac_and_scale/lower_sum [15] ) , .Z ( \u_mac_and_scale/N62 ) ) ;
AN2D0BWP30P140HVT ctmi_14843 ( .A1 ( phfnn_645 ) , 
    .A2 ( \u_mac_and_scale/lower_sum [14] ) , .Z ( \u_mac_and_scale/N63 ) ) ;
AN2D0BWP30P140HVT ctmi_14844 ( .A1 ( phfnn_645 ) , 
    .A2 ( \u_mac_and_scale/lower_sum [13] ) , .Z ( \u_mac_and_scale/N64 ) ) ;
AN2D0BWP30P140HVT ctmi_14845 ( .A1 ( phfnn_645 ) , 
    .A2 ( \u_mac_and_scale/lower_sum [12] ) , .Z ( \u_mac_and_scale/N65 ) ) ;
AN2D0BWP30P140HVT ctmi_14846 ( .A1 ( phfnn_645 ) , 
    .A2 ( \u_mac_and_scale/lower_sum [11] ) , .Z ( \u_mac_and_scale/N66 ) ) ;
AN2D0BWP30P140HVT ctmi_14847 ( .A1 ( phfnn_645 ) , 
    .A2 ( \u_mac_and_scale/lower_sum [10] ) , .Z ( \u_mac_and_scale/N67 ) ) ;
AN2D0BWP30P140HVT ctmi_14848 ( .A1 ( phfnn_645 ) , 
    .A2 ( \u_mac_and_scale/lower_sum [9] ) , .Z ( \u_mac_and_scale/N68 ) ) ;
AN2D0BWP30P140HVT ctmi_14849 ( .A1 ( phfnn_645 ) , 
    .A2 ( \u_mac_and_scale/lower_sum [8] ) , .Z ( \u_mac_and_scale/N69 ) ) ;
AN2D0BWP30P140HVT ctmi_14850 ( .A1 ( phfnn_645 ) , 
    .A2 ( \u_mac_and_scale/lower_sum [7] ) , .Z ( \u_mac_and_scale/N70 ) ) ;
AN2D0BWP30P140HVT ctmi_14851 ( .A1 ( phfnn_645 ) , 
    .A2 ( \u_mac_and_scale/lower_sum [6] ) , .Z ( \u_mac_and_scale/N71 ) ) ;
AN2D0BWP30P140HVT ctmi_14852 ( .A1 ( phfnn_645 ) , 
    .A2 ( \u_mac_and_scale/lower_sum [5] ) , .Z ( \u_mac_and_scale/N72 ) ) ;
AN2D0BWP30P140HVT ctmi_14853 ( .A1 ( phfnn_645 ) , 
    .A2 ( \u_mac_and_scale/lower_sum [4] ) , .Z ( \u_mac_and_scale/N73 ) ) ;
AN2D0BWP30P140HVT ctmi_14854 ( .A1 ( phfnn_645 ) , 
    .A2 ( \u_mac_and_scale/lower_sum [3] ) , .Z ( \u_mac_and_scale/N74 ) ) ;
AN2D0BWP30P140HVT ctmi_14855 ( .A1 ( phfnn_645 ) , 
    .A2 ( \u_mac_and_scale/lower_sum [2] ) , .Z ( \u_mac_and_scale/N75 ) ) ;
AN2D0BWP30P140HVT ctmi_14856 ( .A1 ( phfnn_645 ) , 
    .A2 ( \u_mac_and_scale/lower_sum [1] ) , .Z ( \u_mac_and_scale/N76 ) ) ;
AO21D0BWP30P140HVT ctmTdsLR_1_3543 ( .A1 ( N210 ) , .A2 ( HFSNET_22 ) , 
    .B ( \RS_OP_250_54632_65499_J1/ctmn_154 ) , .Z ( N269 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5230 ( .I ( phfnn_747 ) , .ZN ( phfnn_3760 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5229 ( .I ( ctmn_14581 ) , .ZN ( phfnn_3759 ) ) ;
IND2D1BWP30P140HVT ctmTdsLR_1_3826 ( .A1 ( phfnn_634 ) , .B1 ( ctmn_13315 ) , 
    .ZN ( tmp_net2646 ) ) ;
AOI21D0BWP30P140HVT ctmi_14863 ( .A1 ( operand_A_reg[18] ) , 
    .A2 ( HFSNET_28 ) , .B ( ctmn_13437 ) , .ZN ( ctmn_13438 ) ) ;
AOI21D0BWP30P140HVT ctmi_14864 ( .A1 ( ctmn_13435 ) , .A2 ( ctmn_13436 ) , 
    .B ( HFSNET_25 ) , .ZN ( ctmn_13437 ) ) ;
AOI22D0BWP30P140HVT ctmi_14865 ( .A1 ( ctmn_13309 ) , 
    .A2 ( \u_mac_and_scale/holding_reg [10] ) , .B1 ( HFSNET_7 ) , 
    .B2 ( \u_mac_and_scale/holding_reg [2] ) , .ZN ( ctmn_13435 ) ) ;
AOI22D0BWP30P140HVT ctmi_14866 ( .A1 ( HFSNET_17 ) , .A2 ( accumulator[2] ) , 
    .B1 ( \u_mac_and_scale/holding_reg [18] ) , .B2 ( phfnn_639 ) , 
    .ZN ( ctmn_13436 ) ) ;
NR2D0BWP30P140HVT ctmi_14867 ( .A1 ( ctmn_13440 ) , .A2 ( phfnn_3726 ) , 
    .ZN ( N9352 ) ) ;
ND2D0BWP30P140HVT ctmi_14868 ( .A1 ( operand_B_reg[20] ) , .A2 ( HFSNET_15 ) , 
    .ZN ( ctmn_13440 ) ) ;
ND3D0BWP30P140HVT ctmTdsLR_1_3552 ( .A1 ( N255 ) , 
    .A2 ( \u_mac_and_scale/N7 ) , .A3 ( ctmn_13952 ) , .ZN ( tmp_net2647 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5231 ( .I ( phfnn_3123 ) , .ZN ( phfnn_3761 ) ) ;
AOI21D0BWP30P140HVT ctmi_14871 ( .A1 ( ctmn_13441 ) , .A2 ( ctmn_13442 ) , 
    .B ( HFSNET_25 ) , .ZN ( ctmn_13443 ) ) ;
AOI22D0BWP30P140HVT ctmi_14872 ( .A1 ( ctmn_13309 ) , 
    .A2 ( \u_mac_and_scale/holding_reg [11] ) , .B1 ( HFSNET_7 ) , 
    .B2 ( \u_mac_and_scale/holding_reg [3] ) , .ZN ( ctmn_13441 ) ) ;
AOI22D0BWP30P140HVT ctmi_14873 ( .A1 ( HFSNET_17 ) , .A2 ( accumulator[3] ) , 
    .B1 ( \u_mac_and_scale/holding_reg [19] ) , .B2 ( phfnn_639 ) , 
    .ZN ( ctmn_13442 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5232 ( .I ( phfnn_3122 ) , .ZN ( phfnn_3762 ) ) ;
ND2D0BWP30P140HVT ctmi_14875 ( .A1 ( ctmn_13446 ) , .A2 ( phfnn_3721 ) , 
    .ZN ( ctmn_13452 ) ) ;
NR2D0BWP30P140HVT ctmi_14876 ( .A1 ( ctmn_13445 ) , .A2 ( HFSNET_18 ) , 
    .ZN ( ctmn_13446 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5233 ( .I ( phfnn_3121 ) , .ZN ( phfnn_3763 ) ) ;
AOI21D0BWP30P140HVT ctmi_14878 ( .A1 ( operand_A_reg[17] ) , 
    .A2 ( HFSNET_28 ) , .B ( ctmn_13449 ) , .ZN ( ctmn_13450 ) ) ;
AOI21D0BWP30P140HVT ctmi_14879 ( .A1 ( ctmn_13447 ) , .A2 ( ctmn_13448 ) , 
    .B ( HFSNET_25 ) , .ZN ( ctmn_13449 ) ) ;
AOI22D0BWP30P140HVT ctmi_14880 ( .A1 ( ctmn_13309 ) , 
    .A2 ( \u_mac_and_scale/holding_reg [9] ) , .B1 ( HFSNET_8 ) , 
    .B2 ( \u_mac_and_scale/holding_reg [1] ) , .ZN ( ctmn_13447 ) ) ;
AOI22D0BWP30P140HVT ctmi_14881 ( .A1 ( HFSNET_17 ) , .A2 ( accumulator[1] ) , 
    .B1 ( \u_mac_and_scale/holding_reg [17] ) , .B2 ( phfnn_639 ) , 
    .ZN ( ctmn_13448 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5234 ( .I ( phfnn_2465 ) , .ZN ( phfnn_3764 ) ) ;
AOI21D0BWP30P140HVT ctmi_14883 ( .A1 ( operand_A_reg[16] ) , 
    .A2 ( HFSNET_28 ) , .B ( ctmn_13455 ) , .ZN ( ctmn_13456 ) ) ;
AOI21D0BWP30P140HVT ctmi_14884 ( .A1 ( ctmn_13453 ) , .A2 ( ctmn_13454 ) , 
    .B ( HFSNET_25 ) , .ZN ( ctmn_13455 ) ) ;
AOI22D0BWP30P140HVT ctmi_14885 ( .A1 ( ctmn_13309 ) , 
    .A2 ( \u_mac_and_scale/holding_reg [8] ) , .B1 ( HFSNET_7 ) , 
    .B2 ( \u_mac_and_scale/holding_reg [0] ) , .ZN ( ctmn_13453 ) ) ;
AOI22D0BWP30P140HVT ctmi_14886 ( .A1 ( HFSNET_17 ) , .A2 ( accumulator[0] ) , 
    .B1 ( \u_mac_and_scale/holding_reg [16] ) , .B2 ( phfnn_639 ) , 
    .ZN ( ctmn_13454 ) ) ;
AOI21D0BWP30P140HVT ctmi_14887 ( .A1 ( ctmn_13452 ) , .A2 ( ctmn_13460 ) , 
    .B ( N164 ) , .ZN ( N9364 ) ) ;
ND2D0BWP30P140HVT ctmi_14888 ( .A1 ( ctmn_13458 ) , .A2 ( phfnn_3729 ) , 
    .ZN ( ctmn_13460 ) ) ;
NR2D0BWP30P140HVT ctmi_14889 ( .A1 ( ctmn_13457 ) , .A2 ( HFSNET_18 ) , 
    .ZN ( ctmn_13458 ) ) ;
IOA21D0BWP30P140HVT ctmTdsLR_2_3553 ( .A1 ( N244 ) , .A2 ( phfnn_648 ) , 
    .B ( tmp_net2647 ) , .ZN ( \RS_OP_250_54632_65499_J1/N7 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5237 ( .I ( ctmn_13670 ) , .ZN ( phfnn_3767 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5238 ( .I ( ctmn_13784 ) , .ZN ( phfnn_3768 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5277 ( .I ( N9827 ) , .ZN ( phfnn_3807 ) ) ;
NR2D0BWP30P140HVT ctmi_14894 ( .A1 ( ctmn_13440 ) , .A2 ( ctmn_13438 ) , 
    .ZN ( N9365 ) ) ;
NR2D0BWP30P140HVT ctmi_14895 ( .A1 ( N165 ) , .A2 ( ctmn_13463 ) , 
    .ZN ( N9369 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5239 ( .I ( ctmn_13840 ) , .ZN ( phfnn_3769 ) ) ;
NR2D0BWP30P140HVT ctmi_14897 ( .A1 ( ctmn_13440 ) , .A2 ( ctmn_13456 ) , 
    .ZN ( \u_mac_and_scale/mult_2/mult01 [0] ) ) ;
CKND0BWP30P140HVT phfnr_buf_5235 ( .I ( ctmn_14020 ) , .ZN ( phfnn_3765 ) ) ;
AOI22D0BWP30P140HVT ctmi_1456 ( .A1 ( phfnn_3121 ) , .A2 ( phfnn_1888 ) , 
    .B1 ( ctmn_13970 ) , .B2 ( phfnn_3749 ) , .ZN ( ctmn_13997 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5236 ( .I ( phfnn_1888 ) , .ZN ( phfnn_3766 ) ) ;
NR2D0BWP30P140HVT ctmi_14901 ( .A1 ( ctmn_13479 ) , .A2 ( ctmn_13489 ) , 
    .ZN ( ctmn_13490 ) ) ;
MAOI222D0BWP30P140HVT ctmi_14902 ( .A ( ctmn_13469 ) , .B ( ctmn_13475 ) , 
    .C ( ctmn_13478 ) , .ZN ( ctmn_13479 ) ) ;
OA21D0BWP30P140HVT ctmi_14903 ( .A1 ( phfnn_3693 ) , .A2 ( ctmn_13467 ) , 
    .B ( ctmn_13468 ) , .Z ( ctmn_13469 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5240 ( .I ( ctmn_13750 ) , .ZN ( phfnn_3770 ) ) ;
ND2D0BWP30P140HVT ctmi_14905 ( .A1 ( ctmn_13465 ) , .A2 ( phfnn_2416 ) , 
    .ZN ( ctmn_13467 ) ) ;
NR2D0BWP30P140HVT ctmi_14906 ( .A1 ( phfnn_3695 ) , .A2 ( ctmn_13438 ) , 
    .ZN ( ctmn_13465 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5241 ( .I ( ctmn_14212 ) , .ZN ( phfnn_3771 ) ) ;
OAI22D0BWP30P140HVT ctmi_14908 ( .A1 ( ctmn_13438 ) , .A2 ( phfnn_3695 ) , 
    .B1 ( phfnn_3693 ) , .B2 ( phfnn_3726 ) , .ZN ( ctmn_13468 ) ) ;
AOI21D0BWP30P140HVT ctmi_14909 ( .A1 ( ctmn_13471 ) , .A2 ( ctmn_13472 ) , 
    .B ( N158 ) , .ZN ( ctmn_13475 ) ) ;
ND2D0BWP30P140HVT ctmi_14910 ( .A1 ( ctmn_13470 ) , .A2 ( phfnn_3721 ) , 
    .ZN ( ctmn_13471 ) ) ;
NR2D0BWP30P140HVT ctmi_14911 ( .A1 ( ctmn_13331 ) , .A2 ( phfnn_3695 ) , 
    .ZN ( ctmn_13470 ) ) ;
NR3D0BWP30P140HVT ctmi_14912 ( .A1 ( phfnn_3695 ) , .A2 ( ctmn_13452 ) , 
    .A3 ( ctmn_13438 ) , .ZN ( ctmn_13472 ) ) ;
NR3D0BWP30P140HVT ctmTdsLR_1_3827 ( .A1 ( phfnn_3229 ) , .A2 ( phfnn_867 ) , 
    .A3 ( phfnn_3831 ) , .ZN ( tmp_net2741 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5250 ( .I ( ctmn_13910 ) , .ZN ( phfnn_3780 ) ) ;
MAOI222D0BWP30P140HVT ctmi_14915 ( .A ( N164 ) , .B ( ctmn_13476 ) , 
    .C ( ctmn_13477 ) , .ZN ( ctmn_13478 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5244 ( .I ( ctmn_14134 ) , .ZN ( phfnn_3774 ) ) ;
ND2D0BWP30P140HVT ctmi_14917 ( .A1 ( ctmn_13470 ) , .A2 ( phfnn_3729 ) , 
    .ZN ( ctmn_13477 ) ) ;
MAOI222D0BWP30P140HVT ctmi_14918 ( .A ( ctmn_13487 ) , .B ( ctmn_13481 ) , 
    .C ( ctmn_13488 ) , .ZN ( ctmn_13489 ) ) ;
AO21D0BWP30P140HVT ctmi_14931 ( .A1 ( ctmn_13468 ) , .A2 ( ctmn_13497 ) , 
    .B ( \u_mac_and_scale/mult_2/mult01 [8] ) , 
    .Z ( \u_mac_and_scale/mult_2/mult01 [7] ) ) ;
AOI31D0BWP30P140HVT ctmi_1454 ( .A1 ( ctmn_13438 ) , .A2 ( phfnn_3726 ) , 
    .A3 ( ctmn_928 ) , .B ( phfnn_3745 ) , 
    .ZN ( \u_mac_and_scale/mult_2/mult01 [8] ) ) ;
MAOI222D0BWP30P140HVT ctmi_14919 ( .A ( phfnn_3796 ) , .B ( N11353 ) , 
    .C ( ctmn_13486 ) , .ZN ( ctmn_13487 ) ) ;
ND3D0BWP30P140HVT ctmTdsLR_1_4528 ( .A1 ( \u_mac_and_scale/N7 ) , 
    .A2 ( ctmn_13952 ) , .A3 ( N261 ) , .ZN ( tmp_net3296 ) ) ;
AOI21D0BWP30P140HVT ctmi_14920 ( .A1 ( N9358 ) , .A2 ( ctmn_13480 ) , 
    .B ( ctmn_13481 ) , .ZN ( ctmn_13482 ) ) ;
NR2D0BWP30P140HVT ctmi_14938 ( .A1 ( ctmn_13499 ) , .A2 ( HFSNET_18 ) , 
    .ZN ( ctmn_13500 ) ) ;
OAI33D0BWP30P140HVT ctmi_14921 ( .A1 ( ctmn_13472 ) , .A2 ( ctmn_13438 ) , 
    .A3 ( phfnn_3693 ) , .B1 ( ctmn_13472 ) , .B2 ( phfnn_3695 ) , 
    .B3 ( ctmn_13450 ) , .ZN ( ctmn_13480 ) ) ;
NR2D0BWP30P140HVT ctmi_14922 ( .A1 ( N9358 ) , .A2 ( ctmn_13480 ) , 
    .ZN ( ctmn_13481 ) ) ;
IOA21D0BWP30P140HVT ctmTdsLR_2_4529 ( .A1 ( HFSNET_22 ) , .A2 ( N250 ) , 
    .B ( tmp_net3296 ) , .ZN ( \RS_OP_250_54632_65499_J1/N13 ) ) ;
XOR2UD0BWP30P140HVT ctmi_14924 ( .A1 ( ctmn_13476 ) , .A2 ( ctmn_13485 ) , 
    .Z ( ctmn_13486 ) ) ;
AOI21D0BWP30P140HVT ctmi_14925 ( .A1 ( ctmn_13477 ) , .A2 ( N164 ) , 
    .B ( ctmn_13484 ) , .ZN ( ctmn_13485 ) ) ;
NR2D0BWP30P140HVT ctmi_14926 ( .A1 ( ctmn_13477 ) , .A2 ( N164 ) , 
    .ZN ( ctmn_13484 ) ) ;
XOR3UD0BWP30P140HVT ctmi_14927 ( .A1 ( ctmn_13478 ) , .A2 ( ctmn_13469 ) , 
    .A3 ( ctmn_13475 ) , .Z ( ctmn_13488 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5245 ( .I ( ctmn_14176 ) , .ZN ( phfnn_3775 ) ) ;
OAI21D0BWP30P140HVT ctmi_14929 ( .A1 ( phfnn_3745 ) , .A2 ( ctmn_13467 ) , 
    .B ( ctmn_13492 ) , .ZN ( ctmn_13493 ) ) ;
OAI22D0BWP30P140HVT ctmi_14930 ( .A1 ( ctmn_13438 ) , .A2 ( phfnn_3745 ) , 
    .B1 ( phfnn_3695 ) , .B2 ( phfnn_3726 ) , .ZN ( ctmn_13492 ) ) ;
OAI32D0BWP30P140HVT ctmi_14935 ( .A1 ( N9370 ) , .A2 ( ctmn_13450 ) , 
    .A3 ( ctmn_13440 ) , .B1 ( N9370 ) , .B2 ( ctmn_13498 ) , 
    .ZN ( \u_mac_and_scale/mult_2/mult01 [1] ) ) ;
NR2D0BWP30P140HVT ctmi_14933 ( .A1 ( ctmn_13493 ) , .A2 ( ctmn_13490 ) , 
    .ZN ( ctmn_13497 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5246 ( .I ( ctmn_14033 ) , .ZN ( phfnn_3776 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5247 ( .I ( ctmn_13979 ) , .ZN ( phfnn_3777 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5253 ( .I ( ctmn_13709 ) , .ZN ( phfnn_3783 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5248 ( .I ( ctmn_13812 ) , .ZN ( phfnn_3778 ) ) ;
AOI21D0BWP30P140HVT ctmi_14941 ( .A1 ( operand_A_reg[26] ) , 
    .A2 ( HFSNET_28 ) , .B ( ctmn_13437 ) , .ZN ( ctmn_13502 ) ) ;
NR2D0BWP30P140HVT ctmi_14942 ( .A1 ( ctmn_13503 ) , .A2 ( phfnn_3727 ) , 
    .ZN ( N9452 ) ) ;
ND2D0BWP30P140HVT ctmi_14943 ( .A1 ( operand_B_reg[28] ) , .A2 ( HFSNET_15 ) , 
    .ZN ( ctmn_13503 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5242 ( .I ( ctmn_14252 ) , .ZN ( phfnn_3772 ) ) ;
AN3D0BWP30P140HVT ctmTdsLR_1_3563 ( 
    .A1 ( \u_mac_and_scale/mult_4_1_bottom [7] ) , 
    .A2 ( \u_mac_and_scale/N7 ) , .A3 ( ctmn_13952 ) , 
    .Z ( \RS_OP_250_54632_65499_J1/ctmn_156 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5249 ( .I ( ctmn_13870 ) , .ZN ( phfnn_3779 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5243 ( .I ( ctmn_14292 ) , .ZN ( phfnn_3773 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5251 ( .I ( ctmn_13926 ) , .ZN ( phfnn_3781 ) ) ;
ND2D0BWP30P140HVT ctmi_14946 ( .A1 ( ctmn_13506 ) , .A2 ( phfnn_3722 ) , 
    .ZN ( ctmn_13509 ) ) ;
NR2D0BWP30P140HVT ctmi_15003 ( .A1 ( ctmn_13553 ) , .A2 ( HFSNET_18 ) , 
    .ZN ( ctmn_13554 ) ) ;
AOI21D0BWP30P140HVT ctmi_14952 ( .A1 ( ctmn_13509 ) , .A2 ( ctmn_13514 ) , 
    .B ( N168 ) , .ZN ( N9464 ) ) ;
NR2D0BWP30P140HVT ctmi_14959 ( .A1 ( ctmn_13503 ) , .A2 ( ctmn_13502 ) , 
    .ZN ( N9465 ) ) ;
NR2D0BWP30P140HVT ctmi_14960 ( .A1 ( N169 ) , .A2 ( ctmn_13517 ) , 
    .ZN ( N9469 ) ) ;
AOI22D0BWP30P140HVT ctmi_14961 ( .A1 ( ctmn_13500 ) , .A2 ( phfnn_3722 ) , 
    .B1 ( phfnn_3730 ) , .B2 ( ctmn_13506 ) , .ZN ( ctmn_13517 ) ) ;
NR2D0BWP30P140HVT ctmi_14962 ( .A1 ( ctmn_13503 ) , .A2 ( ctmn_13510 ) , 
    .ZN ( \u_mac_and_scale/mult_3/mult01 [0] ) ) ;
AOI22D0BWP30P140HVT ctmi_1448 ( .A1 ( phfnn_747 ) , .A2 ( ctmn_14020 ) , 
    .B1 ( ctmn_14024 ) , .B2 ( phfnn_3746 ) , .ZN ( ctmn_14051 ) ) ;
AN3D0BWP30P140HVT ctmi_14963 ( .A1 ( phfnn_3722 ) , .A2 ( ctmn_13500 ) , 
    .A3 ( \u_mac_and_scale/mult_3/mult01 [0] ) , .Z ( N9470 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5252 ( .I ( ctmn_14470 ) , .ZN ( phfnn_3782 ) ) ;
NR2D0BWP30P140HVT ctmi_14966 ( .A1 ( ctmn_13533 ) , .A2 ( ctmn_13543 ) , 
    .ZN ( ctmn_13544 ) ) ;
MAOI222D0BWP30P140HVT ctmi_14967 ( .A ( ctmn_13523 ) , .B ( ctmn_13529 ) , 
    .C ( ctmn_13532 ) , .ZN ( ctmn_13533 ) ) ;
OAI32D0BWP30P140HVT ctmi_15000 ( .A1 ( N9470 ) , .A2 ( ctmn_13507 ) , 
    .A3 ( ctmn_13503 ) , .B1 ( N9470 ) , .B2 ( ctmn_13552 ) , 
    .ZN ( \u_mac_and_scale/mult_3/mult01 [1] ) ) ;
CKND0BWP30P140HVT phfnr_buf_5254 ( .I ( ctmn_2752 ) , .ZN ( phfnn_3784 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5278 ( .I ( N10037 ) , .ZN ( phfnn_3808 ) ) ;
ND2D0BWP30P140HVT ctmi_15001 ( .A1 ( ctmn_13500 ) , .A2 ( phfnn_3730 ) , 
    .ZN ( ctmn_13552 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5255 ( .I ( ctmn_2750 ) , .ZN ( phfnn_3785 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5256 ( .I ( ctmn_14096 ) , .ZN ( phfnn_3786 ) ) ;
AOI21D0BWP30P140HVT ctmi_15006 ( .A1 ( operand_A_reg[10] ) , 
    .A2 ( HFSNET_28 ) , .B ( ctmn_13437 ) , .ZN ( ctmn_13556 ) ) ;
NR2D0BWP30P140HVT ctmi_15007 ( .A1 ( ctmn_13557 ) , .A2 ( phfnn_3725 ) , 
    .ZN ( N9552 ) ) ;
ND2D0BWP30P140HVT ctmi_15008 ( .A1 ( operand_B_reg[12] ) , .A2 ( HFSNET_15 ) , 
    .ZN ( ctmn_13557 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5257 ( .I ( N11517 ) , .ZN ( phfnn_3787 ) ) ;
AO21D0BWP30P140HVT ctmi_15062 ( .A1 ( ctmn_13601 ) , .A2 ( ctmn_13606 ) , 
    .B ( \u_mac_and_scale/mult_1/mult01 [8] ) , 
    .Z ( \u_mac_and_scale/mult_1/mult01 [7] ) ) ;
AOI31D0BWP30P140HVT ctmi_1450 ( .A1 ( ctmn_13556 ) , .A2 ( phfnn_3725 ) , 
    .A3 ( ctmn_927 ) , .B ( phfnn_1311 ) , 
    .ZN ( \u_mac_and_scale/mult_1/mult01 [8] ) ) ;
CKND0BWP30P140HVT phfnr_buf_5258 ( .I ( ctmn_14218 ) , .ZN ( phfnn_3788 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5259 ( .I ( ctmn_14258 ) , .ZN ( phfnn_3789 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5260 ( .I ( ctmn_14298 ) , .ZN ( phfnn_3790 ) ) ;
NR2D0BWP30P140HVT ctmi_15069 ( .A1 ( ctmn_13608 ) , .A2 ( HFSNET_18 ) , 
    .ZN ( ctmn_13609 ) ) ;
AOI21D0BWP30P140HVT ctmi_15017 ( .A1 ( ctmn_13563 ) , .A2 ( ctmn_13568 ) , 
    .B ( N171 ) , .ZN ( N9564 ) ) ;
NR2D0BWP30P140HVT ctmi_15024 ( .A1 ( ctmn_13557 ) , .A2 ( ctmn_13556 ) , 
    .ZN ( N9565 ) ) ;
NR2D0BWP30P140HVT ctmi_15025 ( .A1 ( N172 ) , .A2 ( ctmn_13571 ) , 
    .ZN ( N9569 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5264 ( .I ( ctmn_2756 ) , .ZN ( phfnn_3794 ) ) ;
NR2D0BWP30P140HVT ctmi_15027 ( .A1 ( ctmn_13557 ) , .A2 ( ctmn_13564 ) , 
    .ZN ( \u_mac_and_scale/mult_1/mult01 [0] ) ) ;
AOI22D0BWP30P140HVT ctmi_1452 ( .A1 ( phfnn_3123 ) , .A2 ( phfnn_3750 ) , 
    .B1 ( ctmn_14120 ) , .B2 ( phfnn_3747 ) , .ZN ( ctmn_15247 ) ) ;
AN3D0BWP30P140HVT ctmi_15028 ( .A1 ( phfnn_3723 ) , .A2 ( ctmn_13554 ) , 
    .A3 ( \u_mac_and_scale/mult_1/mult01 [0] ) , .Z ( N9570 ) ) ;
NR2D0BWP30P140HVT ctmi_1455 ( .A1 ( ctmn_13490 ) , .A2 ( N158 ) , 
    .ZN ( ctmn_928 ) ) ;
NR2D0BWP30P140HVT ctmi_15031 ( .A1 ( ctmn_13586 ) , .A2 ( ctmn_13597 ) , 
    .ZN ( ctmn_13598 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15032 ( .A ( ctmn_13576 ) , .B ( ctmn_13582 ) , 
    .C ( ctmn_13585 ) , .ZN ( ctmn_13586 ) ) ;
OAI32D0BWP30P140HVT ctmi_15066 ( .A1 ( N9570 ) , .A2 ( ctmn_13561 ) , 
    .A3 ( ctmn_13557 ) , .B1 ( N9570 ) , .B2 ( ctmn_13607 ) , 
    .ZN ( \u_mac_and_scale/mult_1/mult01 [1] ) ) ;
NR2D0BWP30P140HVT ctmi_15064 ( .A1 ( ctmn_13575 ) , .A2 ( ctmn_13598 ) , 
    .ZN ( ctmn_13606 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5262 ( .I ( ctmn_14173 ) , .ZN ( phfnn_3792 ) ) ;
ND2D0BWP30P140HVT ctmi_15067 ( .A1 ( ctmn_13554 ) , .A2 ( phfnn_3731 ) , 
    .ZN ( ctmn_13607 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5261 ( .I ( ctmn_14131 ) , .ZN ( phfnn_3791 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5263 ( .I ( ctmn_341 ) , .ZN ( phfnn_3793 ) ) ;
AOI21D0BWP30P140HVT ctmi_15072 ( .A1 ( operand_A_reg[2] ) , 
    .A2 ( HFSNET_25 ) , .B ( ctmn_13437 ) , .ZN ( ctmn_13611 ) ) ;
NR2D0BWP30P140HVT ctmi_15073 ( .A1 ( ctmn_13612 ) , .A2 ( phfnn_3728 ) , 
    .ZN ( N9649 ) ) ;
ND2D0BWP30P140HVT ctmi_15074 ( .A1 ( operand_B_reg[4] ) , .A2 ( HFSNET_15 ) , 
    .ZN ( ctmn_13612 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5265 ( .I ( ctmn_14424 ) , .ZN ( phfnn_3795 ) ) ;
AO21D0BWP30P140HVT ctmi_15129 ( .A1 ( ctmn_13657 ) , .A2 ( ctmn_13662 ) , 
    .B ( \u_mac_and_scale/mult_0/mult01 [8] ) , 
    .Z ( \u_mac_and_scale/mult_0/mult01 [7] ) ) ;
AOI31D0BWP30P140HVT ctmi_1458 ( .A1 ( ctmn_13611 ) , .A2 ( phfnn_3728 ) , 
    .A3 ( ctmn_929 ) , .B ( phfnn_2442 ) , 
    .ZN ( \u_mac_and_scale/mult_0/mult01 [8] ) ) ;
CKND0BWP30P140HVT phfnr_buf_5279 ( .I ( N10243 ) , .ZN ( phfnn_3809 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5267 ( .I ( ctmn_14094 ) , .ZN ( phfnn_3797 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5271 ( .I ( N10449 ) , .ZN ( phfnn_3801 ) ) ;
ND2D0BWP30P140HVT ctmi_15136 ( .A1 ( ctmn_13664 ) , .A2 ( phfnn_3735 ) , 
    .ZN ( ctmn_13670 ) ) ;
AOI21D0BWP30P140HVT ctmi_15083 ( .A1 ( ctmn_13618 ) , .A2 ( ctmn_13623 ) , 
    .B ( N174 ) , .ZN ( N9661 ) ) ;
NR2D0BWP30P140HVT ctmi_15090 ( .A1 ( ctmn_13612 ) , .A2 ( ctmn_13611 ) , 
    .ZN ( N9662 ) ) ;
NR2D0BWP30P140HVT ctmi_15091 ( .A1 ( N175 ) , .A2 ( ctmn_13627 ) , 
    .ZN ( N9666 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5268 ( .I ( ctmn_13536 ) , .ZN ( phfnn_3798 ) ) ;
NR2D0BWP30P140HVT ctmi_15094 ( .A1 ( ctmn_13612 ) , .A2 ( ctmn_13619 ) , 
    .ZN ( \u_mac_and_scale/mult_0/mult01 [0] ) ) ;
CKND0BWP30P140HVT phfnr_buf_5269 ( .I ( ctmn_13590 ) , .ZN ( phfnn_3799 ) ) ;
AN2D0BWP30P140HVT ctmi_15095 ( .A1 ( ctmn_13626 ) , 
    .A2 ( \u_mac_and_scale/mult_0/mult01 [0] ) , .Z ( N9667 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5270 ( .I ( ctmn_13646 ) , .ZN ( phfnn_3800 ) ) ;
NR2D0BWP30P140HVT ctmi_15098 ( .A1 ( ctmn_13642 ) , .A2 ( ctmn_13653 ) , 
    .ZN ( ctmn_13654 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15099 ( .A ( ctmn_13632 ) , .B ( ctmn_13638 ) , 
    .C ( ctmn_13641 ) , .ZN ( ctmn_13642 ) ) ;
OAI32D0BWP30P140HVT ctmi_15133 ( .A1 ( N9667 ) , .A2 ( ctmn_13616 ) , 
    .A3 ( ctmn_13612 ) , .B1 ( N9667 ) , .B2 ( ctmn_13663 ) , 
    .ZN ( \u_mac_and_scale/mult_0/mult01 [1] ) ) ;
NR2D0BWP30P140HVT ctmi_15131 ( .A1 ( ctmn_13631 ) , .A2 ( ctmn_13654 ) , 
    .ZN ( ctmn_13662 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5272 ( .I ( ctmn_14457 ) , .ZN ( phfnn_3802 ) ) ;
ND2D0BWP30P140HVT ctmi_15134 ( .A1 ( ctmn_13609 ) , .A2 ( phfnn_3732 ) , 
    .ZN ( ctmn_13663 ) ) ;
ND2D1BWP30P140HVT ctmi_15137 ( .A1 ( ctmn_13331 ) , .A2 ( HFSNET_4 ) , 
    .ZN ( ctmn_13664 ) ) ;
AOI21D0BWP30P140HVT ctmi_15138 ( .A1 ( operand_A_reg[7] ) , 
    .A2 ( HFSNET_25 ) , .B ( ctmn_13667 ) , .ZN ( ctmn_13668 ) ) ;
AOI21D0BWP30P140HVT ctmi_15139 ( .A1 ( ctmn_13665 ) , .A2 ( ctmn_13666 ) , 
    .B ( HFSNET_25 ) , .ZN ( ctmn_13667 ) ) ;
AOI22D0BWP30P140HVT ctmi_15140 ( .A1 ( ctmn_13309 ) , 
    .A2 ( \u_mac_and_scale/holding_reg [15] ) , .B1 ( HFSNET_7 ) , 
    .B2 ( \u_mac_and_scale/holding_reg [7] ) , .ZN ( ctmn_13665 ) ) ;
AOI22D0BWP30P140HVT ctmi_15141 ( .A1 ( HFSNET_17 ) , .A2 ( accumulator[7] ) , 
    .B1 ( \u_mac_and_scale/holding_reg [23] ) , .B2 ( phfnn_639 ) , 
    .ZN ( ctmn_13666 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5273 ( .I ( ctmn_14493 ) , .ZN ( phfnn_3803 ) ) ;
OAI31D0BWP30P140HVT ctmi_15208 ( .A1 ( N9818 ) , .A2 ( N9823 ) , 
    .A3 ( ctmn_13720 ) , .B ( phfnn_2528 ) , 
    .ZN ( \u_mac_and_scale/mult_0/mult10 [7] ) ) ;
CKND0BWP30P140HVT phfnr_buf_5274 ( .I ( ctmn_14471 ) , .ZN ( phfnn_3804 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5276 ( .I ( ctmn_14092 ) , .ZN ( phfnn_3806 ) ) ;
ND3D0BWP30P140HVT ctmTdsLR_1_4530 ( .A1 ( \u_mac_and_scale/N7 ) , 
    .A2 ( ctmn_13952 ) , .A3 ( N250 ) , .ZN ( tmp_net3297 ) ) ;
AOI21D0BWP30P140HVT ctmi_15175 ( .A1 ( ctmn_13700 ) , .A2 ( ctmn_13687 ) , 
    .B ( N176 ) , .ZN ( N9784 ) ) ;
AOI22D0BWP30P140HVT ctmi_15166 ( .A1 ( ctmn_13675 ) , .A2 ( phfnn_3735 ) , 
    .B1 ( phfnn_3717 ) , .B2 ( phfnn_3685 ) , .ZN ( N9757 ) ) ;
AOI21D0BWP30P140HVT ctmi_15168 ( .A1 ( phfnn_3735 ) , .A2 ( ctmn_13672 ) , 
    .B ( ctmn_13698 ) , .ZN ( N9776 ) ) ;
NR3D0BWP30P140HVT ctmi_15169 ( .A1 ( ctmn_13678 ) , .A2 ( ctmn_13686 ) , 
    .A3 ( ctmn_13697 ) , .ZN ( ctmn_13698 ) ) ;
AOI21D0BWP30P140HVT ctmi_15170 ( .A1 ( operand_A_reg[4] ) , 
    .A2 ( HFSNET_25 ) , .B ( ctmn_13696 ) , .ZN ( ctmn_13697 ) ) ;
AOI31D0BWP30P140HVT ctmi_15174 ( .A1 ( phfnn_3717 ) , .A2 ( ctmn_13675 ) , 
    .A3 ( ctmn_13692 ) , .B ( N9757 ) , .ZN ( N9781 ) ) ;
ND2D0BWP30P140HVT ctmi_15176 ( .A1 ( phfnn_3767 ) , .A2 ( ctmn_13672 ) , 
    .ZN ( ctmn_13700 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5275 ( .I ( ctmn_13769 ) , .ZN ( phfnn_3805 ) ) ;
NR2D0BWP30P140HVT ctmi_15179 ( .A1 ( phfnn_3701 ) , .A2 ( ctmn_13668 ) , 
    .ZN ( N9793 ) ) ;
NR2D0BWP30P140HVT ctmi_15180 ( .A1 ( ctmn_13701 ) , .A2 ( HFSNET_18 ) , 
    .ZN ( ctmn_13702 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5281 ( .I ( \u_mac_and_scale/mult_4_1_top [5] ) , 
    .ZN ( phfnn_3811 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5282 ( .I ( \u_mac_and_scale/mult_4_2_top [5] ) , 
    .ZN ( phfnn_3812 ) ) ;
NR2D0BWP30P140HVT ctmi_15188 ( .A1 ( phfnn_3701 ) , .A2 ( ctmn_13682 ) , 
    .ZN ( N9806 ) ) ;
NR2D0BWP30P140HVT ctmi_15212 ( .A1 ( ctmn_13608 ) , .A2 ( ctmn_13682 ) , 
    .ZN ( N9862 ) ) ;
NR2D0BWP30P140HVT ctmi_15184 ( .A1 ( ctmn_13698 ) , .A2 ( ctmn_13706 ) , 
    .ZN ( N9805 ) ) ;
NR2D0BWP30P140HVT ctmi_15189 ( .A1 ( N9796 ) , .A2 ( ctmn_13707 ) , 
    .ZN ( N9810 ) ) ;
AOI22D0BWP30P140HVT ctmi_15190 ( .A1 ( ctmn_13672 ) , .A2 ( phfnn_3709 ) , 
    .B1 ( phfnn_3713 ) , .B2 ( ctmn_13675 ) , .ZN ( ctmn_13707 ) ) ;
NR2D0BWP30P140HVT ctmi_15191 ( .A1 ( phfnn_3701 ) , .A2 ( ctmn_13697 ) , 
    .ZN ( \u_mac_and_scale/mult_0/mult10 [0] ) ) ;
AN3D0BWP30P140HVT ctmi_15192 ( .A1 ( phfnn_3709 ) , .A2 ( ctmn_13672 ) , 
    .A3 ( \u_mac_and_scale/mult_0/mult10 [0] ) , .Z ( N9811 ) ) ;
ND3D0BWP30P140HVT ctmTdsLR_1_3589 ( .A1 ( \u_mac_and_scale/N7 ) , 
    .A2 ( ctmn_13952 ) , .A3 ( N258 ) , .ZN ( tmp_net2659 ) ) ;
IOA21D0BWP30P140HVT ctmTdsLR_2_3590 ( .A1 ( N247 ) , .A2 ( HFSNET_22 ) , 
    .B ( tmp_net2659 ) , .ZN ( \RS_OP_250_54632_65499_J1/N10 ) ) ;
NR2D0BWP30P140HVT ctmi_15195 ( .A1 ( phfnn_3807 ) , .A2 ( ctmn_13719 ) , 
    .ZN ( ctmn_13720 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5283 ( .I ( \u_mac_and_scale/mult_4_3_top [5] ) , 
    .ZN ( phfnn_3813 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15197 ( .A ( ctmn_13717 ) , .B ( ctmn_13718 ) , 
    .C ( N11469 ) , .ZN ( ctmn_13719 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15198 ( .A ( phfnn_3783 ) , .B ( N11464 ) , 
    .C ( ctmn_13716 ) , .ZN ( ctmn_13717 ) ) ;
OAI32D0BWP30P140HVT ctmi_15210 ( .A1 ( N9811 ) , .A2 ( ctmn_13686 ) , 
    .A3 ( phfnn_3701 ) , .B1 ( N9811 ) , .B2 ( ctmn_13723 ) , 
    .ZN ( \u_mac_and_scale/mult_0/mult10 [1] ) ) ;
ND2D0BWP30P140HVT ctmi_15211 ( .A1 ( ctmn_13672 ) , .A2 ( phfnn_3713 ) , 
    .ZN ( ctmn_13723 ) ) ;
NR2D0BWP30P140HVT ctmi_15213 ( .A1 ( ctmn_13724 ) , .A2 ( ctmn_13668 ) , 
    .ZN ( N9863 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5280 ( .I ( phfnn_2510 ) , .ZN ( phfnn_3810 ) ) ;
NR4D0BWP30P140HVT ctmi_15215 ( .A1 ( ctmn_13614 ) , .A2 ( ctmn_13608 ) , 
    .A3 ( ctmn_13686 ) , .A4 ( ctmn_13697 ) , .ZN ( N9866 ) ) ;
OAI32D0BWP30P140HVT ctmi_15216 ( .A1 ( ctmn_13725 ) , .A2 ( ctmn_13697 ) , 
    .A3 ( ctmn_13620 ) , .B1 ( ctmn_13725 ) , .B2 ( ctmn_13726 ) , 
    .ZN ( N9871 ) ) ;
NR4D0BWP30P140HVT ctmi_15217 ( .A1 ( ctmn_13620 ) , .A2 ( ctmn_13614 ) , 
    .A3 ( ctmn_13686 ) , .A4 ( ctmn_13697 ) , .ZN ( ctmn_13725 ) ) ;
ND2D0BWP30P140HVT ctmi_15218 ( .A1 ( operand_B_reg[6] ) , .A2 ( phfnn_3709 ) , 
    .ZN ( ctmn_13726 ) ) ;
NR2D0BWP30P140HVT ctmi_15219 ( .A1 ( ctmn_13724 ) , .A2 ( ctmn_13682 ) , 
    .ZN ( N9872 ) ) ;
OAI32D0BWP30P140HVT ctmi_15220 ( .A1 ( N9866 ) , .A2 ( ctmn_13697 ) , 
    .A3 ( ctmn_13614 ) , .B1 ( N9866 ) , .B2 ( ctmn_13727 ) , .ZN ( N9876 ) ) ;
ND2D0BWP30P140HVT ctmi_15221 ( .A1 ( operand_B_reg[5] ) , .A2 ( phfnn_3709 ) , 
    .ZN ( ctmn_13727 ) ) ;
NR2D0BWP30P140HVT ctmi_15222 ( .A1 ( ctmn_13724 ) , .A2 ( ctmn_13697 ) , 
    .ZN ( \u_mac_and_scale/mult_4_0_top [0] ) ) ;
NR2D0BWP30P140HVT ctmi_15274 ( .A1 ( ctmn_13671 ) , .A2 ( ctmn_13611 ) , 
    .ZN ( N9926 ) ) ;
AOI211D0BWP30P140HVT ctmTdsLR_2_3828 ( .A1 ( ctmn_14890 ) , 
    .A2 ( ctmn_14767 ) , .B ( ctmn_15010 ) , .C ( tmp_net2741 ) , 
    .ZN ( tmp_net2742 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5284 ( .I ( ctmn_13771 ) , .ZN ( phfnn_3814 ) ) ;
XNR3UD1BWP30P140HVT ctmi_15225 ( .A1 ( ctmn_13738 ) , .A2 ( ctmn_13773 ) , 
    .A3 ( ctmn_13774 ) , .ZN ( \u_mac_and_scale/mult_4_0_top [7] ) ) ;
OAI211D0BWP30P140HVT ctmi_15226 ( .A1 ( ctmn_13732 ) , .A2 ( ctmn_13735 ) , 
    .B ( ctmn_13736 ) , .C ( ctmn_13737 ) , .ZN ( ctmn_13738 ) ) ;
AOI21D0BWP30P140HVT ctmi_15227 ( .A1 ( ctmn_13730 ) , .A2 ( phfnn_3717 ) , 
    .B ( ctmn_13731 ) , .ZN ( ctmn_13732 ) ) ;
NR2D0BWP30P140HVT ctmi_15228 ( .A1 ( ctmn_13620 ) , .A2 ( ctmn_13729 ) , 
    .ZN ( ctmn_13730 ) ) ;
AN2D0BWP30P140HVT ctmi_15229 ( .A1 ( ctmn_13331 ) , .A2 ( HFSNET_15 ) , 
    .Z ( ctmn_13729 ) ) ;
ND2D0BWP30P140HVT ctmi_15230 ( .A1 ( operand_B_reg[7] ) , .A2 ( phfnn_3735 ) , 
    .ZN ( ctmn_13731 ) ) ;
ND2D0BWP30P140HVT ctmi_15231 ( .A1 ( operand_B_reg[6] ) , .A2 ( ctmn_13734 ) , 
    .ZN ( ctmn_13735 ) ) ;
NR2D0BWP30P140HVT ctmi_15232 ( .A1 ( ctmn_13668 ) , .A2 ( ctmn_13733 ) , 
    .ZN ( ctmn_13734 ) ) ;
NR2D0BWP30P140HVT ctmi_15233 ( .A1 ( ctmn_13664 ) , .A2 ( HFSNET_18 ) , 
    .ZN ( ctmn_13733 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5285 ( .I ( phfnn_3179 ) , .ZN ( phfnn_3815 ) ) ;
NR2D0BWP30P140HVT ctmi_15275 ( .A1 ( ctmn_13701 ) , .A2 ( phfnn_3728 ) , 
    .ZN ( N9927 ) ) ;
NR3D0BWP30P140HVT ctmi_15276 ( .A1 ( ctmn_13671 ) , .A2 ( ctmn_13776 ) , 
    .A3 ( ctmn_13619 ) , .ZN ( N9929 ) ) ;
ND2D0BWP30P140HVT ctmi_15277 ( .A1 ( operand_B_reg[2] ) , .A2 ( phfnn_3724 ) , 
    .ZN ( ctmn_13776 ) ) ;
AOI21D0BWP30P140HVT ctmi_15278 ( .A1 ( ctmn_13776 ) , .A2 ( ctmn_13777 ) , 
    .B ( ctmn_13778 ) , .ZN ( N9932 ) ) ;
ND2D0BWP30P140HVT ctmi_15279 ( .A1 ( operand_B_reg[3] ) , .A2 ( phfnn_3732 ) , 
    .ZN ( ctmn_13777 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5286 ( .I ( phfnn_3180 ) , .ZN ( phfnn_3816 ) ) ;
NR3D0BWP30P140HVT ctmi_15280 ( .A1 ( ctmn_13676 ) , .A2 ( ctmn_13776 ) , 
    .A3 ( ctmn_13619 ) , .ZN ( ctmn_13778 ) ) ;
NR2D0BWP30P140HVT ctmi_15281 ( .A1 ( ctmn_13701 ) , .A2 ( ctmn_13611 ) , 
    .ZN ( N9933 ) ) ;
OAI32D0BWP30P140HVT ctmi_15282 ( .A1 ( N9929 ) , .A2 ( ctmn_13619 ) , 
    .A3 ( ctmn_13674 ) , .B1 ( N9929 ) , .B2 ( ctmn_13779 ) , .ZN ( N9937 ) ) ;
ND2D0BWP30P140HVT ctmi_15283 ( .A1 ( operand_B_reg[1] ) , .A2 ( phfnn_3724 ) , 
    .ZN ( ctmn_13779 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5287 ( .I ( phfnn_3181 ) , .ZN ( phfnn_3817 ) ) ;
OAI32D0BWP30P140HVT ctmi_15287 ( .A1 ( N9938 ) , .A2 ( ctmn_13616 ) , 
    .A3 ( ctmn_13701 ) , .B1 ( N9938 ) , .B2 ( ctmn_13781 ) , .ZN ( N251 ) ) ;
NR3D0BWP30P140HVT ctmi_15285 ( .A1 ( ctmn_13671 ) , .A2 ( phfnn_1320 ) , 
    .A3 ( ctmn_13616 ) , .ZN ( N9938 ) ) ;
TIELBWP30P140HVT optlc_5669 ( .ZN ( optlc_net_3993 ) ) ;
ND2D0BWP30P140HVT ctmi_15288 ( .A1 ( operand_B_reg[1] ) , .A2 ( phfnn_3732 ) , 
    .ZN ( ctmn_13781 ) ) ;
ND2D0BWP30P140HVT ctmi_15290 ( .A1 ( ctmn_13664 ) , .A2 ( phfnn_3736 ) , 
    .ZN ( ctmn_13784 ) ) ;
AOI21D0BWP30P140HVT ctmi_15291 ( .A1 ( operand_A_reg[15] ) , 
    .A2 ( HFSNET_28 ) , .B ( ctmn_13667 ) , .ZN ( ctmn_13782 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5289 ( .I ( phfnn_827 ) , .ZN ( phfnn_3819 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5290 ( .I ( ctmn_14090 ) , .ZN ( phfnn_3820 ) ) ;
OAI31D0BWP30P140HVT ctmi_15347 ( .A1 ( N10028 ) , .A2 ( N10033 ) , 
    .A3 ( ctmn_13823 ) , .B ( phfnn_2530 ) , 
    .ZN ( \u_mac_and_scale/mult_1/mult10 [7] ) ) ;
CKND0BWP30P140HVT phfnr_buf_5291 ( .I ( \DP_OP_248_26668_65499_J1/N_1 ) , 
    .ZN ( phfnn_3821 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5292 ( 
    .I ( \u_mac_and_scale/mult_4_3_bottom [7] ) , .ZN ( phfnn_3822 ) ) ;
XOR2UD0BWP30P140HVT ctmi_15304 ( .A1 ( ctmn_13797 ) , .A2 ( ctmn_13799 ) , 
    .Z ( N9974 ) ) ;
AOI21D0BWP30P140HVT ctmi_15315 ( .A1 ( ctmn_13803 ) , .A2 ( ctmn_13795 ) , 
    .B ( N177 ) , .ZN ( N9994 ) ) ;
AOI22D0BWP30P140HVT ctmi_15309 ( .A1 ( ctmn_13789 ) , .A2 ( phfnn_3736 ) , 
    .B1 ( phfnn_3718 ) , .B2 ( ctmn_13791 ) , .ZN ( N9978 ) ) ;
AOI21D0BWP30P140HVT ctmi_15311 ( .A1 ( phfnn_3736 ) , .A2 ( phfnn_672 ) , 
    .B ( ctmn_13802 ) , .ZN ( N9986 ) ) ;
NR3D0BWP30P140HVT ctmi_15312 ( .A1 ( ctmn_13792 ) , .A2 ( ctmn_13794 ) , 
    .A3 ( ctmn_13801 ) , .ZN ( ctmn_13802 ) ) ;
AOI21D0BWP30P140HVT ctmi_15313 ( .A1 ( operand_A_reg[12] ) , 
    .A2 ( HFSNET_28 ) , .B ( ctmn_13696 ) , .ZN ( ctmn_13801 ) ) ;
AOI31D0BWP30P140HVT ctmi_15314 ( .A1 ( phfnn_3718 ) , .A2 ( ctmn_13789 ) , 
    .A3 ( ctmn_13799 ) , .B ( N9978 ) , .ZN ( N9991 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5293 ( .I ( \u_mac_and_scale/mult_2/mult01 [8] ) , 
    .ZN ( phfnn_3823 ) ) ;
NR2D0BWP30P140HVT ctmi_15318 ( .A1 ( phfnn_3700 ) , .A2 ( ctmn_13782 ) , 
    .ZN ( N10003 ) ) ;
NR2D0BWP30P140HVT ctmi_15319 ( .A1 ( ctmn_13804 ) , .A2 ( HFSNET_18 ) , 
    .ZN ( ctmn_13805 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5294 ( .I ( \u_mac_and_scale/mult_3/mult01 [8] ) , 
    .ZN ( phfnn_3824 ) ) ;
AO21D0BWP30P140HVT ctmTdsLR_1_3544 ( .A1 ( N226 ) , .A2 ( phfnn_648 ) , 
    .B ( \RS_OP_250_54632_65499_J1/ctmn_155 ) , .Z ( N270 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5295 ( .I ( \u_mac_and_scale/mult_1/mult01 [8] ) , 
    .ZN ( phfnn_3825 ) ) ;
NR2D0BWP30P140HVT ctmi_15326 ( .A1 ( phfnn_3700 ) , .A2 ( ctmn_13793 ) , 
    .ZN ( N10016 ) ) ;
NR2D0BWP30P140HVT ctmi_15351 ( .A1 ( ctmn_13553 ) , .A2 ( ctmn_13793 ) , 
    .ZN ( N10069 ) ) ;
OAI32D0BWP30P140HVT ctmi_15325 ( .A1 ( ctmn_13802 ) , .A2 ( ctmn_13801 ) , 
    .A3 ( phfnn_3699 ) , .B1 ( ctmn_13802 ) , .B2 ( ctmn_13808 ) , 
    .ZN ( N10015 ) ) ;
NR2D0BWP30P140HVT ctmi_15327 ( .A1 ( N178 ) , .A2 ( ctmn_13810 ) , 
    .ZN ( N10020 ) ) ;
AOI22D0BWP30P140HVT ctmi_15328 ( .A1 ( phfnn_672 ) , .A2 ( phfnn_3710 ) , 
    .B1 ( phfnn_3714 ) , .B2 ( ctmn_13789 ) , .ZN ( ctmn_13810 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5296 ( .I ( \u_mac_and_scale/mult_0/mult01 [8] ) , 
    .ZN ( phfnn_3826 ) ) ;
NR2D0BWP30P140HVT ctmi_15330 ( .A1 ( phfnn_3700 ) , .A2 ( ctmn_13801 ) , 
    .ZN ( \u_mac_and_scale/mult_1/mult10 [0] ) ) ;
AN3D0BWP30P140HVT ctmi_15331 ( .A1 ( phfnn_3710 ) , .A2 ( phfnn_672 ) , 
    .A3 ( \u_mac_and_scale/mult_1/mult10 [0] ) , .Z ( N10021 ) ) ;
ND3D0BWP30P140HVT ctmTdsLR_1_3591 ( .A1 ( \u_mac_and_scale/N7 ) , 
    .A2 ( ctmn_13952 ) , .A3 ( \u_mac_and_scale/mult_4_0_bottom[5] ) , 
    .ZN ( tmp_net2660 ) ) ;
IOA21D0BWP30P140HVT ctmTdsLR_2_3592 ( .A1 ( N215 ) , .A2 ( HFSNET_22 ) , 
    .B ( tmp_net2660 ) , .ZN ( \RS_OP_250_54632_65499_J1/N26 ) ) ;
NR2D0BWP30P140HVT ctmi_15334 ( .A1 ( phfnn_3808 ) , .A2 ( ctmn_13822 ) , 
    .ZN ( ctmn_13823 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5297 ( .I ( ctmn_14088 ) , .ZN ( phfnn_3827 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15336 ( .A ( ctmn_13820 ) , .B ( ctmn_13821 ) , 
    .C ( N11604 ) , .ZN ( ctmn_13822 ) ) ;
OAI32D0BWP30P140HVT ctmi_15349 ( .A1 ( N10021 ) , .A2 ( ctmn_13794 ) , 
    .A3 ( phfnn_3700 ) , .B1 ( N10021 ) , .B2 ( ctmn_13826 ) , 
    .ZN ( \u_mac_and_scale/mult_1/mult10 [1] ) ) ;
CKND0BWP30P140HVT phfnr_buf_5298 ( .I ( phfnn_3194 ) , .ZN ( phfnn_3828 ) ) ;
NR2D0BWP30P140HVT ctmi_15352 ( .A1 ( ctmn_13827 ) , .A2 ( ctmn_13782 ) , 
    .ZN ( N10070 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5299 ( .I ( ctmn_14682 ) , .ZN ( phfnn_3829 ) ) ;
NR4D0BWP30P140HVT ctmi_15354 ( .A1 ( ctmn_13559 ) , .A2 ( ctmn_13553 ) , 
    .A3 ( ctmn_13794 ) , .A4 ( ctmn_13801 ) , .ZN ( N10073 ) ) ;
OAI32D0BWP30P140HVT ctmi_15355 ( .A1 ( ctmn_13828 ) , .A2 ( ctmn_13801 ) , 
    .A3 ( ctmn_13565 ) , .B1 ( ctmn_13828 ) , .B2 ( ctmn_13829 ) , 
    .ZN ( N10078 ) ) ;
NR4D0BWP30P140HVT ctmi_15356 ( .A1 ( ctmn_13565 ) , .A2 ( ctmn_13559 ) , 
    .A3 ( ctmn_13794 ) , .A4 ( ctmn_13801 ) , .ZN ( ctmn_13828 ) ) ;
ND2D0BWP30P140HVT ctmi_15357 ( .A1 ( operand_B_reg[14] ) , 
    .A2 ( phfnn_3710 ) , .ZN ( ctmn_13829 ) ) ;
NR2D0BWP30P140HVT ctmi_15358 ( .A1 ( ctmn_13827 ) , .A2 ( ctmn_13793 ) , 
    .ZN ( N10079 ) ) ;
OAI32D0BWP30P140HVT ctmi_15359 ( .A1 ( N10073 ) , .A2 ( ctmn_13801 ) , 
    .A3 ( ctmn_13559 ) , .B1 ( N10073 ) , .B2 ( ctmn_13830 ) , 
    .ZN ( N10083 ) ) ;
ND2D0BWP30P140HVT ctmi_15360 ( .A1 ( operand_B_reg[13] ) , 
    .A2 ( phfnn_3710 ) , .ZN ( ctmn_13830 ) ) ;
NR2D0BWP30P140HVT ctmi_15361 ( .A1 ( ctmn_13827 ) , .A2 ( ctmn_13801 ) , 
    .ZN ( \u_mac_and_scale/mult_4_1_top [0] ) ) ;
NR2D0BWP30P140HVT ctmi_15365 ( .A1 ( ctmn_13785 ) , .A2 ( ctmn_13556 ) , 
    .ZN ( N10132 ) ) ;
AN3D0BWP30P140HVT ctmi_15362 ( .A1 ( phfnn_3710 ) , 
    .A2 ( operand_B_reg[13] ) , .A3 ( \u_mac_and_scale/mult_4_1_top [0] ) , 
    .Z ( N10084 ) ) ;
OAI32D0BWP30P140HVT ctmi_15363 ( .A1 ( N10084 ) , .A2 ( ctmn_13794 ) , 
    .A3 ( ctmn_13827 ) , .B1 ( N10084 ) , .B2 ( ctmn_13831 ) , 
    .ZN ( \u_mac_and_scale/mult_4_1_top [1] ) ) ;
ND2D0BWP30P140HVT ctmi_15364 ( .A1 ( operand_B_reg[13] ) , 
    .A2 ( phfnn_3714 ) , .ZN ( ctmn_13831 ) ) ;
NR2D0BWP30P140HVT ctmi_15366 ( .A1 ( ctmn_13804 ) , .A2 ( phfnn_3725 ) , 
    .ZN ( N10133 ) ) ;
NR3D0BWP30P140HVT ctmi_15367 ( .A1 ( ctmn_13785 ) , .A2 ( ctmn_13832 ) , 
    .A3 ( ctmn_13564 ) , .ZN ( N10135 ) ) ;
ND2D0BWP30P140HVT ctmi_15368 ( .A1 ( operand_B_reg[10] ) , 
    .A2 ( phfnn_3723 ) , .ZN ( ctmn_13832 ) ) ;
AOI21D0BWP30P140HVT ctmi_15369 ( .A1 ( ctmn_13832 ) , .A2 ( ctmn_13833 ) , 
    .B ( ctmn_13834 ) , .ZN ( N10138 ) ) ;
ND2D0BWP30P140HVT ctmi_15370 ( .A1 ( operand_B_reg[11] ) , 
    .A2 ( phfnn_3731 ) , .ZN ( ctmn_13833 ) ) ;
NR3D0BWP30P140HVT ctmi_15371 ( .A1 ( ctmn_13790 ) , .A2 ( ctmn_13832 ) , 
    .A3 ( ctmn_13564 ) , .ZN ( ctmn_13834 ) ) ;
NR2D0BWP30P140HVT ctmi_15372 ( .A1 ( ctmn_13804 ) , .A2 ( ctmn_13556 ) , 
    .ZN ( N10139 ) ) ;
OAI32D0BWP30P140HVT ctmi_15373 ( .A1 ( N10135 ) , .A2 ( ctmn_13564 ) , 
    .A3 ( ctmn_13788 ) , .B1 ( N10135 ) , .B2 ( ctmn_13835 ) , 
    .ZN ( N10143 ) ) ;
ND2D0BWP30P140HVT ctmi_15374 ( .A1 ( operand_B_reg[9] ) , .A2 ( phfnn_3723 ) , 
    .ZN ( ctmn_13835 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5300 ( .I ( ctmn_14734 ) , .ZN ( phfnn_3830 ) ) ;
NR3D0BWP30P140HVT ctmi_15376 ( .A1 ( ctmn_13785 ) , .A2 ( phfnn_1319 ) , 
    .A3 ( ctmn_13561 ) , .ZN ( N10144 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5301 ( .I ( ctmn_14707 ) , .ZN ( phfnn_3831 ) ) ;
OAI32D0BWP30P140HVT ctmi_15378 ( .A1 ( N10144 ) , .A2 ( ctmn_13561 ) , 
    .A3 ( ctmn_13804 ) , .B1 ( N10144 ) , .B2 ( ctmn_13837 ) , 
    .ZN ( \u_mac_and_scale/mult_4_1_bottom [1] ) ) ;
CKND0BWP30P140HVT phfnr_buf_5302 ( .I ( ctmn_14086 ) , .ZN ( phfnn_3832 ) ) ;
ND2D0BWP30P140HVT ctmi_15379 ( .A1 ( operand_B_reg[9] ) , .A2 ( phfnn_3731 ) , 
    .ZN ( ctmn_13837 ) ) ;
ND2D0BWP30P140HVT ctmi_15381 ( .A1 ( ctmn_13664 ) , .A2 ( phfnn_3737 ) , 
    .ZN ( ctmn_13840 ) ) ;
AOI21D0BWP30P140HVT ctmi_15382 ( .A1 ( operand_A_reg[23] ) , 
    .A2 ( HFSNET_28 ) , .B ( ctmn_13667 ) , .ZN ( ctmn_13838 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5305 ( .I ( phfnn_1420 ) , .ZN ( phfnn_3835 ) ) ;
NR2D0BWP30P140HVT ctmi_15384 ( .A1 ( ctmn_13841 ) , .A2 ( HFSNET_18 ) , 
    .ZN ( ctmn_13842 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5306 ( .I ( phfnn_1416 ) , .ZN ( phfnn_3836 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5307 ( .I ( ctmn_14684 ) , .ZN ( phfnn_3837 ) ) ;
NR3D0BWP30P140HVT ctmi_15387 ( .A1 ( ctmn_13848 ) , .A2 ( ctmn_13849 ) , 
    .A3 ( ctmn_13850 ) , .ZN ( ctmn_13851 ) ) ;
ND2D0BWP30P140HVT ctmi_15388 ( .A1 ( ctmn_13845 ) , .A2 ( ctmn_13847 ) , 
    .ZN ( ctmn_13848 ) ) ;
NR2D0BWP30P140HVT ctmi_15389 ( .A1 ( ctmn_13844 ) , .A2 ( HFSNET_18 ) , 
    .ZN ( ctmn_13845 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5310 ( .I ( phfnn_2546 ) , .ZN ( phfnn_3840 ) ) ;
NR2D0BWP30P140HVT ctmi_15391 ( .A1 ( ctmn_13846 ) , .A2 ( HFSNET_18 ) , 
    .ZN ( ctmn_13847 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5308 ( .I ( ctmn_14726 ) , .ZN ( phfnn_3838 ) ) ;
OAI31D0BWP30P140HVT ctmi_15440 ( .A1 ( N10234 ) , .A2 ( N10239 ) , 
    .A3 ( ctmn_13881 ) , .B ( phfnn_2529 ) , 
    .ZN ( \u_mac_and_scale/mult_2/mult10 [7] ) ) ;
ND3D0BWP30P140HVT ctmTdsLR_1_3593 ( .A1 ( phfnn_3810 ) , 
    .A2 ( \u_mac_and_scale/N7 ) , .A3 ( ctmn_13952 ) , .ZN ( tmp_net2661 ) ) ;
AOI221D0BWP30P140HVT ctmTdsLR_1_3570 ( .A1 ( N58 ) , .A2 ( HFSNET_20 ) , 
    .B1 ( \RS_OP_250_54632_65499_J1/N100 ) , .B2 ( phfnn_648 ) , 
    .C ( \RS_OP_250_54632_65499_J1/ctmn_152 ) , .ZN ( ctmn_14089 ) ) ;
IOA21D0BWP30P140HVT ctmTdsLR_2_4531 ( .A1 ( HFSNET_22 ) , 
    .A2 ( \u_mac_and_scale/mult_4_1_bottom [2] ) , .B ( tmp_net3297 ) , 
    .ZN ( \RS_OP_250_54632_65499_J1/N29 ) ) ;
AOI21D0BWP30P140HVT ctmi_15407 ( .A1 ( ctmn_13861 ) , .A2 ( ctmn_13851 ) , 
    .B ( N179 ) , .ZN ( N10200 ) ) ;
AOI22D0BWP30P140HVT ctmi_15401 ( .A1 ( ctmn_13845 ) , .A2 ( phfnn_3737 ) , 
    .B1 ( phfnn_3719 ) , .B2 ( ctmn_13847 ) , .ZN ( N10184 ) ) ;
AOI21D0BWP30P140HVT ctmi_15403 ( .A1 ( phfnn_3737 ) , .A2 ( ctmn_13842 ) , 
    .B ( ctmn_13859 ) , .ZN ( N10192 ) ) ;
NR3D0BWP30P140HVT ctmi_15404 ( .A1 ( ctmn_13848 ) , .A2 ( ctmn_13850 ) , 
    .A3 ( ctmn_13858 ) , .ZN ( ctmn_13859 ) ) ;
AOI21D0BWP30P140HVT ctmi_15405 ( .A1 ( operand_A_reg[20] ) , 
    .A2 ( HFSNET_28 ) , .B ( ctmn_13696 ) , .ZN ( ctmn_13858 ) ) ;
AOI31D0BWP30P140HVT ctmi_15406 ( .A1 ( phfnn_3719 ) , .A2 ( ctmn_13845 ) , 
    .A3 ( ctmn_13856 ) , .B ( N10184 ) , .ZN ( N10197 ) ) ;
ND2D0BWP30P140HVT ctmi_15408 ( .A1 ( phfnn_3769 ) , .A2 ( ctmn_13842 ) , 
    .ZN ( ctmn_13861 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5309 ( .I ( ctmn_14736 ) , .ZN ( phfnn_3839 ) ) ;
NR2D0BWP30P140HVT ctmi_15411 ( .A1 ( phfnn_3697 ) , .A2 ( ctmn_13838 ) , 
    .ZN ( N10209 ) ) ;
NR2D0BWP30P140HVT ctmi_15412 ( .A1 ( ctmn_13862 ) , .A2 ( HFSNET_18 ) , 
    .ZN ( ctmn_13863 ) ) ;
ND3D1BWP30P140 ctmi_1486 ( .A1 ( ctmn_13323 ) , .A2 ( HFSNET_17 ) , 
    .A3 ( ctmn_13313 ) , .ZN ( phfnn_645 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5311 ( .I ( phfnn_2563 ) , .ZN ( phfnn_3841 ) ) ;
NR2D0BWP30P140HVT ctmi_15420 ( .A1 ( phfnn_3697 ) , .A2 ( ctmn_13849 ) , 
    .ZN ( N10222 ) ) ;
NR2D0BWP30P140HVT ctmi_15444 ( .A1 ( ctmn_13431 ) , .A2 ( ctmn_13849 ) , 
    .ZN ( N10275 ) ) ;
NR2D0BWP30P140HVT ctmi_15416 ( .A1 ( ctmn_13859 ) , .A2 ( ctmn_13867 ) , 
    .ZN ( N10221 ) ) ;
OAI32D0BWP30P140HVT ctmi_15421 ( .A1 ( N10212 ) , .A2 ( ctmn_13858 ) , 
    .A3 ( phfnn_3696 ) , .B1 ( N10212 ) , .B2 ( ctmn_13868 ) , 
    .ZN ( N10226 ) ) ;
ND2D0BWP30P140HVT ctmi_15422 ( .A1 ( ctmn_13842 ) , .A2 ( phfnn_3711 ) , 
    .ZN ( ctmn_13868 ) ) ;
NR2D0BWP30P140HVT ctmi_15423 ( .A1 ( phfnn_3697 ) , .A2 ( ctmn_13858 ) , 
    .ZN ( \u_mac_and_scale/mult_2/mult10 [0] ) ) ;
AN3D0BWP30P140HVT ctmi_15424 ( .A1 ( phfnn_3711 ) , .A2 ( ctmn_13842 ) , 
    .A3 ( \u_mac_and_scale/mult_2/mult10 [0] ) , .Z ( N10227 ) ) ;
IOA21D1BWP30P140HVT ctmTdsLR_2_3594 ( .A1 ( N231 ) , .A2 ( HFSNET_22 ) , 
    .B ( tmp_net2661 ) , .ZN ( \RS_OP_250_54632_65499_J1/N42 ) ) ;
ND3D0BWP30P140HVT ctmTdsLR_1_3595 ( 
    .A1 ( \u_mac_and_scale/mult_4_1_bottom [4] ) , 
    .A2 ( \u_mac_and_scale/N7 ) , .A3 ( ctmn_13952 ) , .ZN ( tmp_net2662 ) ) ;
NR2D0BWP30P140HVT ctmi_15427 ( .A1 ( phfnn_3809 ) , .A2 ( ctmn_13880 ) , 
    .ZN ( ctmn_13881 ) ) ;
CKND0BWP30P140HVT HFSINV_1768_5399 ( .I ( HFSNET_0 ) , .ZN ( HFSNET_1 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15429 ( .A ( ctmn_13878 ) , .B ( ctmn_13879 ) , 
    .C ( N11737 ) , .ZN ( ctmn_13880 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15430 ( .A ( phfnn_3779 ) , .B ( N11732 ) , 
    .C ( ctmn_13877 ) , .ZN ( ctmn_13878 ) ) ;
OAI32D0BWP30P140HVT ctmi_15442 ( .A1 ( N10227 ) , .A2 ( ctmn_13850 ) , 
    .A3 ( phfnn_3697 ) , .B1 ( N10227 ) , .B2 ( ctmn_13884 ) , 
    .ZN ( \u_mac_and_scale/mult_2/mult10 [1] ) ) ;
ND2D0BWP30P140HVT ctmi_15443 ( .A1 ( ctmn_13842 ) , .A2 ( phfnn_3715 ) , 
    .ZN ( ctmn_13884 ) ) ;
NR2D0BWP30P140HVT ctmi_15445 ( .A1 ( ctmn_13885 ) , .A2 ( ctmn_13838 ) , 
    .ZN ( N10276 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5318 ( .I ( ctmn_14749 ) , .ZN ( phfnn_3848 ) ) ;
NR4D0BWP30P140HVT ctmi_15447 ( .A1 ( ctmn_13445 ) , .A2 ( ctmn_13431 ) , 
    .A3 ( ctmn_13850 ) , .A4 ( ctmn_13858 ) , .ZN ( N10279 ) ) ;
OAI32D0BWP30P140HVT ctmi_15448 ( .A1 ( ctmn_13886 ) , .A2 ( ctmn_13858 ) , 
    .A3 ( ctmn_13457 ) , .B1 ( ctmn_13886 ) , .B2 ( ctmn_13887 ) , 
    .ZN ( N10284 ) ) ;
NR4D0BWP30P140HVT ctmi_15449 ( .A1 ( ctmn_13457 ) , .A2 ( ctmn_13445 ) , 
    .A3 ( ctmn_13850 ) , .A4 ( ctmn_13858 ) , .ZN ( ctmn_13886 ) ) ;
ND2D0BWP30P140HVT ctmi_15450 ( .A1 ( operand_B_reg[22] ) , 
    .A2 ( phfnn_3711 ) , .ZN ( ctmn_13887 ) ) ;
NR2D0BWP30P140HVT ctmi_15451 ( .A1 ( ctmn_13885 ) , .A2 ( ctmn_13849 ) , 
    .ZN ( N10285 ) ) ;
OAI32D0BWP30P140HVT ctmi_15452 ( .A1 ( N10279 ) , .A2 ( ctmn_13858 ) , 
    .A3 ( ctmn_13445 ) , .B1 ( N10279 ) , .B2 ( ctmn_13888 ) , 
    .ZN ( N10289 ) ) ;
ND2D0BWP30P140HVT ctmi_15453 ( .A1 ( operand_B_reg[21] ) , 
    .A2 ( phfnn_3711 ) , .ZN ( ctmn_13888 ) ) ;
NR2D0BWP30P140HVT ctmi_15454 ( .A1 ( ctmn_13885 ) , .A2 ( ctmn_13858 ) , 
    .ZN ( \u_mac_and_scale/mult_4_2_top [0] ) ) ;
NR2D0BWP30P140HVT ctmi_15458 ( .A1 ( ctmn_13841 ) , .A2 ( ctmn_13438 ) , 
    .ZN ( N10338 ) ) ;
AN3D0BWP30P140HVT ctmi_15455 ( .A1 ( phfnn_3711 ) , 
    .A2 ( operand_B_reg[21] ) , .A3 ( \u_mac_and_scale/mult_4_2_top [0] ) , 
    .Z ( N10290 ) ) ;
OAI32D0BWP30P140HVT ctmi_15456 ( .A1 ( N10290 ) , .A2 ( ctmn_13850 ) , 
    .A3 ( ctmn_13885 ) , .B1 ( N10290 ) , .B2 ( ctmn_13889 ) , 
    .ZN ( \u_mac_and_scale/mult_4_2_top [1] ) ) ;
ND2D0BWP30P140HVT ctmi_15457 ( .A1 ( operand_B_reg[21] ) , 
    .A2 ( phfnn_3715 ) , .ZN ( ctmn_13889 ) ) ;
NR2D0BWP30P140HVT ctmi_15459 ( .A1 ( ctmn_13862 ) , .A2 ( phfnn_3726 ) , 
    .ZN ( N10339 ) ) ;
NR3D0BWP30P140HVT ctmi_15460 ( .A1 ( ctmn_13841 ) , .A2 ( ctmn_13890 ) , 
    .A3 ( ctmn_13456 ) , .ZN ( N10341 ) ) ;
ND2D0BWP30P140HVT ctmi_15461 ( .A1 ( operand_B_reg[18] ) , 
    .A2 ( phfnn_3721 ) , .ZN ( ctmn_13890 ) ) ;
AOI21D0BWP30P140HVT ctmi_15462 ( .A1 ( ctmn_13890 ) , .A2 ( ctmn_13891 ) , 
    .B ( ctmn_13892 ) , .ZN ( N10344 ) ) ;
ND2D0BWP30P140HVT ctmi_15463 ( .A1 ( operand_B_reg[19] ) , 
    .A2 ( phfnn_3729 ) , .ZN ( ctmn_13891 ) ) ;
NR3D0BWP30P140HVT ctmi_15464 ( .A1 ( ctmn_13846 ) , .A2 ( ctmn_13890 ) , 
    .A3 ( ctmn_13456 ) , .ZN ( ctmn_13892 ) ) ;
NR2D0BWP30P140HVT ctmi_15465 ( .A1 ( ctmn_13862 ) , .A2 ( ctmn_13438 ) , 
    .ZN ( N10345 ) ) ;
OAI32D0BWP30P140HVT ctmi_15466 ( .A1 ( N10341 ) , .A2 ( ctmn_13456 ) , 
    .A3 ( ctmn_13844 ) , .B1 ( N10341 ) , .B2 ( ctmn_13893 ) , 
    .ZN ( N10349 ) ) ;
ND2D0BWP30P140HVT ctmi_15467 ( .A1 ( operand_B_reg[17] ) , 
    .A2 ( phfnn_3721 ) , .ZN ( ctmn_13893 ) ) ;
NR2D0BWP30P140HVT ctmi_15468 ( .A1 ( ctmn_13862 ) , .A2 ( ctmn_13456 ) , 
    .ZN ( \u_mac_and_scale/mult_4_2_bottom[0] ) ) ;
AN3D0BWP30P140HVT ctmi_15469 ( .A1 ( phfnn_3721 ) , 
    .A2 ( operand_B_reg[17] ) , .A3 ( \u_mac_and_scale/mult_4_2_bottom[0] ) , 
    .Z ( N10350 ) ) ;
OAI32D0BWP30P140HVT ctmi_15470 ( .A1 ( N10350 ) , .A2 ( ctmn_13450 ) , 
    .A3 ( ctmn_13862 ) , .B1 ( N10350 ) , .B2 ( ctmn_13894 ) , .ZN ( N235 ) ) ;
ND2D0BWP30P140HVT ctmi_15471 ( .A1 ( operand_B_reg[17] ) , 
    .A2 ( phfnn_3729 ) , .ZN ( ctmn_13894 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5313 ( .I ( phfnn_2542 ) , .ZN ( phfnn_3843 ) ) ;
ND2D0BWP30P140HVT ctmi_15473 ( .A1 ( ctmn_13664 ) , .A2 ( phfnn_3738 ) , 
    .ZN ( ctmn_13897 ) ) ;
AOI21D0BWP30P140HVT ctmi_15474 ( .A1 ( operand_A_reg[31] ) , 
    .A2 ( HFSNET_25 ) , .B ( ctmn_13667 ) , .ZN ( ctmn_13895 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5317 ( .I ( ctmn_14792 ) , .ZN ( phfnn_3847 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5314 ( .I ( ctmn_14721 ) , .ZN ( phfnn_3844 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5316 ( .I ( ctmn_14838 ) , .ZN ( phfnn_3846 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5320 ( .I ( ctmn_14714 ) , .ZN ( phfnn_3850 ) ) ;
NR3D0BWP30P140HVT ctmi_15479 ( .A1 ( ctmn_13905 ) , .A2 ( ctmn_13906 ) , 
    .A3 ( ctmn_13907 ) , .ZN ( ctmn_13908 ) ) ;
ND2D0BWP30P140HVT ctmi_15480 ( .A1 ( ctmn_13902 ) , .A2 ( ctmn_13904 ) , 
    .ZN ( ctmn_13905 ) ) ;
NR2D0BWP30P140HVT ctmi_15481 ( .A1 ( ctmn_13901 ) , .A2 ( HFSNET_18 ) , 
    .ZN ( ctmn_13902 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5322 ( .I ( ctmn_14725 ) , .ZN ( phfnn_3852 ) ) ;
NR2D0BWP30P140HVT ctmi_15483 ( .A1 ( ctmn_13903 ) , .A2 ( HFSNET_18 ) , 
    .ZN ( ctmn_13904 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5336 ( .I ( ctmn_14965 ) , .ZN ( phfnn_3866 ) ) ;
AOI21D0BWP30P140HVT ctmi_15485 ( .A1 ( operand_A_reg[30] ) , 
    .A2 ( HFSNET_25 ) , .B ( ctmn_13681 ) , .ZN ( ctmn_13906 ) ) ;
OAI31D0BWP30P140HVT ctmi_15531 ( .A1 ( N10440 ) , .A2 ( N10445 ) , 
    .A3 ( ctmn_13937 ) , .B ( phfnn_2531 ) , 
    .ZN ( \u_mac_and_scale/mult_3/mult10 [7] ) ) ;
CKND0BWP30P140HVT phfnr_buf_5329 ( .I ( ctmn_14732 ) , .ZN ( phfnn_3859 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5323 ( .I ( ctmn_14686 ) , .ZN ( phfnn_3853 ) ) ;
MUX2ND0BWP30P140HVT ctmi_15487 ( .I0 ( ctmn_13910 ) , .I1 ( phfnn_3780 ) , 
    .S ( ctmn_13913 ) , .ZN ( N10386 ) ) ;
AOI21D0BWP30P140HVT ctmi_15499 ( .A1 ( ctmn_13918 ) , .A2 ( ctmn_13908 ) , 
    .B ( N180 ) , .ZN ( N10406 ) ) ;
AOI22D0BWP30P140HVT ctmi_15493 ( .A1 ( ctmn_13902 ) , .A2 ( phfnn_3738 ) , 
    .B1 ( phfnn_3720 ) , .B2 ( ctmn_13904 ) , .ZN ( N10390 ) ) ;
AOI21D0BWP30P140HVT ctmi_15495 ( .A1 ( phfnn_3738 ) , .A2 ( phfnn_671 ) , 
    .B ( ctmn_13916 ) , .ZN ( N10398 ) ) ;
NR3D0BWP30P140HVT ctmi_15496 ( .A1 ( ctmn_13905 ) , .A2 ( ctmn_13907 ) , 
    .A3 ( ctmn_13915 ) , .ZN ( ctmn_13916 ) ) ;
AOI21D0BWP30P140HVT ctmi_15497 ( .A1 ( operand_A_reg[28] ) , 
    .A2 ( HFSNET_28 ) , .B ( ctmn_13696 ) , .ZN ( ctmn_13915 ) ) ;
AOI31D0BWP30P140HVT ctmi_15498 ( .A1 ( phfnn_3720 ) , .A2 ( ctmn_13902 ) , 
    .A3 ( ctmn_13913 ) , .B ( N10390 ) , .ZN ( N10403 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5324 ( .I ( ctmn_14691 ) , .ZN ( phfnn_3854 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5325 ( .I ( phfnn_878 ) , .ZN ( phfnn_3855 ) ) ;
NR2D0BWP30P140HVT ctmi_15503 ( .A1 ( phfnn_2389 ) , .A2 ( ctmn_13895 ) , 
    .ZN ( N10415 ) ) ;
ND3D0BWP30P140HVT ctmTdsLR_1_3564 ( .A1 ( \u_mac_and_scale/N7 ) , 
    .A2 ( ctmn_13952 ) , .A3 ( \u_mac_and_scale/mult_4_1_bottom [6] ) , 
    .ZN ( tmp_net2650 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5326 ( .I ( ctmn_14800 ) , .ZN ( phfnn_3856 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5327 ( .I ( ctmn_14793 ) , .ZN ( phfnn_3857 ) ) ;
NR2D0BWP30P140HVT ctmi_15511 ( .A1 ( phfnn_2389 ) , .A2 ( ctmn_13906 ) , 
    .ZN ( N10428 ) ) ;
NR2D0BWP30P140HVT ctmi_15536 ( .A1 ( ctmn_13499 ) , .A2 ( ctmn_13906 ) , 
    .ZN ( N10481 ) ) ;
OAI32D0BWP30P140HVT ctmi_15510 ( .A1 ( ctmn_13916 ) , .A2 ( ctmn_13915 ) , 
    .A3 ( phfnn_3689 ) , .B1 ( ctmn_13916 ) , .B2 ( ctmn_13923 ) , 
    .ZN ( N10427 ) ) ;
OAI32D0BWP30P140HVT ctmi_15512 ( .A1 ( N181 ) , .A2 ( ctmn_13915 ) , 
    .A3 ( phfnn_3690 ) , .B1 ( N181 ) , .B2 ( ctmn_13924 ) , .ZN ( N10432 ) ) ;
ND2D0BWP30P140HVT ctmi_15513 ( .A1 ( phfnn_671 ) , .A2 ( phfnn_3712 ) , 
    .ZN ( ctmn_13924 ) ) ;
NR2D0BWP30P140HVT ctmi_15514 ( .A1 ( phfnn_2389 ) , .A2 ( ctmn_13915 ) , 
    .ZN ( \u_mac_and_scale/mult_3/mult10 [0] ) ) ;
AN3D0BWP30P140HVT ctmi_15515 ( .A1 ( phfnn_3712 ) , .A2 ( phfnn_671 ) , 
    .A3 ( \u_mac_and_scale/mult_3/mult10 [0] ) , .Z ( N10433 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5328 ( .I ( ctmn_14812 ) , .ZN ( phfnn_3858 ) ) ;
OAI32D0BWP30P140HVT ctmTdsLR_2_3572 ( .A1 ( tmp_net2652 ) , .A2 ( N10234 ) , 
    .A3 ( ctmn_13881 ) , .B1 ( tmp_net2652 ) , .B2 ( N10239 ) , 
    .ZN ( phfnn_2529 ) ) ;
NR2D0BWP30P140HVT ctmi_15518 ( .A1 ( phfnn_3801 ) , .A2 ( ctmn_13936 ) , 
    .ZN ( ctmn_13937 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5331 ( .I ( ctmn_14829 ) , .ZN ( phfnn_3861 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15520 ( .A ( ctmn_13934 ) , .B ( ctmn_13935 ) , 
    .C ( N11867 ) , .ZN ( ctmn_13936 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15521 ( .A ( phfnn_3781 ) , .B ( N11862 ) , 
    .C ( ctmn_13933 ) , .ZN ( ctmn_13934 ) ) ;
OAI32D0BWP30P140HVT ctmi_15533 ( .A1 ( N10433 ) , .A2 ( ctmn_13907 ) , 
    .A3 ( phfnn_2389 ) , .B1 ( N10433 ) , .B2 ( ctmn_13941 ) , 
    .ZN ( \u_mac_and_scale/mult_3/mult10 [1] ) ) ;
CKND0BWP30P140HVT phfnr_buf_5332 ( .I ( ctmn_14816 ) , .ZN ( phfnn_3862 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5333 ( .I ( ctmn_14845 ) , .ZN ( phfnn_3863 ) ) ;
NR2D0BWP30P140HVT ctmi_15537 ( .A1 ( ctmn_13942 ) , .A2 ( ctmn_13895 ) , 
    .ZN ( N10482 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5335 ( .I ( ctmn_14879 ) , .ZN ( phfnn_3865 ) ) ;
NR4D0BWP30P140HVT ctmi_15539 ( .A1 ( ctmn_13505 ) , .A2 ( ctmn_13499 ) , 
    .A3 ( ctmn_13907 ) , .A4 ( ctmn_13915 ) , .ZN ( N10485 ) ) ;
OAI32D0BWP30P140HVT ctmi_15540 ( .A1 ( ctmn_13943 ) , .A2 ( ctmn_13915 ) , 
    .A3 ( ctmn_13511 ) , .B1 ( ctmn_13943 ) , .B2 ( ctmn_13944 ) , 
    .ZN ( N10490 ) ) ;
NR4D0BWP30P140HVT ctmi_15541 ( .A1 ( ctmn_13511 ) , .A2 ( ctmn_13505 ) , 
    .A3 ( ctmn_13907 ) , .A4 ( ctmn_13915 ) , .ZN ( ctmn_13943 ) ) ;
ND2D0BWP30P140HVT ctmi_15542 ( .A1 ( operand_B_reg[30] ) , 
    .A2 ( phfnn_3712 ) , .ZN ( ctmn_13944 ) ) ;
NR2D0BWP30P140HVT ctmi_15543 ( .A1 ( ctmn_13942 ) , .A2 ( ctmn_13906 ) , 
    .ZN ( N10491 ) ) ;
OAI32D0BWP30P140HVT ctmi_15544 ( .A1 ( N10485 ) , .A2 ( ctmn_13915 ) , 
    .A3 ( ctmn_13505 ) , .B1 ( N10485 ) , .B2 ( ctmn_13945 ) , 
    .ZN ( N10495 ) ) ;
ND2D0BWP30P140HVT ctmi_15545 ( .A1 ( operand_B_reg[29] ) , 
    .A2 ( phfnn_3712 ) , .ZN ( ctmn_13945 ) ) ;
NR2D0BWP30P140HVT ctmi_15550 ( .A1 ( ctmn_13898 ) , .A2 ( ctmn_13502 ) , 
    .ZN ( N10544 ) ) ;
NR2D0BWP30P140HVT ctmi_15546 ( .A1 ( ctmn_13942 ) , .A2 ( ctmn_13915 ) , 
    .ZN ( \u_mac_and_scale/mult_4_3_top [0] ) ) ;
AN3D0BWP30P140HVT ctmi_15547 ( .A1 ( phfnn_3712 ) , 
    .A2 ( operand_B_reg[29] ) , .A3 ( \u_mac_and_scale/mult_4_3_top [0] ) , 
    .Z ( N10496 ) ) ;
OAI32D0BWP30P140HVT ctmi_15548 ( .A1 ( N10496 ) , .A2 ( ctmn_13907 ) , 
    .A3 ( ctmn_13942 ) , .B1 ( N10496 ) , .B2 ( ctmn_13946 ) , 
    .ZN ( \u_mac_and_scale/mult_4_3_top [1] ) ) ;
ND2D0BWP30P140HVT ctmi_15549 ( .A1 ( operand_B_reg[29] ) , 
    .A2 ( phfnn_3716 ) , .ZN ( ctmn_13946 ) ) ;
NR2D0BWP30P140HVT ctmi_15551 ( .A1 ( ctmn_13919 ) , .A2 ( phfnn_3727 ) , 
    .ZN ( N10545 ) ) ;
NR3D0BWP30P140HVT ctmi_15552 ( .A1 ( ctmn_13898 ) , .A2 ( ctmn_13947 ) , 
    .A3 ( ctmn_13510 ) , .ZN ( N10547 ) ) ;
ND2D0BWP30P140HVT ctmi_15553 ( .A1 ( operand_B_reg[26] ) , 
    .A2 ( phfnn_3722 ) , .ZN ( ctmn_13947 ) ) ;
AOI21D0BWP30P140HVT ctmi_15554 ( .A1 ( ctmn_13947 ) , .A2 ( ctmn_13948 ) , 
    .B ( ctmn_13949 ) , .ZN ( N10550 ) ) ;
ND2D0BWP30P140HVT ctmi_15555 ( .A1 ( operand_B_reg[27] ) , 
    .A2 ( phfnn_3730 ) , .ZN ( ctmn_13948 ) ) ;
NR3D0BWP30P140HVT ctmi_15556 ( .A1 ( ctmn_13903 ) , .A2 ( ctmn_13947 ) , 
    .A3 ( ctmn_13510 ) , .ZN ( ctmn_13949 ) ) ;
NR2D0BWP30P140HVT ctmi_15557 ( .A1 ( ctmn_13919 ) , .A2 ( ctmn_13502 ) , 
    .ZN ( N10551 ) ) ;
OAI32D0BWP30P140HVT ctmi_15558 ( .A1 ( N10547 ) , .A2 ( ctmn_13510 ) , 
    .A3 ( ctmn_13901 ) , .B1 ( N10547 ) , .B2 ( ctmn_13950 ) , 
    .ZN ( N10555 ) ) ;
ND2D0BWP30P140HVT ctmi_15559 ( .A1 ( operand_B_reg[25] ) , 
    .A2 ( phfnn_3722 ) , .ZN ( ctmn_13950 ) ) ;
NR2D0BWP30P140HVT ctmi_15560 ( .A1 ( ctmn_13919 ) , .A2 ( ctmn_13510 ) , 
    .ZN ( \u_mac_and_scale/mult_4_3_bottom [0] ) ) ;
AN3D0BWP30P140HVT ctmi_15561 ( .A1 ( phfnn_3722 ) , 
    .A2 ( operand_B_reg[25] ) , .A3 ( \u_mac_and_scale/mult_4_3_bottom [0] ) , 
    .Z ( N10556 ) ) ;
OAI32D0BWP30P140HVT ctmi_15562 ( .A1 ( N10556 ) , .A2 ( ctmn_13507 ) , 
    .A3 ( ctmn_13919 ) , .B1 ( N10556 ) , .B2 ( ctmn_13951 ) , 
    .ZN ( \u_mac_and_scale/mult_4_3_bottom [1] ) ) ;
IOA21D0BWP30P140HVT ctmTdsLR_2_3596 ( .A1 ( HFSNET_22 ) , .A2 ( N83 ) , 
    .B ( tmp_net2662 ) , .ZN ( \RS_OP_250_54632_65499_J1/N59 ) ) ;
ND2D0BWP30P140HVT ctmi_15563 ( .A1 ( operand_B_reg[25] ) , 
    .A2 ( phfnn_3730 ) , .ZN ( ctmn_13951 ) ) ;
NR2D1BWP30P140HVT ctmi_15565 ( .A1 ( ctmn_13331 ) , .A2 ( \config_out[3] ) , 
    .ZN ( ctmn_13952 ) ) ;
XOR2UD0BWP30P140HVT ctmi_15566 ( .A1 ( ctmn_13995 ) , .A2 ( ctmn_13998 ) , 
    .Z ( \u_mac_and_scale/mult_4_0_bottom[7] ) ) ;
MAOI222D0BWP30P140HVT ctmi_15567 ( .A ( ctmn_13972 ) , .B ( ctmn_13993 ) , 
    .C ( ctmn_13994 ) , .ZN ( ctmn_13995 ) ) ;
XOR2UD0BWP30P140HVT ctmi_15568 ( .A1 ( ctmn_13960 ) , .A2 ( ctmn_13971 ) , 
    .Z ( ctmn_13972 ) ) ;
ND2D0BWP30P140HVT ctmi_15569 ( .A1 ( ctmn_13955 ) , .A2 ( ctmn_13959 ) , 
    .ZN ( ctmn_13960 ) ) ;
ND2D0BWP30P140HVT ctmi_15570 ( .A1 ( operand_B_reg[1] ) , .A2 ( ctmn_13954 ) , 
    .ZN ( ctmn_13955 ) ) ;
NR2D0BWP30P140HVT ctmi_15571 ( .A1 ( ctmn_13953 ) , .A2 ( \config_out[3] ) , 
    .ZN ( ctmn_13954 ) ) ;
ND2D0BWP30P140HVT ctmi_15572 ( .A1 ( operand_A_reg[3] ) , .A2 ( HFSNET_25 ) , 
    .ZN ( ctmn_13953 ) ) ;
ND3D0BWP30P140HVT ctmi_15573 ( .A1 ( ctmn_13956 ) , .A2 ( phfnn_3724 ) , 
    .A3 ( ctmn_13958 ) , .ZN ( ctmn_13959 ) ) ;
NR2D0BWP30P140HVT ctmi_15574 ( .A1 ( ctmn_13676 ) , .A2 ( HFSNET_15 ) , 
    .ZN ( ctmn_13956 ) ) ;
ND3D0BWP30P140HVT ctmi_15575 ( .A1 ( operand_B_reg[3] ) , .A2 ( ctmn_13957 ) , 
    .A3 ( phfnn_3724 ) , .ZN ( ctmn_13958 ) ) ;
NR2D0BWP30P140HVT ctmi_15576 ( .A1 ( ctmn_13674 ) , .A2 ( ctmn_13611 ) , 
    .ZN ( ctmn_13957 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5337 ( .I ( ctmn_14876 ) , .ZN ( phfnn_3867 ) ) ;
AOI221D0BWP30P140HVT ctmTdsLR_1_3599 ( .A1 ( N60 ) , .A2 ( HFSNET_20 ) , 
    .B1 ( \RS_OP_250_54632_65499_J1/N102 ) , .B2 ( phfnn_648 ) , 
    .C ( \RS_OP_250_54632_65499_J1/ctmn_152 ) , .ZN ( ctmn_14093 ) ) ;
XNR3UD0BWP30P140HVT ctmi_15617 ( .A1 ( ctmn_13985 ) , .A2 ( ctmn_13986 ) , 
    .A3 ( ctmn_13992 ) , .ZN ( \u_mac_and_scale/mult_4_0_bottom[5] ) ) ;
XOR3UD0BWP30P140HVT ctmi_15619 ( .A1 ( ctmn_13984 ) , .A2 ( ctmn_13977 ) , 
    .A3 ( N11569 ) , .Z ( \u_mac_and_scale/mult_4_0_bottom[4] ) ) ;
AO21D0BWP30P140HVT ctmTdsLR_1_3618 ( .A1 ( N206 ) , .A2 ( HFSNET_22 ) , 
    .B ( \RS_OP_250_54632_65499_J1/ctmn_154 ) , .Z ( N310 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5338 ( .I ( phfnn_3220 ) , .ZN ( phfnn_3868 ) ) ;
ND3D0BWP30P140HVT ctmTdsLR_1_3834 ( .A1 ( \u_mac_and_scale/N7 ) , 
    .A2 ( ctmn_13952 ) , .A3 ( \u_mac_and_scale/mult_4_1_bottom [2] ) , 
    .ZN ( tmp_net2744 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5339 ( .I ( phfnn_2014 ) , .ZN ( phfnn_3869 ) ) ;
AOI21D0BWP30P140HVT ctmTdsLR_1_3600 ( .A1 ( N72 ) , .A2 ( phfnn_648 ) , 
    .B ( \RS_OP_250_54632_65499_J1/ctmn_156 ) , .ZN ( N315 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5340 ( .I ( phfnn_899 ) , .ZN ( phfnn_3870 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5341 ( .I ( phfnn_881 ) , .ZN ( phfnn_3871 ) ) ;
XOR3UD0BWP30P140HVT ctmi_15633 ( .A1 ( N11517 ) , .A2 ( ctmn_13765 ) , 
    .A3 ( ctmn_13768 ) , .Z ( \u_mac_and_scale/mult_4_0_top [4] ) ) ;
AO21D0BWP30P140HVT ctmTdsLR_1_3619 ( .A1 ( N222 ) , .A2 ( phfnn_648 ) , 
    .B ( \RS_OP_250_54632_65499_J1/ctmn_155 ) , .Z ( N311 ) ) ;
ND3D0BWP30P140HVT ctmTdsLR_1_3620 ( .A1 ( \u_mac_and_scale/N7 ) , 
    .A2 ( ctmn_13952 ) , .A3 ( \u_mac_and_scale/mult_4_0_top [0] ) , 
    .ZN ( tmp_net2672 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5342 ( .I ( ctmn_14886 ) , .ZN ( phfnn_3872 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5343 ( .I ( phfnn_3229 ) , .ZN ( phfnn_3873 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5344 ( .I ( ctmn_14844 ) , .ZN ( phfnn_3874 ) ) ;
OAI32D0BWP30P140HVT ctmTdsLR_2_3574 ( .A1 ( tmp_net2653 ) , .A2 ( N9818 ) , 
    .A3 ( ctmn_13720 ) , .B1 ( tmp_net2653 ) , .B2 ( N9823 ) , 
    .ZN ( phfnn_2528 ) ) ;
XNR3UD0BWP30P140HVT ctmi_15691 ( .A1 ( ctmn_14039 ) , .A2 ( ctmn_14040 ) , 
    .A3 ( ctmn_14046 ) , .ZN ( \u_mac_and_scale/mult_4_1_bottom [5] ) ) ;
XOR3UD0BWP30P140HVT ctmi_15693 ( .A1 ( ctmn_14038 ) , .A2 ( ctmn_14031 ) , 
    .A3 ( N11702 ) , .Z ( \u_mac_and_scale/mult_4_1_bottom [4] ) ) ;
ND3D0BWP30P140HVT ctmTdsLR_1_3610 ( .A1 ( N249 ) , 
    .A2 ( \u_mac_and_scale/N7 ) , .A3 ( ctmn_13952 ) , .ZN ( tmp_net2668 ) ) ;
XOR2UD0BWP30P140HVT ctmTdsLR_1_3841 ( .A1 ( ctmn_14163 ) , 
    .A2 ( ctmn_14168 ) , .Z ( tmp_net2642 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5347 ( .I ( phfnn_874 ) , .ZN ( phfnn_3877 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5348 ( .I ( ctmn_14693 ) , .ZN ( phfnn_3878 ) ) ;
OAI211D0BWP30P140HVT ctmi_15699 ( .A1 ( ctmn_13511 ) , .A2 ( ctmn_14058 ) , 
    .B ( ctmn_14060 ) , .C ( ctmn_14061 ) , 
    .ZN ( \u_mac_and_scale/addend_lo [31] ) ) ;
OAI211D0BWP30P140HVT ctmi_15705 ( .A1 ( ctmn_13505 ) , .A2 ( ctmn_14058 ) , 
    .B ( ctmn_14062 ) , .C ( ctmn_14063 ) , 
    .ZN ( \u_mac_and_scale/addend_lo [30] ) ) ;
AOI21D0BWP30P140HVT ctmi_1441 ( .A1 ( HFSNET_20 ) , .A2 ( N40 ) , 
    .B ( N306 ) , .ZN ( ctmn_14060 ) ) ;
AOI222D0BWP30P140HVT ctmi_15707 ( .A1 ( HFSNET_10 ) , .A2 ( N57 ) , 
    .B1 ( HFSNET_8 ) , .B2 ( N49 ) , .C1 ( phfnn_3832 ) , .C2 ( HFSNET_5 ) , 
    .ZN ( ctmn_14063 ) ) ;
OAI211D0BWP30P140HVT ctmi_15708 ( .A1 ( ctmn_13499 ) , .A2 ( ctmn_14058 ) , 
    .B ( ctmn_14064 ) , .C ( ctmn_14065 ) , 
    .ZN ( \u_mac_and_scale/addend_lo [29] ) ) ;
AOI21D0BWP30P140HVT ctmi_1440 ( .A1 ( HFSNET_20 ) , .A2 ( N41 ) , 
    .B ( N306 ) , .ZN ( ctmn_14062 ) ) ;
AOI222D0BWP30P140HVT ctmi_15710 ( .A1 ( HFSNET_10 ) , .A2 ( N58 ) , 
    .B1 ( HFSNET_8 ) , .B2 ( N50 ) , .C1 ( phfnn_3827 ) , .C2 ( HFSNET_5 ) , 
    .ZN ( ctmn_14065 ) ) ;
OAI211D0BWP30P140HVT ctmi_15711 ( .A1 ( ctmn_13942 ) , .A2 ( ctmn_14058 ) , 
    .B ( ctmn_14066 ) , .C ( ctmn_14067 ) , 
    .ZN ( \u_mac_and_scale/addend_lo [28] ) ) ;
AOI21D0BWP30P140HVT ctmi_1439 ( .A1 ( HFSNET_20 ) , .A2 ( N42 ) , 
    .B ( N306 ) , .ZN ( ctmn_14064 ) ) ;
AOI222D0BWP30P140HVT ctmi_15713 ( .A1 ( HFSNET_10 ) , .A2 ( N59 ) , 
    .B1 ( HFSNET_8 ) , .B2 ( N51 ) , .C1 ( phfnn_3820 ) , .C2 ( HFSNET_5 ) , 
    .ZN ( ctmn_14067 ) ) ;
OAI211D0BWP30P140HVT ctmi_15714 ( .A1 ( ctmn_13903 ) , .A2 ( ctmn_14058 ) , 
    .B ( ctmn_14068 ) , .C ( ctmn_14069 ) , 
    .ZN ( \u_mac_and_scale/addend_lo [27] ) ) ;
AOI21D0BWP30P140HVT ctmi_1438 ( .A1 ( HFSNET_20 ) , .A2 ( N43 ) , 
    .B ( N306 ) , .ZN ( ctmn_14066 ) ) ;
AOI222D0BWP30P140HVT ctmi_15716 ( .A1 ( HFSNET_10 ) , .A2 ( N60 ) , 
    .B1 ( HFSNET_8 ) , .B2 ( N52 ) , .C1 ( phfnn_3806 ) , .C2 ( HFSNET_5 ) , 
    .ZN ( ctmn_14069 ) ) ;
OAI211D0BWP30P140HVT ctmi_15717 ( .A1 ( ctmn_13901 ) , .A2 ( ctmn_14058 ) , 
    .B ( ctmn_14070 ) , .C ( ctmn_14071 ) , 
    .ZN ( \u_mac_and_scale/addend_lo [26] ) ) ;
AOI21D0BWP30P140HVT ctmi_1437 ( .A1 ( HFSNET_20 ) , .A2 ( N44 ) , 
    .B ( N306 ) , .ZN ( ctmn_14068 ) ) ;
AOI222D0BWP30P140HVT ctmi_15719 ( .A1 ( HFSNET_10 ) , .A2 ( N61 ) , 
    .B1 ( HFSNET_8 ) , .B2 ( N53 ) , .C1 ( phfnn_3797 ) , .C2 ( phfnn_639 ) , 
    .ZN ( ctmn_14071 ) ) ;
OAI211D0BWP30P140HVT ctmi_15720 ( .A1 ( ctmn_13898 ) , .A2 ( ctmn_14058 ) , 
    .B ( ctmn_14072 ) , .C ( ctmn_14073 ) , 
    .ZN ( \u_mac_and_scale/addend_lo [25] ) ) ;
AOI21D0BWP30P140HVT ctmi_1436 ( .A1 ( HFSNET_20 ) , .A2 ( N45 ) , 
    .B ( N306 ) , .ZN ( ctmn_14070 ) ) ;
AOI222D0BWP30P140HVT ctmi_15722 ( .A1 ( HFSNET_10 ) , .A2 ( N62 ) , 
    .B1 ( HFSNET_8 ) , .B2 ( N54 ) , .C1 ( phfnn_3786 ) , .C2 ( phfnn_639 ) , 
    .ZN ( ctmn_14073 ) ) ;
OAI211D0BWP30P140HVT ctmi_15723 ( .A1 ( ctmn_13919 ) , .A2 ( ctmn_14058 ) , 
    .B ( ctmn_14074 ) , .C ( ctmn_14075 ) , 
    .ZN ( \u_mac_and_scale/addend_lo [24] ) ) ;
AOI21D0BWP30P140HVT ctmi_1435 ( .A1 ( HFSNET_20 ) , .A2 ( N46 ) , 
    .B ( N306 ) , .ZN ( ctmn_14072 ) ) ;
AOI222D0BWP30P140HVT ctmi_15725 ( .A1 ( HFSNET_10 ) , .A2 ( N63 ) , 
    .B1 ( HFSNET_8 ) , .B2 ( phfnn_3891 ) , .C1 ( phfnn_3764 ) , 
    .C2 ( phfnn_639 ) , .ZN ( ctmn_14075 ) ) ;
OAI221D0BWP30P140HVT ctmi_15726 ( .A1 ( phfnn_3899 ) , .A2 ( HFSNET_19 ) , 
    .B1 ( ctmn_13457 ) , .B2 ( ctmn_14058 ) , .C ( ctmn_14077 ) , 
    .ZN ( \u_mac_and_scale/addend_lo [23] ) ) ;
CKND0BWP30P140HVT phfnr_buf_5349 ( .I ( ctmn_2080 ) , .ZN ( phfnn_3879 ) ) ;
AOI21D0BWP30P140HVT ctmi_1434 ( .A1 ( HFSNET_20 ) , .A2 ( N47 ) , 
    .B ( N306 ) , .ZN ( ctmn_14074 ) ) ;
OAI221D0BWP30P140HVT ctmi_15729 ( .A1 ( phfnn_3898 ) , .A2 ( HFSNET_19 ) , 
    .B1 ( ctmn_13445 ) , .B2 ( ctmn_14058 ) , .C ( ctmn_14078 ) , 
    .ZN ( \u_mac_and_scale/addend_lo [22] ) ) ;
AOI221D0BWP30P140HVT ctmi_1433 ( .A1 ( HFSNET_8 ) , .A2 ( N56 ) , 
    .B1 ( N64 ) , .B2 ( HFSNET_10 ) , .C ( N306 ) , .ZN ( ctmn_14077 ) ) ;
OAI221D0BWP30P140HVT ctmi_15731 ( .A1 ( phfnn_3897 ) , .A2 ( HFSNET_19 ) , 
    .B1 ( ctmn_13431 ) , .B2 ( ctmn_14058 ) , .C ( ctmn_14079 ) , 
    .ZN ( \u_mac_and_scale/addend_lo [21] ) ) ;
AOI221D0BWP30P140HVT ctmi_1432 ( .A1 ( N57 ) , .A2 ( HFSNET_8 ) , 
    .B1 ( HFSNET_10 ) , .B2 ( phfnn_3832 ) , .C ( N306 ) , 
    .ZN ( ctmn_14078 ) ) ;
OAI221D0BWP30P140HVT ctmi_15733 ( .A1 ( phfnn_3896 ) , .A2 ( HFSNET_19 ) , 
    .B1 ( ctmn_13885 ) , .B2 ( ctmn_14058 ) , .C ( ctmn_14080 ) , 
    .ZN ( \u_mac_and_scale/addend_lo [20] ) ) ;
AOI221D0BWP30P140HVT ctmi_1431 ( .A1 ( N58 ) , .A2 ( HFSNET_8 ) , 
    .B1 ( HFSNET_10 ) , .B2 ( phfnn_3827 ) , .C ( N306 ) , 
    .ZN ( ctmn_14079 ) ) ;
OAI221D0BWP30P140HVT ctmi_15735 ( .A1 ( phfnn_3895 ) , .A2 ( HFSNET_19 ) , 
    .B1 ( ctmn_13846 ) , .B2 ( ctmn_14058 ) , .C ( ctmn_14081 ) , 
    .ZN ( \u_mac_and_scale/addend_lo [19] ) ) ;
AOI221D0BWP30P140HVT ctmi_1430 ( .A1 ( N59 ) , .A2 ( HFSNET_8 ) , 
    .B1 ( HFSNET_10 ) , .B2 ( phfnn_3820 ) , .C ( N306 ) , 
    .ZN ( ctmn_14080 ) ) ;
OAI221D0BWP30P140HVT ctmi_15737 ( .A1 ( phfnn_3894 ) , .A2 ( HFSNET_19 ) , 
    .B1 ( ctmn_13844 ) , .B2 ( ctmn_14058 ) , .C ( ctmn_14082 ) , 
    .ZN ( \u_mac_and_scale/addend_lo [18] ) ) ;
AOI221D0BWP30P140HVT ctmi_1429 ( .A1 ( N60 ) , .A2 ( HFSNET_8 ) , 
    .B1 ( HFSNET_10 ) , .B2 ( phfnn_3806 ) , .C ( N306 ) , 
    .ZN ( ctmn_14081 ) ) ;
OAI221D0BWP30P140HVT ctmi_15739 ( .A1 ( phfnn_3892 ) , .A2 ( HFSNET_19 ) , 
    .B1 ( ctmn_13841 ) , .B2 ( ctmn_14058 ) , .C ( ctmn_14083 ) , 
    .ZN ( \u_mac_and_scale/addend_lo [17] ) ) ;
AOI221D0BWP30P140HVT ctmi_1428 ( .A1 ( HFSNET_8 ) , .A2 ( N61 ) , 
    .B1 ( HFSNET_10 ) , .B2 ( phfnn_3797 ) , .C ( N306 ) , 
    .ZN ( ctmn_14082 ) ) ;
OAI221D0BWP30P140HVT ctmi_15741 ( .A1 ( phfnn_908 ) , .A2 ( HFSNET_19 ) , 
    .B1 ( ctmn_13862 ) , .B2 ( ctmn_14058 ) , .C ( ctmn_14084 ) , 
    .ZN ( \u_mac_and_scale/addend_lo [16] ) ) ;
AOI221D0BWP30P140HVT ctmi_1427 ( .A1 ( HFSNET_8 ) , .A2 ( N62 ) , 
    .B1 ( HFSNET_10 ) , .B2 ( phfnn_3786 ) , .C ( N306 ) , 
    .ZN ( ctmn_14083 ) ) ;
IOA21D0BWP30P140HVT ctmi_15743 ( .A1 ( N56 ) , .A2 ( HFSNET_20 ) , 
    .B ( ctmn_14085 ) , .ZN ( \u_mac_and_scale/addend_lo [15] ) ) ;
AOI221D0BWP30P140HVT ctmi_1426 ( .A1 ( HFSNET_8 ) , .A2 ( N63 ) , 
    .B1 ( HFSNET_10 ) , .B2 ( phfnn_3764 ) , .C ( N322 ) , 
    .ZN ( ctmn_14084 ) ) ;
OAI221D0BWP30P140HVT ctmi_15745 ( .A1 ( HFSNET_6 ) , .A2 ( ctmn_14086 ) , 
    .B1 ( ctmn_13559 ) , .B2 ( ctmn_14058 ) , .C ( ctmn_14087 ) , 
    .ZN ( \u_mac_and_scale/addend_lo [14] ) ) ;
CKND0BWP30P140HVT phfnr_buf_5350 ( .I ( phfnn_3243 ) , .ZN ( phfnn_3880 ) ) ;
AOI221D0BWP30P140HVT ctmi_1425 ( .A1 ( HFSNET_8 ) , .A2 ( N64 ) , 
    .B1 ( operand_B_reg[15] ) , .B2 ( phfnn_3661 ) , .C ( N323 ) , 
    .ZN ( ctmn_14085 ) ) ;
OAI221D0BWP30P140HVT ctmi_15748 ( .A1 ( HFSNET_6 ) , .A2 ( ctmn_14088 ) , 
    .B1 ( ctmn_13553 ) , .B2 ( ctmn_14058 ) , .C ( ctmn_14089 ) , 
    .ZN ( \u_mac_and_scale/addend_lo [13] ) ) ;
CKND0BWP30P140HVT phfnr_buf_5351 ( .I ( phfnn_2590 ) , .ZN ( phfnn_3881 ) ) ;
ND3D0BWP30P140HVT ctmTdsLR_1_3575 ( .A1 ( N257 ) , 
    .A2 ( \u_mac_and_scale/N7 ) , .A3 ( ctmn_13952 ) , .ZN ( tmp_net2654 ) ) ;
OAI221D0BWP30P140HVT ctmi_15751 ( .A1 ( HFSNET_6 ) , .A2 ( ctmn_14090 ) , 
    .B1 ( ctmn_13827 ) , .B2 ( ctmn_14058 ) , .C ( ctmn_14091 ) , 
    .ZN ( \u_mac_and_scale/addend_lo [12] ) ) ;
CKND0BWP30P140HVT phfnr_buf_5354 ( .I ( ctmn_14896 ) , .ZN ( phfnn_3884 ) ) ;
ND3D0BWP30P140HVT ctmTdsLR_1_3601 ( 
    .A1 ( \u_mac_and_scale/mult_4_0_top [4] ) , .A2 ( \u_mac_and_scale/N7 ) , 
    .A3 ( ctmn_13952 ) , .ZN ( tmp_net2664 ) ) ;
OAI221D0BWP30P140HVT ctmi_15754 ( .A1 ( HFSNET_6 ) , .A2 ( ctmn_14092 ) , 
    .B1 ( ctmn_13790 ) , .B2 ( ctmn_14058 ) , .C ( ctmn_14093 ) , 
    .ZN ( \u_mac_and_scale/addend_lo [11] ) ) ;
CKND0BWP30P140HVT phfnr_buf_5355 ( .I ( phfnn_3252 ) , .ZN ( phfnn_3885 ) ) ;
IOA21D1BWP30P140HVT ctmTdsLR_2_3602 ( .A1 ( N232 ) , .A2 ( HFSNET_22 ) , 
    .B ( tmp_net2664 ) , .ZN ( \RS_OP_250_54632_65499_J1/N43 ) ) ;
OAI221D0BWP30P140HVT ctmi_15757 ( .A1 ( HFSNET_6 ) , .A2 ( ctmn_14094 ) , 
    .B1 ( ctmn_13788 ) , .B2 ( ctmn_14058 ) , .C ( ctmn_14095 ) , 
    .ZN ( \u_mac_and_scale/addend_lo [10] ) ) ;
CKND0BWP30P140HVT phfnr_buf_5356 ( .I ( ctmn_14916 ) , .ZN ( phfnn_3886 ) ) ;
AOI22D0BWP30P140HVT ctmi_15759 ( .A1 ( N61 ) , .A2 ( HFSNET_20 ) , 
    .B1 ( \RS_OP_250_54632_65499_J1/N103 ) , .B2 ( ctmn_14059 ) , 
    .ZN ( ctmn_14095 ) ) ;
OAI221D0BWP30P140HVT ctmi_15760 ( .A1 ( HFSNET_6 ) , .A2 ( ctmn_14096 ) , 
    .B1 ( ctmn_13785 ) , .B2 ( ctmn_14058 ) , .C ( ctmn_14097 ) , 
    .ZN ( \u_mac_and_scale/addend_lo [9] ) ) ;
CKND0BWP30P140HVT phfnr_buf_5357 ( .I ( ctmn_14797 ) , .ZN ( phfnn_3887 ) ) ;
AOI22D0BWP30P140HVT ctmi_15762 ( .A1 ( N62 ) , .A2 ( HFSNET_20 ) , 
    .B1 ( \RS_OP_250_54632_65499_J1/N104 ) , .B2 ( ctmn_14059 ) , 
    .ZN ( ctmn_14097 ) ) ;
OAI221D0BWP30P140HVT ctmi_15763 ( .A1 ( HFSNET_6 ) , .A2 ( phfnn_2465 ) , 
    .B1 ( ctmn_13804 ) , .B2 ( ctmn_14058 ) , .C ( ctmn_14099 ) , 
    .ZN ( \u_mac_and_scale/addend_lo [8] ) ) ;
CKND0BWP30P140HVT phfnr_buf_5358 ( .I ( phfnn_903 ) , .ZN ( phfnn_3888 ) ) ;
AOI22D0BWP30P140HVT ctmi_15765 ( .A1 ( N63 ) , .A2 ( HFSNET_20 ) , 
    .B1 ( \RS_OP_250_54632_65499_J1/N105 ) , .B2 ( ctmn_14059 ) , 
    .ZN ( ctmn_14099 ) ) ;
OAI21D0BWP30P140HVT ctmi_15766 ( .A1 ( ctmn_13620 ) , .A2 ( ctmn_14058 ) , 
    .B ( ctmn_14100 ) , .ZN ( \u_mac_and_scale/addend_lo [7] ) ) ;
AOI22D0BWP30P140HVT ctmi_15767 ( .A1 ( N64 ) , .A2 ( HFSNET_20 ) , 
    .B1 ( \RS_OP_250_54632_65499_J1/N106 ) , .B2 ( ctmn_14059 ) , 
    .ZN ( ctmn_14100 ) ) ;
OAI21D0BWP30P140HVT ctmi_15768 ( .A1 ( ctmn_13614 ) , .A2 ( ctmn_14058 ) , 
    .B ( ctmn_14101 ) , .ZN ( \u_mac_and_scale/addend_lo [6] ) ) ;
AOI22D0BWP30P140HVT ctmi_15769 ( .A1 ( phfnn_3832 ) , .A2 ( HFSNET_20 ) , 
    .B1 ( \RS_OP_250_54632_65499_J1/N107 ) , .B2 ( ctmn_14059 ) , 
    .ZN ( ctmn_14101 ) ) ;
OAI21D0BWP30P140HVT ctmi_15770 ( .A1 ( ctmn_13608 ) , .A2 ( ctmn_14058 ) , 
    .B ( ctmn_14102 ) , .ZN ( \u_mac_and_scale/addend_lo [5] ) ) ;
AOI22D0BWP30P140HVT ctmi_15771 ( .A1 ( phfnn_3827 ) , .A2 ( HFSNET_20 ) , 
    .B1 ( \RS_OP_250_54632_65499_J1/N108 ) , .B2 ( ctmn_14059 ) , 
    .ZN ( ctmn_14102 ) ) ;
OAI21D0BWP30P140HVT ctmi_15772 ( .A1 ( ctmn_13724 ) , .A2 ( ctmn_14058 ) , 
    .B ( ctmn_14103 ) , .ZN ( \u_mac_and_scale/addend_lo [4] ) ) ;
AOI22D0BWP30P140HVT ctmi_15773 ( .A1 ( phfnn_3820 ) , .A2 ( HFSNET_20 ) , 
    .B1 ( \RS_OP_250_54632_65499_J1/N109 ) , .B2 ( ctmn_14059 ) , 
    .ZN ( ctmn_14103 ) ) ;
OAI21D0BWP30P140HVT ctmi_15774 ( .A1 ( ctmn_13676 ) , .A2 ( ctmn_14058 ) , 
    .B ( ctmn_14104 ) , .ZN ( \u_mac_and_scale/addend_lo [3] ) ) ;
AOI22D0BWP30P140HVT ctmi_15775 ( .A1 ( phfnn_3806 ) , .A2 ( HFSNET_20 ) , 
    .B1 ( \RS_OP_250_54632_65499_J1/N110 ) , .B2 ( ctmn_14059 ) , 
    .ZN ( ctmn_14104 ) ) ;
OAI21D0BWP30P140HVT ctmi_15776 ( .A1 ( ctmn_13674 ) , .A2 ( ctmn_14058 ) , 
    .B ( ctmn_14105 ) , .ZN ( \u_mac_and_scale/addend_lo [2] ) ) ;
AOI22D0BWP30P140HVT ctmi_15777 ( .A1 ( phfnn_3797 ) , .A2 ( HFSNET_20 ) , 
    .B1 ( \RS_OP_250_54632_65499_J1/N111 ) , .B2 ( ctmn_14059 ) , 
    .ZN ( ctmn_14105 ) ) ;
OAI21D0BWP30P140HVT ctmi_15778 ( .A1 ( ctmn_13671 ) , .A2 ( ctmn_14058 ) , 
    .B ( ctmn_14106 ) , .ZN ( \u_mac_and_scale/addend_lo [1] ) ) ;
AOI22D0BWP30P140HVT ctmi_15779 ( .A1 ( phfnn_3786 ) , .A2 ( HFSNET_20 ) , 
    .B1 ( \RS_OP_250_54632_65499_J1/N112 ) , .B2 ( ctmn_14059 ) , 
    .ZN ( ctmn_14106 ) ) ;
OAI21D0BWP30P140HVT ctmi_15780 ( .A1 ( ctmn_13701 ) , .A2 ( ctmn_14058 ) , 
    .B ( ctmn_14107 ) , .ZN ( \u_mac_and_scale/addend_lo [0] ) ) ;
AOI22D0BWP30P140HVT ctmi_15781 ( .A1 ( phfnn_3764 ) , .A2 ( HFSNET_20 ) , 
    .B1 ( \RS_OP_250_54632_65499_J1/N113 ) , .B2 ( ctmn_14059 ) , 
    .ZN ( ctmn_14107 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5360 ( .I ( phfnn_1475 ) , .ZN ( phfnn_3890 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5361 ( .I ( phfnn_908 ) , .ZN ( phfnn_3891 ) ) ;
IOA21D0BWP30P140HVT ctmTdsLR_2_3565 ( .A1 ( N81 ) , .A2 ( phfnn_648 ) , 
    .B ( tmp_net2650 ) , .ZN ( \RS_OP_250_54632_65499_J1/N57 ) ) ;
IOA21D0BWP30P140HVT ctmTdsLR_2_3576 ( .A1 ( N246 ) , .A2 ( phfnn_648 ) , 
    .B ( tmp_net2654 ) , .ZN ( \RS_OP_250_54632_65499_J1/N9 ) ) ;
ND3D0BWP30P140HVT ctmTdsLR_1_3603 ( 
    .A1 ( \u_mac_and_scale/mult_4_0_bottom[4] ) , 
    .A2 ( \u_mac_and_scale/N7 ) , .A3 ( ctmn_13952 ) , .ZN ( tmp_net2665 ) ) ;
IOA21D0BWP30P140HVT ctmTdsLR_2_3604 ( .A1 ( N216 ) , .A2 ( HFSNET_22 ) , 
    .B ( tmp_net2665 ) , .ZN ( \RS_OP_250_54632_65499_J1/N27 ) ) ;
IOA21D0BWP30P140HVT ctmTdsLR_2_3611 ( 
    .A1 ( \u_mac_and_scale/mult_4_1_bottom [3] ) , .A2 ( HFSNET_22 ) , 
    .B ( tmp_net2668 ) , .ZN ( \RS_OP_250_54632_65499_J1/N28 ) ) ;
IOA21D0BWP30P140HVT ctmTdsLR_2_3621 ( .A1 ( HFSNET_22 ) , 
    .A2 ( \u_mac_and_scale/mult_4_2_bottom[0] ) , .B ( tmp_net2672 ) , 
    .ZN ( \RS_OP_250_54632_65499_J1/N47 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5363 ( 
    .I ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_125 ) , 
    .ZN ( phfnn_3893 ) ) ;
IOA21D0BWP30P140HVT ctmTdsLR_2_3835 ( 
    .A1 ( \u_mac_and_scale/mult_4_3_bottom [2] ) , .A2 ( phfnn_648 ) , 
    .B ( tmp_net2744 ) , .ZN ( \RS_OP_250_54632_65499_J1/N61 ) ) ;
OA22D1BWP30P140HVT ctmTdsLR_3_3547 ( .A1 ( ctmn_13313 ) , 
    .A2 ( tmp_net2646 ) , .B1 ( phfnn_643 ) , .B2 ( phfnn_634 ) , 
    .Z ( pe_ready ) ) ;
AN2D0BWP30P140HVT ctmi_15794 ( .A1 ( N238 ) , .A2 ( HFSNET_22 ) , 
    .Z ( \u_mac_and_scale/mac8_in_0 [14] ) ) ;
AN2D0BWP30P140HVT ctmi_15795 ( .A1 ( N239 ) , .A2 ( HFSNET_22 ) , 
    .Z ( \u_mac_and_scale/mac8_in_0 [13] ) ) ;
AN2D0BWP30P140HVT ctmi_15796 ( .A1 ( N240 ) , .A2 ( HFSNET_22 ) , 
    .Z ( \u_mac_and_scale/mac8_in_0 [12] ) ) ;
AN2D0BWP30P140HVT ctmi_15797 ( .A1 ( N241 ) , .A2 ( HFSNET_22 ) , 
    .Z ( \u_mac_and_scale/mac8_in_0 [11] ) ) ;
AO22D0BWP30P140HVT ctmTdsLR_1_3548 ( .A1 ( N21 ) , 
    .A2 ( \u_mac_and_scale/N7 ) , .B1 ( N243 ) , .B2 ( phfnn_648 ) , 
    .Z ( \RS_OP_250_54632_65499_J1/N6 ) ) ;
INR3D0BWP30P140HVT ctmTdsLR_1_3554 ( .A1 ( ctmn_13522 ) , .B1 ( ctmn_13547 ) , 
    .B2 ( ctmn_13544 ) , .ZN ( tmp_net2648 ) ) ;
OAI21D0BWP30P140HVT ctmTdsLR_1_3566 ( .A1 ( phfnn_3689 ) , 
    .A2 ( ctmn_13897 ) , .B ( phfnn_3780 ) , .ZN ( tmp_net2651 ) ) ;
AN3D0BWP30P140HVT ctmTdsLR_1_3577 ( .A1 ( \u_mac_and_scale/N7 ) , 
    .A2 ( ctmn_13952 ) , .A3 ( \u_mac_and_scale/mult_4_0_bottom[7] ) , 
    .Z ( \RS_OP_250_54632_65499_J1/ctmn_154 ) ) ;
ND3D0BWP30P140HVT ctmTdsLR_1_3605 ( .A1 ( N259 ) , 
    .A2 ( \u_mac_and_scale/N7 ) , .A3 ( ctmn_13952 ) , .ZN ( tmp_net2666 ) ) ;
IOA21D0BWP30P140HVT ctmTdsLR_2_3606 ( .A1 ( N248 ) , .A2 ( HFSNET_22 ) , 
    .B ( tmp_net2666 ) , .ZN ( \RS_OP_250_54632_65499_J1/N11 ) ) ;
ND3D0BWP30P140HVT ctmTdsLR_1_3612 ( .A1 ( \u_mac_and_scale/N7 ) , 
    .A2 ( N260 ) , .A3 ( ctmn_13952 ) , .ZN ( tmp_net2669 ) ) ;
ND3D0BWP30P140HVT ctmTdsLR_1_3622 ( 
    .A1 ( \u_mac_and_scale/mult_4_1_bottom [1] ) , 
    .A2 ( \u_mac_and_scale/N7 ) , .A3 ( ctmn_13952 ) , .ZN ( tmp_net2673 ) ) ;
IOA21D0BWP30P140HVT ctmTdsLR_2_3623 ( 
    .A1 ( \u_mac_and_scale/mult_4_3_bottom [1] ) , .A2 ( HFSNET_22 ) , 
    .B ( tmp_net2673 ) , .ZN ( \RS_OP_250_54632_65499_J1/N62 ) ) ;
AO21D0BWP30P140HVT ctmTdsLR_1_3549 ( .A1 ( N211 ) , .A2 ( HFSNET_22 ) , 
    .B ( \RS_OP_250_54632_65499_J1/ctmn_154 ) , .Z ( N220 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5370 ( .I ( ctmn_337 ) , .ZN ( phfnn_3900 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5371 ( .I ( ctmn_336 ) , .ZN ( phfnn_3901 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5372 ( .I ( ctmn_335 ) , .ZN ( phfnn_3902 ) ) ;
AO21D0BWP30P140HVT ctmTdsLR_1_3550 ( .A1 ( N227 ) , .A2 ( phfnn_648 ) , 
    .B ( \RS_OP_250_54632_65499_J1/ctmn_155 ) , .Z ( N236 ) ) ;
OR2D1BWP30P140HVT ctmTdsLR_2_3555 ( 
    .A1 ( \u_mac_and_scale/mult_3/mult01 [8] ) , .A2 ( tmp_net2648 ) , 
    .Z ( \u_mac_and_scale/mult_3/mult01 [7] ) ) ;
AO21D0BWP30P140HVT ctmTdsLR_1_3556 ( .A1 ( N212 ) , .A2 ( HFSNET_22 ) , 
    .B ( \RS_OP_250_54632_65499_J1/ctmn_154 ) , .Z ( N217 ) ) ;
AO21D0BWP30P140HVT ctmTdsLR_1_3557 ( .A1 ( N228 ) , .A2 ( phfnn_648 ) , 
    .B ( \RS_OP_250_54632_65499_J1/ctmn_155 ) , .Z ( N218 ) ) ;
AO21D0BWP30P140HVT ctmTdsLR_1_3558 ( .A1 ( N80 ) , .A2 ( phfnn_648 ) , 
    .B ( \RS_OP_250_54632_65499_J1/ctmn_156 ) , .Z ( N204 ) ) ;
OAI32D0BWP30P140HVT ctmTdsLR_2_3567 ( .A1 ( tmp_net2651 ) , .A2 ( N10440 ) , 
    .A3 ( ctmn_13937 ) , .B1 ( tmp_net2651 ) , .B2 ( N10445 ) , 
    .ZN ( phfnn_2531 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5373 ( .I ( ctmn_334 ) , .ZN ( phfnn_3903 ) ) ;
ND3D0BWP30P140HVT ctmTdsLR_1_3607 ( 
    .A1 ( \u_mac_and_scale/mult_4_1_bottom [3] ) , 
    .A2 ( \u_mac_and_scale/N7 ) , .A3 ( ctmn_13952 ) , .ZN ( tmp_net2667 ) ) ;
IOA21D0BWP30P140HVT ctmTdsLR_2_3608 ( 
    .A1 ( \u_mac_and_scale/mult_4_3_bottom [3] ) , .A2 ( HFSNET_22 ) , 
    .B ( tmp_net2667 ) , .ZN ( \RS_OP_250_54632_65499_J1/N60 ) ) ;
IOA21D0BWP30P140HVT ctmTdsLR_2_3613 ( .A1 ( N249 ) , .A2 ( HFSNET_22 ) , 
    .B ( tmp_net2669 ) , .ZN ( \RS_OP_250_54632_65499_J1/N12 ) ) ;
MOAI22D0BWP30P140HVT ctmTdsLR_2_3625 ( .A1 ( phfnn_1319 ) , 
    .A2 ( tmp_net2655 ) , .B1 ( HFSNET_22 ) , 
    .B2 ( \u_mac_and_scale/mult_4_3_bottom [0] ) , 
    .ZN ( \RS_OP_250_54632_65499_J1/N63 ) ) ;
XOR2UD0BWP30P140HVT ctmTdsLR_1_3842 ( .A1 ( ctmn_14121 ) , 
    .A2 ( ctmn_14126 ) , .Z ( tmp_net2637 ) ) ;
ND3D0BWP30P140HVT ctmTdsLR_1_3626 ( 
    .A1 ( \u_mac_and_scale/mult_4_0_top [1] ) , .A2 ( \u_mac_and_scale/N7 ) , 
    .A3 ( ctmn_13952 ) , .ZN ( tmp_net2675 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5374 ( .I ( ctmn_333 ) , .ZN ( phfnn_3904 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5375 ( .I ( ctmn_332 ) , .ZN ( phfnn_3905 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5376 ( .I ( ctmn_331 ) , .ZN ( phfnn_3906 ) ) ;
OR2D1BWP30P140HVT ctmTdsLR_1_3559 ( .A1 ( HFSNET_18 ) , .A2 ( ctmn_13919 ) , 
    .Z ( phfnn_2389 ) ) ;
AO21D0BWP30P140HVT ctmTdsLR_1_3568 ( .A1 ( N213 ) , .A2 ( HFSNET_22 ) , 
    .B ( \RS_OP_250_54632_65499_J1/ctmn_154 ) , .Z ( N202 ) ) ;
AO21D0BWP30P140HVT ctmTdsLR_1_3569 ( .A1 ( N229 ) , .A2 ( phfnn_648 ) , 
    .B ( \RS_OP_250_54632_65499_J1/ctmn_155 ) , .Z ( N203 ) ) ;
MOAI22D0BWP30P140HVT ctmTdsLR_2_3579 ( .A1 ( phfnn_826 ) , 
    .A2 ( tmp_net2655 ) , .B1 ( N230 ) , .B2 ( HFSNET_22 ) , 
    .ZN ( \RS_OP_250_54632_65499_J1/N41 ) ) ;
AN3D0BWP30P140HVT ctmTdsLR_1_3580 ( 
    .A1 ( \u_mac_and_scale/mult_4_0_top [7] ) , .A2 ( \u_mac_and_scale/N7 ) , 
    .A3 ( ctmn_13952 ) , .Z ( \RS_OP_250_54632_65499_J1/ctmn_155 ) ) ;
ND3D0BWP30P140HVT ctmTdsLR_1_3581 ( .A1 ( \u_mac_and_scale/N7 ) , 
    .A2 ( ctmn_13952 ) , .A3 ( \u_mac_and_scale/mult_4_0_bottom[6] ) , 
    .ZN ( tmp_net2656 ) ) ;
IOA21D0BWP30P140HVT ctmTdsLR_2_3582 ( .A1 ( N214 ) , .A2 ( HFSNET_22 ) , 
    .B ( tmp_net2656 ) , .ZN ( \RS_OP_250_54632_65499_J1/N25 ) ) ;
ND3D0BWP30P140HVT ctmTdsLR_1_3614 ( .A1 ( \u_mac_and_scale/N7 ) , 
    .A2 ( ctmn_13952 ) , .A3 ( \u_mac_and_scale/mult_4_0_top [2] ) , 
    .ZN ( tmp_net2670 ) ) ;
IOA21D0BWP30P140HVT ctmTdsLR_2_3615 ( .A1 ( HFSNET_22 ) , .A2 ( N234 ) , 
    .B ( tmp_net2670 ) , .ZN ( \RS_OP_250_54632_65499_J1/N45 ) ) ;
ND3D0BWP30P140HVT ctmTdsLR_1_3616 ( .A1 ( \u_mac_and_scale/N7 ) , 
    .A2 ( ctmn_13952 ) , .A3 ( \u_mac_and_scale/mult_4_0_top [3] ) , 
    .ZN ( tmp_net2671 ) ) ;
IOA21D0BWP30P140HVT ctmTdsLR_2_3617 ( .A1 ( HFSNET_22 ) , .A2 ( N233 ) , 
    .B ( tmp_net2671 ) , .ZN ( \RS_OP_250_54632_65499_J1/N44 ) ) ;
IOA21D0BWP30P140HVT ctmTdsLR_2_3627 ( .A1 ( N235 ) , .A2 ( HFSNET_22 ) , 
    .B ( tmp_net2675 ) , .ZN ( \RS_OP_250_54632_65499_J1/N46 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5377 ( .I ( phfnn_924 ) , .ZN ( phfnn_3907 ) ) ;
CKND0BWP30P140HVT phfnr_buf_5378 ( .I ( ctmn_330 ) , .ZN ( phfnn_3908 ) ) ;
OA21D0BWP30P140HVT ctmi_4831 ( .A1 ( phfnn_2514 ) , .A2 ( ctmn_14688 ) , 
    .B ( ctmn_14684 ) , .Z ( HFSNET_0 ) ) ;
INR3D0BWP30P140HVT ctmTdsLR_1_3824 ( 
    .A1 ( \u_mac_and_scale/mult_4_0_top [0] ) , .B1 ( ctmn_13608 ) , 
    .B2 ( ctmn_13686 ) , .ZN ( N9877 ) ) ;
DEL025D1BWP30P140HVT HFSBUF_233_5401 ( .I ( ctmn_14331 ) , .Z ( HFSNET_2 ) ) ;
AO21D0BWP30P140HVT ctmTdsLR_1_3851 ( .A1 ( N74 ) , .A2 ( phfnn_648 ) , 
    .B ( \RS_OP_250_54632_65499_J1/ctmn_156 ) , .Z ( N309 ) ) ;
XNR2UD0BWP30P140HVT ctmTdsLR_2_3847 ( .A1 ( tmp_net2748 ) , 
    .A2 ( ctmn_14270 ) , .ZN ( tmp_net2636 ) ) ;
AO21D0BWP30P140HVT ctmTdsLR_1_3843 ( .A1 ( N76 ) , .A2 ( phfnn_648 ) , 
    .B ( \RS_OP_250_54632_65499_J1/ctmn_156 ) , .Z ( N274 ) ) ;
AO21D0BWP30P140HVT ctmTdsLR_1_3836 ( .A1 ( N77 ) , .A2 ( phfnn_648 ) , 
    .B ( \RS_OP_250_54632_65499_J1/ctmn_156 ) , .Z ( N271 ) ) ;
MOAI22D0BWP30P140HVT ctmTdsLR_1_3837 ( .A1 ( ctmn_14435 ) , 
    .A2 ( ctmn_14415 ) , .B1 ( ctmn_14341 ) , .B2 ( ctmn_14437 ) , 
    .ZN ( tmp_net2745 ) ) ;
ND3D0BWP30P140HVT ctmTdsLR_1_3583 ( 
    .A1 ( \u_mac_and_scale/mult_4_1_bottom [5] ) , 
    .A2 ( \u_mac_and_scale/N7 ) , .A3 ( ctmn_13952 ) , .ZN ( tmp_net2657 ) ) ;
IOA21D0BWP30P140HVT ctmTdsLR_2_3584 ( .A1 ( N82 ) , .A2 ( phfnn_648 ) , 
    .B ( tmp_net2657 ) , .ZN ( \RS_OP_250_54632_65499_J1/N58 ) ) ;
OAI21D0BWP30P140HVT ctmTdsLR_1_3585 ( .A1 ( phfnn_3699 ) , 
    .A2 ( ctmn_13784 ) , .B ( ctmn_13797 ) , .ZN ( tmp_net2658 ) ) ;
OAI32D0BWP30P140HVT ctmTdsLR_2_3586 ( .A1 ( tmp_net2658 ) , .A2 ( N10028 ) , 
    .A3 ( ctmn_13823 ) , .B1 ( tmp_net2658 ) , .B2 ( N10033 ) , 
    .ZN ( phfnn_2530 ) ) ;
DEL025D1BWP30P140HVT HFSBUF_274_5402 ( .I ( \u_ppu/u_requantizer/shamt [3] ) , 
    .Z ( HFSNET_3 ) ) ;
DEL025D1BWP30P140HVT HFSBUF_374_5404 ( .I ( phfnn_639 ) , .Z ( HFSNET_5 ) ) ;
AN2D0BWP30P140HVT ctmi_4803 ( .A1 ( \u_controller/state [0] ) , 
    .A2 ( ctmn_13308 ) , .Z ( HFSNET_8 ) ) ;
OR2D1BWP30P140HVT ctmi_4808 ( .A1 ( HFSNET_23 ) , .A2 ( \config_out[3] ) , 
    .Z ( HFSNET_15 ) ) ;
AN2D0BWP30P140HVT ctmi_15857 ( .A1 ( HFSNET_23 ) , .A2 ( N237 ) , 
    .Z ( \u_mac_and_scale/scale_iso_0[15] ) ) ;
AN2D0BWP30P140HVT ctmi_15858 ( .A1 ( HFSNET_23 ) , .A2 ( N238 ) , 
    .Z ( \u_mac_and_scale/scale_iso_0[14] ) ) ;
AN2D0BWP30P140HVT ctmi_15859 ( .A1 ( HFSNET_23 ) , .A2 ( N239 ) , 
    .Z ( \u_mac_and_scale/scale_iso_0[13] ) ) ;
AN2D0BWP30P140HVT ctmi_15860 ( .A1 ( HFSNET_23 ) , .A2 ( N240 ) , 
    .Z ( \u_mac_and_scale/scale_iso_0[12] ) ) ;
AN2D0BWP30P140HVT ctmi_15861 ( .A1 ( HFSNET_23 ) , .A2 ( N241 ) , 
    .Z ( \u_mac_and_scale/scale_iso_0[11] ) ) ;
AN2D0BWP30P140HVT ctmi_15862 ( .A1 ( HFSNET_23 ) , .A2 ( N242 ) , 
    .Z ( \u_mac_and_scale/scale_iso_0[10] ) ) ;
AN2D0BWP30P140HVT ctmi_15863 ( .A1 ( HFSNET_23 ) , .A2 ( N243 ) , 
    .Z ( \u_mac_and_scale/scale_iso_0[9] ) ) ;
DEL025D1BWP30P140HVT HFSBUF_28_5406 ( .I ( HFSNET_8 ) , .Z ( HFSNET_7 ) ) ;
AN2D0BWP30P140HVT ctmi_15865 ( .A1 ( HFSNET_23 ) , .A2 ( N245 ) , .Z ( N64 ) ) ;
DEL025D1BWP30P140HVT HFSBUF_958_5426 ( .I ( sync_rst ) , .Z ( HFSNET_29 ) ) ;
DEL025D1BWP30P140HVT HFSBUF_180_5408 ( .I ( ctmn_13309 ) , .Z ( HFSNET_10 ) ) ;
DEL025D1BWP30P140HVT HFSBUF_271_5409 ( .I ( ctmn_14330 ) , .Z ( HFSNET_11 ) ) ;
DEL025D1BWP30P140HVT HFSBUF_826_5417 ( .I ( acc_load ) , .Z ( HFSNET_20 ) ) ;
DEL025D1BWP30P140HVT HFSBUF_300_5410 ( .I ( \u_ppu/u_requantizer/shamt [0] ) , 
    .Z ( HFSNET_12 ) ) ;
NR2D0BWP30P140HVT ctmi_4810 ( .A1 ( ctmn_13903 ) , .A2 ( phfnn_3727 ) , 
    .ZN ( phfnn_3122 ) ) ;
CKND0BWP30P140HVT HFSINV_202_5412 ( .I ( HFSNET_14 ) , .ZN ( HFSNET_17 ) ) ;
AN2D0BWP30P140HVT ctmi_15873 ( .A1 ( HFSNET_24 ) , .A2 ( N221 ) , 
    .Z ( \u_mac_and_scale/scale_iso_2 [15] ) ) ;
AN2D0BWP30P140HVT ctmi_15874 ( .A1 ( HFSNET_24 ) , .A2 ( N222 ) , 
    .Z ( \u_mac_and_scale/scale_iso_2 [14] ) ) ;
AN2D0BWP30P140HVT ctmi_15875 ( .A1 ( HFSNET_24 ) , .A2 ( N223 ) , 
    .Z ( \u_mac_and_scale/scale_iso_2 [13] ) ) ;
AN2D0BWP30P140HVT ctmi_15876 ( .A1 ( HFSNET_24 ) , .A2 ( N224 ) , 
    .Z ( \u_mac_and_scale/scale_iso_2 [12] ) ) ;
AN2D0BWP30P140HVT ctmi_15877 ( .A1 ( HFSNET_24 ) , .A2 ( N225 ) , 
    .Z ( \u_mac_and_scale/scale_iso_2 [11] ) ) ;
AN2D0BWP30P140HVT ctmi_15878 ( .A1 ( HFSNET_24 ) , .A2 ( N226 ) , 
    .Z ( \u_mac_and_scale/scale_iso_2 [10] ) ) ;
AN2D0BWP30P140HVT ctmi_15879 ( .A1 ( HFSNET_24 ) , .A2 ( N227 ) , 
    .Z ( \u_mac_and_scale/scale_iso_2 [9] ) ) ;
AN2D0BWP30P140HVT ctmi_15880 ( .A1 ( HFSNET_24 ) , .A2 ( N228 ) , 
    .Z ( \u_mac_and_scale/scale_iso_2 [8] ) ) ;
AN2D0BWP30P140HVT ctmi_15881 ( .A1 ( HFSNET_24 ) , .A2 ( N229 ) , 
    .Z ( \u_mac_and_scale/scale_iso_2 [7] ) ) ;
AN2D0BWP30P140HVT ctmi_15882 ( .A1 ( HFSNET_24 ) , .A2 ( N230 ) , 
    .Z ( \u_mac_and_scale/scale_iso_2 [6] ) ) ;
AN2D0BWP30P140HVT ctmi_15883 ( .A1 ( HFSNET_24 ) , .A2 ( N231 ) , 
    .Z ( \u_mac_and_scale/scale_iso_2 [5] ) ) ;
AN2D0BWP30P140HVT ctmi_15884 ( .A1 ( HFSNET_23 ) , .A2 ( N232 ) , 
    .Z ( \u_mac_and_scale/scale_iso_2 [4] ) ) ;
AN2D0BWP30P140HVT ctmi_15885 ( .A1 ( HFSNET_23 ) , .A2 ( N233 ) , 
    .Z ( \u_mac_and_scale/scale_iso_2 [3] ) ) ;
AN2D0BWP30P140HVT ctmi_15886 ( .A1 ( HFSNET_23 ) , .A2 ( N234 ) , 
    .Z ( \u_mac_and_scale/scale_iso_2 [2] ) ) ;
AN2D0BWP30P140HVT ctmi_15887 ( .A1 ( HFSNET_23 ) , .A2 ( N235 ) , 
    .Z ( \u_mac_and_scale/scale_iso_2 [1] ) ) ;
AN2D0BWP30P140HVT ctmi_15888 ( .A1 ( HFSNET_23 ) , 
    .A2 ( \u_mac_and_scale/mult_4_2_bottom[0] ) , 
    .Z ( \u_mac_and_scale/scale_iso_2 [0] ) ) ;
AN2D0BWP30P140HVT ctmi_15889 ( .A1 ( ctmn_13664 ) , 
    .A2 ( \u_mac_and_scale/scale_iso_0[15] ) , 
    .Z ( \u_mac_and_scale/stitch_ext_0[22] ) ) ;
AN2D0BWP30P140HVT ctmi_15890 ( .A1 ( ctmn_13664 ) , 
    .A2 ( \u_mac_and_scale/scale_iso_2 [15] ) , 
    .Z ( \u_mac_and_scale/stitch_ext_2[22] ) ) ;
AN2D0BWP30P140HVT ctmi_15891 ( .A1 ( ctmn_13664 ) , .A2 ( N88 ) , 
    .Z ( \u_mac_and_scale/stitch_lo_ext[38] ) ) ;
INR2D1BWP30P140HVT ctmi_15892 ( .A1 ( valid_A ) , .B1 ( ctmn_13317 ) , 
    .ZN ( \u_io_block/wr_en_A ) ) ;
OAI31D0BWP30P140HVT ctmi_4811 ( .A1 ( phfnn_3122 ) , .A2 ( phfnn_3115 ) , 
    .A3 ( phfnn_3110 ) , .B ( phfnn_3785 ) , .ZN ( phfnn_3150 ) ) ;
NR2D0BWP30P140HVT ctmi_15899 ( .A1 ( ctmn_13846 ) , .A2 ( HFSNET_15 ) , 
    .ZN ( ctmn_14109 ) ) ;
INR2D1BWP30P140HVT ctmi_4812 ( .A1 ( ctmn_14151 ) , .B1 ( ctmn_13502 ) , 
    .ZN ( phfnn_3115 ) ) ;
AN2D0BWP30P140HVT ctmi_4813 ( .A1 ( operand_B_reg[26] ) , .A2 ( ctmn_14155 ) , 
    .Z ( phfnn_3110 ) ) ;
NR2D0BWP30P140HVT ctmi_15902 ( .A1 ( ctmn_14112 ) , .A2 ( \config_out[3] ) , 
    .ZN ( ctmn_14113 ) ) ;
ND2D0BWP30P140HVT ctmi_15903 ( .A1 ( operand_A_reg[19] ) , .A2 ( HFSNET_28 ) , 
    .ZN ( ctmn_14112 ) ) ;
OR2D1BWP30P140HVT ctmi_4804 ( .A1 ( \u_controller/state [0] ) , 
    .A2 ( \u_controller/state [1] ) , .Z ( HFSNET_14 ) ) ;
AOI221D0BWP30P140HVT ctmTdsLR_2_3838 ( .A1 ( accumulator[10] ) , 
    .A2 ( phfnn_3676 ) , .B1 ( accumulator[18] ) , .B2 ( phfnn_3675 ) , 
    .C ( tmp_net2745 ) , .ZN ( ctmn_14440 ) ) ;
DEL025D1BWP30P140HVT HFSBUF_631_5419 ( .I ( phfnn_648 ) , .Z ( HFSNET_22 ) ) ;
MAOI22D0BWP30P140HVT ctmi_15907 ( .A1 ( phfnn_2416 ) , 
    .A2 ( operand_B_reg[18] ) , .B1 ( ctmn_13846 ) , .B2 ( ctmn_13438 ) , 
    .ZN ( ctmn_14119 ) ) ;
ND2D0BWP30P140HVT ctmi_15908 ( .A1 ( ctmn_14119 ) , .A2 ( phfnn_3152 ) , 
    .ZN ( ctmn_14120 ) ) ;
ND2D0BWP30P140HVT ctmi_15909 ( .A1 ( ctmn_14122 ) , .A2 ( ctmn_14125 ) , 
    .ZN ( ctmn_14126 ) ) ;
ND2D0BWP30P140HVT ctmi_15910 ( .A1 ( operand_B_reg[17] ) , 
    .A2 ( ctmn_14113 ) , .ZN ( ctmn_14122 ) ) ;
ND3D0BWP30P140HVT ctmi_15911 ( .A1 ( ctmn_14109 ) , .A2 ( phfnn_3721 ) , 
    .A3 ( ctmn_14124 ) , .ZN ( ctmn_14125 ) ) ;
ND3D0BWP30P140HVT ctmi_15912 ( .A1 ( operand_B_reg[19] ) , 
    .A2 ( ctmn_14123 ) , .A3 ( phfnn_3721 ) , .ZN ( ctmn_14124 ) ) ;
NR2D0BWP30P140HVT ctmi_15913 ( .A1 ( ctmn_13844 ) , .A2 ( ctmn_13438 ) , 
    .ZN ( ctmn_14123 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15914 ( .A ( ctmn_14140 ) , .B ( ctmn_14141 ) , 
    .C ( ctmn_14147 ) , .ZN ( ctmn_14148 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15915 ( .A ( phfnn_3791 ) , .B ( N11835 ) , 
    .C ( ctmn_14139 ) , .ZN ( ctmn_14140 ) ) ;
XNR2UD0BWP30P140HVT ctmi_15916 ( .A1 ( ctmn_13892 ) , .A2 ( ctmn_14130 ) , 
    .ZN ( ctmn_14131 ) ) ;
AOI21D0BWP30P140HVT ctmi_15917 ( .A1 ( ctmn_14127 ) , .A2 ( ctmn_14128 ) , 
    .B ( ctmn_14129 ) , .ZN ( ctmn_14130 ) ) ;
ND2D0BWP30P140HVT ctmi_15918 ( .A1 ( ctmn_14109 ) , .A2 ( phfnn_3729 ) , 
    .ZN ( ctmn_14127 ) ) ;
NR2D0BWP30P140HVT ctmi_15919 ( .A1 ( ctmn_13841 ) , .A2 ( phfnn_3726 ) , 
    .ZN ( ctmn_14128 ) ) ;
NR2D0BWP30P140HVT ctmi_15920 ( .A1 ( ctmn_14127 ) , .A2 ( ctmn_14128 ) , 
    .ZN ( ctmn_14129 ) ) ;
CKND0BWP30P140HVT HFSINV_1822_5421 ( .I ( HFSNET_25 ) , .ZN ( HFSNET_24 ) ) ;
MUX2ND0BWP30P140HVT ctmi_15922 ( .I0 ( ctmn_14134 ) , .I1 ( phfnn_3774 ) , 
    .S ( ctmn_14138 ) , .ZN ( ctmn_14139 ) ) ;
OAI21D0BWP30P140HVT ctmi_15923 ( .A1 ( ctmn_14123 ) , .A2 ( ctmn_14133 ) , 
    .B ( ctmn_14124 ) , .ZN ( ctmn_14134 ) ) ;
NR2D0BWP30P140HVT ctmi_15924 ( .A1 ( ctmn_13846 ) , .A2 ( ctmn_13450 ) , 
    .ZN ( ctmn_14133 ) ) ;
IND2D1BWP30P140HVT ctmi_3854 ( .A1 ( ctmn_13443 ) , .B1 ( ctmn_14154 ) , 
    .ZN ( phfnn_2417 ) ) ;
AOI21D0BWP30P140HVT ctmi_15926 ( .A1 ( ctmn_14136 ) , .A2 ( N11824 ) , 
    .B ( ctmn_14137 ) , .ZN ( ctmn_14138 ) ) ;
ND2D0BWP30P140HVT ctmi_15927 ( .A1 ( operand_B_reg[16] ) , 
    .A2 ( ctmn_14113 ) , .ZN ( ctmn_14136 ) ) ;
NR2D0BWP30P140HVT ctmi_15928 ( .A1 ( ctmn_14136 ) , .A2 ( N11824 ) , 
    .ZN ( ctmn_14137 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15929 ( .A ( N11824 ) , .B ( phfnn_3774 ) , 
    .C ( ctmn_14136 ) , .ZN ( ctmn_14141 ) ) ;
XOR3UD0BWP30P140HVT ctmi_15930 ( .A1 ( ctmn_14144 ) , .A2 ( ctmn_14145 ) , 
    .A3 ( ctmn_14146 ) , .Z ( ctmn_14147 ) ) ;
XOR2UD0BWP30P140HVT ctmi_15931 ( .A1 ( ctmn_14122 ) , .A2 ( ctmn_14143 ) , 
    .Z ( ctmn_14144 ) ) ;
OAI21D0BWP30P140HVT ctmi_15932 ( .A1 ( ctmn_14124 ) , .A2 ( ctmn_14109 ) , 
    .B ( ctmn_14125 ) , .ZN ( ctmn_14143 ) ) ;
CKND0BWP30P140HVT HFSINV_137_5422 ( .I ( HFSNET_25 ) , .ZN ( HFSNET_26 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15934 ( .A ( ctmn_13892 ) , .B ( ctmn_14128 ) , 
    .C ( ctmn_14127 ) , .ZN ( ctmn_14145 ) ) ;
AOI21D0BWP30P140HVT ctmi_15935 ( .A1 ( ctmn_14123 ) , .A2 ( phfnn_3123 ) , 
    .B ( ctmn_14119 ) , .ZN ( ctmn_14146 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15936 ( .A ( ctmn_14145 ) , .B ( ctmn_14146 ) , 
    .C ( ctmn_14144 ) , .ZN ( ctmn_14149 ) ) ;
XOR4D0BWP30P140HVT ctmi_15937 ( .A1 ( ctmn_14163 ) , .A2 ( ctmn_14168 ) , 
    .A3 ( ctmn_14190 ) , .A4 ( ctmn_14191 ) , 
    .Z ( \u_mac_and_scale/mult_4_3_bottom [6] ) ) ;
OAI21D0BWP30P140HVT ctmi_15938 ( .A1 ( phfnn_3150 ) , .A2 ( ctmn_14161 ) , 
    .B ( ctmn_14162 ) , .ZN ( ctmn_14163 ) ) ;
CKND0BWP30P140HVT HFSINV_469_5423 ( .I ( HFSNET_25 ) , .ZN ( HFSNET_27 ) ) ;
OAI31D0BWP30P140HVT ctmi_4818 ( .A1 ( phfnn_3123 ) , .A2 ( phfnn_3114 ) , 
    .A3 ( phfnn_3124 ) , .B ( phfnn_3784 ) , .ZN ( phfnn_3152 ) ) ;
DEL025D1BWP30P140HVT HFSBUF_1852_5424 ( .I ( HFSNET_25 ) , .Z ( HFSNET_28 ) ) ;
NR2D0BWP30P140HVT ctmi_15942 ( .A1 ( ctmn_13903 ) , .A2 ( HFSNET_15 ) , 
    .ZN ( ctmn_14151 ) ) ;
NR2D0BWP30P140HVT ctmi_4819 ( .A1 ( ctmn_13846 ) , .A2 ( phfnn_3726 ) , 
    .ZN ( phfnn_3123 ) ) ;
AN2D0BWP30P140HVT ctmi_4806 ( .A1 ( HFSNET_17 ) , .A2 ( HFSNET_19 ) , 
    .Z ( HFSNET_25 ) ) ;
NR2D0BWP30P140HVT ctmi_15945 ( .A1 ( ctmn_14154 ) , .A2 ( \config_out[3] ) , 
    .ZN ( ctmn_14155 ) ) ;
ND2D0BWP30P140HVT ctmi_15946 ( .A1 ( operand_A_reg[27] ) , .A2 ( HFSNET_25 ) , 
    .ZN ( ctmn_14154 ) ) ;
AOI221D0BWP30P140HVT ctmi_3861 ( .A1 ( phfnn_3110 ) , .A2 ( phfnn_3115 ) , 
    .B1 ( phfnn_3748 ) , .B2 ( phfnn_3751 ) , .C ( phfnn_3762 ) , 
    .ZN ( ctmn_2750 ) ) ;
DEL025D1BWP30P140HVT HFSBUF_409_5427 ( .I ( sync_rst ) , .Z ( HFSNET_30 ) ) ;
DEL025D1BWP30P140HVT HFSBUF_276_5428 ( .I ( sync_rst ) , .Z ( HFSNET_31 ) ) ;
MAOI22D0BWP30P140HVT ctmi_15950 ( .A1 ( phfnn_2417 ) , 
    .A2 ( operand_B_reg[26] ) , .B1 ( ctmn_13903 ) , .B2 ( ctmn_13502 ) , 
    .ZN ( ctmn_14161 ) ) ;
ND2D0BWP30P140HVT ctmi_15951 ( .A1 ( ctmn_14161 ) , .A2 ( phfnn_3150 ) , 
    .ZN ( ctmn_14162 ) ) ;
ND2D0BWP30P140HVT ctmi_15952 ( .A1 ( ctmn_14164 ) , .A2 ( ctmn_14167 ) , 
    .ZN ( ctmn_14168 ) ) ;
ND2D0BWP30P140HVT ctmi_15953 ( .A1 ( operand_B_reg[25] ) , 
    .A2 ( ctmn_14155 ) , .ZN ( ctmn_14164 ) ) ;
ND3D0BWP30P140HVT ctmi_15954 ( .A1 ( ctmn_14151 ) , .A2 ( phfnn_3722 ) , 
    .A3 ( ctmn_14166 ) , .ZN ( ctmn_14167 ) ) ;
ND3D0BWP30P140HVT ctmi_15955 ( .A1 ( operand_B_reg[27] ) , 
    .A2 ( ctmn_14165 ) , .A3 ( phfnn_3722 ) , .ZN ( ctmn_14166 ) ) ;
NR2D0BWP30P140HVT ctmi_15956 ( .A1 ( ctmn_13901 ) , .A2 ( ctmn_13502 ) , 
    .ZN ( ctmn_14165 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15957 ( .A ( ctmn_14182 ) , .B ( ctmn_14183 ) , 
    .C ( ctmn_14189 ) , .ZN ( ctmn_14190 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15958 ( .A ( phfnn_3792 ) , .B ( N11965 ) , 
    .C ( ctmn_14181 ) , .ZN ( ctmn_14182 ) ) ;
XNR2UD0BWP30P140HVT ctmi_15959 ( .A1 ( ctmn_13949 ) , .A2 ( ctmn_14172 ) , 
    .ZN ( ctmn_14173 ) ) ;
AOI21D0BWP30P140HVT ctmi_15960 ( .A1 ( ctmn_14169 ) , .A2 ( ctmn_14170 ) , 
    .B ( ctmn_14171 ) , .ZN ( ctmn_14172 ) ) ;
ND2D0BWP30P140HVT ctmi_15961 ( .A1 ( ctmn_14151 ) , .A2 ( phfnn_3730 ) , 
    .ZN ( ctmn_14169 ) ) ;
NR2D0BWP30P140HVT ctmi_15962 ( .A1 ( ctmn_13898 ) , .A2 ( phfnn_3727 ) , 
    .ZN ( ctmn_14170 ) ) ;
NR2D0BWP30P140HVT ctmi_15963 ( .A1 ( ctmn_14169 ) , .A2 ( ctmn_14170 ) , 
    .ZN ( ctmn_14171 ) ) ;
DEL025D1BWP30P140HVT HFSBUF_838_5429 ( .I ( sync_rst ) , .Z ( HFSNET_32 ) ) ;
MUX2ND0BWP30P140HVT ctmi_15965 ( .I0 ( ctmn_14176 ) , .I1 ( phfnn_3775 ) , 
    .S ( ctmn_14180 ) , .ZN ( ctmn_14181 ) ) ;
OAI21D0BWP30P140HVT ctmi_15966 ( .A1 ( ctmn_14165 ) , .A2 ( ctmn_14175 ) , 
    .B ( ctmn_14166 ) , .ZN ( ctmn_14176 ) ) ;
NR2D0BWP30P140HVT ctmi_15967 ( .A1 ( ctmn_13903 ) , .A2 ( ctmn_13507 ) , 
    .ZN ( ctmn_14175 ) ) ;
IND2D1BWP30P140HVT ctmi_3865 ( .A1 ( ctmn_13443 ) , .B1 ( ctmn_14112 ) , 
    .ZN ( phfnn_2416 ) ) ;
AOI21D0BWP30P140HVT ctmi_15969 ( .A1 ( ctmn_14178 ) , .A2 ( N11954 ) , 
    .B ( ctmn_14179 ) , .ZN ( ctmn_14180 ) ) ;
ND2D0BWP30P140HVT ctmi_15970 ( .A1 ( operand_B_reg[24] ) , 
    .A2 ( ctmn_14155 ) , .ZN ( ctmn_14178 ) ) ;
NR2D0BWP30P140HVT ctmi_15971 ( .A1 ( ctmn_14178 ) , .A2 ( N11954 ) , 
    .ZN ( ctmn_14179 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15972 ( .A ( N11954 ) , .B ( phfnn_3775 ) , 
    .C ( ctmn_14178 ) , .ZN ( ctmn_14183 ) ) ;
XOR3UD0BWP30P140HVT ctmi_15973 ( .A1 ( ctmn_14186 ) , .A2 ( ctmn_14187 ) , 
    .A3 ( ctmn_14188 ) , .Z ( ctmn_14189 ) ) ;
XOR2UD0BWP30P140HVT ctmi_15974 ( .A1 ( ctmn_14164 ) , .A2 ( ctmn_14185 ) , 
    .Z ( ctmn_14186 ) ) ;
OAI21D0BWP30P140HVT ctmi_15975 ( .A1 ( ctmn_14166 ) , .A2 ( ctmn_14151 ) , 
    .B ( ctmn_14167 ) , .ZN ( ctmn_14185 ) ) ;
AOI22D0BWP30P140HVT ctmi_1443 ( .A1 ( phfnn_3122 ) , .A2 ( phfnn_3751 ) , 
    .B1 ( ctmn_14162 ) , .B2 ( phfnn_3748 ) , .ZN ( ctmn_15269 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15977 ( .A ( ctmn_13949 ) , .B ( ctmn_14170 ) , 
    .C ( ctmn_14169 ) , .ZN ( ctmn_14187 ) ) ;
AOI21D0BWP30P140HVT ctmi_15978 ( .A1 ( ctmn_14165 ) , .A2 ( phfnn_3122 ) , 
    .B ( ctmn_14161 ) , .ZN ( ctmn_14188 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15979 ( .A ( ctmn_14187 ) , .B ( ctmn_14188 ) , 
    .C ( ctmn_14186 ) , .ZN ( ctmn_14191 ) ) ;
XNR3UD0BWP30P140HVT ctmi_15980 ( .A1 ( ctmn_13718 ) , .A2 ( N11469 ) , 
    .A3 ( ctmn_13717 ) , .ZN ( \u_mac_and_scale/mult_0/mult10 [5] ) ) ;
XNR3UD0BWP30P140HVT ctmi_15981 ( .A1 ( ctmn_13821 ) , .A2 ( N11604 ) , 
    .A3 ( ctmn_13820 ) , .ZN ( \u_mac_and_scale/mult_1/mult10 [5] ) ) ;
XNR3UD0BWP30P140HVT ctmi_15982 ( .A1 ( ctmn_13879 ) , .A2 ( N11737 ) , 
    .A3 ( ctmn_13878 ) , .ZN ( \u_mac_and_scale/mult_2/mult10 [5] ) ) ;
XNR3UD0BWP30P140HVT ctmi_15983 ( .A1 ( ctmn_13935 ) , .A2 ( N11867 ) , 
    .A3 ( ctmn_13934 ) , .ZN ( \u_mac_and_scale/mult_3/mult10 [5] ) ) ;
INR2D1BWP30P140HVT ctmi_4820 ( .A1 ( ctmn_14109 ) , .B1 ( ctmn_13438 ) , 
    .ZN ( phfnn_3114 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15985 ( .A ( ctmn_14211 ) , .B ( ctmn_14215 ) , 
    .C ( ctmn_14223 ) , .ZN ( ctmn_14224 ) ) ;
XOR3UD0BWP30P140HVT ctmi_15986 ( .A1 ( ctmn_14195 ) , .A2 ( ctmn_14200 ) , 
    .A3 ( ctmn_14210 ) , .Z ( ctmn_14211 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15987 ( .A ( ctmn_13828 ) , .B ( ctmn_14192 ) , 
    .C ( ctmn_14194 ) , .ZN ( ctmn_14195 ) ) ;
NR2D0BWP30P140HVT ctmi_15988 ( .A1 ( ctmn_13553 ) , .A2 ( ctmn_13782 ) , 
    .ZN ( ctmn_14192 ) ) ;
ND2D0BWP30P140HVT ctmi_15989 ( .A1 ( ctmn_14193 ) , .A2 ( phfnn_3714 ) , 
    .ZN ( ctmn_14194 ) ) ;
NR2D0BWP30P140HVT ctmi_15990 ( .A1 ( ctmn_13565 ) , .A2 ( ctmn_13729 ) , 
    .ZN ( ctmn_14193 ) ) ;
AOI21D0BWP30P140HVT ctmi_15991 ( .A1 ( ctmn_14196 ) , .A2 ( ctmn_14197 ) , 
    .B ( phfnn_3753 ) , .ZN ( ctmn_14200 ) ) ;
NR2D0BWP30P140HVT ctmi_15992 ( .A1 ( ctmn_13559 ) , .A2 ( ctmn_13793 ) , 
    .ZN ( ctmn_14196 ) ) ;
NR2D0BWP30P140HVT ctmi_15993 ( .A1 ( ctmn_13565 ) , .A2 ( ctmn_13782 ) , 
    .ZN ( ctmn_14197 ) ) ;
OAI22D0BWP30P140HVT ctmi_15994 ( .A1 ( ctmn_13793 ) , .A2 ( ctmn_13565 ) , 
    .B1 ( ctmn_13559 ) , .B2 ( ctmn_13782 ) , .ZN ( ctmn_14198 ) ) ;
AOI221D0BWP30P140HVT ctmi_3866 ( .A1 ( phfnn_3124 ) , .A2 ( phfnn_3114 ) , 
    .B1 ( phfnn_3747 ) , .B2 ( phfnn_3750 ) , .C ( phfnn_3761 ) , 
    .ZN ( ctmn_2752 ) ) ;
XOR2UD0BWP30P140HVT ctmi_15996 ( .A1 ( ctmn_14203 ) , .A2 ( ctmn_14209 ) , 
    .Z ( ctmn_14210 ) ) ;
NR2D0BWP30P140HVT ctmi_15997 ( .A1 ( ctmn_13553 ) , .A2 ( phfnn_3754 ) , 
    .ZN ( ctmn_14203 ) ) ;
NR2D0BWP30P140HVT ctmi_15998 ( .A1 ( ctmn_13733 ) , .A2 ( ctmn_13782 ) , 
    .ZN ( ctmn_14201 ) ) ;
AN2D0BWP30P140HVT ctmi_4821 ( .A1 ( operand_B_reg[18] ) , .A2 ( ctmn_14113 ) , 
    .Z ( phfnn_3124 ) ) ;
AOI21D0BWP30P140HVT ctmi_16000 ( .A1 ( ctmn_14205 ) , .A2 ( ctmn_14207 ) , 
    .B ( N183 ) , .ZN ( ctmn_14209 ) ) ;
ND3D0BWP30P140HVT ctmi_16001 ( .A1 ( operand_B_reg[15] ) , 
    .A2 ( operand_B_reg[14] ) , .A3 ( ctmn_14204 ) , .ZN ( ctmn_14205 ) ) ;
NR2D0BWP30P140HVT ctmi_16002 ( .A1 ( ctmn_13793 ) , .A2 ( ctmn_13794 ) , 
    .ZN ( ctmn_14204 ) ) ;
NR2D0BWP30P140HVT ctmi_16003 ( .A1 ( phfnn_3741 ) , .A2 ( ctmn_13794 ) , 
    .ZN ( ctmn_14207 ) ) ;
DEL025D1BWP30P140HVT HFSBUF_157_5430 ( .I ( sync_rst ) , .Z ( HFSNET_33 ) ) ;
INR2D1BWP30P140HVT ctmi_14597 ( .A1 ( valid_opcode ) , .B1 ( ctmn_13317 ) , 
    .ZN ( ctmn_13318 ) ) ;
OAI32D0BWP30P140HVT ctmi_15272 ( .A1 ( N9877 ) , .A2 ( ctmn_13686 ) , 
    .A3 ( ctmn_13724 ) , .B1 ( N9877 ) , .B2 ( ctmn_13775 ) , 
    .ZN ( \u_mac_and_scale/mult_4_0_top [1] ) ) ;
ND2D0BWP30P140HVT ctmi_15273 ( .A1 ( operand_B_reg[5] ) , .A2 ( phfnn_3713 ) , 
    .ZN ( ctmn_13775 ) ) ;
NR2D0BWP30P140HVT ctmi_14947 ( .A1 ( ctmn_13505 ) , .A2 ( HFSNET_18 ) , 
    .ZN ( ctmn_13506 ) ) ;
IND2D0BWP30P140HVT ctmTdsLR_1_5431 ( .A1 ( ctmn_14496 ) , .B1 ( ctmn_14457 ) , 
    .ZN ( ctmn_14703 ) ) ;
TIELBWP30P140HVT optlc_5670 ( .ZN ( optlc_net_3994 ) ) ;
NR2D0BWP30P140HVT ctmi_1459 ( .A1 ( ctmn_13654 ) , .A2 ( N161 ) , 
    .ZN ( ctmn_929 ) ) ;
MAOI222D0BWP30P140HVT ctmi_16006 ( .A ( N11640 ) , .B ( phfnn_3771 ) , 
    .C ( ctmn_14214 ) , .ZN ( ctmn_14215 ) ) ;
AOI32D0BWP30P140HVT ctmi_16007 ( .A1 ( ctmn_14205 ) , .A2 ( phfnn_3710 ) , 
    .A3 ( operand_B_reg[15] ) , .B1 ( ctmn_14205 ) , .B2 ( ctmn_14196 ) , 
    .ZN ( ctmn_14212 ) ) ;
AOI221D0BWP30P140HVT ctmi_16593 ( .A1 ( ctmn_14748 ) , .A2 ( ctmn_14811 ) , 
    .B1 ( act_fn_sel[1] ) , .B2 ( ctmn_14822 ) , .C ( ctmn_14835 ) , 
    .ZN ( ctmn_14836 ) ) ;
OAI211D0BWP30P140HVT ctmi_16594 ( .A1 ( phfnn_3880 ) , .A2 ( phfnn_3857 ) , 
    .B ( ctmn_14804 ) , .C ( ctmn_14810 ) , .ZN ( ctmn_14811 ) ) ;
NR2D0BWP30P140HVT ctmi_16595 ( .A1 ( phfnn_3838 ) , .A2 ( ctmn_14792 ) , 
    .ZN ( ctmn_14793 ) ) ;
MOAI22D0BWP30P140HVT ctmTdsLR_1_3839 ( .A1 ( ctmn_14462 ) , 
    .A2 ( ctmn_14415 ) , .B1 ( ctmn_14341 ) , .B2 ( ctmn_14463 ) , 
    .ZN ( tmp_net2746 ) ) ;
OAI22D0BWP30P140HVT ctmi_16676 ( .A1 ( ctmn_14905 ) , .A2 ( phfnn_3859 ) , 
    .B1 ( ctmn_14906 ) , .B2 ( ctmn_14909 ) , .ZN ( ctmn_14910 ) ) ;
AOI211D0BWP30P140HVT ctmi_16677 ( .A1 ( phfnn_3856 ) , .A2 ( ctmn_14875 ) , 
    .B ( ctmn_14882 ) , .C ( ctmn_14904 ) , .ZN ( ctmn_14905 ) ) ;
AN2D0BWP30P140HVT ctmi_3871 ( .A1 ( phfnn_3875 ) , .A2 ( ctmn_14707 ) , 
    .Z ( ctmn_14751 ) ) ;
TIELBWP30P140HVT optlc_5671 ( .ZN ( optlc_net_3995 ) ) ;
TIELBWP30P140HVT optlc_5672 ( .ZN ( optlc_net_3996 ) ) ;
OAI22D0BWP30P140HVT ctmTdsLR_2_4524 ( .A1 ( phfnn_1320 ) , 
    .A2 ( tmp_net2655 ) , .B1 ( HFSNET_21 ) , .B2 ( phfnn_1319 ) , 
    .ZN ( \RS_OP_250_54632_65499_J1/N31 ) ) ;
OAI22D0BWP30P140HVT ctmi_16682 ( .A1 ( ctmn_14797 ) , .A2 ( phfnn_3867 ) , 
    .B1 ( phfnn_3863 ) , .B2 ( ctmn_14881 ) , .ZN ( ctmn_14882 ) ) ;
ND2D0BWP30P140HVT ctmi_14625 ( .A1 ( ctmn_13329 ) , .A2 ( ctmn_13321 ) , 
    .ZN ( ctmn_13331 ) ) ;
OR3D1BWP30P140HVT ctmi_4826 ( .A1 ( HFSNET_18 ) , .A2 ( ctmn_14672 ) , 
    .A3 ( ctmn_14673 ) , .Z ( phfnn_3194 ) ) ;
AOI21D0BWP30P140HVT ctmi_14949 ( .A1 ( operand_A_reg[25] ) , 
    .A2 ( HFSNET_28 ) , .B ( ctmn_13449 ) , .ZN ( ctmn_13507 ) ) ;
OAI21D0BWP30P140HVT ctmi_3874 ( .A1 ( ctmn_14729 ) , .A2 ( ctmn_14497 ) , 
    .B ( ctmn_14682 ) , .ZN ( phfnn_2546 ) ) ;
AOI21D0BWP30P140HVT ctmi_14951 ( .A1 ( operand_A_reg[24] ) , 
    .A2 ( HFSNET_28 ) , .B ( ctmn_13455 ) , .ZN ( ctmn_13510 ) ) ;
ND2D0BWP30P140HVT ctmi_14953 ( .A1 ( ctmn_13512 ) , .A2 ( phfnn_3730 ) , 
    .ZN ( ctmn_13514 ) ) ;
NR2D0BWP30P140HVT ctmi_14954 ( .A1 ( ctmn_13511 ) , .A2 ( HFSNET_18 ) , 
    .ZN ( ctmn_13512 ) ) ;
TIELBWP30P140HVT optlc_5673 ( .ZN ( optlc_net_3997 ) ) ;
AOI21D0BWP30P140HVT ctmi_4828 ( .A1 ( phfnn_3802 ) , .A2 ( ctmn_14496 ) , 
    .B ( phfnn_3194 ) , .ZN ( ctmn_14709 ) ) ;
ND3D0BWP30P140HVT ctmi_15234 ( .A1 ( ctmn_13730 ) , .A2 ( phfnn_3717 ) , 
    .A3 ( ctmn_13731 ) , .ZN ( ctmn_13736 ) ) ;
AOI21D0BWP30P140HVT ctmi_15393 ( .A1 ( operand_A_reg[22] ) , 
    .A2 ( HFSNET_28 ) , .B ( ctmn_13681 ) , .ZN ( ctmn_13849 ) ) ;
AOI21D0BWP30P140HVT ctmi_15486 ( .A1 ( operand_A_reg[29] ) , 
    .A2 ( HFSNET_28 ) , .B ( ctmn_13685 ) , .ZN ( ctmn_13907 ) ) ;
OAI21D0BWP30P140HVT ctmi_15577 ( .A1 ( phfnn_3794 ) , .A2 ( ctmn_13969 ) , 
    .B ( ctmn_13970 ) , .ZN ( ctmn_13971 ) ) ;
TIELBWP30P140HVT optlc_5674 ( .ZN ( optlc_net_3998 ) ) ;
ND2D0BWP30P140HVT ctmi_16009 ( .A1 ( operand_B_reg[12] ) , 
    .A2 ( ctmn_14201 ) , .ZN ( ctmn_14214 ) ) ;
MAOI222D0BWP30P140HVT ctmi_16010 ( .A ( phfnn_3788 ) , .B ( N11651 ) , 
    .C ( ctmn_14222 ) , .ZN ( ctmn_14223 ) ) ;
XNR2UD0BWP30P140HVT ctmi_16011 ( .A1 ( ctmn_14192 ) , .A2 ( ctmn_14217 ) , 
    .ZN ( ctmn_14218 ) ) ;
AOI21D0BWP30P140HVT ctmi_16012 ( .A1 ( ctmn_14194 ) , .A2 ( ctmn_13828 ) , 
    .B ( ctmn_14216 ) , .ZN ( ctmn_14217 ) ) ;
NR2D0BWP30P140HVT ctmi_16013 ( .A1 ( ctmn_14194 ) , .A2 ( ctmn_13828 ) , 
    .ZN ( ctmn_14216 ) ) ;
TIELBWP30P140HVT optlc_5675 ( .ZN ( optlc_net_3999 ) ) ;
MUX2ND0BWP30P140HVT ctmi_16015 ( .I0 ( ctmn_14212 ) , .I1 ( phfnn_3771 ) , 
    .S ( ctmn_14221 ) , .ZN ( ctmn_14222 ) ) ;
AOI21D0BWP30P140HVT ctmi_16016 ( .A1 ( ctmn_14214 ) , .A2 ( N11640 ) , 
    .B ( ctmn_14220 ) , .ZN ( ctmn_14221 ) ) ;
NR2D0BWP30P140HVT ctmi_16017 ( .A1 ( ctmn_14214 ) , .A2 ( N11640 ) , 
    .ZN ( ctmn_14220 ) ) ;
XOR2UD0BWP30P140HVT ctmi_16018 ( .A1 ( ctmn_14227 ) , .A2 ( N184 ) , 
    .Z ( ctmn_14228 ) ) ;
AOI31D0BWP30P140HVT ctmi_3877 ( .A1 ( phfnn_1888 ) , .A2 ( phfnn_3763 ) , 
    .A3 ( phfnn_3749 ) , .B ( ctmn_2755 ) , .ZN ( ctmn_2756 ) ) ;
OAI21D0BWP30P140HVT ctmi_16020 ( .A1 ( ctmn_13793 ) , .A2 ( phfnn_3741 ) , 
    .B ( ctmn_14197 ) , .ZN ( ctmn_14225 ) ) ;
NR2D0BWP30P140HVT ctmi_16021 ( .A1 ( ctmn_13559 ) , .A2 ( phfnn_3754 ) , 
    .ZN ( ctmn_14227 ) ) ;
MAOI222D0BWP30P140HVT ctmi_16022 ( .A ( ctmn_14210 ) , .B ( ctmn_14195 ) , 
    .C ( ctmn_14200 ) , .ZN ( ctmn_14229 ) ) ;
MUX2ND0BWP30P140HVT ctmi_16023 ( .I0 ( phfnn_3753 ) , .I1 ( ctmn_14198 ) , 
    .S ( ctmn_14230 ) , .ZN ( ctmn_14231 ) ) ;
MAOI222D0BWP30P140HVT ctmi_16024 ( .A ( ctmn_14203 ) , .B ( ctmn_14207 ) , 
    .C ( ctmn_14205 ) , .ZN ( ctmn_14230 ) ) ;
XNR3UD0BWP30P140HVT ctmi_16025 ( .A1 ( ctmn_14211 ) , .A2 ( ctmn_14215 ) , 
    .A3 ( ctmn_14223 ) , .ZN ( \u_mac_and_scale/mult_4_1_top [5] ) ) ;
IND2D1BWP30P140HVT ctmi_4830 ( .A1 ( ctmn_14676 ) , .B1 ( phfnn_3194 ) , 
    .ZN ( ctmn_14677 ) ) ;
MAOI222D0BWP30P140HVT ctmi_16027 ( .A ( ctmn_14251 ) , .B ( ctmn_14255 ) , 
    .C ( ctmn_14263 ) , .ZN ( ctmn_14264 ) ) ;
XOR3UD0BWP30P140HVT ctmi_16028 ( .A1 ( ctmn_14235 ) , .A2 ( ctmn_14240 ) , 
    .A3 ( ctmn_14250 ) , .Z ( ctmn_14251 ) ) ;
MAOI222D0BWP30P140HVT ctmi_16029 ( .A ( ctmn_13886 ) , .B ( ctmn_14232 ) , 
    .C ( ctmn_14234 ) , .ZN ( ctmn_14235 ) ) ;
NR2D0BWP30P140HVT ctmi_16030 ( .A1 ( ctmn_13431 ) , .A2 ( ctmn_13838 ) , 
    .ZN ( ctmn_14232 ) ) ;
ND2D0BWP30P140HVT ctmi_16031 ( .A1 ( ctmn_14233 ) , .A2 ( phfnn_3715 ) , 
    .ZN ( ctmn_14234 ) ) ;
NR2D0BWP30P140HVT ctmi_16032 ( .A1 ( ctmn_13457 ) , .A2 ( ctmn_13729 ) , 
    .ZN ( ctmn_14233 ) ) ;
AOI21D0BWP30P140HVT ctmi_16033 ( .A1 ( ctmn_14236 ) , .A2 ( ctmn_14237 ) , 
    .B ( phfnn_3755 ) , .ZN ( ctmn_14240 ) ) ;
NR2D0BWP30P140HVT ctmi_16034 ( .A1 ( ctmn_13445 ) , .A2 ( ctmn_13849 ) , 
    .ZN ( ctmn_14236 ) ) ;
NR2D0BWP30P140HVT ctmi_16035 ( .A1 ( ctmn_13457 ) , .A2 ( ctmn_13838 ) , 
    .ZN ( ctmn_14237 ) ) ;
OAI22D0BWP30P140HVT ctmi_16036 ( .A1 ( ctmn_13849 ) , .A2 ( ctmn_13457 ) , 
    .B1 ( ctmn_13445 ) , .B2 ( ctmn_13838 ) , .ZN ( ctmn_14238 ) ) ;
TIELBWP30P140HVT optlc_5676 ( .ZN ( optlc_net_4000 ) ) ;
XOR2UD0BWP30P140HVT ctmi_16038 ( .A1 ( ctmn_14243 ) , .A2 ( ctmn_14249 ) , 
    .Z ( ctmn_14250 ) ) ;
NR2D0BWP30P140HVT ctmi_16039 ( .A1 ( ctmn_13431 ) , .A2 ( phfnn_3756 ) , 
    .ZN ( ctmn_14243 ) ) ;
XNR3UD0BWP30P140HVT ctmi_16067 ( .A1 ( ctmn_14251 ) , .A2 ( ctmn_14255 ) , 
    .A3 ( ctmn_14263 ) , .ZN ( \u_mac_and_scale/mult_4_2_top [5] ) ) ;
IND2D1BWP30P140HVT ctmi_3879 ( .A1 ( ctmn_13443 ) , .B1 ( ctmn_13953 ) , 
    .ZN ( phfnn_2418 ) ) ;
XNR3UD0BWP30P140HVT ctmi_16109 ( .A1 ( ctmn_14291 ) , .A2 ( ctmn_14295 ) , 
    .A3 ( ctmn_14303 ) , .ZN ( \u_mac_and_scale/mult_4_3_top [5] ) ) ;
OAI22D0BWP30P140HVT ctmi_16110 ( .A1 ( ctmn_14326 ) , .A2 ( phfnn_2357 ) , 
    .B1 ( HFSNET_18 ) , .B2 ( ctmn_14762 ) , 
    .ZN ( \u_io_block/output_mux_result [5] ) ) ;
TIELBWP30P140HVT optlc_5677 ( .ZN ( optlc_net_4001 ) ) ;
NR2D0BWP30P140HVT ctmi_16683 ( .A1 ( phfnn_3844 ) , .A2 ( ctmn_14792 ) , 
    .ZN ( ctmn_14876 ) ) ;
ND2D0BWP30P140HVT ctmi_627 ( .A1 ( phfnn_2357 ) , .A2 ( ctmn_13327 ) , 
    .ZN ( ctmn_14979 ) ) ;
TIELBWP30P140HVT optlc_5678 ( .ZN ( optlc_net_4002 ) ) ;
IAO21D1BWP30P140HVT ctmi_4832 ( .A1 ( ctmn_14507 ) , .A2 ( phfnn_3194 ) , 
    .B ( ctmn_14673 ) , .ZN ( ctmn_14734 ) ) ;
AN2D0BWP30P140HVT A2203 ( .A1 ( phfnn_671 ) , .A2 ( phfnn_3720 ) , 
    .Z ( N1515 ) ) ;
AN2D0BWP30P140HVT A2204 ( .A1 ( phfnn_672 ) , .A2 ( phfnn_3718 ) , 
    .Z ( N1514 ) ) ;
MAOI222D0BWP30P140HVT A2205 ( .A ( \DP_OP_248_26668_65499_J1/N_50 ) , 
    .B ( \DP_OP_248_26668_65499_J1/N_82 ) , .C ( phfnn_3819 ) , 
    .ZN ( N1517 ) ) ;
NR2D0BWP30P140HVT ctmi_15143 ( .A1 ( ctmn_13671 ) , .A2 ( HFSNET_18 ) , 
    .ZN ( ctmn_13672 ) ) ;
TIELBWP30P140HVT optlc_5679 ( .ZN ( optlc_net_4003 ) ) ;
NR2D0BWP30P140HVT ctmi_16040 ( .A1 ( ctmn_13733 ) , .A2 ( ctmn_13838 ) , 
    .ZN ( ctmn_14241 ) ) ;
NR3D0BWP30P140HVT ctmi_15296 ( .A1 ( ctmn_13792 ) , .A2 ( ctmn_13793 ) , 
    .A3 ( ctmn_13794 ) , .ZN ( ctmn_13795 ) ) ;
XOR2UD0BWP30P140HVT ctmi_15640 ( .A1 ( ctmn_14049 ) , .A2 ( ctmn_14052 ) , 
    .Z ( \u_mac_and_scale/mult_4_1_bottom [7] ) ) ;
AOI221D0BWP30P140HVT ctmi_3880 ( .A1 ( phfnn_3766 ) , .A2 ( phfnn_3120 ) , 
    .B1 ( phfnn_1888 ) , .B2 ( phfnn_3749 ) , .C ( phfnn_3763 ) , 
    .ZN ( ctmn_2755 ) ) ;
NR2D0BWP30P140HVT ctmi_4833 ( .A1 ( ctmn_13676 ) , .A2 ( phfnn_3728 ) , 
    .ZN ( phfnn_3121 ) ) ;
TIELBWP30P140HVT optlc_5680 ( .ZN ( optlc_net_4004 ) ) ;
TIELBWP30P140HVT optlc_5681 ( .ZN ( optlc_net_4005 ) ) ;
AOI21D0BWP30P140HVT ctmi_16042 ( .A1 ( ctmn_14245 ) , .A2 ( ctmn_14247 ) , 
    .B ( N185 ) , .ZN ( ctmn_14249 ) ) ;
ND3D0BWP30P140HVT ctmi_16043 ( .A1 ( operand_B_reg[23] ) , 
    .A2 ( operand_B_reg[22] ) , .A3 ( ctmn_14244 ) , .ZN ( ctmn_14245 ) ) ;
NR2D0BWP30P140HVT ctmi_16044 ( .A1 ( ctmn_13849 ) , .A2 ( ctmn_13850 ) , 
    .ZN ( ctmn_14244 ) ) ;
AN2D0BWP30P140HVT ctmi_4835 ( .A1 ( operand_B_reg[2] ) , .A2 ( ctmn_13954 ) , 
    .Z ( phfnn_3120 ) ) ;
TIELBWP30P140HVT optlc_5682 ( .ZN ( optlc_net_4006 ) ) ;
AOI22D0BWP30P140HVT ctmi_2888 ( .A1 ( phfnn_3708 ) , .A2 ( phfnn_3734 ) , 
    .B1 ( phfnn_2418 ) , .B2 ( ctmn_13621 ) , .ZN ( phfnn_756 ) ) ;
NR2D0BWP30P140HVT ctmi_16045 ( .A1 ( phfnn_3742 ) , .A2 ( ctmn_13850 ) , 
    .ZN ( ctmn_14247 ) ) ;
MAOI222D0BWP30P140HVT ctmi_16069 ( .A ( ctmn_14291 ) , .B ( ctmn_14295 ) , 
    .C ( ctmn_14303 ) , .ZN ( ctmn_14304 ) ) ;
XOR3UD0BWP30P140HVT ctmi_16070 ( .A1 ( ctmn_14275 ) , .A2 ( ctmn_14280 ) , 
    .A3 ( ctmn_14290 ) , .Z ( ctmn_14291 ) ) ;
MAOI222D0BWP30P140HVT ctmi_16071 ( .A ( ctmn_13943 ) , .B ( ctmn_14272 ) , 
    .C ( ctmn_14274 ) , .ZN ( ctmn_14275 ) ) ;
AN2D0BWP30P140HVT ctmi_4837 ( .A1 ( HFSNET_21 ) , .A2 ( ctmn_14059 ) , 
    .Z ( \u_mac_and_scale/N7 ) ) ;
ND2D0BWP30P140HVT ctmi_628 ( .A1 ( phfnn_1420 ) , .A2 ( phfnn_3836 ) , 
    .ZN ( ctmn_14725 ) ) ;
AOI221D0BWP30P140HVT ctmi_16111 ( .A1 ( ctmn_14314 ) , 
    .A2 ( accumulator[61] ) , .B1 ( accumulator[29] ) , .B2 ( ctmn_14316 ) , 
    .C ( ctmn_14325 ) , .ZN ( ctmn_14326 ) ) ;
NR2D0BWP30P140HVT ctmi_16112 ( .A1 ( ctmn_14312 ) , .A2 ( ctmn_14313 ) , 
    .ZN ( ctmn_14314 ) ) ;
IOA21D0BWP30P140HVT ctmi_2216 ( .A1 ( ctmn_14705 ) , .A2 ( phfnn_3828 ) , 
    .B ( ctmn_14682 ) , .ZN ( phfnn_1420 ) ) ;
MAOI222D0BWP30P140HVT ctmi_16048 ( .A ( N11773 ) , .B ( phfnn_3772 ) , 
    .C ( ctmn_14254 ) , .ZN ( ctmn_14255 ) ) ;
AOI32D0BWP30P140HVT ctmi_16049 ( .A1 ( ctmn_14245 ) , .A2 ( phfnn_3711 ) , 
    .A3 ( operand_B_reg[23] ) , .B1 ( ctmn_14245 ) , .B2 ( ctmn_14236 ) , 
    .ZN ( ctmn_14252 ) ) ;
AOI21D0BWP30P140HVT ctmi_2217 ( .A1 ( ctmn_14703 ) , .A2 ( ctmn_14709 ) , 
    .B ( phfnn_3829 ) , .ZN ( phfnn_1416 ) ) ;
ND2D0BWP30P140HVT ctmi_16051 ( .A1 ( operand_B_reg[20] ) , 
    .A2 ( ctmn_14241 ) , .ZN ( ctmn_14254 ) ) ;
OA21D0BWP30P140HVT ctmi_14968 ( .A1 ( phfnn_3687 ) , .A2 ( ctmn_13521 ) , 
    .B ( ctmn_13522 ) , .Z ( ctmn_13523 ) ) ;
TIELBWP30P140HVT optlc_5683 ( .ZN ( optlc_net_4007 ) ) ;
TIELBWP30P140HVT optlc_5684 ( .ZN ( optlc_net_4008 ) ) ;
MAOI222D0BWP30P140HVT ctmi_16052 ( .A ( phfnn_3789 ) , .B ( N11784 ) , 
    .C ( ctmn_14262 ) , .ZN ( ctmn_14263 ) ) ;
OAI22D0BWP30P140HVT ctmi_4838 ( .A1 ( phfnn_3687 ) , .A2 ( phfnn_3727 ) , 
    .B1 ( ctmn_13502 ) , .B2 ( phfnn_3688 ) , .ZN ( ctmn_13522 ) ) ;
ND2D0BWP30P140HVT ctmi_14970 ( .A1 ( ctmn_13519 ) , .A2 ( phfnn_2417 ) , 
    .ZN ( ctmn_13521 ) ) ;
NR2D0BWP30P140HVT ctmi_14971 ( .A1 ( phfnn_3688 ) , .A2 ( ctmn_13502 ) , 
    .ZN ( ctmn_13519 ) ) ;
ND3D0BWP30P140HVT ctmi_14616 ( .A1 ( \u_controller/opcode_reg [1] ) , 
    .A2 ( phfnn_3659 ) , .A3 ( HFSNET_17 ) , .ZN ( ctmn_13325 ) ) ;
NR2D0BWP30P140HVT ctmi_4839 ( .A1 ( ctmn_13614 ) , .A2 ( HFSNET_18 ) , 
    .ZN ( phfnn_3048 ) ) ;
OR2D1BWP30P140HVT ctmi_4840 ( .A1 ( phfnn_2442 ) , .A2 ( ctmn_13616 ) , 
    .Z ( ctmn_13634 ) ) ;
AOI221D0BWP30P140HVT ctmi_16686 ( .A1 ( HFSNET_1 ) , .A2 ( phfnn_2542 ) , 
    .B1 ( HFSNET_0 ) , .B2 ( ctmn_14726 ) , .C ( ctmn_14880 ) , 
    .ZN ( ctmn_14881 ) ) ;
XNR2UD0BWP30P140HVT ctmi_16053 ( .A1 ( ctmn_14232 ) , .A2 ( ctmn_14257 ) , 
    .ZN ( ctmn_14258 ) ) ;
OR2D1BWP30P140HVT ctmi_2222 ( .A1 ( ctmn_13559 ) , .A2 ( HFSNET_18 ) , 
    .Z ( phfnn_1254 ) ) ;
ND2D0BWP30P140HVT ctmi_4841 ( .A1 ( phfnn_3048 ) , .A2 ( phfnn_3724 ) , 
    .ZN ( ctmn_13618 ) ) ;
AOI21D0BWP30P140HVT ctmi_14974 ( .A1 ( ctmn_13525 ) , .A2 ( ctmn_13526 ) , 
    .B ( N159 ) , .ZN ( ctmn_13529 ) ) ;
ND2D0BWP30P140HVT ctmi_14975 ( .A1 ( ctmn_13524 ) , .A2 ( phfnn_3722 ) , 
    .ZN ( ctmn_13525 ) ) ;
NR2D0BWP30P140HVT ctmi_14976 ( .A1 ( ctmn_13331 ) , .A2 ( phfnn_3688 ) , 
    .ZN ( ctmn_13524 ) ) ;
NR3D0BWP30P140HVT ctmi_14977 ( .A1 ( phfnn_3688 ) , .A2 ( ctmn_13509 ) , 
    .A3 ( ctmn_13502 ) , .ZN ( ctmn_13526 ) ) ;
ND2D0BWP30P140HVT ctmi_629 ( .A1 ( phfnn_2514 ) , .A2 ( ctmn_14493 ) , 
    .ZN ( ctmn_14496 ) ) ;
NR2D0BWP30P140HVT ctmi_3886 ( .A1 ( phfnn_1420 ) , .A2 ( phfnn_1416 ) , 
    .ZN ( phfnn_2563 ) ) ;
AOI21D0BWP30P140HVT ctmi_16054 ( .A1 ( ctmn_14234 ) , .A2 ( ctmn_13886 ) , 
    .B ( ctmn_14256 ) , .ZN ( ctmn_14257 ) ) ;
NR2D0BWP30P140HVT ctmi_16055 ( .A1 ( ctmn_14234 ) , .A2 ( ctmn_13886 ) , 
    .ZN ( ctmn_14256 ) ) ;
IND2D1BWP30P140HVT ctmi_2224 ( .A1 ( ctmn_13331 ) , .B1 ( ctmn_13566 ) , 
    .ZN ( phfnn_1311 ) ) ;
MUX2ND0BWP30P140HVT ctmi_16057 ( .I0 ( ctmn_14252 ) , .I1 ( phfnn_3772 ) , 
    .S ( ctmn_14261 ) , .ZN ( ctmn_14262 ) ) ;
AOI21D0BWP30P140HVT ctmi_16058 ( .A1 ( ctmn_14254 ) , .A2 ( N11773 ) , 
    .B ( ctmn_14260 ) , .ZN ( ctmn_14261 ) ) ;
NR2D0BWP30P140HVT ctmi_16059 ( .A1 ( ctmn_14254 ) , .A2 ( N11773 ) , 
    .ZN ( ctmn_14260 ) ) ;
XOR2UD0BWP30P140HVT ctmi_16060 ( .A1 ( ctmn_14267 ) , .A2 ( N187 ) , 
    .Z ( ctmn_14268 ) ) ;
OR2D1BWP30P140HVT ctmi_4842 ( .A1 ( phfnn_2442 ) , .A2 ( ctmn_13619 ) , 
    .Z ( ctmn_13640 ) ) ;
OAI21D0BWP30P140HVT ctmi_16062 ( .A1 ( ctmn_13849 ) , .A2 ( phfnn_3742 ) , 
    .B ( ctmn_14237 ) , .ZN ( ctmn_14265 ) ) ;
NR2D0BWP30P140HVT ctmi_16063 ( .A1 ( ctmn_13445 ) , .A2 ( phfnn_3756 ) , 
    .ZN ( ctmn_14267 ) ) ;
MAOI222D0BWP30P140HVT ctmi_16064 ( .A ( ctmn_14250 ) , .B ( ctmn_14235 ) , 
    .C ( ctmn_14240 ) , .ZN ( ctmn_14269 ) ) ;
MUX2ND0BWP30P140HVT ctmi_16065 ( .I0 ( phfnn_3755 ) , .I1 ( ctmn_14238 ) , 
    .S ( ctmn_14270 ) , .ZN ( ctmn_14271 ) ) ;
MAOI222D0BWP30P140HVT ctmi_16066 ( .A ( ctmn_14243 ) , .B ( ctmn_14247 ) , 
    .C ( ctmn_14245 ) , .ZN ( ctmn_14270 ) ) ;
NR2D0BWP30P140HVT ctmi_16072 ( .A1 ( ctmn_13499 ) , .A2 ( ctmn_13895 ) , 
    .ZN ( ctmn_14272 ) ) ;
ND2D0BWP30P140HVT ctmi_16073 ( .A1 ( ctmn_14273 ) , .A2 ( phfnn_3716 ) , 
    .ZN ( ctmn_14274 ) ) ;
NR2D0BWP30P140HVT ctmi_16074 ( .A1 ( ctmn_13511 ) , .A2 ( ctmn_13729 ) , 
    .ZN ( ctmn_14273 ) ) ;
AOI21D0BWP30P140HVT ctmi_16075 ( .A1 ( ctmn_14276 ) , .A2 ( ctmn_14277 ) , 
    .B ( phfnn_3757 ) , .ZN ( ctmn_14280 ) ) ;
NR2D0BWP30P140HVT ctmi_16076 ( .A1 ( ctmn_13505 ) , .A2 ( ctmn_13906 ) , 
    .ZN ( ctmn_14276 ) ) ;
NR2D0BWP30P140HVT ctmi_16077 ( .A1 ( ctmn_13511 ) , .A2 ( ctmn_13895 ) , 
    .ZN ( ctmn_14277 ) ) ;
OAI22D0BWP30P140HVT ctmi_16078 ( .A1 ( ctmn_13906 ) , .A2 ( ctmn_13511 ) , 
    .B1 ( ctmn_13505 ) , .B2 ( ctmn_13895 ) , .ZN ( ctmn_14278 ) ) ;
TIELBWP30P140HVT optlc_5685 ( .ZN ( optlc_net_4009 ) ) ;
XOR2UD0BWP30P140HVT ctmi_16080 ( .A1 ( ctmn_14283 ) , .A2 ( ctmn_14289 ) , 
    .Z ( ctmn_14290 ) ) ;
NR2D0BWP30P140HVT ctmi_16081 ( .A1 ( ctmn_13499 ) , .A2 ( phfnn_3758 ) , 
    .ZN ( ctmn_14283 ) ) ;
NR2D0BWP30P140HVT ctmi_16082 ( .A1 ( ctmn_13733 ) , .A2 ( ctmn_13895 ) , 
    .ZN ( ctmn_14281 ) ) ;
MAOI222D0BWP30P140HVT ctmi_14980 ( .A ( N168 ) , .B ( ctmn_13530 ) , 
    .C ( ctmn_13531 ) , .ZN ( ctmn_13532 ) ) ;
NR2D0BWP30P140HVT ctmi_2894 ( .A1 ( phfnn_3850 ) , .A2 ( phfnn_3831 ) , 
    .ZN ( phfnn_2014 ) ) ;
ND2D0BWP30P140HVT ctmi_14982 ( .A1 ( ctmn_13524 ) , .A2 ( phfnn_3730 ) , 
    .ZN ( ctmn_13531 ) ) ;
MAOI222D0BWP30P140HVT ctmi_14983 ( .A ( ctmn_13541 ) , .B ( ctmn_13535 ) , 
    .C ( ctmn_13542 ) , .ZN ( ctmn_13543 ) ) ;
MAOI222D0BWP30P140HVT ctmi_14984 ( .A ( phfnn_3798 ) , .B ( N11382 ) , 
    .C ( ctmn_13540 ) , .ZN ( ctmn_13541 ) ) ;
AOI21D0BWP30P140HVT ctmi_14985 ( .A1 ( N9458 ) , .A2 ( ctmn_13534 ) , 
    .B ( ctmn_13535 ) , .ZN ( ctmn_13536 ) ) ;
OAI33D0BWP30P140HVT ctmi_14986 ( .A1 ( ctmn_13526 ) , .A2 ( ctmn_13502 ) , 
    .A3 ( phfnn_3687 ) , .B1 ( ctmn_13526 ) , .B2 ( phfnn_3688 ) , 
    .B3 ( ctmn_13507 ) , .ZN ( ctmn_13534 ) ) ;
NR2D0BWP30P140HVT ctmi_14987 ( .A1 ( N9458 ) , .A2 ( ctmn_13534 ) , 
    .ZN ( ctmn_13535 ) ) ;
TIELBWP30P140HVT optlc_5686 ( .ZN ( optlc_net_4010 ) ) ;
XOR2UD0BWP30P140HVT ctmi_14989 ( .A1 ( ctmn_13530 ) , .A2 ( ctmn_13539 ) , 
    .Z ( ctmn_13540 ) ) ;
AOI21D0BWP30P140HVT ctmi_14990 ( .A1 ( ctmn_13531 ) , .A2 ( N168 ) , 
    .B ( ctmn_13538 ) , .ZN ( ctmn_13539 ) ) ;
NR2D0BWP30P140HVT ctmi_14991 ( .A1 ( ctmn_13531 ) , .A2 ( N168 ) , 
    .ZN ( ctmn_13538 ) ) ;
XOR3UD0BWP30P140HVT ctmi_14992 ( .A1 ( ctmn_13532 ) , .A2 ( ctmn_13523 ) , 
    .A3 ( ctmn_13529 ) , .Z ( ctmn_13542 ) ) ;
AO21D0BWP30P140HVT ctmTdsLR_1_3513 ( .A1 ( N207 ) , .A2 ( HFSNET_22 ) , 
    .B ( \RS_OP_250_54632_65499_J1/ctmn_154 ) , .Z ( N307 ) ) ;
OAI21D0BWP30P140HVT ctmi_14994 ( .A1 ( phfnn_3744 ) , .A2 ( ctmn_13521 ) , 
    .B ( ctmn_13546 ) , .ZN ( ctmn_13547 ) ) ;
OAI22D0BWP30P140HVT ctmi_14995 ( .A1 ( ctmn_13502 ) , .A2 ( phfnn_3744 ) , 
    .B1 ( phfnn_3688 ) , .B2 ( phfnn_3727 ) , .ZN ( ctmn_13546 ) ) ;
AOI21D0BWP30P140HVT ctmi_15014 ( .A1 ( operand_A_reg[9] ) , 
    .A2 ( HFSNET_28 ) , .B ( ctmn_13449 ) , .ZN ( ctmn_13561 ) ) ;
AO21D0BWP30P140HVT ctmTdsLR_1_3514 ( .A1 ( N223 ) , .A2 ( phfnn_648 ) , 
    .B ( \RS_OP_250_54632_65499_J1/ctmn_155 ) , .Z ( N308 ) ) ;
AOI21D0BWP30P140HVT ctmi_15016 ( .A1 ( operand_A_reg[8] ) , 
    .A2 ( HFSNET_28 ) , .B ( ctmn_13455 ) , .ZN ( ctmn_13564 ) ) ;
ND2D0BWP30P140HVT ctmi_15018 ( .A1 ( ctmn_13566 ) , .A2 ( phfnn_3731 ) , 
    .ZN ( ctmn_13568 ) ) ;
NR2D0BWP30P140HVT ctmi_15019 ( .A1 ( ctmn_13565 ) , .A2 ( HFSNET_18 ) , 
    .ZN ( ctmn_13566 ) ) ;
AOI22D0BWP30P140HVT ctmi_3888 ( .A1 ( ctmn_13566 ) , .A2 ( phfnn_3733 ) , 
    .B1 ( phfnn_2415 ) , .B2 ( phfnn_3692 ) , .ZN ( ctmn_13575 ) ) ;
MAOI222D0BWP30P140HVT ctmTdsLR_2_3516 ( .A ( ctmn_14224 ) , 
    .B ( ctmn_14229 ) , .C ( tmp_net2635 ) , .ZN ( ctmn_15222 ) ) ;
INR2D1BWP30P140HVT ctmi_631 ( .A1 ( ctmn_14473 ) , .B1 ( ctmn_14496 ) , 
    .ZN ( ctmn_14704 ) ) ;
OR2D1BWP30P140HVT ctmi_4844 ( .A1 ( ctmn_13676 ) , .A2 ( HFSNET_18 ) , 
    .Z ( phfnn_3064 ) ) ;
AOI21D0BWP30P140HVT ctmi_15033 ( .A1 ( phfnn_3692 ) , .A2 ( ctmn_13572 ) , 
    .B ( ctmn_13575 ) , .ZN ( ctmn_13576 ) ) ;
NR3D0BWP30P140HVT ctmi_15034 ( .A1 ( phfnn_3698 ) , .A2 ( ctmn_13556 ) , 
    .A3 ( phfnn_3725 ) , .ZN ( ctmn_13572 ) ) ;
IND2D1BWP30P140HVT ctmi_3889 ( .A1 ( ctmn_13443 ) , .B1 ( ctmn_14007 ) , 
    .ZN ( phfnn_2415 ) ) ;
TIELBWP30P140HVT optlc_5687 ( .ZN ( optlc_net_4011 ) ) ;
NR2D0BWP30P140HVT ctmi_4846 ( .A1 ( phfnn_3064 ) , .A2 ( ctmn_13668 ) , 
    .ZN ( ctmn_13692 ) ) ;
AOI21D0BWP30P140HVT ctmi_15038 ( .A1 ( ctmn_13578 ) , .A2 ( ctmn_13579 ) , 
    .B ( N160 ) , .ZN ( ctmn_13582 ) ) ;
ND2D0BWP30P140HVT ctmi_15039 ( .A1 ( phfnn_3707 ) , .A2 ( phfnn_3723 ) , 
    .ZN ( ctmn_13578 ) ) ;
MAOI222D0BWP30P140HVT ctmTdsLR_2_3518 ( .A ( ctmn_14264 ) , 
    .B ( ctmn_14269 ) , .C ( tmp_net2636 ) , .ZN ( ctmn_15235 ) ) ;
NR3D0BWP30P140HVT ctmi_15041 ( .A1 ( phfnn_3698 ) , .A2 ( ctmn_13563 ) , 
    .A3 ( ctmn_13556 ) , .ZN ( ctmn_13579 ) ) ;
AN2D0BWP30P140HVT ctmi_632 ( .A1 ( ctmn_14457 ) , .A2 ( ctmn_14471 ) , 
    .Z ( ctmn_14473 ) ) ;
ND2D0BWP30P140HVT ctmi_2237 ( .A1 ( \u_mac_and_scale/scale_iso_2 [0] ) , 
    .A2 ( N186 ) , .ZN ( phfnn_1475 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15044 ( .A ( N171 ) , .B ( ctmn_13583 ) , 
    .C ( ctmn_13584 ) , .ZN ( ctmn_13585 ) ) ;
XNR2UD0BWP30P140HVT ctmTdsLR_2_3849 ( .A1 ( ctmn_14310 ) , 
    .A2 ( tmp_net2749 ) , .ZN ( tmp_net2638 ) ) ;
MAOI222D0BWP30P140HVT ctmTdsLR_2_3520 ( .A ( ctmn_14149 ) , 
    .B ( ctmn_14148 ) , .C ( tmp_net2637 ) , .ZN ( ctmn_15245 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15047 ( .A ( ctmn_13595 ) , .B ( ctmn_13589 ) , 
    .C ( ctmn_13596 ) , .ZN ( ctmn_13597 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15048 ( .A ( phfnn_3799 ) , .B ( N11411 ) , 
    .C ( ctmn_13594 ) , .ZN ( ctmn_13595 ) ) ;
AOI21D0BWP30P140HVT ctmi_15049 ( .A1 ( N9558 ) , .A2 ( ctmn_13588 ) , 
    .B ( ctmn_13589 ) , .ZN ( ctmn_13590 ) ) ;
OAI33D0BWP30P140HVT ctmi_15050 ( .A1 ( ctmn_13579 ) , .A2 ( ctmn_13556 ) , 
    .A3 ( phfnn_1254 ) , .B1 ( ctmn_13579 ) , .B2 ( phfnn_3698 ) , 
    .B3 ( ctmn_13561 ) , .ZN ( ctmn_13588 ) ) ;
AOI22D0BWP30P140HVT ctmi_3891 ( .A1 ( ctmn_13621 ) , .A2 ( phfnn_3734 ) , 
    .B1 ( phfnn_2418 ) , .B2 ( phfnn_3048 ) , .ZN ( ctmn_13631 ) ) ;
NR2D0BWP30P140HVT ctmi_15052 ( .A1 ( N9558 ) , .A2 ( ctmn_13588 ) , 
    .ZN ( ctmn_13589 ) ) ;
INR2D1BWP30P140HVT ctmi_2241 ( .A1 ( ctmn_14873 ) , .B1 ( phfnn_874 ) , 
    .ZN ( ctmn_15058 ) ) ;
XOR2UD0BWP30P140HVT ctmi_15054 ( .A1 ( ctmn_13583 ) , .A2 ( ctmn_13593 ) , 
    .Z ( ctmn_13594 ) ) ;
AOI21D0BWP30P140HVT ctmi_15055 ( .A1 ( ctmn_13584 ) , .A2 ( N171 ) , 
    .B ( ctmn_13592 ) , .ZN ( ctmn_13593 ) ) ;
NR2D0BWP30P140HVT ctmi_15056 ( .A1 ( ctmn_13584 ) , .A2 ( N171 ) , 
    .ZN ( ctmn_13592 ) ) ;
XOR3UD0BWP30P140HVT ctmi_15057 ( .A1 ( ctmn_13585 ) , .A2 ( ctmn_13576 ) , 
    .A3 ( ctmn_13582 ) , .Z ( ctmn_13596 ) ) ;
AOI21D0BWP30P140HVT ctmi_15080 ( .A1 ( operand_A_reg[1] ) , 
    .A2 ( HFSNET_25 ) , .B ( ctmn_13449 ) , .ZN ( ctmn_13616 ) ) ;
MAOI222D0BWP30P140HVT ctmTdsLR_2_3522 ( .A ( ctmn_14304 ) , 
    .B ( ctmn_14309 ) , .C ( tmp_net2638 ) , .ZN ( ctmn_15257 ) ) ;
AOI21D0BWP30P140HVT ctmi_15082 ( .A1 ( operand_A_reg[0] ) , 
    .A2 ( HFSNET_25 ) , .B ( ctmn_13455 ) , .ZN ( ctmn_13619 ) ) ;
ND2D0BWP30P140HVT ctmi_15084 ( .A1 ( ctmn_13621 ) , .A2 ( phfnn_3732 ) , 
    .ZN ( ctmn_13623 ) ) ;
NR2D0BWP30P140HVT ctmi_15085 ( .A1 ( ctmn_13620 ) , .A2 ( HFSNET_18 ) , 
    .ZN ( ctmn_13621 ) ) ;
AOI21D0BWP30P140HVT ctmi_15058 ( .A1 ( phfnn_3707 ) , .A2 ( ctmn_13572 ) , 
    .B ( phfnn_755 ) , .ZN ( ctmn_13601 ) ) ;
ND3D0BWP30P140HVT ctmTdsLR_1_3523 ( .A1 ( N251 ) , 
    .A2 ( \u_mac_and_scale/N7 ) , .A3 ( ctmn_13952 ) , .ZN ( tmp_net2639 ) ) ;
IOA21D1BWP30P140HVT ctmTdsLR_2_3524 ( 
    .A1 ( \u_mac_and_scale/mult_4_1_bottom [1] ) , .A2 ( HFSNET_22 ) , 
    .B ( tmp_net2639 ) , .ZN ( \RS_OP_250_54632_65499_J1/N30 ) ) ;
NR3D0BWP30P140HVT ctmi_15146 ( .A1 ( ctmn_13678 ) , .A2 ( ctmn_13682 ) , 
    .A3 ( ctmn_13686 ) , .ZN ( ctmn_13687 ) ) ;
ND2D0BWP30P140HVT ctmi_15147 ( .A1 ( ctmn_13675 ) , .A2 ( phfnn_3685 ) , 
    .ZN ( ctmn_13678 ) ) ;
NR2D0BWP30P140HVT ctmi_15148 ( .A1 ( ctmn_13674 ) , .A2 ( HFSNET_18 ) , 
    .ZN ( ctmn_13675 ) ) ;
ND3D0BWP30P140HVT ctmTdsLR_1_3525 ( .A1 ( N262 ) , 
    .A2 ( \u_mac_and_scale/N7 ) , .A3 ( ctmn_13952 ) , .ZN ( tmp_net2640 ) ) ;
AOI21D0BWP30P140HVT ctmi_15100 ( .A1 ( phfnn_3048 ) , .A2 ( ctmn_13628 ) , 
    .B ( ctmn_13631 ) , .ZN ( ctmn_13632 ) ) ;
NR3D0BWP30P140HVT ctmi_15101 ( .A1 ( phfnn_3702 ) , .A2 ( ctmn_13611 ) , 
    .A3 ( phfnn_3728 ) , .ZN ( ctmn_13628 ) ) ;
ND3D0BWP30P140HVT ctmi_15235 ( .A1 ( operand_B_reg[7] ) , .A2 ( ctmn_13729 ) , 
    .A3 ( ctmn_13734 ) , .ZN ( ctmn_13737 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15236 ( .A ( ctmn_13747 ) , .B ( ctmn_13757 ) , 
    .C ( phfnn_3814 ) , .ZN ( ctmn_13773 ) ) ;
ND2D0BWP30P140HVT A1481 ( .A1 ( ctmn_13664 ) , .A2 ( N10415 ) , .ZN ( N932 ) ) ;
AOI31D0BWP30P140HVT ctmi_15199 ( .A1 ( phfnn_3735 ) , .A2 ( ctmn_13672 ) , 
    .A3 ( ctmn_13698 ) , .B ( N9776 ) , .ZN ( ctmn_13709 ) ) ;
NR2D0BWP30P140HVT ctmi_2246 ( .A1 ( ctmn_14707 ) , .A2 ( ctmn_14792 ) , 
    .ZN ( phfnn_1453 ) ) ;
ND2D0BWP30P140HVT ctmi_15297 ( .A1 ( ctmn_13789 ) , .A2 ( ctmn_13791 ) , 
    .ZN ( ctmn_13792 ) ) ;
NR2D0BWP30P140HVT ctmi_15298 ( .A1 ( ctmn_13788 ) , .A2 ( HFSNET_18 ) , 
    .ZN ( ctmn_13789 ) ) ;
AO22D0BWP30P140HVT ctmi_2247 ( .A1 ( ctmn_14808 ) , .A2 ( phfnn_2014 ) , 
    .B1 ( phfnn_3876 ) , .B2 ( phfnn_899 ) , .Z ( ctmn_14854 ) ) ;
NR2D0BWP30P140HVT ctmi_15300 ( .A1 ( ctmn_13790 ) , .A2 ( HFSNET_18 ) , 
    .ZN ( ctmn_13791 ) ) ;
AN2D1BWP30P140HVT ctmi_1487 ( .A1 ( \u_controller/state [0] ) , 
    .A2 ( \u_controller/state [1] ) , .Z ( phfnn_639 ) ) ;
AOI21D0BWP30P140HVT ctmi_15302 ( .A1 ( operand_A_reg[14] ) , 
    .A2 ( HFSNET_28 ) , .B ( ctmn_13681 ) , .ZN ( ctmn_13793 ) ) ;
AOI21D0BWP30P140HVT ctmi_15303 ( .A1 ( operand_A_reg[13] ) , 
    .A2 ( HFSNET_28 ) , .B ( ctmn_13685 ) , .ZN ( ctmn_13794 ) ) ;
ND2D0BWP30P140HVT ctmi_15305 ( .A1 ( phfnn_3768 ) , .A2 ( ctmn_13789 ) , 
    .ZN ( ctmn_13797 ) ) ;
XNR4D0BWP30P140HVT ctmi_4847 ( .A1 ( ctmn_14264 ) , .A2 ( ctmn_14268 ) , 
    .A3 ( ctmn_14269 ) , .A4 ( ctmn_14271 ) , .ZN ( phfnn_3180 ) ) ;
NR2D0BWP30P140HVT ctmi_15307 ( .A1 ( phfnn_3699 ) , .A2 ( ctmn_13782 ) , 
    .ZN ( ctmn_13799 ) ) ;
TIELBWP30P140HVT optlc_5688 ( .ZN ( optlc_net_4012 ) ) ;
TIELBWP30P140HVT optlc_5689 ( .ZN ( optlc_net_4013 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15641 ( .A ( ctmn_14026 ) , .B ( ctmn_14047 ) , 
    .C ( ctmn_14048 ) , .ZN ( ctmn_14049 ) ) ;
XOR2UD0BWP30P140HVT ctmi_15642 ( .A1 ( ctmn_14014 ) , .A2 ( ctmn_14025 ) , 
    .Z ( ctmn_14026 ) ) ;
MOAI22D0BWP30P140HVT ctmi_2248 ( .A1 ( phfnn_3885 ) , .A2 ( phfnn_867 ) , 
    .B1 ( ctmn_14873 ) , .B2 ( phfnn_3854 ) , .ZN ( ctmn_14875 ) ) ;
OAI21D0BWP30P140HVT ctmi_15629 ( .A1 ( ctmn_13747 ) , .A2 ( ctmn_13757 ) , 
    .B ( ctmn_14004 ) , .ZN ( ctmn_14005 ) ) ;
ND2D0BWP30P140HVT ctmi_15630 ( .A1 ( ctmn_13747 ) , .A2 ( ctmn_13757 ) , 
    .ZN ( ctmn_14004 ) ) ;
XNR3UD0BWP30P140HVT ctmi_4849 ( .A1 ( phfnn_3180 ) , 
    .A2 ( \DP_OP_248_26668_65499_J1/N_2 ) , 
    .A3 ( \DP_OP_246_35163_65499_J1/N_63 ) , .ZN ( N221 ) ) ;
ND2D0BWP30P140HVT ctmi_15643 ( .A1 ( ctmn_14009 ) , .A2 ( ctmn_14013 ) , 
    .ZN ( ctmn_14014 ) ) ;
ND2D0BWP30P140HVT ctmi_4850 ( .A1 ( phfnn_3864 ) , .A2 ( phfnn_3229 ) , 
    .ZN ( phfnn_3243 ) ) ;
AOI21D0BWP30P140HVT ctmi_15394 ( .A1 ( operand_A_reg[21] ) , 
    .A2 ( HFSNET_28 ) , .B ( ctmn_13685 ) , .ZN ( ctmn_13850 ) ) ;
NR2D0BWP30P140HVT ctmi_15396 ( .A1 ( ctmn_13840 ) , .A2 ( phfnn_3696 ) , 
    .ZN ( ctmn_13853 ) ) ;
AOI21D0BWP30P140HVT ctmi_16084 ( .A1 ( ctmn_14285 ) , .A2 ( ctmn_14287 ) , 
    .B ( N189 ) , .ZN ( ctmn_14289 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15337 ( .A ( phfnn_3778 ) , .B ( N11599 ) , 
    .C ( ctmn_13819 ) , .ZN ( ctmn_13820 ) ) ;
AOI31D0BWP30P140HVT ctmi_15338 ( .A1 ( phfnn_3736 ) , .A2 ( phfnn_672 ) , 
    .A3 ( ctmn_13802 ) , .B ( N9986 ) , .ZN ( ctmn_13812 ) ) ;
ND3D0BWP30P140HVT ctmi_16085 ( .A1 ( operand_B_reg[31] ) , 
    .A2 ( operand_B_reg[30] ) , .A3 ( ctmn_14284 ) , .ZN ( ctmn_14285 ) ) ;
NR2D0BWP30P140HVT ctmi_16086 ( .A1 ( ctmn_13906 ) , .A2 ( ctmn_13907 ) , 
    .ZN ( ctmn_14284 ) ) ;
OAI21D0BWP30P140HVT ctmi_1419 ( .A1 ( HFSNET_11 ) , .A2 ( ctmn_14559 ) , 
    .B ( ctmn_14571 ) , .ZN ( ctmn_14572 ) ) ;
NR2D0BWP30P140HVT ctmi_1420 ( .A1 ( ctmn_14725 ) , .A2 ( phfnn_3864 ) , 
    .ZN ( ctmn_14778 ) ) ;
IOA21D0BWP30P140HVT ctmTdsLR_2_3526 ( .A1 ( N251 ) , .A2 ( HFSNET_22 ) , 
    .B ( tmp_net2640 ) , .ZN ( \RS_OP_250_54632_65499_J1/N14 ) ) ;
AOI31D0BWP30P140HVT ctmi_1446 ( .A1 ( ctmn_13502 ) , .A2 ( phfnn_3727 ) , 
    .A3 ( ctmn_926 ) , .B ( phfnn_3744 ) , 
    .ZN ( \u_mac_and_scale/mult_3/mult01 [8] ) ) ;
NR2D0BWP30P140HVT ctmi_1447 ( .A1 ( ctmn_13544 ) , .A2 ( N159 ) , 
    .ZN ( ctmn_926 ) ) ;
AOI222D0BWP30P140HVT ctmi_15704 ( .A1 ( HFSNET_10 ) , .A2 ( N56 ) , 
    .B1 ( HFSNET_8 ) , .B2 ( N48 ) , .C1 ( N64 ) , .C2 ( HFSNET_5 ) , 
    .ZN ( ctmn_14061 ) ) ;
NR2D0BWP30P140HVT ctmi_15399 ( .A1 ( phfnn_3694 ) , .A2 ( ctmn_13838 ) , 
    .ZN ( ctmn_13856 ) ) ;
NR2D0BWP30P140HVT ctmi_15488 ( .A1 ( ctmn_13897 ) , .A2 ( phfnn_3690 ) , 
    .ZN ( ctmn_13910 ) ) ;
NR2D0BWP30P140HVT ctmi_1451 ( .A1 ( ctmn_13598 ) , .A2 ( N160 ) , 
    .ZN ( ctmn_927 ) ) ;
NR2D0BWP30P140HVT ctmi_16087 ( .A1 ( phfnn_3743 ) , .A2 ( ctmn_13907 ) , 
    .ZN ( ctmn_14287 ) ) ;
AOI31D0BWP30P140HVT ctmi_15431 ( .A1 ( phfnn_3737 ) , .A2 ( ctmn_13842 ) , 
    .A3 ( ctmn_13859 ) , .B ( N10192 ) , .ZN ( ctmn_13870 ) ) ;
TIELBWP30P140HVT optlc_5690 ( .ZN ( optlc_net_4014 ) ) ;
IND2D1BWP30P140HVT ctmi_3894 ( .A1 ( ctmn_13331 ) , .B1 ( ctmn_13621 ) , 
    .ZN ( phfnn_2442 ) ) ;
IOA21D0BWP30P140HVT ctmi_633 ( .A1 ( ctmn_14416 ) , .A2 ( ctmn_14335 ) , 
    .B ( ctmn_14513 ) , .ZN ( ctmn_14511 ) ) ;
ND2D0BWP30P140HVT ctmi_4852 ( .A1 ( phfnn_3853 ) , .A2 ( HFSNET_1 ) , 
    .ZN ( phfnn_3229 ) ) ;
NR2D0BWP30P140HVT ctmi_15491 ( .A1 ( phfnn_3689 ) , .A2 ( ctmn_13895 ) , 
    .ZN ( ctmn_13913 ) ) ;
MAOI222D0BWP30P140HVT ctmi_16090 ( .A ( N11903 ) , .B ( phfnn_3773 ) , 
    .C ( ctmn_14294 ) , .ZN ( ctmn_14295 ) ) ;
TIELBWP30P140HVT optlc_5691 ( .ZN ( optlc_net_4015 ) ) ;
AN2D0BWP30P140HVT ctmi_3897 ( .A1 ( ctmn_13609 ) , .A2 ( phfnn_2418 ) , 
    .Z ( ctmn_13639 ) ) ;
OR2D1BWP30P140HVT ctmi_3898 ( .A1 ( HFSNET_25 ) , .A2 ( phfnn_1320 ) , 
    .Z ( phfnn_2465 ) ) ;
AOI221D0BWP30P140HVT ctmTdsLR_2_3840 ( .A1 ( accumulator[12] ) , 
    .A2 ( phfnn_3676 ) , .B1 ( accumulator[20] ) , .B2 ( phfnn_3675 ) , 
    .C ( tmp_net2746 ) , .ZN ( ctmn_14465 ) ) ;
AOI32D0BWP30P140HVT ctmi_16091 ( .A1 ( ctmn_14285 ) , .A2 ( phfnn_3712 ) , 
    .A3 ( operand_B_reg[31] ) , .B1 ( ctmn_14285 ) , .B2 ( ctmn_14276 ) , 
    .ZN ( ctmn_14292 ) ) ;
AOI31D0BWP30P140HVT ctmi_15522 ( .A1 ( phfnn_3738 ) , .A2 ( phfnn_671 ) , 
    .A3 ( ctmn_13916 ) , .B ( N10398 ) , .ZN ( ctmn_13926 ) ) ;
AO22D0BWP30P140HVT ctmi_2250 ( .A1 ( phfnn_1416 ) , .A2 ( ctmn_14795 ) , 
    .B1 ( HFSNET_1 ) , .B2 ( phfnn_1420 ) , .Z ( ctmn_14947 ) ) ;
ND2D0BWP30P140HVT ctmi_16114 ( .A1 ( operand_A_reg[2] ) , 
    .A2 ( operand_A_reg[1] ) , .ZN ( ctmn_14313 ) ) ;
NR3D0BWP30P140HVT ctmi_16115 ( .A1 ( ctmn_14312 ) , .A2 ( ctmn_14315 ) , 
    .A3 ( operand_A_reg[2] ) , .ZN ( ctmn_14316 ) ) ;
ND3D0BWP30P140HVT ctmTdsLR_1_4704 ( .A1 ( ctmn_14581 ) , .A2 ( ctmn_14599 ) , 
    .A3 ( ctmn_14576 ) , .ZN ( tmp_net3359_CDR1 ) ) ;
OR2D1BWP30P140HVT ctmi_2252 ( .A1 ( ctmn_13701 ) , .A2 ( ctmn_13619 ) , 
    .Z ( phfnn_1320 ) ) ;
ND4D0BWP30P140HVT ctmTdsLR_2_4705 ( .A1 ( ctmn_14570 ) , .A2 ( ctmn_14573 ) , 
    .A3 ( ctmn_14578 ) , .A4 ( ctmn_14572 ) , .ZN ( tmp_net3360_CDR1 ) ) ;
TIELBWP30P140HVT optlc_5692 ( .ZN ( optlc_net_4016 ) ) ;
ND4D0BWP30P140HVT ctmTdsLR_3_4706 ( .A1 ( ctmn_14598 ) , .A2 ( ctmn_14591 ) , 
    .A3 ( ctmn_14512 ) , .A4 ( ctmn_14569 ) , .ZN ( tmp_net3361_CDR1 ) ) ;
ND2D0BWP30P140HVT ctmi_16093 ( .A1 ( operand_B_reg[28] ) , 
    .A2 ( ctmn_14281 ) , .ZN ( ctmn_14294 ) ) ;
ND2D0BWP30P140HVT ctmi_15644 ( .A1 ( operand_B_reg[9] ) , .A2 ( ctmn_14008 ) , 
    .ZN ( ctmn_14009 ) ) ;
NR2D0BWP30P140HVT ctmi_15645 ( .A1 ( ctmn_14007 ) , .A2 ( \config_out[3] ) , 
    .ZN ( ctmn_14008 ) ) ;
ND2D0BWP30P140HVT ctmi_15646 ( .A1 ( operand_A_reg[11] ) , .A2 ( HFSNET_28 ) , 
    .ZN ( ctmn_14007 ) ) ;
ND3D0BWP30P140HVT ctmi_15647 ( .A1 ( ctmn_14010 ) , .A2 ( phfnn_3723 ) , 
    .A3 ( ctmn_14012 ) , .ZN ( ctmn_14013 ) ) ;
NR2D0BWP30P140HVT ctmi_15648 ( .A1 ( ctmn_13790 ) , .A2 ( HFSNET_15 ) , 
    .ZN ( ctmn_14010 ) ) ;
ND3D0BWP30P140HVT ctmi_15649 ( .A1 ( operand_B_reg[11] ) , 
    .A2 ( ctmn_14011 ) , .A3 ( phfnn_3723 ) , .ZN ( ctmn_14012 ) ) ;
MAOI222D0BWP30P140HVT ctmi_16094 ( .A ( phfnn_3790 ) , .B ( N11914 ) , 
    .C ( ctmn_14302 ) , .ZN ( ctmn_14303 ) ) ;
XNR2UD0BWP30P140HVT ctmi_16095 ( .A1 ( ctmn_14272 ) , .A2 ( ctmn_14297 ) , 
    .ZN ( ctmn_14298 ) ) ;
AOI21D0BWP30P140HVT ctmi_16096 ( .A1 ( ctmn_14274 ) , .A2 ( ctmn_13943 ) , 
    .B ( ctmn_14296 ) , .ZN ( ctmn_14297 ) ) ;
NR2D0BWP30P140HVT ctmi_16097 ( .A1 ( ctmn_14274 ) , .A2 ( ctmn_13943 ) , 
    .ZN ( ctmn_14296 ) ) ;
NR3D0BWP30P140HVT ctmTdsLR_4_4707 ( .A1 ( tmp_net3359_CDR1 ) , 
    .A2 ( tmp_net3360_CDR1 ) , .A3 ( tmp_net3361_CDR1 ) , 
    .ZN ( tmp_net3362_CDR1 ) ) ;
MUX2ND0BWP30P140HVT ctmi_16099 ( .I0 ( ctmn_14292 ) , .I1 ( phfnn_3773 ) , 
    .S ( ctmn_14301 ) , .ZN ( ctmn_14302 ) ) ;
AOI21D0BWP30P140HVT ctmi_16100 ( .A1 ( ctmn_14294 ) , .A2 ( N11903 ) , 
    .B ( ctmn_14300 ) , .ZN ( ctmn_14301 ) ) ;
NR2D0BWP30P140HVT ctmi_16101 ( .A1 ( ctmn_14294 ) , .A2 ( N11903 ) , 
    .ZN ( ctmn_14300 ) ) ;
XOR2UD0BWP30P140HVT ctmi_16102 ( .A1 ( ctmn_14307 ) , .A2 ( N190 ) , 
    .Z ( ctmn_14308 ) ) ;
IND2D1BWP30P140HVT ctmi_634 ( .A1 ( ctmn_14335 ) , .B1 ( ctmn_14508 ) , 
    .ZN ( ctmn_14513 ) ) ;
OAI21D0BWP30P140HVT ctmi_16104 ( .A1 ( ctmn_13906 ) , .A2 ( phfnn_3743 ) , 
    .B ( ctmn_14277 ) , .ZN ( ctmn_14305 ) ) ;
NR2D0BWP30P140HVT ctmi_16105 ( .A1 ( ctmn_13505 ) , .A2 ( phfnn_3758 ) , 
    .ZN ( ctmn_14307 ) ) ;
MAOI222D0BWP30P140HVT ctmi_16106 ( .A ( ctmn_14290 ) , .B ( ctmn_14275 ) , 
    .C ( ctmn_14280 ) , .ZN ( ctmn_14309 ) ) ;
MUX2ND0BWP30P140HVT ctmi_16107 ( .I0 ( phfnn_3757 ) , .I1 ( ctmn_14278 ) , 
    .S ( ctmn_14310 ) , .ZN ( ctmn_14311 ) ) ;
MAOI222D0BWP30P140HVT ctmi_16108 ( .A ( ctmn_14283 ) , .B ( ctmn_14287 ) , 
    .C ( ctmn_14285 ) , .ZN ( ctmn_14310 ) ) ;
AO22D0BWP30P140HVT ctmi_2902 ( .A1 ( HFSNET_0 ) , .A2 ( phfnn_2014 ) , 
    .B1 ( ctmn_14827 ) , .B2 ( phfnn_2590 ) , .Z ( ctmn_15009 ) ) ;
OAI211D0BWP30P140HVT ctmi_16117 ( .A1 ( ctmn_13374 ) , .A2 ( ctmn_14317 ) , 
    .B ( ctmn_14320 ) , .C ( ctmn_14324 ) , .ZN ( ctmn_14325 ) ) ;
ND3D0BWP30P140HVT ctmi_16118 ( .A1 ( operand_A_reg[2] ) , 
    .A2 ( operand_A_reg[0] ) , .A3 ( ctmn_14315 ) , .ZN ( ctmn_14317 ) ) ;
AOI22D0BWP30P140HVT ctmi_16119 ( .A1 ( ctmn_14318 ) , 
    .A2 ( accumulator[53] ) , .B1 ( ctmn_14319 ) , .B2 ( accumulator[37] ) , 
    .ZN ( ctmn_14320 ) ) ;
NR2D0BWP30P140HVT ctmi_16120 ( .A1 ( ctmn_14313 ) , .A2 ( operand_A_reg[0] ) , 
    .ZN ( ctmn_14318 ) ) ;
AN3D0BWP30P140HVT ctmi_16121 ( .A1 ( ctmn_14312 ) , .A2 ( ctmn_14315 ) , 
    .A3 ( operand_A_reg[2] ) , .Z ( ctmn_14319 ) ) ;
AOI222D0BWP30P140HVT ctmi_16122 ( .A1 ( ctmn_14321 ) , 
    .A2 ( accumulator[21] ) , .B1 ( ctmn_14322 ) , .B2 ( accumulator[13] ) , 
    .C1 ( ctmn_14323 ) , .C2 ( accumulator[5] ) , .ZN ( ctmn_14324 ) ) ;
NR3D0BWP30P140HVT ctmi_16123 ( .A1 ( ctmn_14315 ) , .A2 ( operand_A_reg[2] ) , 
    .A3 ( operand_A_reg[0] ) , .ZN ( ctmn_14321 ) ) ;
NR3D0BWP30P140HVT ctmi_16124 ( .A1 ( ctmn_14312 ) , .A2 ( operand_A_reg[2] ) , 
    .A3 ( operand_A_reg[1] ) , .ZN ( ctmn_14322 ) ) ;
NR3D0BWP30P140HVT ctmi_16125 ( .A1 ( operand_A_reg[2] ) , 
    .A2 ( operand_A_reg[1] ) , .A3 ( operand_A_reg[0] ) , .ZN ( ctmn_14323 ) ) ;
AN4D0BWP30P140HVT ctmTdsLR_5_4708 ( .A1 ( ctmn_14588 ) , .A2 ( ctmn_14596 ) , 
    .A3 ( ctmn_14594 ) , .A4 ( ctmn_14601 ) , .Z ( tmp_net3363_CDR1 ) ) ;
ND3D0BWP30P140HVT ctmTdsLR_6_4709 ( .A1 ( tmp_net3362_CDR1 ) , 
    .A2 ( phfnn_3739 ) , .A3 ( tmp_net3363_CDR1 ) , .ZN ( ctmn_14663_CDR5 ) ) ;
AOI221D0BWP30P140HVT ctmi_16128 ( .A1 ( act_fn_sel[2] ) , .A2 ( ctmn_14759 ) , 
    .B1 ( phfnn_1420 ) , .B2 ( ctmn_14760 ) , .C ( ctmn_14761 ) , 
    .ZN ( ctmn_14762 ) ) ;
OAI22D0BWP30P140HVT ctmi_16129 ( .A1 ( ctmn_14728 ) , .A2 ( phfnn_3859 ) , 
    .B1 ( phfnn_3830 ) , .B2 ( ctmn_14758 ) , .ZN ( ctmn_14759 ) ) ;
AOI221D0BWP30P140HVT ctmi_16130 ( .A1 ( phfnn_2590 ) , .A2 ( N191 ) , 
    .B1 ( ctmn_14720 ) , .B2 ( ctmn_14723 ) , .C ( ctmn_14727 ) , 
    .ZN ( ctmn_14728 ) ) ;
TIELBWP30P140HVT optlc_5693 ( .ZN ( optlc_net_4017 ) ) ;
AOI21D1BWP30P140HVT ctmi_16132 ( .A1 ( ctmn_14425 ) , .A2 ( ctmn_14677 ) , 
    .B ( phfnn_3837 ) , .ZN ( ctmn_14686 ) ) ;
AOI21D0BWP30P140HVT ctmi_16133 ( .A1 ( ctmn_14406 ) , .A2 ( ctmn_14423 ) , 
    .B ( ctmn_14424 ) , .ZN ( ctmn_14425 ) ) ;
CKMUX2D0BWP30P140HVT ctmi_16134 ( .I0 ( ctmn_14372 ) , .I1 ( ctmn_14405 ) , 
    .S ( \u_ppu/u_requantizer/shamt [2] ) , .Z ( ctmn_14406 ) ) ;
OAI22D0BWP30P140HVT ctmi_16135 ( .A1 ( ctmn_14329 ) , .A2 ( ctmn_14356 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [1] ) , .B2 ( ctmn_14371 ) , 
    .ZN ( ctmn_14372 ) ) ;
OR2D0BWP30P140HVT ctmi_2255 ( .A1 ( ctmn_13804 ) , .A2 ( ctmn_13564 ) , 
    .Z ( phfnn_1319 ) ) ;
OAI22D0BWP30P140HVT ctmi_16137 ( .A1 ( HFSNET_11 ) , .A2 ( ctmn_14348 ) , 
    .B1 ( HFSNET_12 ) , .B2 ( ctmn_14355 ) , .ZN ( ctmn_14356 ) ) ;
NR2D0BWP30P140HVT ctmi_4853 ( .A1 ( phfnn_3853 ) , .A2 ( ctmn_14795 ) , 
    .ZN ( phfnn_3252 ) ) ;
AOI221D0BWP30P140HVT ctmi_16139 ( .A1 ( \u_ppu/u_requantizer/shamt [5] ) , 
    .A2 ( phfnn_3682 ) , .B1 ( ctmn_14341 ) , .B2 ( ctmn_14342 ) , 
    .C ( ctmn_14347 ) , .ZN ( ctmn_14348 ) ) ;
MAOI22D0BWP30P140HVT ctmi_16140 ( .A1 ( ctmn_14332 ) , .A2 ( ctmn_14334 ) , 
    .B1 ( phfnn_3666 ) , .B2 ( ctmn_14338 ) , .ZN ( ctmn_14339 ) ) ;
OAI22D0BWP30P140HVT ctmi_16141 ( .A1 ( ctmn_14331 ) , .A2 ( ctmn_13376 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [3] ) , .B2 ( ctmn_13384 ) , 
    .ZN ( ctmn_14332 ) ) ;
TIELBWP30P140HVT optlc_5694 ( .ZN ( optlc_net_4018 ) ) ;
NR2D0BWP30P140HVT ctmi_16143 ( .A1 ( ctmn_14333 ) , 
    .A2 ( \u_ppu/u_requantizer/shamt [4] ) , .ZN ( ctmn_14334 ) ) ;
IND2D1BWP30P140HVT ctmi_16144 ( .A1 ( ctmn_13325 ) , .B1 ( ctmn_13321 ) , 
    .ZN ( ctmn_14333 ) ) ;
NR2D0BWP30P140HVT ctmi_16145 ( .A1 ( ctmn_14335 ) , .A2 ( ctmn_14333 ) , 
    .ZN ( ctmn_14336 ) ) ;
TIELBWP30P140HVT optlc_5695 ( .ZN ( optlc_net_4019 ) ) ;
OR2D1BWP30P140HVT ctmi_1508 ( .A1 ( ctmn_13431 ) , .A2 ( HFSNET_18 ) , 
    .Z ( phfnn_675 ) ) ;
OAI22D0BWP30P140HVT ctmi_16148 ( .A1 ( HFSNET_2 ) , .A2 ( accumulator[59] ) , 
    .B1 ( HFSNET_3 ) , .B2 ( accumulator[51] ) , .ZN ( ctmn_14338 ) ) ;
NR2D0BWP30P140HVT ctmi_1509 ( .A1 ( phfnn_675 ) , .A2 ( phfnn_3726 ) , 
    .ZN ( ctmn_13476 ) ) ;
NR2D1BWP30P140HVT ctmi_16150 ( .A1 ( ctmn_14335 ) , 
    .A2 ( \u_ppu/u_requantizer/shamt [5] ) , .ZN ( ctmn_14341 ) ) ;
AOI221D0BWP30P140HVT ctmi_16151 ( .A1 ( ctmn_14331 ) , .A2 ( ctmn_13344 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [3] ) , .B2 ( ctmn_13336 ) , 
    .C ( ctmn_14333 ) , .ZN ( ctmn_14342 ) ) ;
OAI22D0BWP30P140HVT ctmi_16152 ( .A1 ( ctmn_13352 ) , .A2 ( ctmn_14345 ) , 
    .B1 ( ctmn_13360 ) , .B2 ( ctmn_14346 ) , .ZN ( ctmn_14347 ) ) ;
ND3D0BWP30P140HVT ctmi_16153 ( .A1 ( \u_ppu/u_requantizer/shamt [3] ) , 
    .A2 ( phfnn_3662 ) , .A3 ( ctmn_14344 ) , .ZN ( ctmn_14345 ) ) ;
OAI32D0BWP30P140HVT ctmi_2905 ( .A1 ( phfnn_878 ) , .A2 ( phfnn_2014 ) , 
    .A3 ( ctmn_14793 ) , .B1 ( phfnn_878 ) , .B2 ( ctmn_14879 ) , 
    .ZN ( ctmn_2080 ) ) ;
NR2D0BWP30P140HVT ctmi_16155 ( .A1 ( \u_ppu/u_requantizer/shamt [5] ) , 
    .A2 ( \u_ppu/u_requantizer/shamt [4] ) , .ZN ( ctmn_14344 ) ) ;
ND3D0BWP30P140HVT ctmi_16156 ( .A1 ( ctmn_14344 ) , .A2 ( phfnn_3662 ) , 
    .A3 ( ctmn_14331 ) , .ZN ( ctmn_14346 ) ) ;
AOI221D0BWP30P140HVT ctmi_16157 ( .A1 ( \u_ppu/u_requantizer/shamt [5] ) , 
    .A2 ( ctmn_14352 ) , .B1 ( ctmn_14341 ) , .B2 ( ctmn_14353 ) , 
    .C ( ctmn_14354 ) , .ZN ( ctmn_14355 ) ) ;
OAI22D0BWP30P140HVT ctmi_16158 ( .A1 ( ctmn_14335 ) , .A2 ( ctmn_14349 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [4] ) , .B2 ( phfnn_3667 ) , 
    .ZN ( ctmn_14352 ) ) ;
OAI221D0BWP30P140HVT ctmi_16159 ( .A1 ( HFSNET_2 ) , .A2 ( accumulator[58] ) , 
    .B1 ( HFSNET_3 ) , .B2 ( accumulator[50] ) , .C ( phfnn_3662 ) , 
    .ZN ( ctmn_14349 ) ) ;
AOI221D0BWP30P140HVT ctmi_16160 ( .A1 ( HFSNET_2 ) , .A2 ( ctmn_13385 ) , 
    .B1 ( HFSNET_3 ) , .B2 ( ctmn_13377 ) , .C ( ctmn_14333 ) , 
    .ZN ( ctmn_14350 ) ) ;
OR3D1BWP30P140HVT ctmi_1511 ( .A1 ( HFSNET_15 ) , .A2 ( ctmn_14680 ) , 
    .A3 ( ctmn_14681 ) , .Z ( phfnn_843 ) ) ;
AOI221D0BWP30P140HVT ctmi_16162 ( .A1 ( ctmn_14331 ) , .A2 ( ctmn_13345 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [3] ) , .B2 ( ctmn_13337 ) , 
    .C ( ctmn_14333 ) , .ZN ( ctmn_14353 ) ) ;
OAI22D0BWP30P140HVT ctmi_16163 ( .A1 ( ctmn_13353 ) , .A2 ( ctmn_14345 ) , 
    .B1 ( ctmn_13361 ) , .B2 ( ctmn_14346 ) , .ZN ( ctmn_14354 ) ) ;
OAI22D0BWP30P140HVT ctmi_16164 ( .A1 ( HFSNET_11 ) , .A2 ( ctmn_14363 ) , 
    .B1 ( HFSNET_12 ) , .B2 ( ctmn_14370 ) , .ZN ( ctmn_14371 ) ) ;
AOI221D0BWP30P140HVT ctmi_16165 ( .A1 ( \u_ppu/u_requantizer/shamt [5] ) , 
    .A2 ( ctmn_14360 ) , .B1 ( ctmn_14341 ) , .B2 ( ctmn_14361 ) , 
    .C ( ctmn_14362 ) , .ZN ( ctmn_14363 ) ) ;
OAI22D0BWP30P140HVT ctmi_16166 ( .A1 ( ctmn_14335 ) , .A2 ( ctmn_14357 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [4] ) , .B2 ( phfnn_3668 ) , 
    .ZN ( ctmn_14360 ) ) ;
OAI221D0BWP30P140HVT ctmi_16167 ( .A1 ( HFSNET_2 ) , .A2 ( accumulator[57] ) , 
    .B1 ( HFSNET_3 ) , .B2 ( accumulator[49] ) , .C ( phfnn_3662 ) , 
    .ZN ( ctmn_14357 ) ) ;
AOI221D0BWP30P140HVT ctmi_16168 ( .A1 ( HFSNET_2 ) , .A2 ( ctmn_13386 ) , 
    .B1 ( HFSNET_3 ) , .B2 ( ctmn_13378 ) , .C ( ctmn_14333 ) , 
    .ZN ( ctmn_14358 ) ) ;
TIELBWP30P140HVT optlc_5696 ( .ZN ( optlc_net_4020 ) ) ;
AOI221D0BWP30P140HVT ctmi_16170 ( .A1 ( ctmn_14331 ) , .A2 ( ctmn_13346 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [3] ) , .B2 ( ctmn_13338 ) , 
    .C ( ctmn_14333 ) , .ZN ( ctmn_14361 ) ) ;
OAI22D0BWP30P140HVT ctmi_16171 ( .A1 ( ctmn_13354 ) , .A2 ( ctmn_14345 ) , 
    .B1 ( ctmn_13362 ) , .B2 ( ctmn_14346 ) , .ZN ( ctmn_14362 ) ) ;
AOI221D0BWP30P140HVT ctmi_16172 ( .A1 ( \u_ppu/u_requantizer/shamt [5] ) , 
    .A2 ( ctmn_14367 ) , .B1 ( ctmn_14341 ) , .B2 ( ctmn_14368 ) , 
    .C ( ctmn_14369 ) , .ZN ( ctmn_14370 ) ) ;
OAI22D0BWP30P140HVT ctmi_16173 ( .A1 ( ctmn_14335 ) , .A2 ( ctmn_14364 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [4] ) , .B2 ( phfnn_3669 ) , 
    .ZN ( ctmn_14367 ) ) ;
OAI221D0BWP30P140HVT ctmi_16174 ( .A1 ( HFSNET_2 ) , .A2 ( accumulator[56] ) , 
    .B1 ( HFSNET_3 ) , .B2 ( accumulator[48] ) , .C ( phfnn_3662 ) , 
    .ZN ( ctmn_14364 ) ) ;
AOI221D0BWP30P140HVT ctmi_16175 ( .A1 ( HFSNET_2 ) , .A2 ( ctmn_13387 ) , 
    .B1 ( HFSNET_3 ) , .B2 ( ctmn_13379 ) , .C ( ctmn_14333 ) , 
    .ZN ( ctmn_14365 ) ) ;
AN2D0BWP30P140HVT ctmi_3904 ( .A1 ( phfnn_2542 ) , .A2 ( phfnn_3852 ) , 
    .Z ( ctmn_14767 ) ) ;
AOI221D0BWP30P140HVT ctmi_16177 ( .A1 ( ctmn_14331 ) , .A2 ( ctmn_13347 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [3] ) , .B2 ( ctmn_13339 ) , 
    .C ( ctmn_14333 ) , .ZN ( ctmn_14368 ) ) ;
OAI22D0BWP30P140HVT ctmi_16178 ( .A1 ( ctmn_13355 ) , .A2 ( ctmn_14345 ) , 
    .B1 ( ctmn_13363 ) , .B2 ( ctmn_14346 ) , .ZN ( ctmn_14369 ) ) ;
OAI22D0BWP30P140HVT ctmi_16179 ( .A1 ( ctmn_14329 ) , .A2 ( ctmn_14389 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [1] ) , .B2 ( ctmn_14404 ) , 
    .ZN ( ctmn_14405 ) ) ;
OAI22D0BWP30P140HVT ctmi_16180 ( .A1 ( HFSNET_11 ) , .A2 ( ctmn_14381 ) , 
    .B1 ( HFSNET_12 ) , .B2 ( ctmn_14388 ) , .ZN ( ctmn_14389 ) ) ;
AOI221D0BWP30P140HVT ctmi_16181 ( .A1 ( \u_ppu/u_requantizer/shamt [5] ) , 
    .A2 ( ctmn_14378 ) , .B1 ( ctmn_14341 ) , .B2 ( ctmn_14379 ) , 
    .C ( ctmn_14380 ) , .ZN ( ctmn_14381 ) ) ;
OAI22D0BWP30P140HVT ctmi_16182 ( .A1 ( ctmn_14335 ) , .A2 ( ctmn_14375 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [4] ) , .B2 ( phfnn_3670 ) , 
    .ZN ( ctmn_14378 ) ) ;
OAI21D0BWP30P140HVT ctmi_16183 ( .A1 ( accumulator[55] ) , .A2 ( HFSNET_3 ) , 
    .B ( phfnn_3677 ) , .ZN ( ctmn_14375 ) ) ;
OAI21D0BWP30P140HVT ctmi_16184 ( .A1 ( accumulator[63] ) , .A2 ( HFSNET_2 ) , 
    .B ( phfnn_3662 ) , .ZN ( ctmn_14373 ) ) ;
ND2D0BWP30P140HVT ctmi_1514 ( .A1 ( phfnn_1416 ) , .A2 ( phfnn_1420 ) , 
    .ZN ( phfnn_867 ) ) ;
AOI221D0BWP30P140HVT ctmi_16186 ( .A1 ( HFSNET_2 ) , .A2 ( ctmn_13380 ) , 
    .B1 ( HFSNET_3 ) , .B2 ( ctmn_13372 ) , .C ( ctmn_14333 ) , 
    .ZN ( ctmn_14376 ) ) ;
NR2D0BWP30P140HVT ctmi_3905 ( .A1 ( ctmn_14697 ) , .A2 ( phfnn_3831 ) , 
    .ZN ( phfnn_2542 ) ) ;
AOI221D0BWP30P140HVT ctmi_16188 ( .A1 ( ctmn_14331 ) , .A2 ( ctmn_13340 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [3] ) , .B2 ( ctmn_13332 ) , 
    .C ( ctmn_14333 ) , .ZN ( ctmn_14379 ) ) ;
OAI22D0BWP30P140HVT ctmi_16189 ( .A1 ( ctmn_13348 ) , .A2 ( ctmn_14345 ) , 
    .B1 ( ctmn_13356 ) , .B2 ( ctmn_14346 ) , .ZN ( ctmn_14380 ) ) ;
AOI221D0BWP30P140HVT ctmi_16190 ( .A1 ( \u_ppu/u_requantizer/shamt [5] ) , 
    .A2 ( phfnn_3683 ) , .B1 ( ctmn_14341 ) , .B2 ( ctmn_14386 ) , 
    .C ( ctmn_14387 ) , .ZN ( ctmn_14388 ) ) ;
MAOI22D0BWP30P140HVT ctmi_16191 ( .A1 ( ctmn_14334 ) , .A2 ( ctmn_14382 ) , 
    .B1 ( phfnn_3666 ) , .B2 ( ctmn_14383 ) , .ZN ( ctmn_14384 ) ) ;
OAI22D0BWP30P140HVT ctmi_16192 ( .A1 ( HFSNET_2 ) , .A2 ( ctmn_13373 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [3] ) , .B2 ( ctmn_13381 ) , 
    .ZN ( ctmn_14382 ) ) ;
OAI22D0BWP30P140HVT ctmi_16193 ( .A1 ( HFSNET_2 ) , .A2 ( accumulator[62] ) , 
    .B1 ( HFSNET_3 ) , .B2 ( accumulator[54] ) , .ZN ( ctmn_14383 ) ) ;
TIELBWP30P140HVT optlc_5697 ( .ZN ( optlc_net_4021 ) ) ;
AOI221D0BWP30P140HVT ctmi_16195 ( .A1 ( ctmn_14331 ) , .A2 ( ctmn_13341 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [3] ) , .B2 ( ctmn_13333 ) , 
    .C ( ctmn_14333 ) , .ZN ( ctmn_14386 ) ) ;
OAI22D0BWP30P140HVT ctmi_16196 ( .A1 ( ctmn_13349 ) , .A2 ( ctmn_14345 ) , 
    .B1 ( ctmn_13357 ) , .B2 ( ctmn_14346 ) , .ZN ( ctmn_14387 ) ) ;
OAI22D0BWP30P140HVT ctmi_16197 ( .A1 ( HFSNET_11 ) , .A2 ( ctmn_14396 ) , 
    .B1 ( HFSNET_12 ) , .B2 ( ctmn_14403 ) , .ZN ( ctmn_14404 ) ) ;
AOI221D0BWP30P140HVT ctmi_16198 ( .A1 ( \u_ppu/u_requantizer/shamt [5] ) , 
    .A2 ( phfnn_3684 ) , .B1 ( ctmn_14341 ) , .B2 ( ctmn_14394 ) , 
    .C ( ctmn_14395 ) , .ZN ( ctmn_14396 ) ) ;
MAOI22D0BWP30P140HVT ctmi_16199 ( .A1 ( ctmn_14390 ) , .A2 ( ctmn_14334 ) , 
    .B1 ( phfnn_3666 ) , .B2 ( ctmn_14391 ) , .ZN ( ctmn_14392 ) ) ;
OAI22D0BWP30P140HVT ctmi_16200 ( .A1 ( HFSNET_2 ) , .A2 ( ctmn_13374 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [3] ) , .B2 ( ctmn_13382 ) , 
    .ZN ( ctmn_14390 ) ) ;
OAI22D0BWP30P140HVT ctmi_16201 ( .A1 ( HFSNET_2 ) , .A2 ( accumulator[61] ) , 
    .B1 ( HFSNET_3 ) , .B2 ( accumulator[53] ) , .ZN ( ctmn_14391 ) ) ;
ND2D0BWP30P140HVT ctmi_4857 ( .A1 ( phfnn_3847 ) , .A2 ( ctmn_14707 ) , 
    .ZN ( phfnn_3220 ) ) ;
AOI221D0BWP30P140HVT ctmi_16203 ( .A1 ( ctmn_14331 ) , .A2 ( ctmn_13342 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [3] ) , .B2 ( ctmn_13334 ) , 
    .C ( ctmn_14333 ) , .ZN ( ctmn_14394 ) ) ;
OAI22D0BWP30P140HVT ctmi_16204 ( .A1 ( ctmn_13350 ) , .A2 ( ctmn_14345 ) , 
    .B1 ( ctmn_13358 ) , .B2 ( ctmn_14346 ) , .ZN ( ctmn_14395 ) ) ;
AOI221D0BWP30P140HVT ctmi_16205 ( .A1 ( \u_ppu/u_requantizer/shamt [5] ) , 
    .A2 ( phfnn_3673 ) , .B1 ( ctmn_14341 ) , .B2 ( ctmn_14401 ) , 
    .C ( ctmn_14402 ) , .ZN ( ctmn_14403 ) ) ;
AOI22D0BWP30P140HVT ctmi_16206 ( .A1 ( ctmn_14336 ) , .A2 ( ctmn_14397 ) , 
    .B1 ( ctmn_14334 ) , .B2 ( ctmn_14398 ) , .ZN ( ctmn_14399 ) ) ;
OAI22D0BWP30P140HVT ctmi_16207 ( .A1 ( HFSNET_2 ) , .A2 ( ctmn_13365 ) , 
    .B1 ( HFSNET_3 ) , .B2 ( ctmn_13368 ) , .ZN ( ctmn_14397 ) ) ;
OAI22D0BWP30P140HVT ctmi_16208 ( .A1 ( HFSNET_2 ) , .A2 ( ctmn_13375 ) , 
    .B1 ( HFSNET_3 ) , .B2 ( ctmn_13383 ) , .ZN ( ctmn_14398 ) ) ;
ND2D0BWP30P140HVT ctmi_2907 ( .A1 ( ctmn_14848 ) , .A2 ( phfnn_3243 ) , 
    .ZN ( phfnn_2030 ) ) ;
AOI221D0BWP30P140HVT ctmi_16210 ( .A1 ( ctmn_14331 ) , .A2 ( ctmn_13343 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [3] ) , .B2 ( ctmn_13335 ) , 
    .C ( ctmn_14333 ) , .ZN ( ctmn_14401 ) ) ;
OAI22D0BWP30P140HVT ctmi_16211 ( .A1 ( ctmn_13351 ) , .A2 ( ctmn_14345 ) , 
    .B1 ( ctmn_13359 ) , .B2 ( ctmn_14346 ) , .ZN ( ctmn_14402 ) ) ;
OA21D0BWP30P140HVT ctmi_16212 ( .A1 ( ctmn_14407 ) , .A2 ( ctmn_14410 ) , 
    .B ( ctmn_14422 ) , .Z ( ctmn_14423 ) ) ;
MOAI22D0BWP30P140HVT ctmi_2908 ( .A1 ( phfnn_3838 ) , .A2 ( ctmn_14899 ) , 
    .B1 ( phfnn_886 ) , .B2 ( phfnn_2014 ) , .ZN ( ctmn_14900_CDR1 ) ) ;
OAI22D0BWP30P140HVT ctmi_16214 ( .A1 ( ctmn_14329 ) , .A2 ( ctmn_14408 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [1] ) , .B2 ( ctmn_14409 ) , 
    .ZN ( ctmn_14410 ) ) ;
OAI22D0BWP30P140HVT ctmi_16215 ( .A1 ( HFSNET_11 ) , .A2 ( ctmn_14388 ) , 
    .B1 ( HFSNET_12 ) , .B2 ( ctmn_14396 ) , .ZN ( ctmn_14408 ) ) ;
OAI22D0BWP30P140HVT ctmi_16216 ( .A1 ( HFSNET_11 ) , .A2 ( ctmn_14403 ) , 
    .B1 ( HFSNET_12 ) , .B2 ( ctmn_14348 ) , .ZN ( ctmn_14409 ) ) ;
AOI22D0BWP30P140HVT ctmi_16217 ( .A1 ( ctmn_14411 ) , .A2 ( ctmn_14412 ) , 
    .B1 ( ctmn_14413 ) , .B2 ( ctmn_14421 ) , .ZN ( ctmn_14422 ) ) ;
NR2D0BWP30P140HVT ctmi_16218 ( .A1 ( ctmn_14329 ) , 
    .A2 ( \u_ppu/u_requantizer/shamt [2] ) , .ZN ( ctmn_14411 ) ) ;
OAI22D0BWP30P140HVT ctmi_16219 ( .A1 ( HFSNET_11 ) , .A2 ( ctmn_14355 ) , 
    .B1 ( HFSNET_12 ) , .B2 ( ctmn_14363 ) , .ZN ( ctmn_14412 ) ) ;
NR2D0BWP30P140HVT ctmi_16220 ( .A1 ( \u_ppu/u_requantizer/shamt [1] ) , 
    .A2 ( \u_ppu/u_requantizer/shamt [2] ) , .ZN ( ctmn_14413 ) ) ;
AOI21D0BWP30P140HVT ctmi_16221 ( .A1 ( HFSNET_12 ) , .A2 ( ctmn_14370 ) , 
    .B ( ctmn_14420 ) , .ZN ( ctmn_14421 ) ) ;
AOI211D0BWP30P140HVT ctmi_16222 ( .A1 ( ctmn_14414 ) , .A2 ( ctmn_14341 ) , 
    .B ( ctmn_14419 ) , .C ( HFSNET_12 ) , .ZN ( ctmn_14420 ) ) ;
AOI221D0BWP30P140HVT ctmi_16223 ( .A1 ( ctmn_14331 ) , .A2 ( ctmn_13348 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [3] ) , .B2 ( ctmn_13340 ) , 
    .C ( ctmn_14333 ) , .ZN ( ctmn_14414 ) ) ;
OAI22D0BWP30P140HVT ctmi_16224 ( .A1 ( ctmn_13356 ) , .A2 ( ctmn_14345 ) , 
    .B1 ( ctmn_14415 ) , .B2 ( ctmn_14418 ) , .ZN ( ctmn_14419 ) ) ;
ND2D0BWP30P140HVT ctmi_1520 ( .A1 ( phfnn_3692 ) , .A2 ( phfnn_3723 ) , 
    .ZN ( ctmn_13563 ) ) ;
AN2D0BWP30P140HVT ctmi_3908 ( .A1 ( phfnn_2542 ) , .A2 ( phfnn_2563 ) , 
    .Z ( ctmn_14745 ) ) ;
AOI22D0BWP30P140HVT ctmi_1522 ( .A1 ( phfnn_3707 ) , .A2 ( phfnn_3733 ) , 
    .B1 ( phfnn_2415 ) , .B2 ( ctmn_13566 ) , .ZN ( phfnn_755 ) ) ;
AN2D0BWP30P140HVT ctmi_1523 ( .A1 ( ctmn_13554 ) , .A2 ( phfnn_2415 ) , 
    .Z ( ctmn_13583 ) ) ;
ND2D0BWP30P140HVT ctmi_1524 ( .A1 ( phfnn_3707 ) , .A2 ( phfnn_3731 ) , 
    .ZN ( ctmn_13584 ) ) ;
AOI22D0BWP30P140HVT ctmi_15185 ( .A1 ( ctmn_13675 ) , .A2 ( phfnn_3709 ) , 
    .B1 ( phfnn_3713 ) , .B2 ( phfnn_3685 ) , .ZN ( ctmn_13706 ) ) ;
TIEHBWP30P140HVT optlc_5698 ( .Z ( optlc_net_4022 ) ) ;
AO21D0BWP30P140HVT ctmTdsLR_1_3823 ( .A1 ( N73 ) , .A2 ( phfnn_648 ) , 
    .B ( \RS_OP_250_54632_65499_J1/ctmn_156 ) , .Z ( N312 ) ) ;
NR2D0BWP30P140HVT ctmi_4859 ( .A1 ( phfnn_3875 ) , .A2 ( phfnn_3252 ) , 
    .ZN ( ctmn_15030 ) ) ;
XOR2UD0BWP30P140HVT ctmi_15201 ( .A1 ( ctmn_13712 ) , .A2 ( ctmn_13715 ) , 
    .Z ( ctmn_13716 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15238 ( .A ( ctmn_13739 ) , .B ( ctmn_13740 ) , 
    .C ( ctmn_13741 ) , .ZN ( ctmn_13742 ) ) ;
ND2D0BWP30P140HVT ctmi_15239 ( .A1 ( ctmn_13730 ) , .A2 ( phfnn_3709 ) , 
    .ZN ( ctmn_13739 ) ) ;
ND2D0BWP30P140HVT ctmi_15323 ( .A1 ( ctmn_13789 ) , .A2 ( phfnn_3710 ) , 
    .ZN ( ctmn_13808 ) ) ;
INR3D0BWP30P140HVT ctmTdsLR_1_3825 ( 
    .A1 ( \u_mac_and_scale/mult_2/mult01 [0] ) , .B1 ( ctmn_13450 ) , 
    .B2 ( phfnn_675 ) , .ZN ( N9370 ) ) ;
AOI21D0BWP30P140HVT ctmi_4860 ( .A1 ( phfnn_3220 ) , .A2 ( phfnn_3855 ) , 
    .B ( phfnn_3881 ) , .ZN ( ctmn_15035 ) ) ;
XOR2UD0BWP30P140HVT ctmi_15340 ( .A1 ( ctmn_13815 ) , .A2 ( ctmn_13818 ) , 
    .Z ( ctmn_13819 ) ) ;
OAI32D0BWP30P140HVT ctmi_15341 ( .A1 ( ctmn_13795 ) , .A2 ( ctmn_13794 ) , 
    .A3 ( phfnn_3699 ) , .B1 ( ctmn_13795 ) , .B2 ( ctmn_13814 ) , 
    .ZN ( ctmn_13815 ) ) ;
ND2D0BWP30P140HVT ctmi_15342 ( .A1 ( ctmn_13789 ) , .A2 ( phfnn_3718 ) , 
    .ZN ( ctmn_13814 ) ) ;
AOI21D0BWP30P140HVT ctmi_15343 ( .A1 ( ctmn_13816 ) , .A2 ( N11590 ) , 
    .B ( N192 ) , .ZN ( ctmn_13818 ) ) ;
IND2D1BWP30P140HVT ctmi_635 ( .A1 ( ctmn_14415 ) , .B1 ( ctmn_14508 ) , 
    .ZN ( ctmn_14536 ) ) ;
AO22D0BWP30P140HVT ctmi_4861 ( .A1 ( HFSNET_1 ) , .A2 ( phfnn_3852 ) , 
    .B1 ( phfnn_2563 ) , .B2 ( phfnn_3243 ) , .Z ( ctmn_14772 ) ) ;
ND2D0BWP30P140HVT ctmTdsLR_3_3829 ( .A1 ( tmp_net2742 ) , .A2 ( phfnn_2030 ) , 
    .ZN ( ctmn_15153 ) ) ;
AOI22D0BWP30P140HVT ctmi_15417 ( .A1 ( ctmn_13845 ) , .A2 ( phfnn_3711 ) , 
    .B1 ( phfnn_3715 ) , .B2 ( ctmn_13847 ) , .ZN ( ctmn_13867 ) ) ;
AOI222D0BWP30P140HVT ctmTdsLR_1_3830 ( .A1 ( ctmn_14808 ) , 
    .A2 ( ctmn_14767 ) , .B1 ( ctmn_14829 ) , .B2 ( phfnn_3875 ) , 
    .C1 ( phfnn_3873 ) , .C2 ( phfnn_1453 ) , .ZN ( tmp_net2743 ) ) ;
XNR4D0BWP30P140HVT ctmi_4862 ( .A1 ( ctmn_14224 ) , .A2 ( ctmn_14228 ) , 
    .A3 ( ctmn_14229 ) , .A4 ( ctmn_14231 ) , .ZN ( phfnn_3179 ) ) ;
XOR2UD0BWP30P140HVT ctmi_15433 ( .A1 ( ctmn_13873 ) , .A2 ( ctmn_13876 ) , 
    .Z ( ctmn_13877 ) ) ;
OAI32D0BWP30P140HVT ctmi_15434 ( .A1 ( ctmn_13851 ) , .A2 ( ctmn_13850 ) , 
    .A3 ( phfnn_3694 ) , .B1 ( ctmn_13851 ) , .B2 ( ctmn_13872 ) , 
    .ZN ( ctmn_13873 ) ) ;
ND2D0BWP30P140HVT ctmi_15435 ( .A1 ( ctmn_13845 ) , .A2 ( phfnn_3719 ) , 
    .ZN ( ctmn_13872 ) ) ;
ND2D0BWP30P140HVT ctmi_15508 ( .A1 ( ctmn_13902 ) , .A2 ( phfnn_3712 ) , 
    .ZN ( ctmn_13923 ) ) ;
AN2D0BWP30P140HVT ctmTdsLR_2_3831 ( .A1 ( tmp_net2743 ) , .A2 ( phfnn_2030 ) , 
    .Z ( ctmn_14940 ) ) ;
XOR2UD0BWP30P140HVT ctmi_15524 ( .A1 ( ctmn_13929 ) , .A2 ( ctmn_13932 ) , 
    .Z ( ctmn_13933 ) ) ;
OAI32D0BWP30P140HVT ctmi_15525 ( .A1 ( ctmn_13908 ) , .A2 ( ctmn_13907 ) , 
    .A3 ( phfnn_3689 ) , .B1 ( ctmn_13908 ) , .B2 ( ctmn_13928 ) , 
    .ZN ( ctmn_13929 ) ) ;
ND2D0BWP30P140HVT ctmi_15526 ( .A1 ( ctmn_13902 ) , .A2 ( phfnn_3720 ) , 
    .ZN ( ctmn_13928 ) ) ;
AOI21D0BWP30P140HVT ctmi_15527 ( .A1 ( N932 ) , .A2 ( N11853 ) , .B ( N193 ) , 
    .ZN ( ctmn_13932 ) ) ;
AO21D0BWP30P140HVT ctmTdsLR_1_3850 ( .A1 ( N75 ) , .A2 ( phfnn_648 ) , 
    .B ( \RS_OP_250_54632_65499_J1/ctmn_156 ) , .Z ( N305 ) ) ;
AN4D0BWP30P140HVT ctmi_636 ( .A1 ( ctmn_14506 ) , .A2 ( ctmn_14559 ) , 
    .A3 ( ctmn_14556 ) , .A4 ( ctmn_14554 ) , .Z ( ctmn_14561_CDR2 ) ) ;
NR2D0BWP30P140HVT ctmi_1537 ( .A1 ( ctmn_13785 ) , .A2 ( HFSNET_18 ) , 
    .ZN ( phfnn_672 ) ) ;
NR2D0BWP30P140HVT ctmi_1538 ( .A1 ( ctmn_13898 ) , .A2 ( HFSNET_18 ) , 
    .ZN ( phfnn_671 ) ) ;
AOI22D0BWP30P140HVT ctmi_15586 ( .A1 ( operand_B_reg[2] ) , 
    .A2 ( phfnn_2418 ) , .B1 ( phfnn_3734 ) , .B2 ( operand_B_reg[3] ) , 
    .ZN ( ctmn_13969 ) ) ;
ND2D0BWP30P140HVT ctmi_15344 ( .A1 ( phfnn_3768 ) , .A2 ( ctmn_13805 ) , 
    .ZN ( ctmn_13816 ) ) ;
NR2D0BWP30P140HVT ctmi_15650 ( .A1 ( ctmn_13788 ) , .A2 ( ctmn_13556 ) , 
    .ZN ( ctmn_14011 ) ) ;
OAI21D0BWP30P140HVT ctmi_15651 ( .A1 ( phfnn_3793 ) , .A2 ( ctmn_14023 ) , 
    .B ( ctmn_14024 ) , .ZN ( ctmn_14025 ) ) ;
INR2D1BWP30P140HVT ctmi_1539 ( .A1 ( ctmn_13675 ) , .B1 ( ctmn_13670 ) , 
    .ZN ( N930 ) ) ;
OAI22D0BWP30P140HVT ctmi_16226 ( .A1 ( ctmn_14335 ) , .A2 ( ctmn_14416 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [4] ) , .B2 ( ctmn_14417 ) , 
    .ZN ( ctmn_14418 ) ) ;
XOR3UD0BWP30P140HVT ctmi_4864 ( .A1 ( phfnn_3179 ) , .A2 ( phfnn_827 ) , 
    .A3 ( \DP_OP_245_33587_65499_J1/N_63 ) , .Z ( N205 ) ) ;
IOA21D0BWP30P140HVT ctmi_637 ( .A1 ( ctmn_14397 ) , .A2 ( ctmn_14334 ) , 
    .B ( ctmn_14513 ) , .ZN ( ctmn_14614 ) ) ;
AOI21D0BWP30P140HVT ctmi_15436 ( .A1 ( ctmn_13874 ) , .A2 ( N11723 ) , 
    .B ( N195 ) , .ZN ( ctmn_13876 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15530 ( .A ( N11853 ) , .B ( ctmn_13929 ) , 
    .C ( N932 ) , .ZN ( ctmn_13935 ) ) ;
XNR4D0BWP30P140HVT ctmi_4865 ( .A1 ( ctmn_14304 ) , .A2 ( ctmn_14308 ) , 
    .A3 ( ctmn_14309 ) , .A4 ( ctmn_14311 ) , .ZN ( phfnn_3181 ) ) ;
OR2D1BWP30P140HVT ctmi_2267 ( .A1 ( HFSNET_25 ) , .A2 ( phfnn_1319 ) , 
    .Z ( \DP_OP_245_33587_65499_J1/ctmn_15276 ) ) ;
AOI211D0BWP30P140HVT ctmi_16599 ( .A1 ( phfnn_3887 ) , .A2 ( ctmn_14799 ) , 
    .B ( phfnn_3852 ) , .C ( ctmn_14803 ) , .ZN ( ctmn_14804 ) ) ;
NR2D0BWP30P140HVT ctmi_16600 ( .A1 ( phfnn_3873 ) , .A2 ( phfnn_3252 ) , 
    .ZN ( ctmn_14797 ) ) ;
NR2D0BWP30P140HVT ctmi_1543 ( .A1 ( phfnn_867 ) , .A2 ( phfnn_3839 ) , 
    .ZN ( phfnn_878 ) ) ;
NR2D0BWP30P140HVT ctmi_16602 ( .A1 ( ctmn_14693 ) , .A2 ( ctmn_14740 ) , 
    .ZN ( ctmn_14795 ) ) ;
NR2D0BWP30P140HVT ctmi_16687 ( .A1 ( phfnn_3839 ) , .A2 ( ctmn_14879 ) , 
    .ZN ( ctmn_14880 ) ) ;
NR2D0BWP30P140HVT ctmi_16688 ( .A1 ( HFSNET_1 ) , .A2 ( ctmn_14691 ) , 
    .ZN ( ctmn_14879 ) ) ;
ND4D0BWP30P140HVT ctmi_16689 ( .A1 ( ctmn_14884_CDR1 ) , 
    .A2 ( ctmn_14892_CDR1 ) , .A3 ( ctmn_14902_CDR1 ) , .A4 ( phfnn_2030 ) , 
    .ZN ( ctmn_14904 ) ) ;
AOI211D0BWP30P140HVT ctmi_16690 ( .A1 ( ctmn_14827 ) , .A2 ( phfnn_3884 ) , 
    .B ( ctmn_14809 ) , .C ( ctmn_14883 ) , .ZN ( ctmn_14884_CDR1 ) ) ;
NR2D0BWP30P140HVT ctmi_16691 ( .A1 ( phfnn_3858 ) , .A2 ( ctmn_14740 ) , 
    .ZN ( ctmn_14883 ) ) ;
AOI221D0BWP30P140HVT ctmi_16692 ( .A1 ( phfnn_3872 ) , .A2 ( phfnn_3882 ) , 
    .B1 ( phfnn_3883 ) , .B2 ( phfnn_878 ) , .C ( ctmn_14891_CDR1 ) , 
    .ZN ( ctmn_14892_CDR1 ) ) ;
ND2D0BWP30P140HVT ctmi_16693 ( .A1 ( ctmn_14721 ) , .A2 ( ctmn_14885 ) , 
    .ZN ( ctmn_14886 ) ) ;
XNR3UD0BWP30P140HVT ctmi_4867 ( .A1 ( phfnn_3181 ) , 
    .A2 ( \DP_OP_248_26668_65499_J1/N_4 ) , 
    .A3 ( \DP_OP_244_18871_65499_J1/N_63 ) , .ZN ( N72 ) ) ;
ND2D0BWP30P140HVT ctmi_3910 ( .A1 ( ctmn_14686 ) , .A2 ( ctmn_14693 ) , 
    .ZN ( phfnn_2590 ) ) ;
NR2D0BWP30P140HVT ctmi_16698 ( .A1 ( ctmn_14719 ) , .A2 ( ctmn_14889 ) , 
    .ZN ( ctmn_14890 ) ) ;
NR2D0BWP30P140HVT ctmi_16699 ( .A1 ( phfnn_3853 ) , .A2 ( phfnn_3854 ) , 
    .ZN ( ctmn_14889 ) ) ;
AOI211D0BWP30P140HVT ctmi_16700 ( .A1 ( ctmn_14795 ) , .A2 ( ctmn_14894 ) , 
    .B ( ctmn_14900_CDR1 ) , .C ( ctmn_14901 ) , .ZN ( ctmn_14902_CDR1 ) ) ;
OAI22D0BWP30P140HVT ctmi_16701 ( .A1 ( ctmn_14697 ) , .A2 ( phfnn_3874 ) , 
    .B1 ( phfnn_3850 ) , .B2 ( ctmn_14686 ) , .ZN ( ctmn_14894 ) ) ;
NR2D0BWP30P140HVT ctmi_1546 ( .A1 ( phfnn_3854 ) , .A2 ( HFSNET_0 ) , 
    .ZN ( phfnn_874 ) ) ;
AOI221D0BWP30P140HVT ctmi_16227 ( .A1 ( HFSNET_2 ) , .A2 ( ctmn_13372 ) , 
    .B1 ( HFSNET_3 ) , .B2 ( ctmn_13367 ) , .C ( ctmn_14333 ) , 
    .ZN ( ctmn_14416 ) ) ;
AOI221D0BWP30P140HVT ctmi_16228 ( .A1 ( ctmn_14331 ) , .A2 ( ctmn_13332 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [3] ) , .B2 ( ctmn_13380 ) , 
    .C ( ctmn_14333 ) , .ZN ( ctmn_14417 ) ) ;
NR2D0BWP30P140HVT ctmi_16229 ( .A1 ( ctmn_14406 ) , .A2 ( ctmn_14423 ) , 
    .ZN ( ctmn_14424 ) ) ;
AOI21D0BWP30P140HVT ctmi_16232 ( .A1 ( ctmn_14507 ) , .A2 ( ctmn_14671 ) , 
    .B ( ctmn_14508 ) , .ZN ( ctmn_14672 ) ) ;
AN2D0BWP30P140HVT ctmi_3912 ( .A1 ( phfnn_2563 ) , .A2 ( phfnn_3853 ) , 
    .Z ( ctmn_14873 ) ) ;
NR2D0BWP30P140HVT ctmi_1548 ( .A1 ( phfnn_3882 ) , .A2 ( phfnn_886 ) , 
    .ZN ( phfnn_903 ) ) ;
NR2D0BWP30P140HVT ctmi_1549 ( .A1 ( phfnn_3853 ) , .A2 ( phfnn_874 ) , 
    .ZN ( phfnn_886 ) ) ;
AN2D0BWP30P140HVT ctmi_3913 ( .A1 ( ctmn_14686 ) , .A2 ( phfnn_2563 ) , 
    .Z ( ctmn_14885 ) ) ;
NR2D0BWP30P140HVT ctmi_1551 ( .A1 ( ctmn_14707 ) , .A2 ( phfnn_3850 ) , 
    .ZN ( phfnn_899 ) ) ;
NR2D0BWP30P140HVT ctmi_1552 ( .A1 ( phfnn_3878 ) , .A2 ( phfnn_881 ) , 
    .ZN ( ctmn_15065 ) ) ;
ND2D0BWP30P140HVT ctmi_1553 ( .A1 ( phfnn_3852 ) , .A2 ( ctmn_14726 ) , 
    .ZN ( phfnn_881 ) ) ;
AOI22D0BWP30P140HVT ctmi_15660 ( .A1 ( operand_B_reg[10] ) , 
    .A2 ( phfnn_2415 ) , .B1 ( phfnn_3733 ) , .B2 ( operand_B_reg[11] ) , 
    .ZN ( ctmn_14023 ) ) ;
ND2D0BWP30P140HVT ctmi_15661 ( .A1 ( ctmn_14023 ) , .A2 ( phfnn_3793 ) , 
    .ZN ( ctmn_14024 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15662 ( .A ( ctmn_14039 ) , .B ( ctmn_14040 ) , 
    .C ( ctmn_14046 ) , .ZN ( ctmn_14047 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15663 ( .A ( ctmn_14031 ) , .B ( N11702 ) , 
    .C ( ctmn_14038 ) , .ZN ( ctmn_14039 ) ) ;
XOR2UD0BWP30P140HVT ctmi_15664 ( .A1 ( ctmn_13834 ) , .A2 ( ctmn_14030 ) , 
    .Z ( ctmn_14031 ) ) ;
AOI21D0BWP30P140HVT ctmi_15665 ( .A1 ( ctmn_14027 ) , .A2 ( ctmn_14028 ) , 
    .B ( ctmn_14029 ) , .ZN ( ctmn_14030 ) ) ;
ND2D0BWP30P140HVT ctmi_15666 ( .A1 ( ctmn_14010 ) , .A2 ( phfnn_3731 ) , 
    .ZN ( ctmn_14027 ) ) ;
NR2D0BWP30P140HVT ctmi_15667 ( .A1 ( ctmn_13785 ) , .A2 ( phfnn_3725 ) , 
    .ZN ( ctmn_14028 ) ) ;
NR2D0BWP30P140HVT ctmi_15668 ( .A1 ( ctmn_14027 ) , .A2 ( ctmn_14028 ) , 
    .ZN ( ctmn_14029 ) ) ;
MUX2ND0BWP30P140HVT ctmi_15669 ( .I0 ( ctmn_14033 ) , .I1 ( phfnn_3776 ) , 
    .S ( ctmn_14037 ) , .ZN ( ctmn_14038 ) ) ;
XNR2UD0BWP30P140HVT ctmi_16233 ( .A1 ( ctmn_14497 ) , .A2 ( ctmn_14506 ) , 
    .ZN ( ctmn_14507 ) ) ;
NR2D0BWP30P140HVT ctmi_16234 ( .A1 ( ctmn_14484 ) , .A2 ( ctmn_14496 ) , 
    .ZN ( ctmn_14497 ) ) ;
ND2D0BWP30P140HVT ctmi_16235 ( .A1 ( ctmn_14473 ) , .A2 ( ctmn_14483 ) , 
    .ZN ( ctmn_14484 ) ) ;
AO22D0BWP30P140HVT ctmi_1554 ( .A1 ( phfnn_899 ) , .A2 ( ctmn_14879 ) , 
    .B1 ( ctmn_14865 ) , .B2 ( ctmn_14693 ) , .Z ( ctmn_15090_CDR1 ) ) ;
OAI22D0BWP30P140HVT ctmi_16237 ( .A1 ( ctmn_14407 ) , .A2 ( ctmn_14456 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [2] ) , .B2 ( ctmn_14405 ) , 
    .ZN ( ctmn_14457 ) ) ;
OAI22D0BWP30P140HVT ctmi_16238 ( .A1 ( ctmn_14329 ) , .A2 ( ctmn_14441 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [1] ) , .B2 ( ctmn_14455 ) , 
    .ZN ( ctmn_14456 ) ) ;
OAI22D0BWP30P140HVT ctmi_16239 ( .A1 ( HFSNET_11 ) , .A2 ( ctmn_14431 ) , 
    .B1 ( HFSNET_12 ) , .B2 ( ctmn_14440 ) , .ZN ( ctmn_14441 ) ) ;
AOI221D0BWP30P140HVT ctmi_16240 ( .A1 ( \u_ppu/u_requantizer/shamt [5] ) , 
    .A2 ( ctmn_14428 ) , .B1 ( ctmn_14341 ) , .B2 ( ctmn_14429 ) , 
    .C ( ctmn_14430 ) , .ZN ( ctmn_14431 ) ) ;
OAI22D0BWP30P140HVT ctmi_16241 ( .A1 ( ctmn_14335 ) , .A2 ( ctmn_14426 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [4] ) , .B2 ( ctmn_14427 ) , 
    .ZN ( ctmn_14428 ) ) ;
OAI21D0BWP30P140HVT ctmi_16242 ( .A1 ( HFSNET_3 ) , .A2 ( accumulator[59] ) , 
    .B ( phfnn_3677 ) , .ZN ( ctmn_14426 ) ) ;
OAI221D0BWP30P140HVT ctmi_16243 ( .A1 ( HFSNET_2 ) , .A2 ( accumulator[51] ) , 
    .B1 ( HFSNET_3 ) , .B2 ( accumulator[43] ) , .C ( phfnn_3662 ) , 
    .ZN ( ctmn_14427 ) ) ;
AOI221D0BWP30P140HVT ctmi_16244 ( .A1 ( ctmn_14331 ) , .A2 ( ctmn_13336 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [3] ) , .B2 ( ctmn_13384 ) , 
    .C ( ctmn_14333 ) , .ZN ( ctmn_14429 ) ) ;
OAI22D0BWP30P140HVT ctmi_16245 ( .A1 ( ctmn_13344 ) , .A2 ( ctmn_14345 ) , 
    .B1 ( ctmn_13352 ) , .B2 ( ctmn_14346 ) , .ZN ( ctmn_14430 ) ) ;
OAI22D0BWP30P140HVT ctmi_16247 ( .A1 ( ctmn_14335 ) , .A2 ( phfnn_3704 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [4] ) , .B2 ( ctmn_14434 ) , 
    .ZN ( ctmn_14435 ) ) ;
OAI21D0BWP30P140HVT ctmi_16248 ( .A1 ( HFSNET_3 ) , .A2 ( accumulator[58] ) , 
    .B ( phfnn_3677 ) , .ZN ( ctmn_14432 ) ) ;
AOI221D0BWP30P140HVT ctmi_16250 ( .A1 ( HFSNET_2 ) , .A2 ( ctmn_13377 ) , 
    .B1 ( HFSNET_3 ) , .B2 ( ctmn_13369 ) , .C ( ctmn_14333 ) , 
    .ZN ( ctmn_14434 ) ) ;
AO21D0BWP30P140HVT ctmi_3915 ( .A1 ( ctmn_14726 ) , .A2 ( phfnn_2563 ) , 
    .B ( ctmn_14773 ) , .Z ( ctmn_15026 ) ) ;
AN2D0BWP30P140HVT ctmi_3916 ( .A1 ( phfnn_2563 ) , .A2 ( ctmn_14736 ) , 
    .Z ( ctmn_14827 ) ) ;
AOI221D0BWP30P140HVT ctmi_16253 ( .A1 ( HFSNET_2 ) , .A2 ( ctmn_13337 ) , 
    .B1 ( HFSNET_3 ) , .B2 ( ctmn_13385 ) , .C ( ctmn_14333 ) , 
    .ZN ( ctmn_14437 ) ) ;
AO211D0BWP30P140HVT ctmi_1557 ( .A1 ( ctmn_14693 ) , .A2 ( ctmn_14773 ) , 
    .B ( phfnn_3849 ) , .C ( phfnn_878 ) , .Z ( ctmn_15005 ) ) ;
OAI22D0BWP30P140HVT ctmi_16255 ( .A1 ( HFSNET_11 ) , .A2 ( ctmn_14448 ) , 
    .B1 ( HFSNET_12 ) , .B2 ( ctmn_14454 ) , .ZN ( ctmn_14455 ) ) ;
AOI221D0BWP30P140HVT ctmi_16256 ( .A1 ( \u_ppu/u_requantizer/shamt [5] ) , 
    .A2 ( ctmn_14445 ) , .B1 ( ctmn_14341 ) , .B2 ( ctmn_14446 ) , 
    .C ( ctmn_14447 ) , .ZN ( ctmn_14448 ) ) ;
OAI22D0BWP30P140HVT ctmi_16257 ( .A1 ( ctmn_14335 ) , .A2 ( ctmn_14442 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [4] ) , .B2 ( phfnn_3671 ) , 
    .ZN ( ctmn_14445 ) ) ;
OAI21D0BWP30P140HVT ctmi_16258 ( .A1 ( HFSNET_3 ) , .A2 ( accumulator[57] ) , 
    .B ( phfnn_3677 ) , .ZN ( ctmn_14442 ) ) ;
AOI221D0BWP30P140HVT ctmi_16259 ( .A1 ( HFSNET_2 ) , .A2 ( ctmn_13378 ) , 
    .B1 ( HFSNET_3 ) , .B2 ( ctmn_13370 ) , .C ( ctmn_14333 ) , 
    .ZN ( ctmn_14443 ) ) ;
ND2D0BWP30P140HVT ctmi_2922 ( .A1 ( ctmn_13956 ) , .A2 ( phfnn_3734 ) , 
    .ZN ( phfnn_1888 ) ) ;
AOI221D0BWP30P140HVT ctmi_16261 ( .A1 ( ctmn_14331 ) , .A2 ( ctmn_13338 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [3] ) , .B2 ( ctmn_13386 ) , 
    .C ( ctmn_14333 ) , .ZN ( ctmn_14446 ) ) ;
OAI22D0BWP30P140HVT ctmi_16262 ( .A1 ( ctmn_13346 ) , .A2 ( ctmn_14345 ) , 
    .B1 ( ctmn_13354 ) , .B2 ( ctmn_14346 ) , .ZN ( ctmn_14447 ) ) ;
MOAI22D0BWP30P140HVT ctmi_3917 ( .A1 ( ctmn_14922 ) , .A2 ( ctmn_14795 ) , 
    .B1 ( phfnn_903 ) , .B2 ( ctmn_14812 ) , .ZN ( ctmn_15088 ) ) ;
OAI22D0BWP30P140HVT ctmi_16264 ( .A1 ( ctmn_14335 ) , .A2 ( ctmn_14449 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [4] ) , .B2 ( ctmn_14450 ) , 
    .ZN ( ctmn_14451 ) ) ;
AOI21D0BWP30P140HVT ctmi_16265 ( .A1 ( HFSNET_2 ) , .A2 ( ctmn_13366 ) , 
    .B ( ctmn_14373 ) , .ZN ( ctmn_14449 ) ) ;
AOI221D0BWP30P140HVT ctmi_16266 ( .A1 ( HFSNET_2 ) , .A2 ( ctmn_13379 ) , 
    .B1 ( HFSNET_3 ) , .B2 ( ctmn_13371 ) , .C ( ctmn_14333 ) , 
    .ZN ( ctmn_14450 ) ) ;
AOI221D0BWP30P140HVT ctmi_16268 ( .A1 ( ctmn_14331 ) , .A2 ( ctmn_13339 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [3] ) , .B2 ( ctmn_13387 ) , 
    .C ( ctmn_14333 ) , .ZN ( ctmn_14452 ) ) ;
OAI22D0BWP30P140HVT ctmi_16270 ( .A1 ( ctmn_14407 ) , .A2 ( ctmn_14468 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [2] ) , .B2 ( ctmn_14470 ) , 
    .ZN ( ctmn_14471 ) ) ;
OAI22D0BWP30P140HVT ctmi_16271 ( .A1 ( ctmn_14329 ) , .A2 ( ctmn_14466 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [1] ) , .B2 ( ctmn_14467 ) , 
    .ZN ( ctmn_14468 ) ) ;
OAI22D0BWP30P140HVT ctmi_16272 ( .A1 ( HFSNET_11 ) , .A2 ( ctmn_14465 ) , 
    .B1 ( HFSNET_12 ) , .B2 ( ctmn_14431 ) , .ZN ( ctmn_14466 ) ) ;
OAI22D0BWP30P140HVT ctmi_16274 ( .A1 ( ctmn_14335 ) , .A2 ( phfnn_3705 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [4] ) , .B2 ( ctmn_14461 ) , 
    .ZN ( ctmn_14462 ) ) ;
OAI21D0BWP30P140HVT ctmi_16275 ( .A1 ( HFSNET_3 ) , .A2 ( accumulator[60] ) , 
    .B ( phfnn_3677 ) , .ZN ( ctmn_14459 ) ) ;
AOI221D0BWP30P140HVT ctmi_16277 ( .A1 ( HFSNET_2 ) , .A2 ( ctmn_13375 ) , 
    .B1 ( HFSNET_3 ) , .B2 ( ctmn_13368 ) , .C ( ctmn_14333 ) , 
    .ZN ( ctmn_14461 ) ) ;
AN2D0BWP30P140HVT ctmi_3921 ( .A1 ( ctmn_14844 ) , .A2 ( ctmn_14879 ) , 
    .Z ( ctmn_14898 ) ) ;
AOI221D0BWP30P140HVT ctmi_16279 ( .A1 ( HFSNET_2 ) , .A2 ( ctmn_13335 ) , 
    .B1 ( HFSNET_3 ) , .B2 ( ctmn_13383 ) , .C ( ctmn_14333 ) , 
    .ZN ( ctmn_14463 ) ) ;
OAI22D0BWP30P140HVT ctmi_16280 ( .A1 ( HFSNET_11 ) , .A2 ( ctmn_14440 ) , 
    .B1 ( HFSNET_12 ) , .B2 ( ctmn_14448 ) , .ZN ( ctmn_14467 ) ) ;
OAI22D0BWP30P140HVT ctmi_16281 ( .A1 ( ctmn_14329 ) , .A2 ( ctmn_14469 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [1] ) , .B2 ( ctmn_14408 ) , 
    .ZN ( ctmn_14470 ) ) ;
OAI22D0BWP30P140HVT ctmi_16282 ( .A1 ( HFSNET_11 ) , .A2 ( ctmn_14454 ) , 
    .B1 ( HFSNET_12 ) , .B2 ( ctmn_14381 ) , .ZN ( ctmn_14469 ) ) ;
OAI22D0BWP30P140HVT ctmi_16284 ( .A1 ( ctmn_14407 ) , .A2 ( ctmn_14481 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [2] ) , .B2 ( ctmn_14482 ) , 
    .ZN ( ctmn_14483 ) ) ;
OAI22D0BWP30P140HVT ctmi_16285 ( .A1 ( ctmn_14329 ) , .A2 ( ctmn_14480 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [1] ) , .B2 ( ctmn_14441 ) , 
    .ZN ( ctmn_14481 ) ) ;
OAI22D0BWP30P140HVT ctmi_16286 ( .A1 ( HFSNET_11 ) , .A2 ( ctmn_14479 ) , 
    .B1 ( HFSNET_12 ) , .B2 ( ctmn_14465 ) , .ZN ( ctmn_14480 ) ) ;
AOI221D0BWP30P140HVT ctmi_16287 ( .A1 ( \u_ppu/u_requantizer/shamt [5] ) , 
    .A2 ( ctmn_14476 ) , .B1 ( ctmn_14341 ) , .B2 ( ctmn_14477 ) , 
    .C ( ctmn_14478 ) , .ZN ( ctmn_14479 ) ) ;
OAI22D0BWP30P140HVT ctmi_16288 ( .A1 ( ctmn_14335 ) , .A2 ( ctmn_14474 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [4] ) , .B2 ( ctmn_14475 ) , 
    .ZN ( ctmn_14476 ) ) ;
OAI21D0BWP30P140HVT ctmi_16289 ( .A1 ( HFSNET_3 ) , .A2 ( accumulator[61] ) , 
    .B ( phfnn_3677 ) , .ZN ( ctmn_14474 ) ) ;
OAI221D0BWP30P140HVT ctmi_16290 ( .A1 ( HFSNET_2 ) , .A2 ( accumulator[53] ) , 
    .B1 ( HFSNET_3 ) , .B2 ( accumulator[45] ) , .C ( phfnn_3662 ) , 
    .ZN ( ctmn_14475 ) ) ;
AOI221D0BWP30P140HVT ctmi_16291 ( .A1 ( ctmn_14331 ) , .A2 ( ctmn_13334 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [3] ) , .B2 ( ctmn_13382 ) , 
    .C ( ctmn_14333 ) , .ZN ( ctmn_14477 ) ) ;
OAI22D0BWP30P140HVT ctmi_16292 ( .A1 ( ctmn_13342 ) , .A2 ( ctmn_14345 ) , 
    .B1 ( ctmn_13350 ) , .B2 ( ctmn_14346 ) , .ZN ( ctmn_14478 ) ) ;
OAI22D0BWP30P140HVT ctmi_16293 ( .A1 ( ctmn_14329 ) , .A2 ( ctmn_14455 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [1] ) , .B2 ( ctmn_14389 ) , 
    .ZN ( ctmn_14482 ) ) ;
AN2D0BWP30P140HVT ctmi_3924 ( .A1 ( ctmn_14721 ) , .A2 ( phfnn_1420 ) , 
    .Z ( ctmn_14723 ) ) ;
NR2D0BWP30P140HVT ctmi_16296 ( .A1 ( phfnn_3795 ) , .A2 ( ctmn_14487 ) , 
    .ZN ( ctmn_14488 ) ) ;
AO22D0BWP30P140HVT ctmi_1563 ( .A1 ( ctmn_14806 ) , .A2 ( ctmn_14879 ) , 
    .B1 ( phfnn_886 ) , .B2 ( phfnn_1453 ) , .Z ( ctmn_15109 ) ) ;
AOI222D0BWP30P140HVT ctmi_16298 ( .A1 ( phfnn_3782 ) , 
    .A2 ( \u_ppu/u_requantizer/shamt [2] ) , .B1 ( ctmn_14411 ) , 
    .B2 ( ctmn_14409 ) , .C1 ( ctmn_14413 ) , .C2 ( ctmn_14412 ) , 
    .ZN ( ctmn_14487 ) ) ;
AN2D0BWP30P140HVT ctmi_2276 ( .A1 ( N1517 ) , .A2 ( ctmn_13952 ) , 
    .Z ( N21 ) ) ;
OAI21D0BWP30P140HVT ctmi_16300 ( .A1 ( ctmn_14482 ) , .A2 ( ctmn_14407 ) , 
    .B ( ctmn_14489 ) , .ZN ( ctmn_14490 ) ) ;
AOI22D0BWP30P140HVT ctmi_16301 ( .A1 ( ctmn_14411 ) , .A2 ( ctmn_14404 ) , 
    .B1 ( ctmn_14413 ) , .B2 ( ctmn_14356 ) , .ZN ( ctmn_14489 ) ) ;
OAI22D0BWP30P140HVT ctmi_16302 ( .A1 ( ctmn_14407 ) , .A2 ( ctmn_14492 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [2] ) , .B2 ( ctmn_14410 ) , 
    .ZN ( ctmn_14493 ) ) ;
OAI22D0BWP30P140HVT ctmi_16303 ( .A1 ( ctmn_14329 ) , .A2 ( ctmn_14467 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [1] ) , .B2 ( ctmn_14469 ) , 
    .ZN ( ctmn_14492 ) ) ;
IOA21D0BWP30P140HVT ctmi_1565 ( .A1 ( phfnn_2590 ) , .A2 ( ctmn_14865 ) , 
    .B ( ctmn_15117 ) , .ZN ( ctmn_15118 ) ) ;
AO22D0BWP30P140HVT ctmi_3925 ( .A1 ( HFSNET_1 ) , .A2 ( ctmn_14793 ) , 
    .B1 ( ctmn_14865 ) , .B2 ( ctmn_14719 ) , .Z ( ctmn_14891_CDR1 ) ) ;
OAI22D0BWP30P140HVT ctmi_16306 ( .A1 ( ctmn_14407 ) , .A2 ( ctmn_14505 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [2] ) , .B2 ( ctmn_14492 ) , 
    .ZN ( ctmn_14506 ) ) ;
OAI22D0BWP30P140HVT ctmi_16307 ( .A1 ( ctmn_14329 ) , .A2 ( ctmn_14504 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [1] ) , .B2 ( ctmn_14466 ) , 
    .ZN ( ctmn_14505 ) ) ;
OAI22D0BWP30P140HVT ctmi_16308 ( .A1 ( HFSNET_11 ) , .A2 ( ctmn_14503 ) , 
    .B1 ( HFSNET_12 ) , .B2 ( ctmn_14479 ) , .ZN ( ctmn_14504 ) ) ;
AOI221D0BWP30P140HVT ctmi_16309 ( .A1 ( \u_ppu/u_requantizer/shamt [5] ) , 
    .A2 ( ctmn_14500 ) , .B1 ( ctmn_14501 ) , .B2 ( ctmn_14341 ) , 
    .C ( ctmn_14502 ) , .ZN ( ctmn_14503 ) ) ;
OAI22D0BWP30P140HVT ctmi_16310 ( .A1 ( ctmn_14335 ) , .A2 ( ctmn_14498 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [4] ) , .B2 ( ctmn_14499 ) , 
    .ZN ( ctmn_14500 ) ) ;
OA211D0BWP30P140HVT ctmi_3926 ( .A1 ( phfnn_2542 ) , .A2 ( phfnn_3853 ) , 
    .B ( phfnn_2563 ) , .C ( ctmn_14879 ) , .Z ( ctmn_14901 ) ) ;
IOA21D0BWP30P140HVT ctmi_638 ( .A1 ( ctmn_14449 ) , .A2 ( ctmn_14335 ) , 
    .B ( ctmn_14513 ) , .ZN ( ctmn_14565 ) ) ;
IAO21D1BWP30P140HVT ctmi_1567 ( .A1 ( ctmn_15098 ) , .A2 ( phfnn_3872 ) , 
    .B ( phfnn_874 ) , .ZN ( ctmn_15158 ) ) ;
AO22D0BWP30P140HVT ctmi_1568 ( .A1 ( phfnn_3880 ) , .A2 ( phfnn_878 ) , 
    .B1 ( phfnn_3243 ) , .B2 ( ctmn_14827 ) , .Z ( ctmn_15162 ) ) ;
AN2D0BWP30P140HVT ctmi_1569 ( .A1 ( ctmn_14806 ) , .A2 ( phfnn_3876 ) , 
    .Z ( ctmn_14809 ) ) ;
NR2D0BWP30P140HVT ctmi_16604 ( .A1 ( phfnn_1420 ) , .A2 ( phfnn_3844 ) , 
    .ZN ( ctmn_14799 ) ) ;
AOI21D0BWP30P140HVT ctmi_16605 ( .A1 ( phfnn_3856 ) , .A2 ( ctmn_14802 ) , 
    .B ( phfnn_1416 ) , .ZN ( ctmn_14803 ) ) ;
NR2D0BWP30P140HVT ctmi_16606 ( .A1 ( phfnn_2542 ) , .A2 ( ctmn_14726 ) , 
    .ZN ( ctmn_14800 ) ) ;
AO22D0BWP30P140HVT ctmi_1570 ( .A1 ( phfnn_3881 ) , .A2 ( ctmn_14827 ) , 
    .B1 ( phfnn_3875 ) , .B2 ( ctmn_14829 ) , .Z ( ctmn_14831 ) ) ;
ND2D0BWP30P140HVT ctmi_16608 ( .A1 ( ctmn_14693 ) , .A2 ( phfnn_3831 ) , 
    .ZN ( ctmn_14802 ) ) ;
AOI221D0BWP30P140HVT ctmi_16609 ( .A1 ( ctmn_14723 ) , .A2 ( HFSNET_1 ) , 
    .B1 ( phfnn_3878 ) , .B2 ( ctmn_14805 ) , .C ( ctmn_14809 ) , 
    .ZN ( ctmn_14810 ) ) ;
NR2D0BWP30P140HVT ctmi_16610 ( .A1 ( phfnn_3843 ) , .A2 ( phfnn_3835 ) , 
    .ZN ( ctmn_14805 ) ) ;
NR2D0BWP30P140HVT ctmi_16612 ( .A1 ( phfnn_3843 ) , .A2 ( ctmn_14792 ) , 
    .ZN ( ctmn_14806 ) ) ;
OAI22D0BWP30P140HVT ctmi_1571 ( .A1 ( ctmn_14693 ) , .A2 ( phfnn_3851 ) , 
    .B1 ( phfnn_867 ) , .B2 ( phfnn_3831 ) , .ZN ( ctmn_14944 ) ) ;
NR2D0BWP30P140HVT ctmi_16614 ( .A1 ( HFSNET_1 ) , .A2 ( ctmn_14719 ) , 
    .ZN ( ctmn_14808 ) ) ;
OAI22D0BWP30P140HVT ctmi_16615 ( .A1 ( phfnn_3858 ) , .A2 ( ctmn_14720 ) , 
    .B1 ( ctmn_14821 ) , .B2 ( act_fn_sel[0] ) , .ZN ( ctmn_14822 ) ) ;
NR2D0BWP30P140HVT ctmi_16616 ( .A1 ( phfnn_3839 ) , .A2 ( ctmn_14792 ) , 
    .ZN ( ctmn_14812 ) ) ;
NR2D1BWP30P140HVT ctmi_1572 ( .A1 ( ctmn_13330 ) , .A2 ( ctmn_13331 ) , 
    .ZN ( phfnn_648 ) ) ;
OAI22D0BWP30P140HVT ctmi_16618 ( .A1 ( ctmn_14817 ) , .A2 ( ctmn_14818 ) , 
    .B1 ( ctmn_14707 ) , .B2 ( ctmn_14820 ) , .ZN ( ctmn_14821 ) ) ;
OAI221D0BWP30P140HVT ctmi_16619 ( .A1 ( phfnn_2546 ) , .A2 ( ctmn_14792 ) , 
    .B1 ( phfnn_3840 ) , .B2 ( ctmn_14814 ) , .C ( ctmn_14816 ) , 
    .ZN ( ctmn_14817 ) ) ;
NR2D0BWP30P140HVT ctmi_16620 ( .A1 ( ctmn_14686 ) , .A2 ( phfnn_3852 ) , 
    .ZN ( ctmn_14814 ) ) ;
MUX2ND0BWP30P140HVT ctmi_3927 ( .I0 ( ctmn_14198 ) , .I1 ( phfnn_3753 ) , 
    .S ( ctmn_14228 ) , .ZN ( tmp_net2747 ) ) ;
ND2D0BWP30P140HVT ctmi_16623 ( .A1 ( ctmn_14740 ) , .A2 ( ctmn_14707 ) , 
    .ZN ( ctmn_14818 ) ) ;
AOI221D0BWP30P140HVT ctmi_16624 ( .A1 ( phfnn_1420 ) , .A2 ( ctmn_14819 ) , 
    .B1 ( phfnn_3835 ) , .B2 ( phfnn_3840 ) , .C ( ctmn_14720 ) , 
    .ZN ( ctmn_14820 ) ) ;
NR2D0BWP30P140HVT ctmi_16625 ( .A1 ( phfnn_3840 ) , .A2 ( phfnn_1416 ) , 
    .ZN ( ctmn_14819 ) ) ;
OAI211D0BWP30P140HVT ctmi_16626 ( .A1 ( phfnn_3848 ) , .A2 ( ctmn_14826 ) , 
    .B ( ctmn_14832 ) , .C ( ctmn_14834 ) , .ZN ( ctmn_14835 ) ) ;
AOI221D0BWP30P140HVT ctmi_16628 ( .A1 ( phfnn_2590 ) , .A2 ( ctmn_14824 ) , 
    .B1 ( phfnn_3881 ) , .B2 ( ctmn_14773 ) , .C ( ctmn_14825 ) , 
    .ZN ( ctmn_14826 ) ) ;
AOI21D0BWP30P140HVT ctmi_16706 ( .A1 ( phfnn_874 ) , .A2 ( ctmn_14885 ) , 
    .B ( ctmn_14898 ) , .ZN ( ctmn_14899 ) ) ;
XOR3UD0BWP30P140HVT ctmi_1579 ( .A1 ( ctmn_15222 ) , .A2 ( ctmn_15223 ) , 
    .A3 ( ctmn_15226 ) , .Z ( phfnn_827 ) ) ;
ND2D0BWP30P140HVT ctmi_16711 ( .A1 ( act_fn_sel[0] ) , .A2 ( phfnn_3852 ) , 
    .ZN ( ctmn_14906 ) ) ;
AOI21D0BWP30P140HVT ctmi_16712 ( .A1 ( phfnn_3878 ) , .A2 ( ctmn_14749 ) , 
    .B ( ctmn_14908 ) , .ZN ( ctmn_14909 ) ) ;
MUX2ND0BWP30P140HVT ctmi_3933 ( .I0 ( ctmn_14238 ) , .I1 ( phfnn_3755 ) , 
    .S ( ctmn_14268 ) , .ZN ( tmp_net2748 ) ) ;
OAI211D0BWP30P140HVT ctmi_16715 ( .A1 ( phfnn_3840 ) , .A2 ( ctmn_14912 ) , 
    .B ( ctmn_14914 ) , .C ( ctmn_14919 ) , .ZN ( ctmn_14920 ) ) ;
AOI22D0BWP30P140HVT ctmi_16716 ( .A1 ( ctmn_14911 ) , .A2 ( ctmn_14845 ) , 
    .B1 ( ctmn_14693 ) , .B2 ( phfnn_3871 ) , .ZN ( ctmn_14912 ) ) ;
ND2D0BWP30P140HVT ctmi_16717 ( .A1 ( HFSNET_0 ) , .A2 ( ctmn_14736 ) , 
    .ZN ( ctmn_14911 ) ) ;
AOI31D0BWP30P140HVT ctmi_16718 ( .A1 ( ctmn_14686 ) , .A2 ( ctmn_14860 ) , 
    .A3 ( ctmn_14913 ) , .B ( phfnn_3830 ) , .ZN ( ctmn_14914 ) ) ;
OAI21D0BWP30P140HVT ctmi_16719 ( .A1 ( ctmn_14740 ) , .A2 ( phfnn_3839 ) , 
    .B ( phfnn_3852 ) , .ZN ( ctmn_14913 ) ) ;
OAI21D0BWP30P140HVT ctmi_16720 ( .A1 ( ctmn_14918 ) , .A2 ( phfnn_1420 ) , 
    .B ( ctmn_14732 ) , .ZN ( ctmn_14919 ) ) ;
AOI33D0BWP30P140HVT ctmi_16721 ( .A1 ( phfnn_3836 ) , .A2 ( ctmn_14915 ) , 
    .A3 ( ctmn_14818 ) , .B1 ( phfnn_1416 ) , .B2 ( ctmn_14916 ) , 
    .B3 ( ctmn_14917 ) , .ZN ( ctmn_14918 ) ) ;
ND2D0BWP30P140HVT ctmi_16722 ( .A1 ( ctmn_14697 ) , .A2 ( ctmn_14802 ) , 
    .ZN ( ctmn_14915 ) ) ;
MUX2ND0BWP30P140HVT ctmi_3935 ( .I0 ( phfnn_3814 ) , .I1 ( ctmn_13771 ) , 
    .S ( ctmn_14005 ) , .ZN ( phfnn_826 ) ) ;
ND2D0BWP30P140HVT ctmi_16724 ( .A1 ( HFSNET_0 ) , .A2 ( phfnn_3856 ) , 
    .ZN ( ctmn_14917 ) ) ;
AOI31D0BWP30P140HVT ctmi_16725 ( .A1 ( ctmn_14932_CDR1 ) , 
    .A2 ( ctmn_14935_CDR1 ) , .A3 ( ctmn_14940 ) , .B ( phfnn_3849 ) , 
    .ZN ( ctmn_14941 ) ) ;
AOI211D0BWP30P140HVT ctmi_16726 ( .A1 ( ctmn_14921 ) , .A2 ( ctmn_14686 ) , 
    .B ( ctmn_14925 ) , .C ( ctmn_14931_CDR1 ) , .ZN ( ctmn_14932_CDR1 ) ) ;
XOR3UD0BWP30P140HVT ctmi_1583 ( .A1 ( phfnn_826 ) , 
    .A2 ( \u_mac_and_scale/mult_4_0_top [7] ) , 
    .A3 ( \DP_OP_247_35163_65499_J1/N_63 ) , .Z ( N237 ) ) ;
OAI22D0BWP30P140HVT ctmi_16728 ( .A1 ( ctmn_14922 ) , .A2 ( phfnn_3877 ) , 
    .B1 ( phfnn_3855 ) , .B2 ( ctmn_14924 ) , .ZN ( ctmn_14925 ) ) ;
ND2D0BWP30P140HVT ctmi_16729 ( .A1 ( ctmn_14806 ) , .A2 ( phfnn_3853 ) , 
    .ZN ( ctmn_14922 ) ) ;
AOI21D0BWP30P140HVT ctmi_16731 ( .A1 ( ctmn_14686 ) , .A2 ( ctmn_14795 ) , 
    .B ( ctmn_14719 ) , .ZN ( ctmn_14924 ) ) ;
OAI222D0BWP30P140HVT ctmi_16732 ( .A1 ( ctmn_14886 ) , .A2 ( HFSNET_0 ) , 
    .B1 ( ctmn_14929 ) , .B2 ( phfnn_3838 ) , .C1 ( ctmn_14795 ) , 
    .C2 ( ctmn_14930 ) , .ZN ( ctmn_14931_CDR1 ) ) ;
AOI211D0BWP30P140HVT ctmi_16733 ( .A1 ( act_fn_sel[0] ) , .A2 ( ctmn_14873 ) , 
    .B ( phfnn_2014 ) , .C ( ctmn_14745 ) , .ZN ( ctmn_14926 ) ) ;
AOI211D0BWP30P140HVT ctmi_16734 ( .A1 ( ctmn_14691 ) , .A2 ( ctmn_14885 ) , 
    .B ( ctmn_14927 ) , .C ( ctmn_14928 ) , .ZN ( ctmn_14929 ) ) ;
NR2D0BWP30P140HVT ctmi_16735 ( .A1 ( phfnn_3874 ) , .A2 ( ctmn_14879 ) , 
    .ZN ( ctmn_14927 ) ) ;
NR3D0BWP30P140HVT ctmi_16736 ( .A1 ( HFSNET_0 ) , .A2 ( ctmn_14814 ) , 
    .A3 ( phfnn_3862 ) , .ZN ( ctmn_14928 ) ) ;
AOI221D0BWP30P140HVT ctmi_16737 ( .A1 ( ctmn_14697 ) , .A2 ( ctmn_14873 ) , 
    .B1 ( ctmn_14736 ) , .B2 ( ctmn_14844 ) , .C ( ctmn_14865 ) , 
    .ZN ( ctmn_14930 ) ) ;
AOI221D0BWP30P140HVT ctmi_16738 ( .A1 ( phfnn_899 ) , .A2 ( ctmn_14933 ) , 
    .B1 ( ctmn_14885 ) , .B2 ( ctmn_14880 ) , .C ( ctmn_14934_CDR1 ) , 
    .ZN ( ctmn_14935_CDR1 ) ) ;
NR2D0BWP30P140HVT ctmi_16739 ( .A1 ( ctmn_14686 ) , .A2 ( phfnn_874 ) , 
    .ZN ( ctmn_14933 ) ) ;
OAI22D0BWP30P140HVT ctmi_16740 ( .A1 ( phfnn_3867 ) , .A2 ( phfnn_3243 ) , 
    .B1 ( ctmn_14691 ) , .B2 ( ctmn_14926 ) , .ZN ( ctmn_14934_CDR1 ) ) ;
MUX2ND0BWP30P140HVT ctmi_3938 ( .I0 ( ctmn_14278 ) , .I1 ( phfnn_3757 ) , 
    .S ( ctmn_14308 ) , .ZN ( tmp_net2749 ) ) ;
AN2D0BWP30P140HVT ctmi_3940 ( .A1 ( ctmn_13609 ) , .A2 ( phfnn_3734 ) , 
    .Z ( N9646 ) ) ;
INR2D1BWP30P140HVT ctmi_3941 ( .A1 ( ctmn_13609 ) , .B1 ( ctmn_13616 ) , 
    .ZN ( ctmn_13626 ) ) ;
AOI31D0BWP30P140HVT ctmi_16746 ( .A1 ( ctmn_14950 ) , .A2 ( ctmn_14951 ) , 
    .A3 ( ctmn_14953 ) , .B ( phfnn_3848 ) , .ZN ( ctmn_14954 ) ) ;
AOI221D0BWP30P140HVT ctmi_16747 ( .A1 ( ctmn_14693 ) , .A2 ( phfnn_2014 ) , 
    .B1 ( ctmn_14812 ) , .B2 ( ctmn_14890 ) , .C ( ctmn_14949 ) , 
    .ZN ( ctmn_14950 ) ) ;
AOI32D0BWP30P140HVT ctmi_16748 ( .A1 ( phfnn_3853 ) , .A2 ( ctmn_14945 ) , 
    .A3 ( ctmn_14946 ) , .B1 ( ctmn_14686 ) , .B2 ( ctmn_14948 ) , 
    .ZN ( ctmn_14949 ) ) ;
AOI221D0BWP30P140HVT ctmi_16749 ( .A1 ( ctmn_14942 ) , .A2 ( phfnn_3836 ) , 
    .B1 ( phfnn_3865 ) , .B2 ( ctmn_14943 ) , .C ( ctmn_14944 ) , 
    .ZN ( ctmn_14945 ) ) ;
NR2D0BWP30P140HVT ctmi_16750 ( .A1 ( HFSNET_1 ) , .A2 ( phfnn_3838 ) , 
    .ZN ( ctmn_14942 ) ) ;
NR2D0BWP30P140HVT ctmi_16751 ( .A1 ( phfnn_1420 ) , .A2 ( phfnn_3838 ) , 
    .ZN ( ctmn_14943 ) ) ;
XOR2UD0BWP30P140HVT ctmi_1587 ( .A1 ( \DP_OP_244_18871_65499_J1/ctmn_15273 ) , 
    .A2 ( \DP_OP_244_18871_65499_J1/ctmn_15274 ) , .Z ( phfnn_924 ) ) ;
AO21D0BWP30P140HVT ctmi_3942 ( .A1 ( phfnn_3685 ) , .A2 ( phfnn_3767 ) , 
    .B ( N930 ) , .Z ( tmp_net2653 ) ) ;
XNR3UD0BWP30P140HVT ctmi_3944 ( .A1 ( ctmn_13758 ) , .A2 ( ctmn_13761 ) , 
    .A3 ( ctmn_13769 ) , .ZN ( phfnn_2510 ) ) ;
AOI21D0BWP30P140HVT ctmi_15105 ( .A1 ( ctmn_13634 ) , .A2 ( ctmn_13635 ) , 
    .B ( N161 ) , .ZN ( ctmn_13638 ) ) ;
OAI21D0BWP30P140HVT ctmi_1590 ( .A1 ( \u_mac_and_scale/scale_iso_2 [0] ) , 
    .A2 ( N186 ) , .B ( phfnn_1475 ) , .ZN ( phfnn_908 ) ) ;
NR3D0BWP30P140HVT ctmi_15108 ( .A1 ( phfnn_3702 ) , .A2 ( ctmn_13618 ) , 
    .A3 ( ctmn_13611 ) , .ZN ( ctmn_13635 ) ) ;
AO21D0BWP30P140HVT ctmi_3946 ( .A1 ( ctmn_13847 ) , .A2 ( phfnn_3769 ) , 
    .B ( ctmn_13853 ) , .Z ( tmp_net2652 ) ) ;
ND2D0BWP30P140HVT ctmi_3947 ( .A1 ( ctmn_13952 ) , 
    .A2 ( \u_mac_and_scale/N7 ) , .ZN ( tmp_net2655 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15111 ( .A ( N174 ) , .B ( ctmn_13639 ) , 
    .C ( ctmn_13640 ) , .ZN ( ctmn_13641 ) ) ;
AN2D0BWP30P140HVT ctmi_3948 ( .A1 ( phfnn_3733 ) , .A2 ( ctmn_13554 ) , 
    .Z ( N9549 ) ) ;
OR2D1BWP30P140HVT ctmi_1593 ( .A1 ( phfnn_675 ) , .A2 ( ctmn_13456 ) , 
    .Z ( ctmn_13498 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15114 ( .A ( ctmn_13651 ) , .B ( ctmn_13645 ) , 
    .C ( ctmn_13652 ) , .ZN ( ctmn_13653 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15115 ( .A ( phfnn_3800 ) , .B ( N11440 ) , 
    .C ( ctmn_13650 ) , .ZN ( ctmn_13651 ) ) ;
AOI21D0BWP30P140HVT ctmi_15116 ( .A1 ( N9655 ) , .A2 ( ctmn_13644 ) , 
    .B ( ctmn_13645 ) , .ZN ( ctmn_13646 ) ) ;
OAI33D0BWP30P140HVT ctmi_15117 ( .A1 ( ctmn_13635 ) , .A2 ( ctmn_13611 ) , 
    .A3 ( phfnn_3686 ) , .B1 ( ctmn_13635 ) , .B2 ( phfnn_3702 ) , 
    .B3 ( ctmn_13616 ) , .ZN ( ctmn_13644 ) ) ;
MAOI22D0BWP30P140HVT ctmi_1594 ( .A1 ( phfnn_3729 ) , .A2 ( ctmn_13446 ) , 
    .B1 ( phfnn_675 ) , .B2 ( ctmn_13450 ) , .ZN ( ctmn_13463 ) ) ;
NR2D0BWP30P140HVT ctmi_15119 ( .A1 ( N9655 ) , .A2 ( ctmn_13644 ) , 
    .ZN ( ctmn_13645 ) ) ;
MUX2ND0BWP30P140HVT ctmi_3949 ( .I0 ( ctmn_14258 ) , .I1 ( phfnn_3789 ) , 
    .S ( ctmn_15241 ) , .ZN ( \u_mac_and_scale/mult_4_2_top [4] ) ) ;
XOR2UD0BWP30P140HVT ctmi_15121 ( .A1 ( ctmn_13639 ) , .A2 ( ctmn_13649 ) , 
    .Z ( ctmn_13650 ) ) ;
AOI21D0BWP30P140HVT ctmi_15122 ( .A1 ( ctmn_13640 ) , .A2 ( N174 ) , 
    .B ( ctmn_13648 ) , .ZN ( ctmn_13649 ) ) ;
NR2D0BWP30P140HVT ctmi_15123 ( .A1 ( ctmn_13640 ) , .A2 ( N174 ) , 
    .ZN ( ctmn_13648 ) ) ;
XOR3UD0BWP30P140HVT ctmi_15124 ( .A1 ( ctmn_13641 ) , .A2 ( ctmn_13632 ) , 
    .A3 ( ctmn_13638 ) , .Z ( ctmn_13652 ) ) ;
AOI21D0BWP30P140HVT ctmi_15125 ( .A1 ( phfnn_3708 ) , .A2 ( ctmn_13628 ) , 
    .B ( phfnn_756 ) , .ZN ( ctmn_13657 ) ) ;
MUX2ND0BWP30P140HVT ctmi_3950 ( .I0 ( ctmn_14131 ) , .I1 ( phfnn_3791 ) , 
    .S ( ctmn_15250 ) , .ZN ( \u_mac_and_scale/mult_4_2_bottom[4] ) ) ;
MUX2ND0BWP30P140HVT ctmi_3951 ( .I0 ( ctmn_14173 ) , .I1 ( phfnn_3792 ) , 
    .S ( ctmn_15272 ) , .ZN ( \u_mac_and_scale/mult_4_3_bottom [4] ) ) ;
AOI21D0BWP30P140HVT ctmi_15152 ( .A1 ( operand_A_reg[6] ) , 
    .A2 ( HFSNET_28 ) , .B ( ctmn_13681 ) , .ZN ( ctmn_13682 ) ) ;
AOI21D0BWP30P140HVT ctmi_15153 ( .A1 ( ctmn_13679 ) , .A2 ( ctmn_13680 ) , 
    .B ( HFSNET_25 ) , .ZN ( ctmn_13681 ) ) ;
AOI22D0BWP30P140HVT ctmi_15154 ( .A1 ( ctmn_13309 ) , 
    .A2 ( \u_mac_and_scale/holding_reg [14] ) , .B1 ( HFSNET_7 ) , 
    .B2 ( \u_mac_and_scale/holding_reg [6] ) , .ZN ( ctmn_13679 ) ) ;
AOI22D0BWP30P140HVT ctmi_15155 ( .A1 ( HFSNET_17 ) , .A2 ( accumulator[6] ) , 
    .B1 ( \u_mac_and_scale/holding_reg [22] ) , .B2 ( phfnn_639 ) , 
    .ZN ( ctmn_13680 ) ) ;
AOI21D0BWP30P140HVT ctmi_15156 ( .A1 ( operand_A_reg[5] ) , 
    .A2 ( HFSNET_25 ) , .B ( ctmn_13685 ) , .ZN ( ctmn_13686 ) ) ;
AOI21D0BWP30P140HVT ctmi_15157 ( .A1 ( ctmn_13683 ) , .A2 ( ctmn_13684 ) , 
    .B ( HFSNET_25 ) , .ZN ( ctmn_13685 ) ) ;
AOI22D0BWP30P140HVT ctmi_15158 ( .A1 ( ctmn_13309 ) , 
    .A2 ( \u_mac_and_scale/holding_reg [13] ) , .B1 ( HFSNET_8 ) , 
    .B2 ( \u_mac_and_scale/holding_reg [5] ) , .ZN ( ctmn_13683 ) ) ;
AOI22D0BWP30P140HVT ctmi_15159 ( .A1 ( HFSNET_17 ) , .A2 ( accumulator[5] ) , 
    .B1 ( \u_mac_and_scale/holding_reg [21] ) , .B2 ( phfnn_639 ) , 
    .ZN ( ctmn_13684 ) ) ;
AOI22D0BWP30P140HVT ctmi_1600 ( .A1 ( phfnn_3731 ) , .A2 ( phfnn_3692 ) , 
    .B1 ( ctmn_13554 ) , .B2 ( phfnn_3723 ) , .ZN ( ctmn_13571 ) ) ;
AOI21D0BWP30P140HVT ctmi_1602 ( .A1 ( phfnn_3732 ) , .A2 ( phfnn_3048 ) , 
    .B ( ctmn_13626 ) , .ZN ( ctmn_13627 ) ) ;
AOI21D0BWP30P140HVT ctmi_15171 ( .A1 ( ctmn_13694 ) , .A2 ( ctmn_13695 ) , 
    .B ( HFSNET_25 ) , .ZN ( ctmn_13696 ) ) ;
AOI22D0BWP30P140HVT ctmi_15172 ( .A1 ( ctmn_13309 ) , 
    .A2 ( \u_mac_and_scale/holding_reg [12] ) , .B1 ( HFSNET_7 ) , 
    .B2 ( \u_mac_and_scale/holding_reg [4] ) , .ZN ( ctmn_13694 ) ) ;
AOI22D0BWP30P140HVT ctmi_15173 ( .A1 ( HFSNET_17 ) , .A2 ( accumulator[4] ) , 
    .B1 ( \u_mac_and_scale/holding_reg [20] ) , .B2 ( phfnn_639 ) , 
    .ZN ( ctmn_13695 ) ) ;
OAI32D0BWP30P140HVT ctmi_15202 ( .A1 ( ctmn_13687 ) , .A2 ( ctmn_13686 ) , 
    .A3 ( phfnn_3064 ) , .B1 ( ctmn_13687 ) , .B2 ( ctmn_13711 ) , 
    .ZN ( ctmn_13712 ) ) ;
ND2D0BWP30P140HVT ctmi_15203 ( .A1 ( ctmn_13675 ) , .A2 ( phfnn_3717 ) , 
    .ZN ( ctmn_13711 ) ) ;
AOI21D0BWP30P140HVT ctmi_15204 ( .A1 ( ctmn_13713 ) , .A2 ( N11455 ) , 
    .B ( N196 ) , .ZN ( ctmn_13715 ) ) ;
ND2D0BWP30P140HVT ctmi_15205 ( .A1 ( phfnn_3767 ) , .A2 ( ctmn_13702 ) , 
    .ZN ( ctmn_13713 ) ) ;
OR4D1BWP30P140HVT ctmi_640 ( .A1 ( ctmn_14614 ) , .A2 ( ctmn_14554 ) , 
    .A3 ( ctmn_14556 ) , .A4 ( ctmn_14559 ) , .Z ( ctmn_14655_CDR5 ) ) ;
ND2D0BWP30P140HVT ctmi_15240 ( .A1 ( operand_B_reg[5] ) , .A2 ( ctmn_13734 ) , 
    .ZN ( ctmn_13740 ) ) ;
NR4D0BWP30P140HVT ctmi_15241 ( .A1 ( ctmn_13620 ) , .A2 ( ctmn_13614 ) , 
    .A3 ( ctmn_13682 ) , .A4 ( ctmn_13686 ) , .ZN ( ctmn_13741 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15346 ( .A ( N11590 ) , .B ( ctmn_13815 ) , 
    .C ( ctmn_13816 ) , .ZN ( ctmn_13821 ) ) ;
ND2D0BWP30P140HVT ctmi_15437 ( .A1 ( phfnn_3769 ) , .A2 ( ctmn_13863 ) , 
    .ZN ( ctmn_13874 ) ) ;
INR2D1BWP30P140HVT ctmi_641 ( .A1 ( ctmn_14508 ) , .B1 ( ctmn_14671 ) , 
    .ZN ( ctmn_14673 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15439 ( .A ( N11723 ) , .B ( ctmn_13873 ) , 
    .C ( ctmn_13874 ) , .ZN ( ctmn_13879 ) ) ;
ND2D0BWP30P140HVT ctmi_15587 ( .A1 ( ctmn_13969 ) , .A2 ( phfnn_3794 ) , 
    .ZN ( ctmn_13970 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15588 ( .A ( ctmn_13985 ) , .B ( ctmn_13986 ) , 
    .C ( ctmn_13992 ) , .ZN ( ctmn_13993 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15589 ( .A ( ctmn_13977 ) , .B ( N11569 ) , 
    .C ( ctmn_13984 ) , .ZN ( ctmn_13985 ) ) ;
XOR2UD0BWP30P140HVT ctmi_15590 ( .A1 ( ctmn_13778 ) , .A2 ( ctmn_13976 ) , 
    .Z ( ctmn_13977 ) ) ;
AOI21D0BWP30P140HVT ctmi_15591 ( .A1 ( ctmn_13973 ) , .A2 ( ctmn_13974 ) , 
    .B ( ctmn_13975 ) , .ZN ( ctmn_13976 ) ) ;
OAI21D0BWP30P140HVT ctmi_15670 ( .A1 ( ctmn_14011 ) , .A2 ( ctmn_14032 ) , 
    .B ( ctmn_14012 ) , .ZN ( ctmn_14033 ) ) ;
ND2D0BWP30P140HVT ctmi_15592 ( .A1 ( ctmn_13956 ) , .A2 ( phfnn_3732 ) , 
    .ZN ( ctmn_13973 ) ) ;
NR2D0BWP30P140HVT ctmi_15593 ( .A1 ( ctmn_13671 ) , .A2 ( phfnn_3728 ) , 
    .ZN ( ctmn_13974 ) ) ;
NR2D0BWP30P140HVT ctmi_15594 ( .A1 ( ctmn_13973 ) , .A2 ( ctmn_13974 ) , 
    .ZN ( ctmn_13975 ) ) ;
MUX2ND0BWP30P140HVT ctmi_15595 ( .I0 ( ctmn_13979 ) , .I1 ( phfnn_3777 ) , 
    .S ( ctmn_13983 ) , .ZN ( ctmn_13984 ) ) ;
OAI21D0BWP30P140HVT ctmi_15596 ( .A1 ( ctmn_13957 ) , .A2 ( ctmn_13978 ) , 
    .B ( ctmn_13958 ) , .ZN ( ctmn_13979 ) ) ;
NR2D0BWP30P140HVT ctmi_15597 ( .A1 ( ctmn_13676 ) , .A2 ( ctmn_13616 ) , 
    .ZN ( ctmn_13978 ) ) ;
OAI21D0BWP30P140HVT ctmi_16311 ( .A1 ( accumulator[62] ) , .A2 ( HFSNET_3 ) , 
    .B ( phfnn_3677 ) , .ZN ( ctmn_14498 ) ) ;
OAI221D0BWP30P140HVT ctmi_16312 ( .A1 ( HFSNET_2 ) , .A2 ( accumulator[54] ) , 
    .B1 ( HFSNET_3 ) , .B2 ( accumulator[46] ) , .C ( phfnn_3662 ) , 
    .ZN ( ctmn_14499 ) ) ;
AOI221D0BWP30P140HVT ctmi_16313 ( .A1 ( ctmn_14331 ) , .A2 ( ctmn_13333 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [3] ) , .B2 ( ctmn_13381 ) , 
    .C ( ctmn_14333 ) , .ZN ( ctmn_14501 ) ) ;
OAI22D0BWP30P140HVT ctmi_16314 ( .A1 ( ctmn_13341 ) , .A2 ( ctmn_14345 ) , 
    .B1 ( ctmn_13349 ) , .B2 ( ctmn_14346 ) , .ZN ( ctmn_14502 ) ) ;
ND2D0BWP30P140HVT ctmi_16315 ( .A1 ( ctmn_14651 ) , .A2 ( ctmn_14670 ) , 
    .ZN ( ctmn_14671 ) ) ;
ND3D0BWP30P140HVT ctmi_16316 ( .A1 ( ctmn_14534_CDR5 ) , 
    .A2 ( ctmn_14551_CDR5 ) , .A3 ( ctmn_14650_CDR5 ) , .ZN ( ctmn_14651 ) ) ;
NR4D0BWP30P140HVT ctmi_16317 ( .A1 ( ctmn_14528 ) , .A2 ( ctmn_14600 ) , 
    .A3 ( phfnn_3740 ) , .A4 ( ctmn_14637 ) , .ZN ( ctmn_14534_CDR5 ) ) ;
OAI22D0BWP30P140HVT ctmi_16318 ( .A1 ( ctmn_14330 ) , .A2 ( ctmn_14511 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [0] ) , .B2 ( ctmn_14500 ) , 
    .ZN ( ctmn_14512 ) ) ;
ND2D0BWP30P140HVT ctmi_1604 ( .A1 ( phfnn_3768 ) , .A2 ( phfnn_672 ) , 
    .ZN ( ctmn_13803 ) ) ;
NR2D0BWP30P140HVT ctmi_16321 ( .A1 ( ctmn_13364 ) , .A2 ( ctmn_14333 ) , 
    .ZN ( ctmn_14508 ) ) ;
ND2D0BWP30P140HVT ctmi_1605 ( .A1 ( phfnn_672 ) , .A2 ( phfnn_3714 ) , 
    .ZN ( ctmn_13826 ) ) ;
OAI21D0BWP30P140HVT ctmi_16323 ( .A1 ( ctmn_14474 ) , 
    .A2 ( \u_ppu/u_requantizer/shamt [4] ) , .B ( ctmn_14513 ) , 
    .ZN ( ctmn_14514 ) ) ;
IND2D1BWP30P140HVT ctmi_1607 ( .A1 ( ctmn_13897 ) , .B1 ( phfnn_671 ) , 
    .ZN ( ctmn_13918 ) ) ;
OAI22D0BWP30P140HVT ctmi_16326 ( .A1 ( ctmn_14329 ) , .A2 ( ctmn_14521 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [1] ) , .B2 ( ctmn_14527 ) , 
    .ZN ( ctmn_14528 ) ) ;
OAI22D0BWP30P140HVT ctmi_16327 ( .A1 ( ctmn_14330 ) , .A2 ( ctmn_14518 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [0] ) , .B2 ( ctmn_14520 ) , 
    .ZN ( ctmn_14521 ) ) ;
AOI222D0BWP30P140HVT ctmi_16328 ( .A1 ( \u_ppu/u_requantizer/shamt [5] ) , 
    .A2 ( phfnn_3706 ) , .B1 ( ctmn_14344 ) , .B2 ( ctmn_14501 ) , 
    .C1 ( ctmn_14341 ) , .C2 ( phfnn_3680 ) , .ZN ( ctmn_14518 ) ) ;
ND2D0BWP30P140HVT ctmi_1608 ( .A1 ( phfnn_671 ) , .A2 ( phfnn_3716 ) , 
    .ZN ( ctmn_13941 ) ) ;
AOI222D0BWP30P140HVT ctmi_16331 ( .A1 ( ctmn_14514 ) , 
    .A2 ( \u_ppu/u_requantizer/shamt [5] ) , .B1 ( ctmn_14344 ) , 
    .B2 ( ctmn_14477 ) , .C1 ( ctmn_14341 ) , .C2 ( phfnn_3679 ) , 
    .ZN ( ctmn_14520 ) ) ;
OAI22D0BWP30P140HVT ctmi_16333 ( .A1 ( ctmn_14330 ) , .A2 ( ctmn_14523 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [0] ) , .B2 ( ctmn_14526 ) , 
    .ZN ( ctmn_14527 ) ) ;
AOI222D0BWP30P140HVT ctmi_16334 ( .A1 ( ctmn_14522 ) , 
    .A2 ( \u_ppu/u_requantizer/shamt [5] ) , .B1 ( ctmn_14344 ) , 
    .B2 ( ctmn_14463 ) , .C1 ( ctmn_14341 ) , .C2 ( ctmn_14461 ) , 
    .ZN ( ctmn_14523 ) ) ;
OAI21D0BWP30P140HVT ctmi_16335 ( .A1 ( ctmn_14459 ) , 
    .A2 ( \u_ppu/u_requantizer/shamt [4] ) , .B ( ctmn_14513 ) , 
    .ZN ( ctmn_14522 ) ) ;
AOI222D0BWP30P140HVT ctmi_16336 ( .A1 ( ctmn_14524 ) , 
    .A2 ( \u_ppu/u_requantizer/shamt [5] ) , .B1 ( ctmn_14344 ) , 
    .B2 ( ctmn_14429 ) , .C1 ( ctmn_14341 ) , .C2 ( phfnn_3678 ) , 
    .ZN ( ctmn_14526 ) ) ;
OAI21D0BWP30P140HVT ctmi_16337 ( .A1 ( ctmn_14426 ) , 
    .A2 ( \u_ppu/u_requantizer/shamt [4] ) , .B ( ctmn_14513 ) , 
    .ZN ( ctmn_14524 ) ) ;
OAI22D0BWP30P140HVT ctmi_16339 ( .A1 ( ctmn_14329 ) , .A2 ( ctmn_14529 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [1] ) , .B2 ( ctmn_14532 ) , 
    .ZN ( ctmn_14533 ) ) ;
OAI22D0BWP30P140HVT ctmi_16340 ( .A1 ( ctmn_14330 ) , .A2 ( ctmn_14520 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [0] ) , .B2 ( ctmn_14523 ) , 
    .ZN ( ctmn_14529 ) ) ;
OAI22D0BWP30P140HVT ctmi_16341 ( .A1 ( ctmn_14330 ) , .A2 ( ctmn_14526 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [0] ) , .B2 ( ctmn_14531 ) , 
    .ZN ( ctmn_14532 ) ) ;
AOI222D0BWP30P140HVT ctmi_16342 ( .A1 ( ctmn_14530 ) , 
    .A2 ( \u_ppu/u_requantizer/shamt [5] ) , .B1 ( ctmn_14344 ) , 
    .B2 ( ctmn_14437 ) , .C1 ( ctmn_14341 ) , .C2 ( ctmn_14434 ) , 
    .ZN ( ctmn_14531 ) ) ;
OAI21D0BWP30P140HVT ctmi_16343 ( .A1 ( ctmn_14432 ) , 
    .A2 ( \u_ppu/u_requantizer/shamt [4] ) , .B ( ctmn_14513 ) , 
    .ZN ( ctmn_14530 ) ) ;
NR4D0BWP30P140HVT ctmi_16344 ( .A1 ( ctmn_14547 ) , .A2 ( ctmn_14539 ) , 
    .A3 ( ctmn_14548 ) , .A4 ( ctmn_14550 ) , .ZN ( ctmn_14551_CDR5 ) ) ;
OAI22D0BWP30P140HVT ctmi_16345 ( .A1 ( HFSNET_11 ) , .A2 ( ctmn_14537 ) , 
    .B1 ( HFSNET_12 ) , .B2 ( ctmn_14538 ) , .ZN ( ctmn_14539 ) ) ;
OAI21D0BWP30P140HVT ctmi_16346 ( .A1 ( \u_ppu/u_requantizer/shamt [5] ) , 
    .A2 ( ctmn_14392 ) , .B ( ctmn_14536 ) , .ZN ( ctmn_14537 ) ) ;
OAI21D0BWP30P140HVT ctmi_16349 ( .A1 ( \u_ppu/u_requantizer/shamt [5] ) , 
    .A2 ( ctmn_14399 ) , .B ( ctmn_14536 ) , .ZN ( ctmn_14538 ) ) ;
OAI22D0BWP30P140HVT ctmi_16350 ( .A1 ( ctmn_14329 ) , .A2 ( ctmn_14544 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [1] ) , .B2 ( ctmn_14546 ) , 
    .ZN ( ctmn_14547 ) ) ;
OAI22D0BWP30P140HVT ctmi_16351 ( .A1 ( HFSNET_11 ) , .A2 ( ctmn_14541 ) , 
    .B1 ( HFSNET_12 ) , .B2 ( ctmn_14543 ) , .ZN ( ctmn_14544 ) ) ;
AOI222D0BWP30P140HVT ctmi_16352 ( .A1 ( ctmn_14540 ) , 
    .A2 ( \u_ppu/u_requantizer/shamt [5] ) , .B1 ( ctmn_14344 ) , 
    .B2 ( ctmn_14361 ) , .C1 ( ctmn_14341 ) , .C2 ( ctmn_14358 ) , 
    .ZN ( ctmn_14541 ) ) ;
OAI21D0BWP30P140HVT ctmi_16353 ( .A1 ( ctmn_14357 ) , 
    .A2 ( \u_ppu/u_requantizer/shamt [4] ) , .B ( ctmn_14513 ) , 
    .ZN ( ctmn_14540 ) ) ;
AOI222D0BWP30P140HVT ctmi_16354 ( .A1 ( ctmn_14542 ) , 
    .A2 ( \u_ppu/u_requantizer/shamt [5] ) , .B1 ( ctmn_14344 ) , 
    .B2 ( ctmn_14368 ) , .C1 ( ctmn_14341 ) , .C2 ( ctmn_14365 ) , 
    .ZN ( ctmn_14543 ) ) ;
OAI21D0BWP30P140HVT ctmi_16355 ( .A1 ( ctmn_14364 ) , 
    .A2 ( \u_ppu/u_requantizer/shamt [4] ) , .B ( ctmn_14513 ) , 
    .ZN ( ctmn_14542 ) ) ;
OAI22D0BWP30P140HVT ctmi_16356 ( .A1 ( HFSNET_11 ) , .A2 ( ctmn_14545 ) , 
    .B1 ( HFSNET_12 ) , .B2 ( ctmn_14503 ) , .ZN ( ctmn_14546 ) ) ;
AOI222D0BWP30P140HVT ctmi_16357 ( .A1 ( ctmn_14511 ) , 
    .A2 ( \u_ppu/u_requantizer/shamt [5] ) , .B1 ( ctmn_14344 ) , 
    .B2 ( ctmn_14414 ) , .C1 ( ctmn_14341 ) , .C2 ( ctmn_14417 ) , 
    .ZN ( ctmn_14545 ) ) ;
OAI22D0BWP30P140HVT ctmi_16358 ( .A1 ( ctmn_14329 ) , .A2 ( ctmn_14546 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [1] ) , .B2 ( ctmn_14480 ) , 
    .ZN ( ctmn_14548 ) ) ;
OAI22D0BWP30P140HVT ctmi_16359 ( .A1 ( ctmn_14329 ) , .A2 ( ctmn_14549 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [1] ) , .B2 ( ctmn_14504 ) , 
    .ZN ( ctmn_14550 ) ) ;
OAI22D0BWP30P140HVT ctmi_16360 ( .A1 ( HFSNET_11 ) , .A2 ( ctmn_14543 ) , 
    .B1 ( HFSNET_12 ) , .B2 ( ctmn_14545 ) , .ZN ( ctmn_14549 ) ) ;
NR4D0BWP30P140HVT ctmi_16361 ( .A1 ( ctmn_14562_CDR2 ) , 
    .A2 ( ctmn_14568_CDR2 ) , .A3 ( ctmn_14603_CDR5 ) , 
    .A4 ( ctmn_14649_CDR5 ) , .ZN ( ctmn_14650_CDR5 ) ) ;
OAI211D0BWP30P140HVT ctmi_16362 ( .A1 ( \u_ppu/u_requantizer/shamt [2] ) , 
    .A2 ( ctmn_14552 ) , .B ( ctmn_14561_CDR2 ) , .C ( ctmn_14614 ) , 
    .ZN ( ctmn_14562_CDR2 ) ) ;
NR4D0BWP30P140HVT ctmi_16363 ( .A1 ( ctmn_14505 ) , .A2 ( ctmn_14481 ) , 
    .A3 ( ctmn_14468 ) , .A4 ( ctmn_14456 ) , .ZN ( ctmn_14552 ) ) ;
ND2D0BWP30P140HVT ctmi_1614 ( .A1 ( phfnn_3733 ) , .A2 ( ctmn_14010 ) , 
    .ZN ( ctmn_14020 ) ) ;
OAI21D0BWP30P140HVT ctmi_16365 ( .A1 ( phfnn_3665 ) , .A2 ( ctmn_14383 ) , 
    .B ( ctmn_14513 ) , .ZN ( ctmn_14554 ) ) ;
NR2D0BWP30P140HVT ctmi_1615 ( .A1 ( ctmn_13790 ) , .A2 ( phfnn_3725 ) , 
    .ZN ( phfnn_747 ) ) ;
OAI21D0BWP30P140HVT ctmi_16368 ( .A1 ( ctmn_14391 ) , .A2 ( phfnn_3665 ) , 
    .B ( ctmn_14513 ) , .ZN ( ctmn_14556 ) ) ;
AN2D0BWP30P140HVT ctmi_1617 ( .A1 ( operand_B_reg[10] ) , .A2 ( ctmn_14008 ) , 
    .Z ( phfnn_748 ) ) ;
OAI21D0BWP30P140HVT ctmi_16371 ( .A1 ( ctmn_14338 ) , .A2 ( phfnn_3665 ) , 
    .B ( ctmn_14513 ) , .ZN ( ctmn_14559 ) ) ;
ND3D0BWP30P140HVT ctmi_16373 ( .A1 ( ctmn_14563_CDR1 ) , 
    .A2 ( ctmn_14567_CDR2 ) , .A3 ( ctmn_14508 ) , .ZN ( ctmn_14568_CDR2 ) ) ;
AN3D0BWP30P140HVT ctmi_16374 ( .A1 ( ctmn_14524 ) , .A2 ( phfnn_3706 ) , 
    .A3 ( ctmn_14522 ) , .Z ( ctmn_14563_CDR1 ) ) ;
AN4D0BWP30P140HVT ctmi_16375 ( .A1 ( ctmn_14566 ) , .A2 ( ctmn_14530 ) , 
    .A3 ( ctmn_14565 ) , .A4 ( ctmn_14564 ) , .Z ( ctmn_14567_CDR2 ) ) ;
OAI21D0BWP30P140HVT ctmi_16376 ( .A1 ( ctmn_14442 ) , 
    .A2 ( \u_ppu/u_requantizer/shamt [4] ) , .B ( ctmn_14513 ) , 
    .ZN ( ctmn_14564 ) ) ;
OAI21D0BWP30P140HVT ctmi_16378 ( .A1 ( ctmn_14375 ) , 
    .A2 ( \u_ppu/u_requantizer/shamt [4] ) , .B ( ctmn_14513 ) , 
    .ZN ( ctmn_14566 ) ) ;
ND4D0BWP30P140HVT ctmi_16379 ( .A1 ( ctmn_14574_CDR4 ) , 
    .A2 ( ctmn_14585_CDR5 ) , .A3 ( ctmn_14597_CDR5 ) , 
    .A4 ( ctmn_14602_CDR5 ) , .ZN ( ctmn_14603_CDR5 ) ) ;
NR4D0BWP30P140HVT ctmi_16380 ( .A1 ( ctmn_14570 ) , .A2 ( ctmn_14573 ) , 
    .A3 ( ctmn_14572 ) , .A4 ( ctmn_14578 ) , .ZN ( ctmn_14574_CDR4 ) ) ;
OAI22D0BWP30P140HVT ctmi_16381 ( .A1 ( ctmn_14330 ) , .A2 ( ctmn_14542 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [0] ) , .B2 ( ctmn_14511 ) , 
    .ZN ( ctmn_14569 ) ) ;
OAI22D0BWP30P140HVT ctmi_16382 ( .A1 ( ctmn_14330 ) , .A2 ( ctmn_14540 ) , 
    .B1 ( HFSNET_12 ) , .B2 ( ctmn_14542 ) , .ZN ( ctmn_14570 ) ) ;
OAI21D0BWP30P140HVT ctmi_16384 ( .A1 ( ctmn_14349 ) , 
    .A2 ( \u_ppu/u_requantizer/shamt [4] ) , .B ( ctmn_14513 ) , 
    .ZN ( ctmn_14571 ) ) ;
OAI22D0BWP30P140HVT ctmi_16385 ( .A1 ( HFSNET_11 ) , .A2 ( ctmn_14571 ) , 
    .B1 ( HFSNET_12 ) , .B2 ( ctmn_14540 ) , .ZN ( ctmn_14573 ) ) ;
NR4D0BWP30P140HVT ctmi_16386 ( .A1 ( phfnn_3739 ) , .A2 ( ctmn_14599 ) , 
    .A3 ( ctmn_14576 ) , .A4 ( ctmn_14581 ) , .ZN ( ctmn_14585_CDR5 ) ) ;
OAI22D0BWP30P140HVT ctmi_16387 ( .A1 ( HFSNET_11 ) , .A2 ( ctmn_14575 ) , 
    .B1 ( HFSNET_12 ) , .B2 ( ctmn_14537 ) , .ZN ( ctmn_14576 ) ) ;
OAI21D0BWP30P140HVT ctmi_16388 ( .A1 ( \u_ppu/u_requantizer/shamt [5] ) , 
    .A2 ( ctmn_14384 ) , .B ( ctmn_14536 ) , .ZN ( ctmn_14575 ) ) ;
OAI22D0BWP30P140HVT ctmi_16389 ( .A1 ( HFSNET_11 ) , .A2 ( ctmn_14538 ) , 
    .B1 ( HFSNET_12 ) , .B2 ( ctmn_14577 ) , .ZN ( ctmn_14578 ) ) ;
OAI21D0BWP30P140HVT ctmi_16390 ( .A1 ( \u_ppu/u_requantizer/shamt [5] ) , 
    .A2 ( ctmn_14339 ) , .B ( ctmn_14536 ) , .ZN ( ctmn_14577 ) ) ;
OAI22D0BWP30P140HVT ctmi_16391 ( .A1 ( HFSNET_11 ) , .A2 ( ctmn_14577 ) , 
    .B1 ( HFSNET_12 ) , .B2 ( phfnn_3703 ) , .ZN ( ctmn_14581 ) ) ;
AOI21D0BWP30P140HVT ctmi_16392 ( .A1 ( ctmn_14415 ) , .A2 ( ctmn_14352 ) , 
    .B ( phfnn_3674 ) , .ZN ( ctmn_14579 ) ) ;
OAI22D0BWP30P140HVT ctmi_16394 ( .A1 ( ctmn_14330 ) , .A2 ( ctmn_14579 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [0] ) , .B2 ( ctmn_14582 ) , 
    .ZN ( ctmn_14583 ) ) ;
AOI21D0BWP30P140HVT ctmi_16395 ( .A1 ( ctmn_14415 ) , .A2 ( ctmn_14360 ) , 
    .B ( phfnn_3674 ) , .ZN ( ctmn_14582 ) ) ;
OR2D1BWP30P140HVT ctmi_1623 ( .A1 ( phfnn_899 ) , .A2 ( ctmn_14805 ) , 
    .Z ( N191 ) ) ;
NR4D0BWP30P140HVT ctmi_16397 ( .A1 ( ctmn_14594 ) , .A2 ( ctmn_14601 ) , 
    .A3 ( ctmn_14588 ) , .A4 ( ctmn_14596 ) , .ZN ( ctmn_14597_CDR5 ) ) ;
OAI22D0BWP30P140HVT ctmi_16398 ( .A1 ( ctmn_14330 ) , .A2 ( ctmn_14586 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [0] ) , .B2 ( ctmn_14587 ) , 
    .ZN ( ctmn_14588 ) ) ;
OAI21D0BWP30P140HVT ctmi_16399 ( .A1 ( \u_ppu/u_requantizer/shamt [5] ) , 
    .A2 ( ctmn_14435 ) , .B ( ctmn_14536 ) , .ZN ( ctmn_14586 ) ) ;
AO21D0BWP30P140HVT ctmi_16400 ( .A1 ( ctmn_14415 ) , .A2 ( ctmn_14445 ) , 
    .B ( phfnn_3674 ) , .Z ( ctmn_14587 ) ) ;
OAI22D0BWP30P140HVT ctmi_16401 ( .A1 ( ctmn_14330 ) , .A2 ( ctmn_14589 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [0] ) , .B2 ( ctmn_14590 ) , 
    .ZN ( ctmn_14591 ) ) ;
OAI21D0BWP30P140HVT ctmi_16402 ( .A1 ( \u_ppu/u_requantizer/shamt [5] ) , 
    .A2 ( ctmn_14451 ) , .B ( ctmn_14536 ) , .ZN ( ctmn_14589 ) ) ;
AO21D0BWP30P140HVT ctmi_16403 ( .A1 ( ctmn_14415 ) , .A2 ( ctmn_14378 ) , 
    .B ( phfnn_3674 ) , .Z ( ctmn_14590 ) ) ;
OAI22D0BWP30P140HVT ctmi_16404 ( .A1 ( ctmn_14330 ) , .A2 ( ctmn_14592 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [0] ) , .B2 ( ctmn_14593 ) , 
    .ZN ( ctmn_14594 ) ) ;
OAI21D0BWP30P140HVT ctmi_16405 ( .A1 ( \u_ppu/u_requantizer/shamt [5] ) , 
    .A2 ( ctmn_14462 ) , .B ( ctmn_14536 ) , .ZN ( ctmn_14592 ) ) ;
AO21D0BWP30P140HVT ctmi_16406 ( .A1 ( ctmn_14415 ) , .A2 ( ctmn_14428 ) , 
    .B ( phfnn_3674 ) , .Z ( ctmn_14593 ) ) ;
OAI22D0BWP30P140HVT ctmi_16407 ( .A1 ( ctmn_14330 ) , .A2 ( ctmn_14500 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [0] ) , .B2 ( ctmn_14595 ) , 
    .ZN ( ctmn_14596 ) ) ;
AO21D0BWP30P140HVT ctmi_16408 ( .A1 ( ctmn_14415 ) , .A2 ( ctmn_14476 ) , 
    .B ( phfnn_3674 ) , .Z ( ctmn_14595 ) ) ;
NR4D0BWP30P140HVT ctmi_16409 ( .A1 ( ctmn_14598 ) , .A2 ( ctmn_14591 ) , 
    .A3 ( ctmn_14512 ) , .A4 ( ctmn_14569 ) , .ZN ( ctmn_14602_CDR5 ) ) ;
OAI22D0BWP30P140HVT ctmi_16410 ( .A1 ( ctmn_14330 ) , .A2 ( ctmn_14587 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [0] ) , .B2 ( ctmn_14589 ) , 
    .ZN ( ctmn_14598 ) ) ;
OAI22D0BWP30P140HVT ctmi_16411 ( .A1 ( ctmn_14330 ) , .A2 ( ctmn_14590 ) , 
    .B1 ( HFSNET_12 ) , .B2 ( ctmn_14575 ) , .ZN ( ctmn_14599 ) ) ;
OAI22D0BWP30P140HVT ctmi_16412 ( .A1 ( ctmn_14330 ) , .A2 ( ctmn_14595 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [0] ) , .B2 ( ctmn_14592 ) , 
    .ZN ( ctmn_14600 ) ) ;
OAI22D0BWP30P140HVT ctmi_16413 ( .A1 ( ctmn_14330 ) , .A2 ( ctmn_14593 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [0] ) , .B2 ( ctmn_14586 ) , 
    .ZN ( ctmn_14601 ) ) ;
ND4D0BWP30P140HVT ctmi_16414 ( .A1 ( ctmn_14622_CDR5 ) , 
    .A2 ( ctmn_14631_CDR5 ) , .A3 ( ctmn_14641_CDR4 ) , 
    .A4 ( ctmn_14648_CDR3 ) , .ZN ( ctmn_14649_CDR5 ) ) ;
NR4D0BWP30P140HVT ctmi_16415 ( .A1 ( ctmn_14608 ) , .A2 ( ctmn_14621 ) , 
    .A3 ( ctmn_14630 ) , .A4 ( ctmn_14647 ) , .ZN ( ctmn_14622_CDR5 ) ) ;
OAI22D0BWP30P140HVT ctmi_16416 ( .A1 ( ctmn_14329 ) , .A2 ( ctmn_14605 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [1] ) , .B2 ( ctmn_14607 ) , 
    .ZN ( ctmn_14608 ) ) ;
OAI22D0BWP30P140HVT ctmi_16417 ( .A1 ( ctmn_14330 ) , .A2 ( ctmn_14582 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [0] ) , .B2 ( ctmn_14604 ) , 
    .ZN ( ctmn_14605 ) ) ;
AOI21D0BWP30P140HVT ctmi_16418 ( .A1 ( ctmn_14415 ) , .A2 ( ctmn_14367 ) , 
    .B ( phfnn_3674 ) , .ZN ( ctmn_14604 ) ) ;
OAI22D0BWP30P140HVT ctmi_16419 ( .A1 ( ctmn_14330 ) , .A2 ( ctmn_14606 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [0] ) , .B2 ( ctmn_14518 ) , 
    .ZN ( ctmn_14607 ) ) ;
OA21D0BWP30P140HVT ctmi_16420 ( .A1 ( \u_ppu/u_requantizer/shamt [5] ) , 
    .A2 ( ctmn_14418 ) , .B ( ctmn_14536 ) , .Z ( ctmn_14606 ) ) ;
OAI22D0BWP30P140HVT ctmi_16421 ( .A1 ( ctmn_14329 ) , .A2 ( ctmn_14610 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [1] ) , .B2 ( ctmn_14549 ) , 
    .ZN ( ctmn_14611 ) ) ;
OAI22D0BWP30P140HVT ctmi_16422 ( .A1 ( HFSNET_11 ) , .A2 ( ctmn_14609 ) , 
    .B1 ( HFSNET_12 ) , .B2 ( ctmn_14541 ) , .ZN ( ctmn_14610 ) ) ;
AOI222D0BWP30P140HVT ctmi_16423 ( .A1 ( ctmn_14571 ) , 
    .A2 ( \u_ppu/u_requantizer/shamt [5] ) , .B1 ( ctmn_14344 ) , 
    .B2 ( ctmn_14353 ) , .C1 ( ctmn_14341 ) , .C2 ( ctmn_14350 ) , 
    .ZN ( ctmn_14609 ) ) ;
OAI22D0BWP30P140HVT ctmi_16424 ( .A1 ( ctmn_14329 ) , .A2 ( ctmn_14616 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [1] ) , .B2 ( ctmn_14618 ) , 
    .ZN ( ctmn_14619 ) ) ;
OAI22D0BWP30P140HVT ctmi_16425 ( .A1 ( HFSNET_11 ) , .A2 ( ctmn_14613 ) , 
    .B1 ( HFSNET_12 ) , .B2 ( ctmn_14615 ) , .ZN ( ctmn_14616 ) ) ;
AOI222D0BWP30P140HVT ctmi_16426 ( .A1 ( ctmn_14556 ) , 
    .A2 ( \u_ppu/u_requantizer/shamt [5] ) , .B1 ( ctmn_14344 ) , 
    .B2 ( ctmn_14394 ) , .C1 ( ctmn_14612 ) , .C2 ( ctmn_14390 ) , 
    .ZN ( ctmn_14613 ) ) ;
AN2D0BWP30P140HVT ctmi_16427 ( .A1 ( phfnn_3662 ) , .A2 ( ctmn_14341 ) , 
    .Z ( ctmn_14612 ) ) ;
AOI222D0BWP30P140HVT ctmi_16428 ( .A1 ( ctmn_14614 ) , 
    .A2 ( \u_ppu/u_requantizer/shamt [5] ) , .B1 ( ctmn_14344 ) , 
    .B2 ( ctmn_14401 ) , .C1 ( ctmn_14612 ) , .C2 ( ctmn_14398 ) , 
    .ZN ( ctmn_14615 ) ) ;
IND3D1BWP30P140HVT ctmi_1624 ( .A1 ( ctmn_13329 ) , .B1 ( HFSNET_25 ) , 
    .B2 ( phfnn_645 ) , .ZN ( \u_mac_and_scale/N13 ) ) ;
OAI22D0BWP30P140HVT ctmi_16430 ( .A1 ( HFSNET_11 ) , .A2 ( ctmn_14617 ) , 
    .B1 ( HFSNET_12 ) , .B2 ( ctmn_14609 ) , .ZN ( ctmn_14618 ) ) ;
AOI222D0BWP30P140HVT ctmi_16431 ( .A1 ( ctmn_14559 ) , 
    .A2 ( \u_ppu/u_requantizer/shamt [5] ) , .B1 ( ctmn_14344 ) , 
    .B2 ( ctmn_14342 ) , .C1 ( ctmn_14612 ) , .C2 ( ctmn_14332 ) , 
    .ZN ( ctmn_14617 ) ) ;
OAI22D0BWP30P140HVT ctmi_16432 ( .A1 ( ctmn_14329 ) , .A2 ( phfnn_3759 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [1] ) , .B2 ( ctmn_14605 ) , 
    .ZN ( ctmn_14621 ) ) ;
NR4D0BWP30P140HVT ctmi_16434 ( .A1 ( ctmn_14626 ) , .A2 ( ctmn_14628 ) , 
    .A3 ( ctmn_14627 ) , .A4 ( ctmn_14611 ) , .ZN ( ctmn_14631_CDR5 ) ) ;
OAI22D0BWP30P140HVT ctmi_16435 ( .A1 ( ctmn_14329 ) , .A2 ( ctmn_14624 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [1] ) , .B2 ( ctmn_14625 ) , 
    .ZN ( ctmn_14626 ) ) ;
OAI22D0BWP30P140HVT ctmi_16436 ( .A1 ( HFSNET_11 ) , .A2 ( ctmn_14623 ) , 
    .B1 ( HFSNET_12 ) , .B2 ( ctmn_14613 ) , .ZN ( ctmn_14624 ) ) ;
AOI222D0BWP30P140HVT ctmi_16437 ( .A1 ( ctmn_14554 ) , 
    .A2 ( \u_ppu/u_requantizer/shamt [5] ) , .B1 ( ctmn_14344 ) , 
    .B2 ( ctmn_14386 ) , .C1 ( ctmn_14382 ) , .C2 ( ctmn_14612 ) , 
    .ZN ( ctmn_14623 ) ) ;
OAI22D0BWP30P140HVT ctmi_16438 ( .A1 ( HFSNET_11 ) , .A2 ( ctmn_14615 ) , 
    .B1 ( HFSNET_12 ) , .B2 ( ctmn_14617 ) , .ZN ( ctmn_14625 ) ) ;
OAI22D0BWP30P140HVT ctmi_16439 ( .A1 ( ctmn_14329 ) , .A2 ( ctmn_14618 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [1] ) , .B2 ( ctmn_14544 ) , 
    .ZN ( ctmn_14627 ) ) ;
OAI22D0BWP30P140HVT ctmi_16440 ( .A1 ( ctmn_14329 ) , .A2 ( ctmn_14625 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [1] ) , .B2 ( ctmn_14610 ) , 
    .ZN ( ctmn_14628 ) ) ;
OAI22D0BWP30P140HVT ctmi_16441 ( .A1 ( ctmn_14329 ) , .A2 ( ctmn_14583 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [1] ) , .B2 ( ctmn_14629 ) , 
    .ZN ( ctmn_14630 ) ) ;
OAI22D0BWP30P140HVT ctmi_16442 ( .A1 ( ctmn_14330 ) , .A2 ( ctmn_14604 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [0] ) , .B2 ( ctmn_14606 ) , 
    .ZN ( ctmn_14629 ) ) ;
NR4D0BWP30P140HVT ctmi_16443 ( .A1 ( ctmn_14632 ) , .A2 ( ctmn_14533 ) , 
    .A3 ( ctmn_14643 ) , .A4 ( ctmn_14636 ) , .ZN ( ctmn_14641_CDR4 ) ) ;
OAI22D0BWP30P140HVT ctmi_16444 ( .A1 ( ctmn_14329 ) , .A2 ( ctmn_14607 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [1] ) , .B2 ( ctmn_14529 ) , 
    .ZN ( ctmn_14632 ) ) ;
OAI22D0BWP30P140HVT ctmi_16445 ( .A1 ( ctmn_14329 ) , .A2 ( ctmn_14532 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [1] ) , .B2 ( ctmn_14635 ) , 
    .ZN ( ctmn_14636 ) ) ;
OAI22D0BWP30P140HVT ctmi_16446 ( .A1 ( ctmn_14330 ) , .A2 ( ctmn_14633 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [0] ) , .B2 ( ctmn_14634 ) , 
    .ZN ( ctmn_14635 ) ) ;
AOI222D0BWP30P140HVT ctmi_16447 ( .A1 ( ctmn_14564 ) , 
    .A2 ( \u_ppu/u_requantizer/shamt [5] ) , .B1 ( ctmn_14344 ) , 
    .B2 ( ctmn_14446 ) , .C1 ( ctmn_14341 ) , .C2 ( ctmn_14443 ) , 
    .ZN ( ctmn_14633 ) ) ;
AOI222D0BWP30P140HVT ctmi_16448 ( .A1 ( ctmn_14565 ) , 
    .A2 ( \u_ppu/u_requantizer/shamt [5] ) , .B1 ( ctmn_14344 ) , 
    .B2 ( ctmn_14452 ) , .C1 ( ctmn_14341 ) , .C2 ( ctmn_14450 ) , 
    .ZN ( ctmn_14634 ) ) ;
OAI22D0BWP30P140HVT ctmi_16449 ( .A1 ( ctmn_14329 ) , .A2 ( ctmn_14629 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [1] ) , .B2 ( ctmn_14521 ) , 
    .ZN ( ctmn_14637 ) ) ;
OAI22D0BWP30P140HVT ctmi_16450 ( .A1 ( ctmn_14329 ) , .A2 ( ctmn_14639 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [1] ) , .B2 ( ctmn_14616 ) , 
    .ZN ( ctmn_14640 ) ) ;
OAI22D0BWP30P140HVT ctmi_16451 ( .A1 ( ctmn_14330 ) , .A2 ( ctmn_14638 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [0] ) , .B2 ( ctmn_14623 ) , 
    .ZN ( ctmn_14639 ) ) ;
AOI222D0BWP30P140HVT ctmi_16452 ( .A1 ( ctmn_14566 ) , 
    .A2 ( \u_ppu/u_requantizer/shamt [5] ) , .B1 ( ctmn_14344 ) , 
    .B2 ( ctmn_14379 ) , .C1 ( ctmn_14341 ) , .C2 ( ctmn_14376 ) , 
    .ZN ( ctmn_14638 ) ) ;
NR4D0BWP30P140HVT ctmi_16453 ( .A1 ( ctmn_14645 ) , .A2 ( ctmn_14646 ) , 
    .A3 ( ctmn_14640 ) , .A4 ( ctmn_14619 ) , .ZN ( ctmn_14648_CDR3 ) ) ;
OAI22D0BWP30P140HVT ctmi_16454 ( .A1 ( ctmn_14329 ) , .A2 ( ctmn_14527 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [1] ) , .B2 ( ctmn_14642 ) , 
    .ZN ( ctmn_14643 ) ) ;
OAI22D0BWP30P140HVT ctmi_16455 ( .A1 ( ctmn_14330 ) , .A2 ( ctmn_14531 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [0] ) , .B2 ( ctmn_14633 ) , 
    .ZN ( ctmn_14642 ) ) ;
OAI22D0BWP30P140HVT ctmi_16456 ( .A1 ( ctmn_14329 ) , .A2 ( ctmn_14644 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [1] ) , .B2 ( ctmn_14624 ) , 
    .ZN ( ctmn_14645 ) ) ;
OAI22D0BWP30P140HVT ctmi_16457 ( .A1 ( ctmn_14330 ) , .A2 ( ctmn_14634 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [0] ) , .B2 ( ctmn_14638 ) , 
    .ZN ( ctmn_14644 ) ) ;
OAI22D0BWP30P140HVT ctmi_16458 ( .A1 ( ctmn_14329 ) , .A2 ( ctmn_14635 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [1] ) , .B2 ( ctmn_14639 ) , 
    .ZN ( ctmn_14646 ) ) ;
OAI22D0BWP30P140HVT ctmi_16459 ( .A1 ( ctmn_14329 ) , .A2 ( ctmn_14642 ) , 
    .B1 ( \u_ppu/u_requantizer/shamt [1] ) , .B2 ( ctmn_14644 ) , 
    .ZN ( ctmn_14647 ) ) ;
ND4D0BWP30P140HVT ctmi_16460 ( .A1 ( ctmn_14652_CDR3 ) , 
    .A2 ( ctmn_14653_CDR4 ) , .A3 ( ctmn_14656_CDR5 ) , .A4 ( ctmn_14669 ) , 
    .ZN ( ctmn_14670 ) ) ;
NR4D0BWP30P140HVT ctmi_16461 ( .A1 ( ctmn_14530 ) , .A2 ( ctmn_14565 ) , 
    .A3 ( ctmn_14564 ) , .A4 ( ctmn_14566 ) , .ZN ( ctmn_14652_CDR3 ) ) ;
NR4D0BWP30P140HVT ctmi_16462 ( .A1 ( ctmn_14522 ) , .A2 ( phfnn_3706 ) , 
    .A3 ( ctmn_14524 ) , .A4 ( ctmn_14508 ) , .ZN ( ctmn_14653_CDR4 ) ) ;
AOI211D0BWP30P140HVT ctmi_16463 ( .A1 ( ctmn_14407 ) , .A2 ( ctmn_14654 ) , 
    .B ( ctmn_14506 ) , .C ( ctmn_14655_CDR5 ) , .ZN ( ctmn_14656_CDR5 ) ) ;
ND4D0BWP30P140HVT ctmi_16464 ( .A1 ( ctmn_14505 ) , .A2 ( ctmn_14481 ) , 
    .A3 ( ctmn_14468 ) , .A4 ( ctmn_14456 ) , .ZN ( ctmn_14654 ) ) ;
NR4D0BWP30P140HVT ctmi_16466 ( .A1 ( ctmn_14657_CDR5 ) , 
    .A2 ( ctmn_14658_CDR3 ) , .A3 ( ctmn_14663_CDR5 ) , 
    .A4 ( ctmn_14668_CDR5 ) , .ZN ( ctmn_14669 ) ) ;
ND4D0BWP30P140HVT ctmi_16467 ( .A1 ( ctmn_14528 ) , .A2 ( ctmn_14637 ) , 
    .A3 ( ctmn_14600 ) , .A4 ( phfnn_3740 ) , .ZN ( ctmn_14657_CDR5 ) ) ;
ND4D0BWP30P140HVT ctmi_16468 ( .A1 ( ctmn_14539 ) , .A2 ( ctmn_14547 ) , 
    .A3 ( ctmn_14548 ) , .A4 ( ctmn_14550 ) , .ZN ( ctmn_14658_CDR3 ) ) ;
FA1D0BWP30P140HVT A14505 ( .A ( N9349 ) , .B ( N9352 ) , .CI ( N165 ) , 
    .CO ( N9358 ) , .S ( N13276 ) ) ;
FA1D0BWP30P140HVT A14506 ( .A ( N9365 ) , .B ( N9369 ) , .CI ( N9370 ) , 
    .CO ( N13277 ) , .S ( \u_mac_and_scale/mult_2/mult01 [2] ) ) ;
FA1D0BWP30P140HVT A14507 ( .A ( N9364 ) , .B ( N13276 ) , .CI ( N13277 ) , 
    .CO ( N11353 ) , .S ( \u_mac_and_scale/mult_2/mult01 [3] ) ) ;
FA1D0BWP30P140HVT A14508 ( .A ( N9449 ) , .B ( N9452 ) , .CI ( N169 ) , 
    .CO ( N9458 ) , .S ( N13278 ) ) ;
FA1D0BWP30P140HVT A14509 ( .A ( N9465 ) , .B ( N9469 ) , .CI ( N9470 ) , 
    .CO ( N13279 ) , .S ( \u_mac_and_scale/mult_3/mult01 [2] ) ) ;
FA1D0BWP30P140HVT A14510 ( .A ( N9464 ) , .B ( N13278 ) , .CI ( N13279 ) , 
    .CO ( N11382 ) , .S ( \u_mac_and_scale/mult_3/mult01 [3] ) ) ;
FA1D0BWP30P140HVT A14511 ( .A ( N9549 ) , .B ( N9552 ) , .CI ( N172 ) , 
    .CO ( N9558 ) , .S ( N13280 ) ) ;
FA1D0BWP30P140HVT A14512 ( .A ( N9565 ) , .B ( N9569 ) , .CI ( N9570 ) , 
    .CO ( N13281 ) , .S ( \u_mac_and_scale/mult_1/mult01 [2] ) ) ;
FA1D0BWP30P140HVT A14513 ( .A ( N9564 ) , .B ( N13280 ) , .CI ( N13281 ) , 
    .CO ( N11411 ) , .S ( \u_mac_and_scale/mult_1/mult01 [3] ) ) ;
FA1D0BWP30P140HVT A14514 ( .A ( N9646 ) , .B ( N9649 ) , .CI ( N175 ) , 
    .CO ( N9655 ) , .S ( N13282 ) ) ;
FA1D0BWP30P140HVT A14515 ( .A ( N9662 ) , .B ( N9666 ) , .CI ( N9667 ) , 
    .CO ( N13283 ) , .S ( \u_mac_and_scale/mult_0/mult01 [2] ) ) ;
FA1D0BWP30P140HVT A14516 ( .A ( N9661 ) , .B ( N13282 ) , .CI ( N13283 ) , 
    .CO ( N11440 ) , .S ( \u_mac_and_scale/mult_0/mult01 [3] ) ) ;
FA1D0BWP30P140HVT A14517 ( .A ( N9776 ) , .B ( N9781 ) , .CI ( N9784 ) , 
    .CO ( N9827 ) , .S ( N11469 ) ) ;
FA1D0BWP30P140HVT A14518 ( .A ( N9792 ) , .B ( N9793 ) , .CI ( N9796 ) , 
    .CO ( N11455 ) , .S ( N13284 ) ) ;
FA1D0BWP30P140HVT A14519 ( .A ( N9806 ) , .B ( N9810 ) , .CI ( N9811 ) , 
    .CO ( N13285 ) , .S ( \u_mac_and_scale/mult_0/mult10 [2] ) ) ;
FA1D0BWP30P140HVT A14520 ( .A ( N9805 ) , .B ( N13284 ) , .CI ( N13285 ) , 
    .CO ( N11464 ) , .S ( \u_mac_and_scale/mult_0/mult10 [3] ) ) ;
FA1D0BWP30P140HVT A14521 ( .A ( N176 ) , .B ( N9753 ) , .CI ( N9757 ) , 
    .CO ( N9823 ) , .S ( N9818 ) ) ;
FA1D0BWP30P140HVT A14522 ( .A ( N9862 ) , .B ( N9863 ) , .CI ( N9866 ) , 
    .CO ( N11506 ) , .S ( N13286 ) ) ;
FA1D0BWP30P140HVT A14523 ( .A ( N9872 ) , .B ( N9876 ) , .CI ( N9877 ) , 
    .CO ( N13287 ) , .S ( \u_mac_and_scale/mult_4_0_top [2] ) ) ;
FA1D0BWP30P140HVT A14524 ( .A ( N9871 ) , .B ( N13286 ) , .CI ( N13287 ) , 
    .CO ( N11517 ) , .S ( \u_mac_and_scale/mult_4_0_top [3] ) ) ;
FA1D0BWP30P140HVT A14525 ( .A ( N9926 ) , .B ( N9927 ) , .CI ( N9929 ) , 
    .CO ( N11558 ) , .S ( N13288 ) ) ;
FA1D0BWP30P140HVT A14526 ( .A ( N9933 ) , .B ( N9937 ) , .CI ( N9938 ) , 
    .CO ( N13289 ) , .S ( N250 ) ) ;
FA1D0BWP30P140HVT A14527 ( .A ( N9932 ) , .B ( N13288 ) , .CI ( N13289 ) , 
    .CO ( N11569 ) , .S ( N249 ) ) ;
FA1D0BWP30P140HVT A14528 ( .A ( N9986 ) , .B ( N9991 ) , .CI ( N9994 ) , 
    .CO ( N10037 ) , .S ( N11604 ) ) ;
FA1D0BWP30P140HVT A14529 ( .A ( N1514 ) , .B ( N10003 ) , .CI ( N178 ) , 
    .CO ( N11590 ) , .S ( N13290 ) ) ;
FA1D0BWP30P140HVT A14530 ( .A ( N10016 ) , .B ( N10020 ) , .CI ( N10021 ) , 
    .CO ( N13291 ) , .S ( \u_mac_and_scale/mult_1/mult10 [2] ) ) ;
FA1D0BWP30P140HVT A14531 ( .A ( N10015 ) , .B ( N13290 ) , .CI ( N13291 ) , 
    .CO ( N11599 ) , .S ( \u_mac_and_scale/mult_1/mult10 [3] ) ) ;
FA1D0BWP30P140HVT A14532 ( .A ( N177 ) , .B ( N9974 ) , .CI ( N9978 ) , 
    .CO ( N10033 ) , .S ( N10028 ) ) ;
FA1D0BWP30P140HVT A14533 ( .A ( N10069 ) , .B ( N10070 ) , .CI ( N10073 ) , 
    .CO ( N11640 ) , .S ( N13292 ) ) ;
FA1D0BWP30P140HVT A14534 ( .A ( N10079 ) , .B ( N10083 ) , .CI ( N10084 ) , 
    .CO ( N13293 ) , .S ( \u_mac_and_scale/mult_4_1_top [2] ) ) ;
FA1D0BWP30P140HVT A14535 ( .A ( N10078 ) , .B ( N13292 ) , .CI ( N13293 ) , 
    .CO ( N11651 ) , .S ( \u_mac_and_scale/mult_4_1_top [3] ) ) ;
FA1D0BWP30P140HVT A14536 ( .A ( N10132 ) , .B ( N10133 ) , .CI ( N10135 ) , 
    .CO ( N11691 ) , .S ( N13294 ) ) ;
FA1D0BWP30P140HVT A14537 ( .A ( N10139 ) , .B ( N10143 ) , .CI ( N10144 ) , 
    .CO ( N13295 ) , .S ( \u_mac_and_scale/mult_4_1_bottom [2] ) ) ;
FA1D0BWP30P140HVT A14538 ( .A ( N10138 ) , .B ( N13294 ) , .CI ( N13295 ) , 
    .CO ( N11702 ) , .S ( \u_mac_and_scale/mult_4_1_bottom [3] ) ) ;
FA1D0BWP30P140HVT A14539 ( .A ( N10192 ) , .B ( N10197 ) , .CI ( N10200 ) , 
    .CO ( N10243 ) , .S ( N11737 ) ) ;
FA1D0BWP30P140HVT A14540 ( .A ( N10208 ) , .B ( N10209 ) , .CI ( N10212 ) , 
    .CO ( N11723 ) , .S ( N13296 ) ) ;
FA1D0BWP30P140HVT A14541 ( .A ( N10222 ) , .B ( N10226 ) , .CI ( N10227 ) , 
    .CO ( N13297 ) , .S ( \u_mac_and_scale/mult_2/mult10 [2] ) ) ;
FA1D0BWP30P140HVT A14542 ( .A ( N10221 ) , .B ( N13296 ) , .CI ( N13297 ) , 
    .CO ( N11732 ) , .S ( \u_mac_and_scale/mult_2/mult10 [3] ) ) ;
FA1D0BWP30P140HVT A14543 ( .A ( N179 ) , .B ( N10180 ) , .CI ( N10184 ) , 
    .CO ( N10239 ) , .S ( N10234 ) ) ;
FA1D0BWP30P140HVT A14544 ( .A ( N10275 ) , .B ( N10276 ) , .CI ( N10279 ) , 
    .CO ( N11773 ) , .S ( N13298 ) ) ;
FA1D0BWP30P140HVT A14545 ( .A ( N10285 ) , .B ( N10289 ) , .CI ( N10290 ) , 
    .CO ( N13299 ) , .S ( \u_mac_and_scale/mult_4_2_top [2] ) ) ;
FA1D0BWP30P140HVT A14546 ( .A ( N10284 ) , .B ( N13298 ) , .CI ( N13299 ) , 
    .CO ( N11784 ) , .S ( \u_mac_and_scale/mult_4_2_top [3] ) ) ;
FA1D0BWP30P140HVT A14547 ( .A ( N10338 ) , .B ( N10339 ) , .CI ( N10341 ) , 
    .CO ( N11824 ) , .S ( N13300 ) ) ;
FA1D0BWP30P140HVT A14548 ( .A ( N10345 ) , .B ( N10349 ) , .CI ( N10350 ) , 
    .CO ( N13301 ) , .S ( N234 ) ) ;
FA1D0BWP30P140HVT A14549 ( .A ( N10344 ) , .B ( N13300 ) , .CI ( N13301 ) , 
    .CO ( N11835 ) , .S ( N233 ) ) ;
FA1D0BWP30P140HVT A14550 ( .A ( N10398 ) , .B ( N10403 ) , .CI ( N10406 ) , 
    .CO ( N10449 ) , .S ( N11867 ) ) ;
FA1D0BWP30P140HVT A14551 ( .A ( N1515 ) , .B ( N10415 ) , .CI ( N181 ) , 
    .CO ( N11853 ) , .S ( N13302 ) ) ;
FA1D0BWP30P140HVT A14552 ( .A ( N10428 ) , .B ( N10432 ) , .CI ( N10433 ) , 
    .CO ( N13303 ) , .S ( \u_mac_and_scale/mult_3/mult10 [2] ) ) ;
FA1D0BWP30P140HVT A14553 ( .A ( N10427 ) , .B ( N13302 ) , .CI ( N13303 ) , 
    .CO ( N11862 ) , .S ( \u_mac_and_scale/mult_3/mult10 [3] ) ) ;
FA1D0BWP30P140HVT A14554 ( .A ( N180 ) , .B ( N10386 ) , .CI ( N10390 ) , 
    .CO ( N10445 ) , .S ( N10440 ) ) ;
FA1D0BWP30P140HVT A14555 ( .A ( N10481 ) , .B ( N10482 ) , .CI ( N10485 ) , 
    .CO ( N11903 ) , .S ( N13304 ) ) ;
FA1D0BWP30P140HVT A14556 ( .A ( N10491 ) , .B ( N10495 ) , .CI ( N10496 ) , 
    .CO ( N13305 ) , .S ( \u_mac_and_scale/mult_4_3_top [2] ) ) ;
FA1D0BWP30P140HVT A14557 ( .A ( N10490 ) , .B ( N13304 ) , .CI ( N13305 ) , 
    .CO ( N11914 ) , .S ( \u_mac_and_scale/mult_4_3_top [3] ) ) ;
FA1D0BWP30P140HVT A14558 ( .A ( N10544 ) , .B ( N10545 ) , .CI ( N10547 ) , 
    .CO ( N11954 ) , .S ( N13306 ) ) ;
FA1D0BWP30P140HVT A14559 ( .A ( N10551 ) , .B ( N10555 ) , .CI ( N10556 ) , 
    .CO ( N13307 ) , .S ( \u_mac_and_scale/mult_4_3_bottom [2] ) ) ;
FA1D0BWP30P140HVT A14560 ( .A ( N10550 ) , .B ( N13306 ) , .CI ( N13307 ) , 
    .CO ( N11965 ) , .S ( \u_mac_and_scale/mult_4_3_bottom [3] ) ) ;
NR2D0BWP30P140HVT ctmi_14592 ( .A1 ( ctmn_13308 ) , 
    .A2 ( \u_controller/state [0] ) , .ZN ( ctmn_13309 ) ) ;
ND2D0BWP30P140HVT ctmi_14598 ( .A1 ( chp_slct ) , .A2 ( pe_ready ) , 
    .ZN ( ctmn_13317 ) ) ;
ND2D0BWP30P140HVT ctmi_14600 ( .A1 ( ctmn_13312 ) , 
    .A2 ( \u_controller/opcode_reg [2] ) , .ZN ( ctmn_13313 ) ) ;
NR2D0BWP30P140HVT ctmi_14601 ( .A1 ( \u_controller/opcode_reg [4] ) , 
    .A2 ( \u_controller/opcode_reg [3] ) , .ZN ( ctmn_13312 ) ) ;
NR2D0BWP30P140HVT ctmi_14603 ( .A1 ( \u_controller/opcode_reg [0] ) , 
    .A2 ( \u_controller/opcode_reg [1] ) , .ZN ( ctmn_13315 ) ) ;
ND2D0BWP30P140HVT ctmi_14609 ( .A1 ( \u_controller/opcode_reg [0] ) , 
    .A2 ( ctmn_13312 ) , .ZN ( ctmn_13321 ) ) ;
NR2D0BWP30P140HVT ctmi_14613 ( .A1 ( ctmn_13321 ) , 
    .A2 ( \u_controller/opcode_reg [1] ) , .ZN ( ctmn_13323 ) ) ;
ND4D0BWP30P140HVT ctmi_14617 ( .A1 ( ctmn_13315 ) , 
    .A2 ( \u_controller/opcode_reg [3] ) , .A3 ( HFSNET_17 ) , 
    .A4 ( ctmn_13326 ) , .ZN ( ctmn_13327 ) ) ;
NR2D0BWP30P140HVT ctmi_14618 ( .A1 ( \u_controller/opcode_reg [4] ) , 
    .A2 ( \u_controller/opcode_reg [2] ) , .ZN ( ctmn_13326 ) ) ;
ND3D0BWP30P140HVT ctmi_14621 ( .A1 ( \u_controller/opcode_reg [1] ) , 
    .A2 ( HFSNET_17 ) , .A3 ( ctmn_13313 ) , .ZN ( ctmn_13328 ) ) ;
OAI211D1BWP30P140HVT ctmi_644 ( .A1 ( ctmn_14679 ) , .A2 ( phfnn_3194 ) , 
    .B ( ctmn_14682 ) , .C ( phfnn_843 ) , .ZN ( ctmn_14707 ) ) ;
AO21D0BWP30P140HVT \RS_OP_250_54632_65499_J1/ctmi_188 ( 
    .A1 ( \RS_OP_250_54632_65499_J1/N97 ) , .A2 ( phfnn_648 ) , 
    .B ( \RS_OP_250_54632_65499_J1/ctmn_152 ) , .Z ( N322 ) ) ;
AO21D0BWP30P140HVT \RS_OP_250_54632_65499_J1/ctmi_189 ( 
    .A1 ( \RS_OP_250_54632_65499_J1/N98 ) , .A2 ( phfnn_648 ) , 
    .B ( \RS_OP_250_54632_65499_J1/ctmn_152 ) , .Z ( N323 ) ) ;
XOR3UD0BWP30P140HVT A282 ( .A1 ( \u_mac_and_scale/stitch_ext_2[22] ) , 
    .A2 ( \DP_OP_244_18871_65499_J1/N_100 ) , 
    .A3 ( \u_mac_and_scale/stitch_lo_ext[38] ) , .Z ( N199 ) ) ;
MOAI22D0BWP30P140HVT ctmi_649 ( .A1 ( phfnn_3835 ) , .A2 ( ctmn_14908 ) , 
    .B1 ( phfnn_2563 ) , .B2 ( ctmn_14751 ) , .ZN ( ctmn_14990 ) ) ;
AN2D0BWP30P140HVT ctmi_650 ( .A1 ( phfnn_3840 ) , .A2 ( ctmn_14751 ) , 
    .Z ( ctmn_14908 ) ) ;
AN2D0BWP30P140HVT ctmi_653 ( .A1 ( ctmn_13500 ) , .A2 ( phfnn_2417 ) , 
    .Z ( ctmn_13530 ) ) ;
CKLNQD1BWP30P140 \clock_gate_u_io_block/data_out_r_reg ( .CP ( clk ) , 
    .E ( \u_controller/N47 ) , .TE ( optlc_net_4013 ) , 
    .Q ( \clk_clock_gate_u_io_block/data_out_r_reg ) ) ;
CKLNQD1BWP30P140 \clock_gate_u_io_block/operand_A_reg_r_reg ( .CP ( clk ) , 
    .E ( \u_io_block/wr_en_A ) , .TE ( optlc_net_4012 ) , 
    .Q ( \clk_clock_gate_u_io_block/operand_A_reg_r_reg ) ) ;
CKLNQD1BWP30P140 \clock_gate_u_io_block/operand_B_reg_r_reg ( .CP ( clk ) , 
    .E ( \u_io_block/wr_en_B ) , .TE ( optlc_net_4001 ) , 
    .Q ( \clk_clock_gate_u_io_block/operand_B_reg_r_reg ) ) ;
CKLNQD1BWP30P140 \clock_gate_u_mac_and_scale/accumulator_reg ( .CP ( clk ) , 
    .E ( \u_mac_and_scale/N13 ) , .TE ( optlc_net_4001 ) , 
    .Q ( \clk_clock_gate_u_mac_and_scale/accumulator_reg ) ) ;
CKLNQD1BWP30P140 \clock_gate_u_mac_and_scale/holding_reg_reg ( .CP ( clk ) , 
    .E ( acc_load ) , .TE ( optlc_net_4013 ) , 
    .Q ( \clk_clock_gate_u_mac_and_scale/holding_reg_reg ) ) ;
MAOI222D0BWP30P140HVT ctmi_15207 ( .A ( N11455 ) , .B ( ctmn_13712 ) , 
    .C ( ctmn_13713 ) , .ZN ( ctmn_13718 ) ) ;
OAI22D0BWP30P140HVT ctmi_15242 ( .A1 ( ctmn_13682 ) , .A2 ( ctmn_13620 ) , 
    .B1 ( ctmn_13614 ) , .B2 ( ctmn_13668 ) , .ZN ( ctmn_13743 ) ) ;
XNR2UD0BWP30P140HVT ctmi_15244 ( .A1 ( N197 ) , .A2 ( ctmn_13735 ) , 
    .ZN ( ctmn_13746 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15246 ( .A ( phfnn_3770 ) , .B ( ctmn_13754 ) , 
    .C ( ctmn_13756 ) , .ZN ( ctmn_13757 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15247 ( .A ( ctmn_13725 ) , .B ( ctmn_13748 ) , 
    .C ( ctmn_13749 ) , .ZN ( ctmn_13750 ) ) ;
NR2D0BWP30P140HVT ctmi_15248 ( .A1 ( ctmn_13608 ) , .A2 ( ctmn_13668 ) , 
    .ZN ( ctmn_13748 ) ) ;
ND2D0BWP30P140HVT ctmi_15249 ( .A1 ( ctmn_13730 ) , .A2 ( phfnn_3713 ) , 
    .ZN ( ctmn_13749 ) ) ;
XNR2UD0BWP30P140HVT ctmi_15251 ( .A1 ( ctmn_13740 ) , .A2 ( ctmn_13753 ) , 
    .ZN ( ctmn_13754 ) ) ;
OAI21D0BWP30P140HVT ctmi_15252 ( .A1 ( ctmn_13739 ) , .A2 ( ctmn_13741 ) , 
    .B ( ctmn_13752 ) , .ZN ( ctmn_13753 ) ) ;
ND2D0BWP30P140HVT ctmi_15253 ( .A1 ( ctmn_13741 ) , .A2 ( ctmn_13739 ) , 
    .ZN ( ctmn_13752 ) ) ;
OAI21D0BWP30P140HVT ctmi_15254 ( .A1 ( ctmn_13755 ) , .A2 ( ctmn_13731 ) , 
    .B ( ctmn_13743 ) , .ZN ( ctmn_13756 ) ) ;
ND2D0BWP30P140HVT ctmi_15255 ( .A1 ( operand_B_reg[6] ) , .A2 ( phfnn_3717 ) , 
    .ZN ( ctmn_13755 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15256 ( .A ( ctmn_13758 ) , .B ( ctmn_13761 ) , 
    .C ( phfnn_3805 ) , .ZN ( ctmn_13771 ) ) ;
XOR3UD0BWP30P140HVT ctmi_15257 ( .A1 ( ctmn_13756 ) , .A2 ( ctmn_13754 ) , 
    .A3 ( ctmn_13750 ) , .Z ( ctmn_13758 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15258 ( .A ( N11506 ) , .B ( ctmn_13759 ) , 
    .C ( ctmn_13760 ) , .ZN ( ctmn_13761 ) ) ;
OAI32D0BWP30P140HVT ctmi_15259 ( .A1 ( ctmn_13741 ) , .A2 ( ctmn_13686 ) , 
    .A3 ( ctmn_13620 ) , .B1 ( ctmn_13741 ) , .B2 ( ctmn_13755 ) , 
    .ZN ( ctmn_13759 ) ) ;
ND2D0BWP30P140HVT ctmi_15260 ( .A1 ( operand_B_reg[4] ) , .A2 ( ctmn_13734 ) , 
    .ZN ( ctmn_13760 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15261 ( .A ( phfnn_3787 ) , .B ( ctmn_13765 ) , 
    .C ( ctmn_13768 ) , .ZN ( ctmn_13769 ) ) ;
XNR2UD0BWP30P140HVT ctmi_15263 ( .A1 ( ctmn_13748 ) , .A2 ( ctmn_13764 ) , 
    .ZN ( ctmn_13765 ) ) ;
AOI21D0BWP30P140HVT ctmi_15264 ( .A1 ( ctmn_13749 ) , .A2 ( ctmn_13725 ) , 
    .B ( ctmn_13763 ) , .ZN ( ctmn_13764 ) ) ;
NR2D0BWP30P140HVT ctmi_15265 ( .A1 ( ctmn_13749 ) , .A2 ( ctmn_13725 ) , 
    .ZN ( ctmn_13763 ) ) ;
XNR2UD0BWP30P140HVT ctmi_15266 ( .A1 ( ctmn_13759 ) , .A2 ( ctmn_13767 ) , 
    .ZN ( ctmn_13768 ) ) ;
AOI21D0BWP30P140HVT ctmi_15267 ( .A1 ( ctmn_13760 ) , .A2 ( N11506 ) , 
    .B ( ctmn_13766 ) , .ZN ( ctmn_13767 ) ) ;
NR2D0BWP30P140HVT ctmi_15268 ( .A1 ( ctmn_13760 ) , .A2 ( N11506 ) , 
    .ZN ( ctmn_13766 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15271 ( .A ( ctmn_13746 ) , .B ( ctmn_13742 ) , 
    .C ( phfnn_3752 ) , .ZN ( ctmn_13774 ) ) ;
AOI21D0BWP30P140HVT ctmi_15599 ( .A1 ( ctmn_13981 ) , .A2 ( N11558 ) , 
    .B ( ctmn_13982 ) , .ZN ( ctmn_13983 ) ) ;
ND2D0BWP30P140HVT ctmi_15600 ( .A1 ( operand_B_reg[0] ) , .A2 ( ctmn_13954 ) , 
    .ZN ( ctmn_13981 ) ) ;
NR2D0BWP30P140HVT ctmi_15601 ( .A1 ( ctmn_13981 ) , .A2 ( N11558 ) , 
    .ZN ( ctmn_13982 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15602 ( .A ( N11558 ) , .B ( phfnn_3777 ) , 
    .C ( ctmn_13981 ) , .ZN ( ctmn_13986 ) ) ;
XOR3UD0BWP30P140HVT ctmi_15603 ( .A1 ( ctmn_13987 ) , .A2 ( ctmn_13990 ) , 
    .A3 ( ctmn_13991 ) , .Z ( ctmn_13992 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15604 ( .A ( ctmn_13778 ) , .B ( ctmn_13974 ) , 
    .C ( ctmn_13973 ) , .ZN ( ctmn_13987 ) ) ;
XOR2UD0BWP30P140HVT ctmi_15605 ( .A1 ( ctmn_13955 ) , .A2 ( ctmn_13989 ) , 
    .Z ( ctmn_13990 ) ) ;
OAI21D0BWP30P140HVT ctmi_15606 ( .A1 ( ctmn_13958 ) , .A2 ( ctmn_13956 ) , 
    .B ( ctmn_13959 ) , .ZN ( ctmn_13989 ) ) ;
AOI21D0BWP30P140HVT ctmi_15608 ( .A1 ( ctmn_13957 ) , .A2 ( phfnn_3121 ) , 
    .B ( ctmn_13969 ) , .ZN ( ctmn_13991 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15609 ( .A ( ctmn_13990 ) , .B ( ctmn_13991 ) , 
    .C ( ctmn_13987 ) , .ZN ( ctmn_13994 ) ) ;
AOI211D0BWP30P140HVT ctmi_15610 ( .A1 ( phfnn_3763 ) , .A2 ( phfnn_3766 ) , 
    .B ( ctmn_13960 ) , .C ( ctmn_13997 ) , .ZN ( ctmn_13998 ) ) ;
XOR2UD0BWP30P140HVT ctmi_15614 ( .A1 ( ctmn_13993 ) , .A2 ( ctmn_14001 ) , 
    .Z ( \u_mac_and_scale/mult_4_0_bottom[6] ) ) ;
AOI21D0BWP30P140HVT ctmi_15615 ( .A1 ( ctmn_13972 ) , .A2 ( ctmn_13994 ) , 
    .B ( ctmn_14000 ) , .ZN ( ctmn_14001 ) ) ;
NR2D0BWP30P140HVT ctmi_15616 ( .A1 ( ctmn_13972 ) , .A2 ( ctmn_13994 ) , 
    .ZN ( ctmn_14000 ) ) ;
NR2D0BWP30P140HVT ctmi_15671 ( .A1 ( ctmn_13790 ) , .A2 ( ctmn_13561 ) , 
    .ZN ( ctmn_14032 ) ) ;
AOI21D0BWP30P140HVT ctmi_15673 ( .A1 ( ctmn_14035 ) , .A2 ( N11691 ) , 
    .B ( ctmn_14036 ) , .ZN ( ctmn_14037 ) ) ;
ND2D0BWP30P140HVT ctmi_15674 ( .A1 ( operand_B_reg[8] ) , .A2 ( ctmn_14008 ) , 
    .ZN ( ctmn_14035 ) ) ;
NR2D0BWP30P140HVT ctmi_15675 ( .A1 ( ctmn_14035 ) , .A2 ( N11691 ) , 
    .ZN ( ctmn_14036 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15676 ( .A ( N11691 ) , .B ( phfnn_3776 ) , 
    .C ( ctmn_14035 ) , .ZN ( ctmn_14040 ) ) ;
XOR3UD0BWP30P140HVT ctmi_15677 ( .A1 ( ctmn_14041 ) , .A2 ( ctmn_14044 ) , 
    .A3 ( ctmn_14045 ) , .Z ( ctmn_14046 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15678 ( .A ( ctmn_13834 ) , .B ( ctmn_14028 ) , 
    .C ( ctmn_14027 ) , .ZN ( ctmn_14041 ) ) ;
XOR2UD0BWP30P140HVT ctmi_15679 ( .A1 ( ctmn_14009 ) , .A2 ( ctmn_14043 ) , 
    .Z ( ctmn_14044 ) ) ;
OAI21D0BWP30P140HVT ctmi_15680 ( .A1 ( ctmn_14012 ) , .A2 ( ctmn_14010 ) , 
    .B ( ctmn_14013 ) , .ZN ( ctmn_14043 ) ) ;
AOI21D0BWP30P140HVT ctmi_15682 ( .A1 ( ctmn_14011 ) , .A2 ( phfnn_747 ) , 
    .B ( ctmn_14023 ) , .ZN ( ctmn_14045 ) ) ;
MAOI222D0BWP30P140HVT ctmi_15683 ( .A ( ctmn_14044 ) , .B ( ctmn_14045 ) , 
    .C ( ctmn_14041 ) , .ZN ( ctmn_14048 ) ) ;
AOI211D0BWP30P140HVT ctmi_15684 ( .A1 ( phfnn_3760 ) , .A2 ( phfnn_3765 ) , 
    .B ( ctmn_14014 ) , .C ( ctmn_14051 ) , .ZN ( ctmn_14052 ) ) ;
XOR2UD0BWP30P140HVT ctmi_15688 ( .A1 ( ctmn_14047 ) , .A2 ( ctmn_14055 ) , 
    .Z ( \u_mac_and_scale/mult_4_1_bottom [6] ) ) ;
AOI21D0BWP30P140HVT ctmi_15689 ( .A1 ( ctmn_14026 ) , .A2 ( ctmn_14048 ) , 
    .B ( ctmn_14054 ) , .ZN ( ctmn_14055 ) ) ;
NR2D0BWP30P140HVT ctmi_15690 ( .A1 ( ctmn_14026 ) , .A2 ( ctmn_14048 ) , 
    .ZN ( ctmn_14054 ) ) ;
OR4D1BWP30P140HVT ctmi_16474 ( .A1 ( ctmn_14664_CDR5 ) , 
    .A2 ( ctmn_14665_CDR5 ) , .A3 ( ctmn_14666_CDR5 ) , 
    .A4 ( ctmn_14667_CDR3 ) , .Z ( ctmn_14668_CDR5 ) ) ;
ND4D0BWP30P140HVT ctmi_16475 ( .A1 ( ctmn_14621 ) , .A2 ( ctmn_14608 ) , 
    .A3 ( ctmn_14630 ) , .A4 ( ctmn_14647 ) , .ZN ( ctmn_14664_CDR5 ) ) ;
ND4D0BWP30P140HVT ctmi_16476 ( .A1 ( ctmn_14626 ) , .A2 ( ctmn_14628 ) , 
    .A3 ( ctmn_14627 ) , .A4 ( ctmn_14611 ) , .ZN ( ctmn_14665_CDR5 ) ) ;
ND4D0BWP30P140HVT ctmi_16477 ( .A1 ( ctmn_14533 ) , .A2 ( ctmn_14632 ) , 
    .A3 ( ctmn_14636 ) , .A4 ( ctmn_14643 ) , .ZN ( ctmn_14666_CDR5 ) ) ;
ND4D0BWP30P140HVT ctmi_16478 ( .A1 ( ctmn_14646 ) , .A2 ( ctmn_14645 ) , 
    .A3 ( ctmn_14640 ) , .A4 ( ctmn_14619 ) , .ZN ( ctmn_14667_CDR3 ) ) ;
OAI32D0BWP30P140HVT ctmi_16480 ( .A1 ( phfnn_3803 ) , .A2 ( ctmn_14651 ) , 
    .A3 ( ctmn_14484 ) , .B1 ( ctmn_14670 ) , .B2 ( ctmn_14675 ) , 
    .ZN ( ctmn_14676 ) ) ;
OR4D1BWP30P140HVT ctmi_16481 ( .A1 ( ctmn_14483 ) , .A2 ( ctmn_14457 ) , 
    .A3 ( ctmn_14471 ) , .A4 ( ctmn_14493 ) , .Z ( ctmn_14675 ) ) ;
AOI21D0BWP30P140HVT ctmi_16482 ( .A1 ( HFSNET_18 ) , .A2 ( ctmn_14681 ) , 
    .B ( phfnn_3829 ) , .ZN ( ctmn_14684 ) ) ;
NR2D0BWP30P140HVT ctmi_16483 ( .A1 ( ctmn_14508 ) , .A2 ( ctmn_14680 ) , 
    .ZN ( ctmn_14681 ) ) ;
AN2D0BWP30P140HVT ctmi_16484 ( .A1 ( ctmn_14679 ) , .A2 ( ctmn_14676 ) , 
    .Z ( ctmn_14680 ) ) ;
OAI21D0BWP30P140HVT ctmi_16485 ( .A1 ( ctmn_14493 ) , .A2 ( phfnn_2514 ) , 
    .B ( ctmn_14496 ) , .ZN ( ctmn_14679 ) ) ;
MUX2D0BWP30P140HVT ctmi_679 ( .I0 ( phfnn_3788 ) , .I1 ( ctmn_14218 ) , 
    .S ( ctmn_15228 ) , .Z ( \u_mac_and_scale/mult_4_1_top [4] ) ) ;
ND2D0BWP30P140HVT ctmi_16487 ( .A1 ( ctmn_14672 ) , .A2 ( HFSNET_15 ) , 
    .ZN ( ctmn_14682 ) ) ;
XNR2UD0BWP30P140HVT ctmi_681 ( .A1 ( ctmn_15245 ) , .A2 ( ctmn_15248 ) , 
    .ZN ( \DP_OP_248_26668_65499_J1/N_1 ) ) ;
NR2D0BWP30P140HVT ctmi_16491 ( .A1 ( HFSNET_1 ) , .A2 ( phfnn_3854 ) , 
    .ZN ( ctmn_14693 ) ) ;
OAI21D0BWP30P140HVT ctmi_16493 ( .A1 ( ctmn_14490 ) , .A2 ( ctmn_14488 ) , 
    .B ( ctmn_14677 ) , .ZN ( ctmn_14688 ) ) ;
AOI21D0BWP30P140HVT ctmi_16494 ( .A1 ( ctmn_14690 ) , .A2 ( ctmn_14677 ) , 
    .B ( phfnn_3837 ) , .ZN ( ctmn_14691 ) ) ;
AOI21D0BWP30P140HVT ctmi_16495 ( .A1 ( phfnn_3795 ) , .A2 ( ctmn_14487 ) , 
    .B ( ctmn_14488 ) , .ZN ( ctmn_14690 ) ) ;
MUX2D0BWP30P140HVT ctmi_686 ( .I0 ( phfnn_3790 ) , .I1 ( ctmn_14298 ) , 
    .S ( ctmn_15263 ) , .Z ( \u_mac_and_scale/mult_4_3_top [4] ) ) ;
AOI21D0BWP30P140HVT ctmi_16507 ( .A1 ( ctmn_14703 ) , .A2 ( phfnn_3804 ) , 
    .B ( ctmn_14704 ) , .ZN ( ctmn_14705 ) ) ;
NR2D0BWP30P140HVT ctmi_16512 ( .A1 ( phfnn_867 ) , .A2 ( act_fn_sel[0] ) , 
    .ZN ( ctmn_14714 ) ) ;
ND2D0BWP30P140HVT ctmi_16521 ( .A1 ( ctmn_14719 ) , .A2 ( HFSNET_1 ) , 
    .ZN ( ctmn_14720 ) ) ;
NR2D0BWP30P140HVT ctmi_16522 ( .A1 ( ctmn_14686 ) , .A2 ( ctmn_14691 ) , 
    .ZN ( ctmn_14719 ) ) ;
NR2D0BWP30P140HVT ctmi_16524 ( .A1 ( act_fn_sel[0] ) , .A2 ( phfnn_3831 ) , 
    .ZN ( ctmn_14721 ) ) ;
NR2D0BWP30P140HVT ctmi_16526 ( .A1 ( ctmn_14725 ) , .A2 ( ctmn_14726 ) , 
    .ZN ( ctmn_14727 ) ) ;
AO21D0BWP30P140HVT \RS_OP_250_54632_65499_J1/ctmi_186 ( .A1 ( phfnn_3893 ) , 
    .A2 ( phfnn_648 ) , .B ( \RS_OP_250_54632_65499_J1/ctmn_152 ) , 
    .Z ( N306 ) ) ;
NR2D0BWP30P140HVT ctmi_16529 ( .A1 ( ctmn_14707 ) , .A2 ( act_fn_sel[0] ) , 
    .ZN ( ctmn_14726 ) ) ;
NR2D0BWP30P140HVT ctmi_16530 ( .A1 ( act_fn_sel[1] ) , .A2 ( phfnn_3840 ) , 
    .ZN ( ctmn_14732 ) ) ;
OAI21D0BWP30P140HVT ctmi_16532 ( .A1 ( ctmn_14704 ) , .A2 ( ctmn_14483 ) , 
    .B ( phfnn_3828 ) , .ZN ( ctmn_14729 ) ) ;
AN2D0BWP30P140HVT \RS_OP_250_54632_65499_J1/ctmi_187 ( 
    .A1 ( \u_mac_and_scale/N7 ) , .A2 ( \RS_OP_250_54632_65499_J1/N103 ) , 
    .Z ( \RS_OP_250_54632_65499_J1/ctmn_152 ) ) ;
FA1D0BWP30P140HVT \u_mac_and_scale/add_188/U_3 ( 
    .A ( \u_mac_and_scale/addend_lo [1] ) , 
    .B ( \u_mac_and_scale/gated_lo_feedback [1] ) , 
    .CI ( \u_mac_and_scale/add_188/N_67 ) , 
    .CO ( \u_mac_and_scale/add_188/N_71 ) , 
    .S ( \u_mac_and_scale/lower_sum [1] ) ) ;
AN2D0BWP30P140HVT \u_mac_and_scale/add_188/ctmi_17332 ( 
    .A1 ( \u_mac_and_scale/gated_lo_feedback [0] ) , 
    .A2 ( \u_mac_and_scale/addend_lo [0] ) , 
    .Z ( \u_mac_and_scale/add_188/N_67 ) ) ;
OAI32D0BWP30P140HVT ctmi_16537 ( .A1 ( ctmn_14755 ) , .A2 ( ctmn_14757 ) , 
    .A3 ( phfnn_1420 ) , .B1 ( ctmn_14755 ) , .B2 ( ctmn_14748 ) , 
    .ZN ( ctmn_14758 ) ) ;
OAI211D0BWP30P140HVT ctmi_16538 ( .A1 ( ctmn_14746 ) , .A2 ( phfnn_2546 ) , 
    .B ( ctmn_14750 ) , .C ( ctmn_14754 ) , .ZN ( ctmn_14755 ) ) ;
AOI221D0BWP30P140HVT ctmi_16539 ( .A1 ( phfnn_3881 ) , .A2 ( phfnn_878 ) , 
    .B1 ( ctmn_14740 ) , .B2 ( phfnn_2014 ) , .C ( ctmn_14745 ) , 
    .ZN ( ctmn_14746 ) ) ;
NR2D0BWP30P140HVT ctmi_16541 ( .A1 ( ctmn_14697 ) , .A2 ( ctmn_14707 ) , 
    .ZN ( ctmn_14736 ) ) ;
FA1D0BWP30P140HVT \u_mac_and_scale/add_188/U_5 ( 
    .A ( \u_mac_and_scale/addend_lo [2] ) , 
    .B ( \u_mac_and_scale/gated_lo_feedback [2] ) , 
    .CI ( \u_mac_and_scale/add_188/N_71 ) , 
    .CO ( \u_mac_and_scale/add_188/N_74 ) , 
    .S ( \u_mac_and_scale/lower_sum [2] ) ) ;
NR2D0BWP30P140HVT ctmi_16543 ( .A1 ( HFSNET_0 ) , .A2 ( ctmn_14691 ) , 
    .ZN ( ctmn_14740 ) ) ;
FA1D0BWP30P140HVT \u_mac_and_scale/add_188/U_8 ( 
    .A ( \u_mac_and_scale/addend_lo [3] ) , 
    .B ( \u_mac_and_scale/gated_lo_feedback [3] ) , 
    .CI ( \u_mac_and_scale/add_188/N_74 ) , 
    .CO ( \u_mac_and_scale/add_188/N_78 ) , 
    .S ( \u_mac_and_scale/lower_sum [3] ) ) ;
FA1D0BWP30P140HVT \u_mac_and_scale/add_188/U_10 ( 
    .A ( \u_mac_and_scale/addend_lo [4] ) , 
    .B ( \u_mac_and_scale/gated_lo_feedback [4] ) , 
    .CI ( \u_mac_and_scale/add_188/N_78 ) , 
    .CO ( \u_mac_and_scale/add_188/N_81 ) , 
    .S ( \u_mac_and_scale/lower_sum [4] ) ) ;
FA1D0BWP30P140HVT \u_mac_and_scale/add_188/U_13 ( 
    .A ( \u_mac_and_scale/addend_lo [5] ) , 
    .B ( \u_mac_and_scale/gated_lo_feedback [5] ) , 
    .CI ( \u_mac_and_scale/add_188/N_81 ) , 
    .CO ( \u_mac_and_scale/add_188/N_85 ) , 
    .S ( \u_mac_and_scale/lower_sum [5] ) ) ;
AOI31D0BWP30P140HVT ctmi_16550 ( .A1 ( phfnn_2590 ) , .A2 ( ctmn_14747 ) , 
    .A3 ( ctmn_14749 ) , .B ( ctmn_14732 ) , .ZN ( ctmn_14750 ) ) ;
NR2D0BWP30P140HVT ctmi_16551 ( .A1 ( ctmn_14697 ) , .A2 ( phfnn_3841 ) , 
    .ZN ( ctmn_14747 ) ) ;
NR2D0BWP30P140HVT ctmi_16552 ( .A1 ( ctmn_14748 ) , .A2 ( phfnn_2546 ) , 
    .ZN ( ctmn_14749 ) ) ;
FA1D0BWP30P140HVT \u_mac_and_scale/add_188/U_15 ( 
    .A ( \u_mac_and_scale/addend_lo [6] ) , 
    .B ( \u_mac_and_scale/gated_lo_feedback [6] ) , 
    .CI ( \u_mac_and_scale/add_188/N_85 ) , 
    .CO ( \u_mac_and_scale/add_188/N_88 ) , 
    .S ( \u_mac_and_scale/lower_sum [6] ) ) ;
AOI31D0BWP30P140HVT ctmi_16554 ( .A1 ( phfnn_2546 ) , .A2 ( phfnn_3841 ) , 
    .A3 ( ctmn_14751 ) , .B ( ctmn_14753 ) , .ZN ( ctmn_14754 ) ) ;
AOI211D0BWP30P140HVT ctmi_16556 ( .A1 ( phfnn_3835 ) , .A2 ( ctmn_14752 ) , 
    .B ( phfnn_1416 ) , .C ( ctmn_14751 ) , .ZN ( ctmn_14753 ) ) ;
AOI21D0BWP30P140HVT ctmi_16557 ( .A1 ( act_fn_sel[1] ) , .A2 ( ctmn_14697 ) , 
    .B ( phfnn_2546 ) , .ZN ( ctmn_14752 ) ) ;
OAI33D0BWP30P140HVT ctmi_16558 ( .A1 ( phfnn_3836 ) , .A2 ( phfnn_3881 ) , 
    .A3 ( phfnn_3844 ) , .B1 ( phfnn_1416 ) , .B2 ( phfnn_3878 ) , 
    .B3 ( phfnn_3838 ) , .ZN ( ctmn_14757 ) ) ;
FA1D0BWP30P140HVT \u_mac_and_scale/add_188/U_18 ( 
    .A ( \u_mac_and_scale/addend_lo [7] ) , 
    .B ( \u_mac_and_scale/gated_lo_feedback [7] ) , 
    .CI ( \u_mac_and_scale/add_188/N_88 ) , 
    .CO ( \u_mac_and_scale/add_188/N_92 ) , 
    .S ( \u_mac_and_scale/lower_sum [7] ) ) ;
AOI21D0BWP30P140HVT ctmi_16560 ( .A1 ( phfnn_3830 ) , .A2 ( act_fn_sel[0] ) , 
    .B ( act_fn_sel[2] ) , .ZN ( ctmn_14760 ) ) ;
NR3D0BWP30P140HVT ctmi_16561 ( .A1 ( ctmn_14748 ) , .A2 ( act_fn_sel[2] ) , 
    .A3 ( ctmn_14734 ) , .ZN ( ctmn_14761 ) ) ;
NR2D0BWP30P140HVT ctmi_16629 ( .A1 ( phfnn_1420 ) , .A2 ( phfnn_3843 ) , 
    .ZN ( ctmn_14824 ) ) ;
NR2D0BWP30P140HVT ctmi_16630 ( .A1 ( phfnn_3843 ) , .A2 ( phfnn_3836 ) , 
    .ZN ( ctmn_14825 ) ) ;
AOI221D0BWP30P140HVT ctmi_16631 ( .A1 ( phfnn_3840 ) , .A2 ( ctmn_14831 ) , 
    .B1 ( ctmn_14720 ) , .B2 ( ctmn_14767 ) , .C ( ctmn_14732 ) , 
    .ZN ( ctmn_14832 ) ) ;
FA1D0BWP30P140HVT \u_mac_and_scale/add_188/U_20 ( 
    .A ( \u_mac_and_scale/addend_lo [8] ) , 
    .B ( \u_mac_and_scale/gated_lo_feedback [8] ) , 
    .CI ( \u_mac_and_scale/add_188/N_92 ) , 
    .CO ( \u_mac_and_scale/add_188/N_95 ) , 
    .S ( \u_mac_and_scale/lower_sum [8] ) ) ;
NR2D0BWP30P140HVT ctmi_16635 ( .A1 ( ctmn_14725 ) , .A2 ( phfnn_3839 ) , 
    .ZN ( ctmn_14829 ) ) ;
FA1D0BWP30P140HVT \u_mac_and_scale/add_188/U_23 ( 
    .A ( \u_mac_and_scale/addend_lo [9] ) , 
    .B ( \u_mac_and_scale/gated_lo_feedback [9] ) , 
    .CI ( \u_mac_and_scale/add_188/N_95 ) , 
    .CO ( \u_mac_and_scale/add_188/N_99 ) , 
    .S ( \u_mac_and_scale/lower_sum [9] ) ) ;
OAI21D0BWP30P140HVT ctmi_16637 ( .A1 ( ctmn_14833 ) , .A2 ( ctmn_14767 ) , 
    .B ( phfnn_2546 ) , .ZN ( ctmn_14834 ) ) ;
OAI32D0BWP30P140HVT ctmi_16638 ( .A1 ( ctmn_14720 ) , .A2 ( phfnn_3839 ) , 
    .A3 ( phfnn_3852 ) , .B1 ( phfnn_3875 ) , .B2 ( phfnn_3843 ) , 
    .ZN ( ctmn_14833 ) ) ;
NR2D0BWP30P140HVT ctmi_16639 ( .A1 ( phfnn_3833 ) , .A2 ( act_fn_sel[0] ) , 
    .ZN ( ctmn_14838 ) ) ;
OAI211D0BWP30P140HVT ctmi_16753 ( .A1 ( ctmn_14697 ) , .A2 ( phfnn_3878 ) , 
    .B ( phfnn_1416 ) , .C ( ctmn_14707 ) , .ZN ( ctmn_14946 ) ) ;
AOI32D0BWP30P140HVT ctmi_16754 ( .A1 ( phfnn_3838 ) , .A2 ( phfnn_3878 ) , 
    .A3 ( phfnn_3836 ) , .B1 ( ctmn_14726 ) , .B2 ( ctmn_14947 ) , 
    .ZN ( ctmn_14948 ) ) ;
AOI22D0BWP30P140HVT ctmi_16756 ( .A1 ( ctmn_14707 ) , .A2 ( ctmn_14844 ) , 
    .B1 ( act_fn_sel[0] ) , .B2 ( ctmn_14885 ) , .ZN ( ctmn_14951 ) ) ;
OAI21D0BWP30P140HVT ctmi_16757 ( .A1 ( ctmn_14952 ) , .A2 ( ctmn_14824 ) , 
    .B ( phfnn_3881 ) , .ZN ( ctmn_14953 ) ) ;
NR2D0BWP30P140HVT ctmi_16758 ( .A1 ( ctmn_14707 ) , .A2 ( phfnn_867 ) , 
    .ZN ( ctmn_14952 ) ) ;
FA1D0BWP30P140HVT \u_mac_and_scale/add_188/U_25 ( 
    .A ( \u_mac_and_scale/addend_lo [10] ) , 
    .B ( \u_mac_and_scale/gated_lo_feedback [10] ) , 
    .CI ( \u_mac_and_scale/add_188/N_99 ) , 
    .CO ( \u_mac_and_scale/add_188/N_102 ) , 
    .S ( \u_mac_and_scale/lower_sum [10] ) ) ;
AOI31D0BWP30P140HVT ctmi_16760 ( .A1 ( ctmn_14960 ) , .A2 ( ctmn_14961 ) , 
    .A3 ( ctmn_14962 ) , .B ( phfnn_2357 ) , .ZN ( ctmn_14963 ) ) ;
AOI221D0BWP30P140HVT ctmi_16761 ( .A1 ( ctmn_14322 ) , 
    .A2 ( accumulator[9] ) , .B1 ( ctmn_14323 ) , .B2 ( accumulator[1] ) , 
    .C ( ctmn_14959 ) , .ZN ( ctmn_14960 ) ) ;
OAI22D0BWP30P140HVT ctmi_16762 ( .A1 ( ctmn_14317 ) , .A2 ( ctmn_13378 ) , 
    .B1 ( phfnn_3658 ) , .B2 ( ctmn_13346 ) , .ZN ( ctmn_14959 ) ) ;
FA1D0BWP30P140HVT \u_mac_and_scale/add_188/U_28 ( 
    .A ( \u_mac_and_scale/addend_lo [11] ) , 
    .B ( \u_mac_and_scale/gated_lo_feedback [11] ) , 
    .CI ( \u_mac_and_scale/add_188/N_102 ) , 
    .CO ( \u_mac_and_scale/add_188/N_106 ) , 
    .S ( \u_mac_and_scale/lower_sum [11] ) ) ;
AOI22D0BWP30P140HVT ctmi_16764 ( .A1 ( ctmn_14318 ) , 
    .A2 ( accumulator[49] ) , .B1 ( ctmn_14319 ) , .B2 ( accumulator[33] ) , 
    .ZN ( ctmn_14961 ) ) ;
AOI22D0BWP30P140HVT ctmi_16765 ( .A1 ( ctmn_14314 ) , 
    .A2 ( accumulator[57] ) , .B1 ( ctmn_14316 ) , .B2 ( accumulator[25] ) , 
    .ZN ( ctmn_14962 ) ) ;
AOI221D0BWP30P140HVT ctmi_16766 ( .A1 ( phfnn_3866 ) , .A2 ( phfnn_3854 ) , 
    .B1 ( phfnn_3853 ) , .B2 ( ctmn_14967 ) , .C ( ctmn_14971 ) , 
    .ZN ( ctmn_14972 ) ) ;
AOI32D0BWP30P140HVT ctmi_16767 ( .A1 ( HFSNET_18 ) , .A2 ( ctmn_14782 ) , 
    .A3 ( phfnn_3843 ) , .B1 ( HFSNET_15 ) , .B2 ( ctmn_14760 ) , 
    .ZN ( ctmn_14965 ) ) ;
FA1D0BWP30P140HVT \u_mac_and_scale/add_188/U_30 ( 
    .A ( \u_mac_and_scale/addend_lo [12] ) , 
    .B ( \u_mac_and_scale/gated_lo_feedback [12] ) , 
    .CI ( \u_mac_and_scale/add_188/N_106 ) , 
    .CO ( \u_mac_and_scale/add_188/N_109 ) , 
    .S ( \u_mac_and_scale/lower_sum [12] ) ) ;
NR4D0BWP30P140HVT ctmi_16769 ( .A1 ( ctmn_14748 ) , .A2 ( ctmn_14782 ) , 
    .A3 ( HFSNET_15 ) , .A4 ( ctmn_14707 ) , .ZN ( ctmn_14967 ) ) ;
ND2D0BWP30P140HVT ctmi_16770 ( .A1 ( phfnn_3846 ) , .A2 ( ctmn_14970 ) , 
    .ZN ( ctmn_14971 ) ) ;
FA1D0BWP30P140HVT \u_mac_and_scale/add_188/U_33 ( 
    .A ( \u_mac_and_scale/addend_lo [13] ) , 
    .B ( \u_mac_and_scale/gated_lo_feedback [13] ) , 
    .CI ( \u_mac_and_scale/add_188/N_109 ) , 
    .CO ( \u_mac_and_scale/add_188/N_113 ) , 
    .S ( \u_mac_and_scale/lower_sum [13] ) ) ;
ND3D0BWP30P140HVT ctmi_16772 ( .A1 ( act_fn_sel[1] ) , .A2 ( ctmn_14969 ) , 
    .A3 ( ctmn_14707 ) , .ZN ( ctmn_14970 ) ) ;
NR2D0BWP30P140HVT ctmi_16773 ( .A1 ( HFSNET_15 ) , .A2 ( act_fn_sel[2] ) , 
    .ZN ( ctmn_14969 ) ) ;
SDFCNQD0BWP30P140HVT \u_io_block/operand_A_reg_r_reg[31] ( 
    .D ( operand_A[31] ) , .SI ( optlc_net_4011 ) , .SE ( optlc_net_4011 ) , 
    .CP ( \clk_clock_gate_u_io_block/operand_A_reg_r_reg ) , 
    .CDN ( sync_rst ) , .Q ( operand_A_reg[31] ) ) ;
FA1D0BWP30P140HVT \u_mac_and_scale/add_188/U_35 ( 
    .A ( \u_mac_and_scale/addend_lo [14] ) , 
    .B ( \u_mac_and_scale/gated_lo_feedback [14] ) , 
    .CI ( \u_mac_and_scale/add_188/N_113 ) , 
    .CO ( \u_mac_and_scale/add_188/N_116 ) , 
    .S ( \u_mac_and_scale/lower_sum [14] ) ) ;
FA1D0BWP30P140HVT \u_mac_and_scale/add_188/U_38 ( 
    .A ( \u_mac_and_scale/addend_lo [15] ) , 
    .B ( \u_mac_and_scale/gated_lo_feedback [15] ) , 
    .CI ( \u_mac_and_scale/add_188/N_116 ) , 
    .CO ( \u_mac_and_scale/add_188/N_120 ) , 
    .S ( \u_mac_and_scale/lower_sum [15] ) ) ;
FA1D0BWP30P140HVT \u_mac_and_scale/add_188/U_40 ( 
    .A ( \u_mac_and_scale/addend_lo [16] ) , 
    .B ( \u_mac_and_scale/gated_lo_feedback [16] ) , 
    .CI ( \u_mac_and_scale/add_188/N_120 ) , 
    .CO ( \u_mac_and_scale/add_188/N_123 ) , 
    .S ( \u_mac_and_scale/lower_sum [16] ) ) ;
FA1D0BWP30P140HVT \u_mac_and_scale/add_188/U_43 ( 
    .A ( \u_mac_and_scale/addend_lo [17] ) , 
    .B ( \u_mac_and_scale/gated_lo_feedback [17] ) , 
    .CI ( \u_mac_and_scale/add_188/N_123 ) , 
    .CO ( \u_mac_and_scale/add_188/N_127 ) , 
    .S ( \u_mac_and_scale/lower_sum [17] ) ) ;
FA1D0BWP30P140HVT \u_mac_and_scale/add_188/U_45 ( 
    .A ( \u_mac_and_scale/addend_lo [18] ) , 
    .B ( \u_mac_and_scale/gated_lo_feedback [18] ) , 
    .CI ( \u_mac_and_scale/add_188/N_127 ) , 
    .CO ( \u_mac_and_scale/add_188/N_130 ) , 
    .S ( \u_mac_and_scale/lower_sum [18] ) ) ;
FA1D0BWP30P140HVT \u_mac_and_scale/add_188/U_48 ( 
    .A ( \u_mac_and_scale/addend_lo [19] ) , 
    .B ( \u_mac_and_scale/gated_lo_feedback [19] ) , 
    .CI ( \u_mac_and_scale/add_188/N_130 ) , 
    .CO ( \u_mac_and_scale/add_188/N_134 ) , 
    .S ( \u_mac_and_scale/lower_sum [19] ) ) ;
FA1D0BWP30P140HVT \u_mac_and_scale/add_188/U_50 ( 
    .A ( \u_mac_and_scale/addend_lo [20] ) , 
    .B ( \u_mac_and_scale/gated_lo_feedback [20] ) , 
    .CI ( \u_mac_and_scale/add_188/N_134 ) , 
    .CO ( \u_mac_and_scale/add_188/N_137 ) , 
    .S ( \u_mac_and_scale/lower_sum [20] ) ) ;
FA1D0BWP30P140HVT \u_mac_and_scale/add_188/U_53 ( 
    .A ( \u_mac_and_scale/addend_lo [21] ) , 
    .B ( \u_mac_and_scale/gated_lo_feedback [21] ) , 
    .CI ( \u_mac_and_scale/add_188/N_137 ) , 
    .CO ( \u_mac_and_scale/add_188/N_141 ) , 
    .S ( \u_mac_and_scale/lower_sum [21] ) ) ;
FA1D0BWP30P140HVT \u_mac_and_scale/add_188/U_55 ( 
    .A ( \u_mac_and_scale/addend_lo [22] ) , 
    .B ( \u_mac_and_scale/gated_lo_feedback [22] ) , 
    .CI ( \u_mac_and_scale/add_188/N_141 ) , 
    .CO ( \u_mac_and_scale/add_188/N_144 ) , 
    .S ( \u_mac_and_scale/lower_sum [22] ) ) ;
FA1D0BWP30P140HVT \u_mac_and_scale/add_188/U_58 ( 
    .A ( \u_mac_and_scale/addend_lo [23] ) , 
    .B ( \u_mac_and_scale/gated_lo_feedback [23] ) , 
    .CI ( \u_mac_and_scale/add_188/N_144 ) , 
    .CO ( \u_mac_and_scale/add_188/N_148 ) , 
    .S ( \u_mac_and_scale/lower_sum [23] ) ) ;
FA1D0BWP30P140HVT \u_mac_and_scale/add_188/U_60 ( 
    .A ( \u_mac_and_scale/addend_lo [24] ) , 
    .B ( \u_mac_and_scale/gated_lo_feedback [24] ) , 
    .CI ( \u_mac_and_scale/add_188/N_148 ) , 
    .CO ( \u_mac_and_scale/add_188/N_151 ) , 
    .S ( \u_mac_and_scale/lower_sum [24] ) ) ;
FA1D0BWP30P140HVT \u_mac_and_scale/add_188/U_63 ( 
    .A ( \u_mac_and_scale/addend_lo [25] ) , 
    .B ( \u_mac_and_scale/gated_lo_feedback [25] ) , 
    .CI ( \u_mac_and_scale/add_188/N_151 ) , 
    .CO ( \u_mac_and_scale/add_188/N_155 ) , 
    .S ( \u_mac_and_scale/lower_sum [25] ) ) ;
FA1D0BWP30P140HVT \u_mac_and_scale/add_188/U_65 ( 
    .A ( \u_mac_and_scale/addend_lo [26] ) , 
    .B ( \u_mac_and_scale/gated_lo_feedback [26] ) , 
    .CI ( \u_mac_and_scale/add_188/N_155 ) , 
    .CO ( \u_mac_and_scale/add_188/N_158 ) , 
    .S ( \u_mac_and_scale/lower_sum [26] ) ) ;
FA1D0BWP30P140HVT \u_mac_and_scale/add_188/U_68 ( 
    .A ( \u_mac_and_scale/addend_lo [27] ) , 
    .B ( \u_mac_and_scale/gated_lo_feedback [27] ) , 
    .CI ( \u_mac_and_scale/add_188/N_158 ) , 
    .CO ( \u_mac_and_scale/add_188/N_162 ) , 
    .S ( \u_mac_and_scale/lower_sum [27] ) ) ;
FA1D0BWP30P140HVT \u_mac_and_scale/add_188/U_70 ( 
    .A ( \u_mac_and_scale/addend_lo [28] ) , 
    .B ( \u_mac_and_scale/gated_lo_feedback [28] ) , 
    .CI ( \u_mac_and_scale/add_188/N_162 ) , 
    .CO ( \u_mac_and_scale/add_188/N_165 ) , 
    .S ( \u_mac_and_scale/lower_sum [28] ) ) ;
FA1D0BWP30P140HVT \u_mac_and_scale/add_188/U_73 ( 
    .A ( \u_mac_and_scale/addend_lo [29] ) , 
    .B ( \u_mac_and_scale/gated_lo_feedback [29] ) , 
    .CI ( \u_mac_and_scale/add_188/N_165 ) , 
    .CO ( \u_mac_and_scale/add_188/N_169 ) , 
    .S ( \u_mac_and_scale/lower_sum [29] ) ) ;
FA1D0BWP30P140HVT \u_mac_and_scale/add_188/U_75 ( 
    .A ( \u_mac_and_scale/addend_lo [30] ) , 
    .B ( \u_mac_and_scale/gated_lo_feedback [30] ) , 
    .CI ( \u_mac_and_scale/add_188/N_169 ) , 
    .CO ( \u_mac_and_scale/add_188/N_172 ) , 
    .S ( \u_mac_and_scale/lower_sum [30] ) ) ;
FA1D0BWP30P140HVT \u_mac_and_scale/add_188/U_78 ( 
    .A ( \u_mac_and_scale/addend_lo [31] ) , 
    .B ( \u_mac_and_scale/gated_lo_feedback [31] ) , 
    .CI ( \u_mac_and_scale/add_188/N_172 ) , 
    .CO ( \u_mac_and_scale/lower_sum [32] ) , 
    .S ( \u_mac_and_scale/lower_sum [31] ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_3 ( 
    .A ( \u_mac_and_scale/mult_4_3_bottom [6] ) , 
    .B ( \u_mac_and_scale/mult_3/mult01 [2] ) , 
    .CI ( \u_mac_and_scale/mult_3/mult10 [2] ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_5 ) , 
    .S ( \DP_OP_244_18871_65499_J1/N_4 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_4 ( 
    .A ( \u_mac_and_scale/mult_4_3_bottom [7] ) , 
    .B ( \u_mac_and_scale/mult_3/mult01 [3] ) , 
    .CI ( \u_mac_and_scale/mult_3/mult10 [3] ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_7 ) , 
    .S ( \DP_OP_244_18871_65499_J1/N_6 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_5 ( 
    .A ( \u_mac_and_scale/mult_3/mult01 [4] ) , 
    .B ( \u_mac_and_scale/mult_3/mult10 [4] ) , 
    .CI ( \u_mac_and_scale/mult_4_3_top [0] ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_9 ) , 
    .S ( \DP_OP_244_18871_65499_J1/N_8 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_6 ( 
    .A ( \u_mac_and_scale/mult_3/mult01 [5] ) , 
    .B ( \u_mac_and_scale/mult_3/mult10 [5] ) , 
    .CI ( \u_mac_and_scale/mult_4_3_top [1] ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_11 ) , 
    .S ( \DP_OP_244_18871_65499_J1/N_10 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_7 ( 
    .A ( \u_mac_and_scale/mult_3/mult01 [6] ) , 
    .B ( \u_mac_and_scale/mult_3/mult10 [6] ) , 
    .CI ( \u_mac_and_scale/mult_4_3_top [2] ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_13 ) , 
    .S ( \DP_OP_244_18871_65499_J1/N_12 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_8 ( 
    .A ( \u_mac_and_scale/mult_3/mult01 [7] ) , 
    .B ( \u_mac_and_scale/mult_3/mult10 [7] ) , 
    .CI ( \u_mac_and_scale/mult_4_3_top [3] ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_15 ) , 
    .S ( \DP_OP_244_18871_65499_J1/N_14 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_9 ( 
    .A ( \u_mac_and_scale/mult_4_3_top [4] ) , .B ( phfnn_3824 ) , 
    .CI ( phfnn_2531 ) , .CO ( \DP_OP_244_18871_65499_J1/N_17 ) , 
    .S ( \DP_OP_244_18871_65499_J1/N_16 ) ) ;
AN2D0BWP30P140HVT \DP_OP_244_18871_65499_J1/ctmi_17244 ( 
    .A1 ( \u_mac_and_scale/mult_3/mult01 [1] ) , 
    .A2 ( \u_mac_and_scale/mult_4_3_bottom [5] ) , 
    .Z ( \DP_OP_244_18871_65499_J1/N_3 ) ) ;
IAO21D1BWP30P140HVT \DP_OP_244_18871_65499_J1/ctmi_17245 ( 
    .A1 ( \u_mac_and_scale/mult_3/mult01 [1] ) , 
    .A2 ( \u_mac_and_scale/mult_4_3_bottom [5] ) , 
    .B ( \DP_OP_244_18871_65499_J1/N_3 ) , 
    .ZN ( \DP_OP_244_18871_65499_J1/N_2 ) ) ;
AN2D0BWP30P140HVT \DP_OP_244_18871_65499_J1/ctmi_17247 ( 
    .A1 ( \u_mac_and_scale/scale_iso_2 [8] ) , 
    .A2 ( \u_mac_and_scale/stitch_lo_ext[38] ) , 
    .Z ( \DP_OP_244_18871_65499_J1/N_86 ) ) ;
AN2D0BWP30P140HVT \DP_OP_244_18871_65499_J1/ctmi_17248 ( .A1 ( HFSNET_24 ) , 
    .A2 ( \u_mac_and_scale/mult_4_3_bottom [2] ) , 
    .Z ( \DP_OP_244_18871_65499_J1/N_71 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_15 ( 
    .A ( \u_mac_and_scale/mult_3/mult01 [0] ) , 
    .B ( \u_mac_and_scale/mult_3/mult10 [0] ) , 
    .CI ( \u_mac_and_scale/mult_4_3_bottom [4] ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_28 ) , .S ( N83 ) ) ;
AN2D0BWP30P140HVT \DP_OP_244_18871_65499_J1/ctmi_17249 ( .A1 ( HFSNET_24 ) , 
    .A2 ( \u_mac_and_scale/mult_4_3_bottom [3] ) , 
    .Z ( \DP_OP_244_18871_65499_J1/N_72 ) ) ;
AN2D0BWP30P140HVT \DP_OP_244_18871_65499_J1/ctmi_17250 ( .A1 ( HFSNET_24 ) , 
    .A2 ( \u_mac_and_scale/mult_4_3_bottom [0] ) , 
    .Z ( \DP_OP_244_18871_65499_J1/N_69 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_18 ( 
    .A ( \u_mac_and_scale/mult_3/mult10 [1] ) , 
    .B ( \DP_OP_244_18871_65499_J1/N_2 ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_28 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_32 ) , .S ( N82 ) ) ;
IAO21D1BWP30P140HVT \DP_OP_244_18871_65499_J1/ctmi_17251 ( 
    .A1 ( \u_mac_and_scale/scale_iso_2 [8] ) , 
    .A2 ( \u_mac_and_scale/stitch_lo_ext[38] ) , 
    .B ( \DP_OP_244_18871_65499_J1/N_86 ) , 
    .ZN ( \DP_OP_244_18871_65499_J1/N_85 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_202 ( 
    .A ( \DP_OP_244_18871_65499_J1/N_3 ) , 
    .B ( \DP_OP_244_18871_65499_J1/N_4 ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_32 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_35 ) , .S ( N81 ) ) ;
AN2D0BWP30P140HVT \DP_OP_244_18871_65499_J1/ctmi_17252 ( .A1 ( HFSNET_24 ) , 
    .A2 ( \u_mac_and_scale/mult_4_3_bottom [1] ) , 
    .Z ( \DP_OP_244_18871_65499_J1/N_70 ) ) ;
AN2D0BWP30P140HVT \DP_OP_244_18871_65499_J1/ctmi_17253 ( .A1 ( HFSNET_27 ) , 
    .A2 ( N83 ) , .Z ( \DP_OP_244_18871_65499_J1/N_73 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_23 ( 
    .A ( \DP_OP_244_18871_65499_J1/N_5 ) , 
    .B ( \DP_OP_244_18871_65499_J1/N_6 ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_35 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_39 ) , .S ( N80 ) ) ;
AN2D0BWP30P140HVT \DP_OP_244_18871_65499_J1/ctmi_17254 ( .A1 ( HFSNET_27 ) , 
    .A2 ( N82 ) , .Z ( \DP_OP_244_18871_65499_J1/N_74 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_25 ( 
    .A ( \DP_OP_244_18871_65499_J1/N_7 ) , 
    .B ( \DP_OP_244_18871_65499_J1/N_8 ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_39 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_42 ) , .S ( N79 ) ) ;
AN2D0BWP30P140HVT \DP_OP_244_18871_65499_J1/ctmi_17255 ( .A1 ( HFSNET_27 ) , 
    .A2 ( N81 ) , .Z ( \DP_OP_244_18871_65499_J1/N_75 ) ) ;
AN2D0BWP30P140HVT \DP_OP_244_18871_65499_J1/ctmi_17256 ( .A1 ( HFSNET_27 ) , 
    .A2 ( N80 ) , .Z ( \DP_OP_244_18871_65499_J1/N_76 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_28 ( 
    .A ( \DP_OP_244_18871_65499_J1/N_9 ) , 
    .B ( \DP_OP_244_18871_65499_J1/N_10 ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_42 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_46 ) , .S ( N78 ) ) ;
AN2D0BWP30P140HVT \DP_OP_244_18871_65499_J1/ctmi_17257 ( .A1 ( HFSNET_27 ) , 
    .A2 ( N79 ) , .Z ( \DP_OP_244_18871_65499_J1/N_77 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_30 ( 
    .A ( \DP_OP_244_18871_65499_J1/N_11 ) , 
    .B ( \DP_OP_244_18871_65499_J1/N_12 ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_46 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_49 ) , .S ( N77 ) ) ;
AN2D0BWP30P140HVT \DP_OP_244_18871_65499_J1/ctmi_17258 ( .A1 ( HFSNET_27 ) , 
    .A2 ( N78 ) , .Z ( \DP_OP_244_18871_65499_J1/N_78 ) ) ;
AN2D0BWP30P140HVT \DP_OP_244_18871_65499_J1/ctmi_17259 ( .A1 ( HFSNET_27 ) , 
    .A2 ( N77 ) , .Z ( \DP_OP_244_18871_65499_J1/N_79 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_33 ( 
    .A ( \DP_OP_244_18871_65499_J1/N_13 ) , 
    .B ( \DP_OP_244_18871_65499_J1/N_14 ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_49 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_53 ) , .S ( N76 ) ) ;
AN2D0BWP30P140HVT \DP_OP_244_18871_65499_J1/ctmi_17260 ( .A1 ( HFSNET_27 ) , 
    .A2 ( N76 ) , .Z ( \DP_OP_244_18871_65499_J1/N_80 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_35 ( 
    .A ( \DP_OP_244_18871_65499_J1/N_15 ) , 
    .B ( \DP_OP_244_18871_65499_J1/N_16 ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_53 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_56 ) , .S ( N75 ) ) ;
AN2D0BWP30P140HVT \DP_OP_244_18871_65499_J1/ctmi_17261 ( .A1 ( HFSNET_27 ) , 
    .A2 ( N75 ) , .Z ( \DP_OP_244_18871_65499_J1/N_81 ) ) ;
AN2D0BWP30P140HVT \DP_OP_244_18871_65499_J1/ctmi_17262 ( .A1 ( HFSNET_27 ) , 
    .A2 ( N74 ) , .Z ( \DP_OP_244_18871_65499_J1/N_82 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_38 ( .A ( phfnn_3813 ) , 
    .B ( \DP_OP_244_18871_65499_J1/N_17 ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_56 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_60 ) , .S ( N74 ) ) ;
AN2D0BWP30P140HVT \DP_OP_244_18871_65499_J1/ctmi_17263 ( .A1 ( HFSNET_27 ) , 
    .A2 ( N73 ) , .Z ( \DP_OP_244_18871_65499_J1/N_83 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_40 ( 
    .A ( \u_mac_and_scale/mult_4_3_top [5] ) , .B ( phfnn_3181 ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_60 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_63 ) , .S ( N73 ) ) ;
XOR4D0BWP30P140HVT \DP_OP_244_18871_65499_J1/ctmi_17266 ( 
    .A1 ( \u_mac_and_scale/stitch_ext_2[22] ) , 
    .A2 ( \u_mac_and_scale/stitch_lo_ext[38] ) , 
    .A3 ( \DP_OP_244_18871_65499_J1/N_210 ) , .A4 ( N198 ) , 
    .Z ( \DP_OP_244_18871_65499_J1/ctmn_15273 ) ) ;
ND2D0BWP30P140HVT \DP_OP_244_18871_65499_J1/ctmi_17267 ( .A1 ( HFSNET_27 ) , 
    .A2 ( N72 ) , .ZN ( \DP_OP_244_18871_65499_J1/ctmn_15274 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_63 ( 
    .A ( \u_mac_and_scale/stitch_lo_ext[38] ) , 
    .B ( \u_mac_and_scale/scale_iso_2 [9] ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_86 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_88 ) , 
    .S ( \DP_OP_244_18871_65499_J1/N_87 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_64 ( 
    .A ( \u_mac_and_scale/stitch_lo_ext[38] ) , 
    .B ( \u_mac_and_scale/scale_iso_2 [10] ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_71 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_90 ) , 
    .S ( \DP_OP_244_18871_65499_J1/N_89 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_65 ( 
    .A ( \u_mac_and_scale/stitch_lo_ext[38] ) , 
    .B ( \u_mac_and_scale/scale_iso_2 [11] ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_72 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_92 ) , 
    .S ( \DP_OP_244_18871_65499_J1/N_91 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_66 ( 
    .A ( \u_mac_and_scale/stitch_lo_ext[38] ) , 
    .B ( \u_mac_and_scale/scale_iso_2 [12] ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_92 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_94 ) , 
    .S ( \DP_OP_244_18871_65499_J1/N_93 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_67 ( 
    .A ( \u_mac_and_scale/stitch_lo_ext[38] ) , 
    .B ( \u_mac_and_scale/scale_iso_2 [13] ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_94 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_96 ) , 
    .S ( \DP_OP_244_18871_65499_J1/N_95 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_68 ( 
    .A ( \u_mac_and_scale/stitch_lo_ext[38] ) , 
    .B ( \u_mac_and_scale/scale_iso_2 [14] ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_96 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_98 ) , 
    .S ( \DP_OP_244_18871_65499_J1/N_97 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_69 ( 
    .A ( \u_mac_and_scale/stitch_lo_ext[38] ) , 
    .B ( \u_mac_and_scale/scale_iso_2 [15] ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_98 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_100 ) , 
    .S ( \DP_OP_244_18871_65499_J1/N_99 ) ) ;
ND2D0BWP30P140HVT ctmi_695 ( .A1 ( phfnn_3835 ) , .A2 ( phfnn_1416 ) , 
    .ZN ( ctmn_14792 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_81 ( .A ( N96 ) , 
    .B ( \u_mac_and_scale/scale_iso_2 [1] ) , .CI ( phfnn_3890 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_137 ) , .S ( N54 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_83 ( .A ( N95 ) , 
    .B ( \u_mac_and_scale/scale_iso_2 [2] ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_137 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_140 ) , .S ( N53 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_86 ( .A ( N92 ) , 
    .B ( \u_mac_and_scale/scale_iso_2 [3] ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_140 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_144 ) , .S ( N52 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_88 ( .A ( N91 ) , 
    .B ( \u_mac_and_scale/scale_iso_2 [4] ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_144 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_147 ) , .S ( N51 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_91 ( .A ( N90 ) , 
    .B ( \u_mac_and_scale/scale_iso_2 [5] ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_147 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_151 ) , .S ( N50 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_93 ( .A ( N89 ) , 
    .B ( \u_mac_and_scale/scale_iso_2 [6] ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_151 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_154 ) , .S ( N49 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_96 ( .A ( N88 ) , 
    .B ( \u_mac_and_scale/scale_iso_2 [7] ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_154 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_158 ) , .S ( N48 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_98 ( 
    .A ( \DP_OP_244_18871_65499_J1/N_69 ) , 
    .B ( \DP_OP_244_18871_65499_J1/N_85 ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_158 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_161 ) , .S ( N47 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_101 ( 
    .A ( \DP_OP_244_18871_65499_J1/N_70 ) , 
    .B ( \DP_OP_244_18871_65499_J1/N_87 ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_161 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_165 ) , .S ( N46 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_103 ( 
    .A ( \DP_OP_244_18871_65499_J1/N_88 ) , 
    .B ( \DP_OP_244_18871_65499_J1/N_89 ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_165 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_168 ) , .S ( N45 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_106 ( 
    .A ( \DP_OP_244_18871_65499_J1/N_90 ) , 
    .B ( \DP_OP_244_18871_65499_J1/N_91 ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_168 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_172 ) , .S ( N44 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_108 ( 
    .A ( \DP_OP_244_18871_65499_J1/N_73 ) , 
    .B ( \DP_OP_244_18871_65499_J1/N_93 ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_172 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_175 ) , .S ( N43 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_111 ( 
    .A ( \DP_OP_244_18871_65499_J1/N_74 ) , 
    .B ( \DP_OP_244_18871_65499_J1/N_95 ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_175 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_179 ) , .S ( N42 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_113 ( 
    .A ( \DP_OP_244_18871_65499_J1/N_75 ) , 
    .B ( \DP_OP_244_18871_65499_J1/N_97 ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_179 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_182 ) , .S ( N41 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_116 ( 
    .A ( \DP_OP_244_18871_65499_J1/N_76 ) , 
    .B ( \DP_OP_244_18871_65499_J1/N_99 ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_182 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_186 ) , .S ( N40 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_118 ( 
    .A ( \DP_OP_244_18871_65499_J1/N_77 ) , .B ( N199 ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_186 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_189 ) , .S ( N39 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_121 ( 
    .A ( \DP_OP_244_18871_65499_J1/N_78 ) , .B ( N200 ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_189 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_193 ) , .S ( N38 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_123 ( 
    .A ( \DP_OP_244_18871_65499_J1/N_79 ) , .B ( N200 ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_193 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_196 ) , .S ( N37 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_126 ( 
    .A ( \DP_OP_244_18871_65499_J1/N_80 ) , .B ( N200 ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_196 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_200 ) , .S ( N36 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_128 ( 
    .A ( \DP_OP_244_18871_65499_J1/N_81 ) , .B ( N200 ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_200 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_203 ) , .S ( N35 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_131 ( 
    .A ( \DP_OP_244_18871_65499_J1/N_82 ) , .B ( N200 ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_203 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_207 ) , .S ( N34 ) ) ;
FA1D0BWP30P140HVT \DP_OP_244_18871_65499_J1/U_133 ( 
    .A ( \DP_OP_244_18871_65499_J1/N_83 ) , .B ( N200 ) , 
    .CI ( \DP_OP_244_18871_65499_J1/N_207 ) , 
    .CO ( \DP_OP_244_18871_65499_J1/N_210 ) , .S ( N33 ) ) ;
AOI21D0BWP30P140HVT \DP_OP_245_33587_65499_J1/ctmi_17270 ( 
    .A1 ( \DP_OP_245_33587_65499_J1/ctmn_15275 ) , 
    .A2 ( \DP_OP_245_33587_65499_J1/ctmn_15276 ) , .B ( N201 ) , .ZN ( N63 ) ) ;
FA1D0BWP30P140HVT \DP_OP_245_33587_65499_J1/U_3 ( 
    .A ( \u_mac_and_scale/mult_4_1_bottom [6] ) , 
    .B ( \u_mac_and_scale/mult_1/mult01 [2] ) , 
    .CI ( \u_mac_and_scale/mult_1/mult10 [2] ) , 
    .CO ( \DP_OP_245_33587_65499_J1/N_5 ) , 
    .S ( \DP_OP_245_33587_65499_J1/N_4 ) ) ;
FA1D0BWP30P140HVT \DP_OP_245_33587_65499_J1/U_4 ( 
    .A ( \u_mac_and_scale/mult_4_1_bottom [7] ) , 
    .B ( \u_mac_and_scale/mult_1/mult01 [3] ) , 
    .CI ( \u_mac_and_scale/mult_1/mult10 [3] ) , 
    .CO ( \DP_OP_245_33587_65499_J1/N_7 ) , 
    .S ( \DP_OP_245_33587_65499_J1/N_6 ) ) ;
FA1D0BWP30P140HVT \DP_OP_245_33587_65499_J1/U_5 ( 
    .A ( \u_mac_and_scale/mult_1/mult01 [4] ) , 
    .B ( \u_mac_and_scale/mult_1/mult10 [4] ) , 
    .CI ( \u_mac_and_scale/mult_4_1_top [0] ) , 
    .CO ( \DP_OP_245_33587_65499_J1/N_9 ) , 
    .S ( \DP_OP_245_33587_65499_J1/N_8 ) ) ;
FA1D0BWP30P140HVT \DP_OP_245_33587_65499_J1/U_6 ( 
    .A ( \u_mac_and_scale/mult_1/mult01 [5] ) , 
    .B ( \u_mac_and_scale/mult_1/mult10 [5] ) , 
    .CI ( \u_mac_and_scale/mult_4_1_top [1] ) , 
    .CO ( \DP_OP_245_33587_65499_J1/N_11 ) , 
    .S ( \DP_OP_245_33587_65499_J1/N_10 ) ) ;
FA1D0BWP30P140HVT \DP_OP_245_33587_65499_J1/U_7 ( 
    .A ( \u_mac_and_scale/mult_1/mult01 [6] ) , 
    .B ( \u_mac_and_scale/mult_1/mult10 [6] ) , 
    .CI ( \u_mac_and_scale/mult_4_1_top [2] ) , 
    .CO ( \DP_OP_245_33587_65499_J1/N_13 ) , 
    .S ( \DP_OP_245_33587_65499_J1/N_12 ) ) ;
FA1D0BWP30P140HVT \DP_OP_245_33587_65499_J1/U_8 ( 
    .A ( \u_mac_and_scale/mult_1/mult01 [7] ) , 
    .B ( \u_mac_and_scale/mult_1/mult10 [7] ) , 
    .CI ( \u_mac_and_scale/mult_4_1_top [3] ) , 
    .CO ( \DP_OP_245_33587_65499_J1/N_15 ) , 
    .S ( \DP_OP_245_33587_65499_J1/N_14 ) ) ;
FA1D0BWP30P140HVT \DP_OP_245_33587_65499_J1/U_9 ( 
    .A ( \u_mac_and_scale/mult_4_1_top [4] ) , .B ( phfnn_3825 ) , 
    .CI ( phfnn_2530 ) , .CO ( \DP_OP_245_33587_65499_J1/N_17 ) , 
    .S ( \DP_OP_245_33587_65499_J1/N_16 ) ) ;
AN2D0BWP30P140HVT \DP_OP_245_33587_65499_J1/ctmi_17275 ( 
    .A1 ( \u_mac_and_scale/mult_1/mult01 [1] ) , 
    .A2 ( \u_mac_and_scale/mult_4_1_bottom [5] ) , 
    .Z ( \DP_OP_245_33587_65499_J1/N_3 ) ) ;
IAO21D1BWP30P140HVT \DP_OP_245_33587_65499_J1/ctmi_17276 ( 
    .A1 ( \u_mac_and_scale/mult_1/mult01 [1] ) , 
    .A2 ( \u_mac_and_scale/mult_4_1_bottom [5] ) , 
    .B ( \DP_OP_245_33587_65499_J1/N_3 ) , 
    .ZN ( \DP_OP_245_33587_65499_J1/N_2 ) ) ;
AN2D0BWP30P140HVT \DP_OP_245_33587_65499_J1/ctmi_17278 ( .A1 ( HFSNET_23 ) , 
    .A2 ( \u_mac_and_scale/mult_4_1_bottom [1] ) , 
    .Z ( \DP_OP_245_33587_65499_J1/N_70 ) ) ;
AN2D0BWP30P140HVT \DP_OP_245_33587_65499_J1/ctmi_17279 ( .A1 ( HFSNET_23 ) , 
    .A2 ( \u_mac_and_scale/mult_4_1_bottom [2] ) , 
    .Z ( \DP_OP_245_33587_65499_J1/N_71 ) ) ;
FA1D0BWP30P140HVT \DP_OP_245_33587_65499_J1/U_15 ( 
    .A ( \u_mac_and_scale/mult_1/mult01 [0] ) , 
    .B ( \u_mac_and_scale/mult_1/mult10 [0] ) , 
    .CI ( \u_mac_and_scale/mult_4_1_bottom [4] ) , 
    .CO ( \DP_OP_245_33587_65499_J1/N_28 ) , .S ( N216 ) ) ;
AN2D0BWP30P140HVT \DP_OP_245_33587_65499_J1/ctmi_17280 ( .A1 ( HFSNET_23 ) , 
    .A2 ( \u_mac_and_scale/mult_4_1_bottom [3] ) , 
    .Z ( \DP_OP_245_33587_65499_J1/N_72 ) ) ;
AN2D0BWP30P140HVT \DP_OP_245_33587_65499_J1/ctmi_17281 ( .A1 ( HFSNET_23 ) , 
    .A2 ( N216 ) , .Z ( \DP_OP_245_33587_65499_J1/N_73 ) ) ;
FA1D0BWP30P140HVT \DP_OP_245_33587_65499_J1/U_18 ( 
    .A ( \u_mac_and_scale/mult_1/mult10 [1] ) , 
    .B ( \DP_OP_245_33587_65499_J1/N_2 ) , 
    .CI ( \DP_OP_245_33587_65499_J1/N_28 ) , 
    .CO ( \DP_OP_245_33587_65499_J1/N_32 ) , .S ( N215 ) ) ;
AN2D0BWP30P140HVT \DP_OP_245_33587_65499_J1/ctmi_17282 ( .A1 ( HFSNET_23 ) , 
    .A2 ( N215 ) , .Z ( \DP_OP_245_33587_65499_J1/N_74 ) ) ;
FA1D0BWP30P140HVT \DP_OP_245_33587_65499_J1/U_202 ( 
    .A ( \DP_OP_245_33587_65499_J1/N_3 ) , 
    .B ( \DP_OP_245_33587_65499_J1/N_4 ) , 
    .CI ( \DP_OP_245_33587_65499_J1/N_32 ) , 
    .CO ( \DP_OP_245_33587_65499_J1/N_35 ) , .S ( N214 ) ) ;
AN2D0BWP30P140HVT \DP_OP_245_33587_65499_J1/ctmi_17283 ( .A1 ( HFSNET_23 ) , 
    .A2 ( N214 ) , .Z ( \DP_OP_245_33587_65499_J1/N_75 ) ) ;
AN2D0BWP30P140HVT \DP_OP_245_33587_65499_J1/ctmi_17284 ( .A1 ( HFSNET_23 ) , 
    .A2 ( N213 ) , .Z ( \DP_OP_245_33587_65499_J1/N_76 ) ) ;
FA1D0BWP30P140HVT \DP_OP_245_33587_65499_J1/U_23 ( 
    .A ( \DP_OP_245_33587_65499_J1/N_5 ) , 
    .B ( \DP_OP_245_33587_65499_J1/N_6 ) , 
    .CI ( \DP_OP_245_33587_65499_J1/N_35 ) , 
    .CO ( \DP_OP_245_33587_65499_J1/N_39 ) , .S ( N213 ) ) ;
AN2D0BWP30P140HVT \DP_OP_245_33587_65499_J1/ctmi_17285 ( .A1 ( HFSNET_23 ) , 
    .A2 ( N212 ) , .Z ( \DP_OP_245_33587_65499_J1/N_77 ) ) ;
FA1D0BWP30P140HVT \DP_OP_245_33587_65499_J1/U_25 ( 
    .A ( \DP_OP_245_33587_65499_J1/N_7 ) , 
    .B ( \DP_OP_245_33587_65499_J1/N_8 ) , 
    .CI ( \DP_OP_245_33587_65499_J1/N_39 ) , 
    .CO ( \DP_OP_245_33587_65499_J1/N_42 ) , .S ( N212 ) ) ;
AN2D0BWP30P140HVT \DP_OP_245_33587_65499_J1/ctmi_17286 ( .A1 ( HFSNET_23 ) , 
    .A2 ( N211 ) , .Z ( \DP_OP_245_33587_65499_J1/N_78 ) ) ;
AN2D0BWP30P140HVT \DP_OP_245_33587_65499_J1/ctmi_17287 ( .A1 ( HFSNET_23 ) , 
    .A2 ( N210 ) , .Z ( \DP_OP_245_33587_65499_J1/N_79 ) ) ;
FA1D0BWP30P140HVT \DP_OP_245_33587_65499_J1/U_28 ( 
    .A ( \DP_OP_245_33587_65499_J1/N_9 ) , 
    .B ( \DP_OP_245_33587_65499_J1/N_10 ) , 
    .CI ( \DP_OP_245_33587_65499_J1/N_42 ) , 
    .CO ( \DP_OP_245_33587_65499_J1/N_46 ) , .S ( N211 ) ) ;
AN2D0BWP30P140HVT \DP_OP_245_33587_65499_J1/ctmi_17288 ( .A1 ( HFSNET_23 ) , 
    .A2 ( N209 ) , .Z ( \DP_OP_245_33587_65499_J1/N_80 ) ) ;
FA1D0BWP30P140HVT \DP_OP_245_33587_65499_J1/U_30 ( 
    .A ( \DP_OP_245_33587_65499_J1/N_11 ) , 
    .B ( \DP_OP_245_33587_65499_J1/N_12 ) , 
    .CI ( \DP_OP_245_33587_65499_J1/N_46 ) , 
    .CO ( \DP_OP_245_33587_65499_J1/N_49 ) , .S ( N210 ) ) ;
AN2D0BWP30P140HVT \DP_OP_245_33587_65499_J1/ctmi_17289 ( .A1 ( HFSNET_23 ) , 
    .A2 ( N208 ) , .Z ( \DP_OP_245_33587_65499_J1/N_81 ) ) ;
AN2D0BWP30P140HVT \DP_OP_245_33587_65499_J1/ctmi_17290 ( .A1 ( HFSNET_23 ) , 
    .A2 ( N207 ) , .Z ( \DP_OP_245_33587_65499_J1/N_82 ) ) ;
FA1D0BWP30P140HVT \DP_OP_245_33587_65499_J1/U_33 ( 
    .A ( \DP_OP_245_33587_65499_J1/N_13 ) , 
    .B ( \DP_OP_245_33587_65499_J1/N_14 ) , 
    .CI ( \DP_OP_245_33587_65499_J1/N_49 ) , 
    .CO ( \DP_OP_245_33587_65499_J1/N_53 ) , .S ( N209 ) ) ;
AN2D0BWP30P140HVT \DP_OP_245_33587_65499_J1/ctmi_17291 ( .A1 ( HFSNET_23 ) , 
    .A2 ( N206 ) , .Z ( \DP_OP_245_33587_65499_J1/N_83 ) ) ;
FA1D0BWP30P140HVT \DP_OP_245_33587_65499_J1/U_35 ( 
    .A ( \DP_OP_245_33587_65499_J1/N_15 ) , 
    .B ( \DP_OP_245_33587_65499_J1/N_16 ) , 
    .CI ( \DP_OP_245_33587_65499_J1/N_53 ) , 
    .CO ( \DP_OP_245_33587_65499_J1/N_56 ) , .S ( N208 ) ) ;
XNR3UD1BWP30P140HVT \DP_OP_245_33587_65499_J1/ctmi_17293 ( 
    .A1 ( \DP_OP_245_33587_65499_J1/ctmn_15277 ) , 
    .A2 ( \DP_OP_245_33587_65499_J1/N_143 ) , 
    .A3 ( \u_mac_and_scale/stitch_ext_0[22] ) , .ZN ( N88 ) ) ;
FA1D0BWP30P140HVT \DP_OP_245_33587_65499_J1/U_38 ( .A ( phfnn_3811 ) , 
    .B ( \DP_OP_245_33587_65499_J1/N_17 ) , 
    .CI ( \DP_OP_245_33587_65499_J1/N_56 ) , 
    .CO ( \DP_OP_245_33587_65499_J1/N_60 ) , .S ( N207 ) ) ;
ND2D0BWP30P140HVT \DP_OP_245_33587_65499_J1/ctmi_17294 ( .A1 ( HFSNET_23 ) , 
    .A2 ( N205 ) , .ZN ( \DP_OP_245_33587_65499_J1/ctmn_15277 ) ) ;
FA1D0BWP30P140HVT \DP_OP_245_33587_65499_J1/U_40 ( 
    .A ( \u_mac_and_scale/mult_4_1_top [5] ) , .B ( phfnn_3179 ) , 
    .CI ( \DP_OP_245_33587_65499_J1/N_60 ) , 
    .CO ( \DP_OP_245_33587_65499_J1/N_63 ) , .S ( N206 ) ) ;
FA1D0BWP30P140HVT \DP_OP_245_33587_65499_J1/U_65 ( 
    .A ( \u_mac_and_scale/scale_iso_0[9] ) , 
    .B ( \DP_OP_245_33587_65499_J1/N_70 ) , .CI ( N201 ) , 
    .CO ( \DP_OP_245_33587_65499_J1/N_98 ) , .S ( N62 ) ) ;
FA1D0BWP30P140HVT \DP_OP_245_33587_65499_J1/U_67 ( 
    .A ( \u_mac_and_scale/scale_iso_0[10] ) , 
    .B ( \DP_OP_245_33587_65499_J1/N_71 ) , 
    .CI ( \DP_OP_245_33587_65499_J1/N_98 ) , 
    .CO ( \DP_OP_245_33587_65499_J1/N_101 ) , .S ( N61 ) ) ;
FA1D0BWP30P140HVT \DP_OP_245_33587_65499_J1/U_70 ( 
    .A ( \u_mac_and_scale/scale_iso_0[11] ) , 
    .B ( \DP_OP_245_33587_65499_J1/N_72 ) , 
    .CI ( \DP_OP_245_33587_65499_J1/N_101 ) , 
    .CO ( \DP_OP_245_33587_65499_J1/N_105 ) , .S ( N60 ) ) ;
FA1D0BWP30P140HVT \DP_OP_245_33587_65499_J1/U_72 ( 
    .A ( \u_mac_and_scale/scale_iso_0[12] ) , 
    .B ( \DP_OP_245_33587_65499_J1/N_73 ) , 
    .CI ( \DP_OP_245_33587_65499_J1/N_105 ) , 
    .CO ( \DP_OP_245_33587_65499_J1/N_108 ) , .S ( N59 ) ) ;
FA1D0BWP30P140HVT \DP_OP_245_33587_65499_J1/U_75 ( 
    .A ( \u_mac_and_scale/scale_iso_0[13] ) , 
    .B ( \DP_OP_245_33587_65499_J1/N_74 ) , 
    .CI ( \DP_OP_245_33587_65499_J1/N_108 ) , 
    .CO ( \DP_OP_245_33587_65499_J1/N_112 ) , .S ( N58 ) ) ;
FA1D0BWP30P140HVT \DP_OP_245_33587_65499_J1/U_77 ( 
    .A ( \u_mac_and_scale/scale_iso_0[14] ) , 
    .B ( \DP_OP_245_33587_65499_J1/N_75 ) , 
    .CI ( \DP_OP_245_33587_65499_J1/N_112 ) , 
    .CO ( \DP_OP_245_33587_65499_J1/N_115 ) , .S ( N57 ) ) ;
FA1D0BWP30P140HVT \DP_OP_245_33587_65499_J1/U_80 ( 
    .A ( \u_mac_and_scale/scale_iso_0[15] ) , 
    .B ( \DP_OP_245_33587_65499_J1/N_76 ) , 
    .CI ( \DP_OP_245_33587_65499_J1/N_115 ) , 
    .CO ( \DP_OP_245_33587_65499_J1/N_119 ) , .S ( N56 ) ) ;
FA1D0BWP30P140HVT \DP_OP_245_33587_65499_J1/U_82 ( 
    .A ( \u_mac_and_scale/stitch_ext_0[22] ) , 
    .B ( \DP_OP_245_33587_65499_J1/N_77 ) , 
    .CI ( \DP_OP_245_33587_65499_J1/N_119 ) , 
    .CO ( \DP_OP_245_33587_65499_J1/N_122 ) , .S ( N186 ) ) ;
FA1D0BWP30P140HVT \DP_OP_245_33587_65499_J1/U_85 ( 
    .A ( \u_mac_and_scale/stitch_ext_0[22] ) , 
    .B ( \DP_OP_245_33587_65499_J1/N_78 ) , 
    .CI ( \DP_OP_245_33587_65499_J1/N_122 ) , 
    .CO ( \DP_OP_245_33587_65499_J1/N_126 ) , .S ( N96 ) ) ;
FA1D0BWP30P140HVT \DP_OP_245_33587_65499_J1/U_87 ( 
    .A ( \u_mac_and_scale/stitch_ext_0[22] ) , 
    .B ( \DP_OP_245_33587_65499_J1/N_79 ) , 
    .CI ( \DP_OP_245_33587_65499_J1/N_126 ) , 
    .CO ( \DP_OP_245_33587_65499_J1/N_129 ) , .S ( N95 ) ) ;
FA1D0BWP30P140HVT \DP_OP_245_33587_65499_J1/U_90 ( 
    .A ( \u_mac_and_scale/stitch_ext_0[22] ) , 
    .B ( \DP_OP_245_33587_65499_J1/N_80 ) , 
    .CI ( \DP_OP_245_33587_65499_J1/N_129 ) , 
    .CO ( \DP_OP_245_33587_65499_J1/N_133 ) , .S ( N92 ) ) ;
FA1D0BWP30P140HVT \DP_OP_245_33587_65499_J1/U_92 ( 
    .A ( \u_mac_and_scale/stitch_ext_0[22] ) , 
    .B ( \DP_OP_245_33587_65499_J1/N_81 ) , 
    .CI ( \DP_OP_245_33587_65499_J1/N_133 ) , 
    .CO ( \DP_OP_245_33587_65499_J1/N_136 ) , .S ( N91 ) ) ;
FA1D0BWP30P140HVT \DP_OP_245_33587_65499_J1/U_95 ( 
    .A ( \u_mac_and_scale/stitch_ext_0[22] ) , 
    .B ( \DP_OP_245_33587_65499_J1/N_82 ) , 
    .CI ( \DP_OP_245_33587_65499_J1/N_136 ) , 
    .CO ( \DP_OP_245_33587_65499_J1/N_140 ) , .S ( N90 ) ) ;
FA1D0BWP30P140HVT \DP_OP_245_33587_65499_J1/U_97 ( 
    .A ( \u_mac_and_scale/stitch_ext_0[22] ) , 
    .B ( \DP_OP_245_33587_65499_J1/N_83 ) , 
    .CI ( \DP_OP_245_33587_65499_J1/N_140 ) , 
    .CO ( \DP_OP_245_33587_65499_J1/N_143 ) , .S ( N89 ) ) ;
AN2D0BWP30P140HVT \DP_OP_246_35163_65499_J1/ctmi_17298 ( 
    .A1 ( \u_mac_and_scale/mult_2/mult01 [1] ) , 
    .A2 ( \u_mac_and_scale/mult_4_2_bottom[5] ) , 
    .Z ( \DP_OP_246_35163_65499_J1/N_3 ) ) ;
IAO21D1BWP30P140HVT \DP_OP_246_35163_65499_J1/ctmi_17300 ( 
    .A1 ( \u_mac_and_scale/mult_4_2_bottom[5] ) , 
    .A2 ( \u_mac_and_scale/mult_2/mult01 [1] ) , 
    .B ( \DP_OP_246_35163_65499_J1/N_3 ) , 
    .ZN ( \DP_OP_246_35163_65499_J1/N_2 ) ) ;
FA1D0BWP30P140HVT \DP_OP_246_35163_65499_J1/U_3 ( 
    .A ( \u_mac_and_scale/mult_4_2_bottom[6] ) , 
    .B ( \u_mac_and_scale/mult_2/mult01 [2] ) , 
    .CI ( \u_mac_and_scale/mult_2/mult10 [2] ) , 
    .CO ( \DP_OP_246_35163_65499_J1/N_5 ) , 
    .S ( \DP_OP_246_35163_65499_J1/N_4 ) ) ;
FA1D0BWP30P140HVT \DP_OP_246_35163_65499_J1/U_4 ( .A ( phfnn_3821 ) , 
    .B ( \u_mac_and_scale/mult_2/mult01 [3] ) , 
    .CI ( \u_mac_and_scale/mult_2/mult10 [3] ) , 
    .CO ( \DP_OP_246_35163_65499_J1/N_7 ) , 
    .S ( \DP_OP_246_35163_65499_J1/N_6 ) ) ;
FA1D0BWP30P140HVT \DP_OP_246_35163_65499_J1/U_5 ( 
    .A ( \u_mac_and_scale/mult_2/mult01 [4] ) , 
    .B ( \u_mac_and_scale/mult_2/mult10 [4] ) , 
    .CI ( \u_mac_and_scale/mult_4_2_top [0] ) , 
    .CO ( \DP_OP_246_35163_65499_J1/N_9 ) , 
    .S ( \DP_OP_246_35163_65499_J1/N_8 ) ) ;
FA1D0BWP30P140HVT \DP_OP_246_35163_65499_J1/U_6 ( 
    .A ( \u_mac_and_scale/mult_2/mult01 [5] ) , 
    .B ( \u_mac_and_scale/mult_2/mult10 [5] ) , 
    .CI ( \u_mac_and_scale/mult_4_2_top [1] ) , 
    .CO ( \DP_OP_246_35163_65499_J1/N_11 ) , 
    .S ( \DP_OP_246_35163_65499_J1/N_10 ) ) ;
FA1D0BWP30P140HVT \DP_OP_246_35163_65499_J1/U_7 ( 
    .A ( \u_mac_and_scale/mult_2/mult01 [6] ) , 
    .B ( \u_mac_and_scale/mult_2/mult10 [6] ) , 
    .CI ( \u_mac_and_scale/mult_4_2_top [2] ) , 
    .CO ( \DP_OP_246_35163_65499_J1/N_13 ) , 
    .S ( \DP_OP_246_35163_65499_J1/N_12 ) ) ;
FA1D0BWP30P140HVT \DP_OP_246_35163_65499_J1/U_8 ( 
    .A ( \u_mac_and_scale/mult_2/mult01 [7] ) , 
    .B ( \u_mac_and_scale/mult_2/mult10 [7] ) , 
    .CI ( \u_mac_and_scale/mult_4_2_top [3] ) , 
    .CO ( \DP_OP_246_35163_65499_J1/N_15 ) , 
    .S ( \DP_OP_246_35163_65499_J1/N_14 ) ) ;
FA1D0BWP30P140HVT \DP_OP_246_35163_65499_J1/U_9 ( 
    .A ( \u_mac_and_scale/mult_4_2_top [4] ) , .B ( phfnn_3823 ) , 
    .CI ( phfnn_2529 ) , .CO ( \DP_OP_246_35163_65499_J1/N_17 ) , 
    .S ( \DP_OP_246_35163_65499_J1/N_16 ) ) ;
FA1D0BWP30P140HVT \DP_OP_246_35163_65499_J1/U_15 ( 
    .A ( \u_mac_and_scale/mult_2/mult01 [0] ) , 
    .B ( \u_mac_and_scale/mult_2/mult10 [0] ) , 
    .CI ( \u_mac_and_scale/mult_4_2_bottom[4] ) , 
    .CO ( \DP_OP_246_35163_65499_J1/N_28 ) , .S ( N232 ) ) ;
FA1D0BWP30P140HVT \DP_OP_246_35163_65499_J1/U_18 ( 
    .A ( \u_mac_and_scale/mult_2/mult10 [1] ) , 
    .B ( \DP_OP_246_35163_65499_J1/N_2 ) , 
    .CI ( \DP_OP_246_35163_65499_J1/N_28 ) , 
    .CO ( \DP_OP_246_35163_65499_J1/N_32 ) , .S ( N231 ) ) ;
FA1D0BWP30P140HVT \DP_OP_246_35163_65499_J1/U_202 ( 
    .A ( \DP_OP_246_35163_65499_J1/N_3 ) , 
    .B ( \DP_OP_246_35163_65499_J1/N_4 ) , 
    .CI ( \DP_OP_246_35163_65499_J1/N_32 ) , 
    .CO ( \DP_OP_246_35163_65499_J1/N_35 ) , .S ( N230 ) ) ;
FA1D0BWP30P140HVT \DP_OP_246_35163_65499_J1/U_23 ( 
    .A ( \DP_OP_246_35163_65499_J1/N_5 ) , 
    .B ( \DP_OP_246_35163_65499_J1/N_6 ) , 
    .CI ( \DP_OP_246_35163_65499_J1/N_35 ) , 
    .CO ( \DP_OP_246_35163_65499_J1/N_39 ) , .S ( N229 ) ) ;
FA1D0BWP30P140HVT \DP_OP_246_35163_65499_J1/U_25 ( 
    .A ( \DP_OP_246_35163_65499_J1/N_7 ) , 
    .B ( \DP_OP_246_35163_65499_J1/N_8 ) , 
    .CI ( \DP_OP_246_35163_65499_J1/N_39 ) , 
    .CO ( \DP_OP_246_35163_65499_J1/N_42 ) , .S ( N228 ) ) ;
FA1D0BWP30P140HVT \DP_OP_246_35163_65499_J1/U_28 ( 
    .A ( \DP_OP_246_35163_65499_J1/N_9 ) , 
    .B ( \DP_OP_246_35163_65499_J1/N_10 ) , 
    .CI ( \DP_OP_246_35163_65499_J1/N_42 ) , 
    .CO ( \DP_OP_246_35163_65499_J1/N_46 ) , .S ( N227 ) ) ;
FA1D0BWP30P140HVT \DP_OP_246_35163_65499_J1/U_30 ( 
    .A ( \DP_OP_246_35163_65499_J1/N_11 ) , 
    .B ( \DP_OP_246_35163_65499_J1/N_12 ) , 
    .CI ( \DP_OP_246_35163_65499_J1/N_46 ) , 
    .CO ( \DP_OP_246_35163_65499_J1/N_49 ) , .S ( N226 ) ) ;
FA1D0BWP30P140HVT \DP_OP_246_35163_65499_J1/U_33 ( 
    .A ( \DP_OP_246_35163_65499_J1/N_13 ) , 
    .B ( \DP_OP_246_35163_65499_J1/N_14 ) , 
    .CI ( \DP_OP_246_35163_65499_J1/N_49 ) , 
    .CO ( \DP_OP_246_35163_65499_J1/N_53 ) , .S ( N225 ) ) ;
FA1D0BWP30P140HVT \DP_OP_246_35163_65499_J1/U_35 ( 
    .A ( \DP_OP_246_35163_65499_J1/N_15 ) , 
    .B ( \DP_OP_246_35163_65499_J1/N_16 ) , 
    .CI ( \DP_OP_246_35163_65499_J1/N_53 ) , 
    .CO ( \DP_OP_246_35163_65499_J1/N_56 ) , .S ( N224 ) ) ;
FA1D0BWP30P140HVT \DP_OP_246_35163_65499_J1/U_38 ( .A ( phfnn_3812 ) , 
    .B ( \DP_OP_246_35163_65499_J1/N_17 ) , 
    .CI ( \DP_OP_246_35163_65499_J1/N_56 ) , 
    .CO ( \DP_OP_246_35163_65499_J1/N_60 ) , .S ( N223 ) ) ;
FA1D0BWP30P140HVT \DP_OP_246_35163_65499_J1/U_40 ( 
    .A ( \u_mac_and_scale/mult_4_2_top [5] ) , .B ( phfnn_3180 ) , 
    .CI ( \DP_OP_246_35163_65499_J1/N_60 ) , 
    .CO ( \DP_OP_246_35163_65499_J1/N_63 ) , .S ( N222 ) ) ;
AN2D0BWP30P140HVT \DP_OP_247_35163_65499_J1/ctmi_17305 ( 
    .A1 ( \u_mac_and_scale/mult_0/mult01 [1] ) , 
    .A2 ( \u_mac_and_scale/mult_4_0_bottom[5] ) , 
    .Z ( \DP_OP_247_35163_65499_J1/N_3 ) ) ;
IAO21D1BWP30P140HVT \DP_OP_247_35163_65499_J1/ctmi_17307 ( 
    .A1 ( \u_mac_and_scale/mult_4_0_bottom[5] ) , 
    .A2 ( \u_mac_and_scale/mult_0/mult01 [1] ) , 
    .B ( \DP_OP_247_35163_65499_J1/N_3 ) , 
    .ZN ( \DP_OP_247_35163_65499_J1/N_2 ) ) ;
FA1D0BWP30P140HVT \DP_OP_247_35163_65499_J1/U_3 ( 
    .A ( \u_mac_and_scale/mult_4_0_bottom[6] ) , 
    .B ( \u_mac_and_scale/mult_0/mult01 [2] ) , 
    .CI ( \u_mac_and_scale/mult_0/mult10 [2] ) , 
    .CO ( \DP_OP_247_35163_65499_J1/N_5 ) , 
    .S ( \DP_OP_247_35163_65499_J1/N_4 ) ) ;
FA1D0BWP30P140HVT \DP_OP_247_35163_65499_J1/U_4 ( 
    .A ( \u_mac_and_scale/mult_4_0_bottom[7] ) , 
    .B ( \u_mac_and_scale/mult_0/mult01 [3] ) , 
    .CI ( \u_mac_and_scale/mult_0/mult10 [3] ) , 
    .CO ( \DP_OP_247_35163_65499_J1/N_7 ) , 
    .S ( \DP_OP_247_35163_65499_J1/N_6 ) ) ;
FA1D0BWP30P140HVT \DP_OP_247_35163_65499_J1/U_5 ( 
    .A ( \u_mac_and_scale/mult_0/mult01 [4] ) , 
    .B ( \u_mac_and_scale/mult_0/mult10 [4] ) , 
    .CI ( \u_mac_and_scale/mult_4_0_top [0] ) , 
    .CO ( \DP_OP_247_35163_65499_J1/N_9 ) , 
    .S ( \DP_OP_247_35163_65499_J1/N_8 ) ) ;
FA1D0BWP30P140HVT \DP_OP_247_35163_65499_J1/U_6 ( 
    .A ( \u_mac_and_scale/mult_0/mult01 [5] ) , 
    .B ( \u_mac_and_scale/mult_0/mult10 [5] ) , 
    .CI ( \u_mac_and_scale/mult_4_0_top [1] ) , 
    .CO ( \DP_OP_247_35163_65499_J1/N_11 ) , 
    .S ( \DP_OP_247_35163_65499_J1/N_10 ) ) ;
FA1D0BWP30P140HVT \DP_OP_247_35163_65499_J1/U_7 ( 
    .A ( \u_mac_and_scale/mult_0/mult01 [6] ) , 
    .B ( \u_mac_and_scale/mult_0/mult10 [6] ) , 
    .CI ( \u_mac_and_scale/mult_4_0_top [2] ) , 
    .CO ( \DP_OP_247_35163_65499_J1/N_13 ) , 
    .S ( \DP_OP_247_35163_65499_J1/N_12 ) ) ;
FA1D0BWP30P140HVT \DP_OP_247_35163_65499_J1/U_8 ( 
    .A ( \u_mac_and_scale/mult_0/mult01 [7] ) , 
    .B ( \u_mac_and_scale/mult_0/mult10 [7] ) , 
    .CI ( \u_mac_and_scale/mult_4_0_top [3] ) , 
    .CO ( \DP_OP_247_35163_65499_J1/N_15 ) , 
    .S ( \DP_OP_247_35163_65499_J1/N_14 ) ) ;
FA1D0BWP30P140HVT \DP_OP_247_35163_65499_J1/U_9 ( 
    .A ( \u_mac_and_scale/mult_4_0_top [4] ) , .B ( phfnn_3826 ) , 
    .CI ( phfnn_2528 ) , .CO ( \DP_OP_247_35163_65499_J1/N_17 ) , 
    .S ( \DP_OP_247_35163_65499_J1/N_16 ) ) ;
FA1D0BWP30P140HVT \DP_OP_247_35163_65499_J1/U_15 ( 
    .A ( \u_mac_and_scale/mult_0/mult01 [0] ) , 
    .B ( \u_mac_and_scale/mult_0/mult10 [0] ) , 
    .CI ( \u_mac_and_scale/mult_4_0_bottom[4] ) , 
    .CO ( \DP_OP_247_35163_65499_J1/N_28 ) , .S ( N248 ) ) ;
FA1D0BWP30P140HVT \DP_OP_247_35163_65499_J1/U_18 ( 
    .A ( \u_mac_and_scale/mult_0/mult10 [1] ) , 
    .B ( \DP_OP_247_35163_65499_J1/N_2 ) , 
    .CI ( \DP_OP_247_35163_65499_J1/N_28 ) , 
    .CO ( \DP_OP_247_35163_65499_J1/N_32 ) , .S ( N247 ) ) ;
FA1D0BWP30P140HVT \DP_OP_247_35163_65499_J1/U_202 ( 
    .A ( \DP_OP_247_35163_65499_J1/N_3 ) , 
    .B ( \DP_OP_247_35163_65499_J1/N_4 ) , 
    .CI ( \DP_OP_247_35163_65499_J1/N_32 ) , 
    .CO ( \DP_OP_247_35163_65499_J1/N_35 ) , .S ( N246 ) ) ;
FA1D0BWP30P140HVT \DP_OP_247_35163_65499_J1/U_23 ( 
    .A ( \DP_OP_247_35163_65499_J1/N_5 ) , 
    .B ( \DP_OP_247_35163_65499_J1/N_6 ) , 
    .CI ( \DP_OP_247_35163_65499_J1/N_35 ) , 
    .CO ( \DP_OP_247_35163_65499_J1/N_39 ) , .S ( N245 ) ) ;
FA1D0BWP30P140HVT \DP_OP_247_35163_65499_J1/U_25 ( 
    .A ( \DP_OP_247_35163_65499_J1/N_7 ) , 
    .B ( \DP_OP_247_35163_65499_J1/N_8 ) , 
    .CI ( \DP_OP_247_35163_65499_J1/N_39 ) , 
    .CO ( \DP_OP_247_35163_65499_J1/N_42 ) , .S ( N244 ) ) ;
FA1D0BWP30P140HVT \DP_OP_247_35163_65499_J1/U_28 ( 
    .A ( \DP_OP_247_35163_65499_J1/N_9 ) , 
    .B ( \DP_OP_247_35163_65499_J1/N_10 ) , 
    .CI ( \DP_OP_247_35163_65499_J1/N_42 ) , 
    .CO ( \DP_OP_247_35163_65499_J1/N_46 ) , .S ( N243 ) ) ;
FA1D0BWP30P140HVT \DP_OP_247_35163_65499_J1/U_30 ( 
    .A ( \DP_OP_247_35163_65499_J1/N_11 ) , 
    .B ( \DP_OP_247_35163_65499_J1/N_12 ) , 
    .CI ( \DP_OP_247_35163_65499_J1/N_46 ) , 
    .CO ( \DP_OP_247_35163_65499_J1/N_49 ) , .S ( N242 ) ) ;
FA1D0BWP30P140HVT \DP_OP_247_35163_65499_J1/U_33 ( 
    .A ( \DP_OP_247_35163_65499_J1/N_13 ) , 
    .B ( \DP_OP_247_35163_65499_J1/N_14 ) , 
    .CI ( \DP_OP_247_35163_65499_J1/N_49 ) , 
    .CO ( \DP_OP_247_35163_65499_J1/N_53 ) , .S ( N241 ) ) ;
FA1D0BWP30P140HVT \DP_OP_247_35163_65499_J1/U_35 ( 
    .A ( \DP_OP_247_35163_65499_J1/N_15 ) , 
    .B ( \DP_OP_247_35163_65499_J1/N_16 ) , 
    .CI ( \DP_OP_247_35163_65499_J1/N_53 ) , 
    .CO ( \DP_OP_247_35163_65499_J1/N_56 ) , .S ( N240 ) ) ;
FA1D0BWP30P140HVT \DP_OP_247_35163_65499_J1/U_38 ( .A ( phfnn_2510 ) , 
    .B ( \DP_OP_247_35163_65499_J1/N_17 ) , 
    .CI ( \DP_OP_247_35163_65499_J1/N_56 ) , 
    .CO ( \DP_OP_247_35163_65499_J1/N_60 ) , .S ( N239 ) ) ;
FA1D0BWP30P140HVT \DP_OP_247_35163_65499_J1/U_40 ( .A ( phfnn_3810 ) , 
    .B ( phfnn_826 ) , .CI ( \DP_OP_247_35163_65499_J1/N_60 ) , 
    .CO ( \DP_OP_247_35163_65499_J1/N_63 ) , .S ( N238 ) ) ;
FA1D0BWP30P140HVT \DP_OP_248_26668_65499_J1/U_5 ( 
    .A ( \u_mac_and_scale/mult_4_1_top [0] ) , 
    .B ( \u_mac_and_scale/mult_4_2_bottom[0] ) , 
    .CI ( \u_mac_and_scale/mult_4_2_top [0] ) , 
    .CO ( \DP_OP_248_26668_65499_J1/N_6 ) , 
    .S ( \DP_OP_248_26668_65499_J1/N_5 ) ) ;
FA1D0BWP30P140HVT \DP_OP_248_26668_65499_J1/U_6 ( 
    .A ( \u_mac_and_scale/mult_4_1_top [1] ) , .B ( N235 ) , 
    .CI ( \u_mac_and_scale/mult_4_2_top [1] ) , 
    .CO ( \DP_OP_248_26668_65499_J1/N_8 ) , 
    .S ( \DP_OP_248_26668_65499_J1/N_7 ) ) ;
FA1D0BWP30P140HVT \DP_OP_248_26668_65499_J1/U_7 ( 
    .A ( \u_mac_and_scale/mult_4_3_bottom [1] ) , 
    .B ( \u_mac_and_scale/mult_4_3_top [1] ) , 
    .CI ( \DP_OP_248_26668_65499_J1/N_6 ) , 
    .CO ( \DP_OP_248_26668_65499_J1/N_10 ) , 
    .S ( \DP_OP_248_26668_65499_J1/N_9 ) ) ;
AN2D0BWP30P140HVT \DP_OP_248_26668_65499_J1/ctmi_17315 ( .A1 ( N234 ) , 
    .A2 ( \u_mac_and_scale/mult_4_1_top [2] ) , 
    .Z ( \DP_OP_248_26668_65499_J1/N_12 ) ) ;
IAO21D1BWP30P140HVT \DP_OP_248_26668_65499_J1/ctmi_17316 ( 
    .A1 ( \u_mac_and_scale/mult_4_1_top [2] ) , .A2 ( N234 ) , 
    .B ( \DP_OP_248_26668_65499_J1/N_12 ) , 
    .ZN ( \DP_OP_248_26668_65499_J1/N_11 ) ) ;
FA1D0BWP30P140HVT \DP_OP_248_26668_65499_J1/U_9 ( 
    .A ( \u_mac_and_scale/mult_4_2_top [2] ) , 
    .B ( \u_mac_and_scale/mult_4_3_bottom [2] ) , 
    .CI ( \u_mac_and_scale/mult_4_3_top [2] ) , 
    .CO ( \DP_OP_248_26668_65499_J1/N_14 ) , 
    .S ( \DP_OP_248_26668_65499_J1/N_13 ) ) ;
FA1D0BWP30P140HVT \DP_OP_248_26668_65499_J1/U_10 ( 
    .A ( \DP_OP_248_26668_65499_J1/N_11 ) , 
    .B ( \DP_OP_248_26668_65499_J1/N_8 ) , 
    .CI ( \DP_OP_248_26668_65499_J1/N_13 ) , 
    .CO ( \DP_OP_248_26668_65499_J1/N_16 ) , 
    .S ( \DP_OP_248_26668_65499_J1/N_15 ) ) ;
FA1D0BWP30P140HVT \DP_OP_248_26668_65499_J1/U_11 ( 
    .A ( \u_mac_and_scale/mult_4_1_top [3] ) , .B ( N233 ) , 
    .CI ( \u_mac_and_scale/mult_4_2_top [3] ) , 
    .CO ( \DP_OP_248_26668_65499_J1/N_18 ) , 
    .S ( \DP_OP_248_26668_65499_J1/N_17 ) ) ;
FA1D0BWP30P140HVT \DP_OP_248_26668_65499_J1/U_12 ( 
    .A ( \u_mac_and_scale/mult_4_3_bottom [3] ) , 
    .B ( \u_mac_and_scale/mult_4_3_top [3] ) , 
    .CI ( \DP_OP_248_26668_65499_J1/N_12 ) , 
    .CO ( \DP_OP_248_26668_65499_J1/N_20 ) , 
    .S ( \DP_OP_248_26668_65499_J1/N_19 ) ) ;
FA1D0BWP30P140HVT \DP_OP_248_26668_65499_J1/U_13 ( 
    .A ( \DP_OP_248_26668_65499_J1/N_14 ) , 
    .B ( \DP_OP_248_26668_65499_J1/N_17 ) , 
    .CI ( \DP_OP_248_26668_65499_J1/N_19 ) , 
    .CO ( \DP_OP_248_26668_65499_J1/N_22 ) , 
    .S ( \DP_OP_248_26668_65499_J1/N_21 ) ) ;
FA1D0BWP30P140HVT \DP_OP_248_26668_65499_J1/U_14 ( 
    .A ( \u_mac_and_scale/mult_4_1_top [4] ) , 
    .B ( \u_mac_and_scale/mult_4_2_bottom[4] ) , 
    .CI ( \u_mac_and_scale/mult_4_2_top [4] ) , 
    .CO ( \DP_OP_248_26668_65499_J1/N_24 ) , 
    .S ( \DP_OP_248_26668_65499_J1/N_23 ) ) ;
FA1D0BWP30P140HVT \DP_OP_248_26668_65499_J1/U_15 ( 
    .A ( \u_mac_and_scale/mult_4_3_bottom [4] ) , 
    .B ( \u_mac_and_scale/mult_4_3_top [4] ) , 
    .CI ( \DP_OP_248_26668_65499_J1/N_18 ) , 
    .CO ( \DP_OP_248_26668_65499_J1/N_26 ) , 
    .S ( \DP_OP_248_26668_65499_J1/N_25 ) ) ;
FA1D0BWP30P140HVT \DP_OP_248_26668_65499_J1/U_16 ( 
    .A ( \DP_OP_248_26668_65499_J1/N_20 ) , 
    .B ( \DP_OP_248_26668_65499_J1/N_23 ) , 
    .CI ( \DP_OP_248_26668_65499_J1/N_22 ) , 
    .CO ( \DP_OP_248_26668_65499_J1/N_28 ) , 
    .S ( \DP_OP_248_26668_65499_J1/N_27 ) ) ;
FA1D0BWP30P140HVT \DP_OP_248_26668_65499_J1/U_17 ( 
    .A ( \u_mac_and_scale/mult_4_1_top [5] ) , 
    .B ( \u_mac_and_scale/mult_4_2_bottom[5] ) , 
    .CI ( \u_mac_and_scale/mult_4_2_top [5] ) , 
    .CO ( \DP_OP_248_26668_65499_J1/N_30 ) , 
    .S ( \DP_OP_248_26668_65499_J1/N_29 ) ) ;
FA1D0BWP30P140HVT \DP_OP_248_26668_65499_J1/U_18 ( 
    .A ( \u_mac_and_scale/mult_4_3_bottom [5] ) , 
    .B ( \u_mac_and_scale/mult_4_3_top [5] ) , 
    .CI ( \DP_OP_248_26668_65499_J1/N_24 ) , 
    .CO ( \DP_OP_248_26668_65499_J1/N_32 ) , 
    .S ( \DP_OP_248_26668_65499_J1/N_31 ) ) ;
FA1D0BWP30P140HVT \DP_OP_248_26668_65499_J1/U_19 ( 
    .A ( \DP_OP_248_26668_65499_J1/N_29 ) , 
    .B ( \DP_OP_248_26668_65499_J1/N_26 ) , 
    .CI ( \DP_OP_248_26668_65499_J1/N_31 ) , 
    .CO ( \DP_OP_248_26668_65499_J1/N_34 ) , 
    .S ( \DP_OP_248_26668_65499_J1/N_33 ) ) ;
FA1D0BWP30P140HVT \DP_OP_248_26668_65499_J1/U_20 ( .A ( phfnn_3815 ) , 
    .B ( \u_mac_and_scale/mult_4_2_bottom[6] ) , .CI ( phfnn_3816 ) , 
    .CO ( \DP_OP_248_26668_65499_J1/N_36 ) , 
    .S ( \DP_OP_248_26668_65499_J1/N_35 ) ) ;
FA1D0BWP30P140HVT \DP_OP_248_26668_65499_J1/U_21 ( 
    .A ( \u_mac_and_scale/mult_4_3_bottom [6] ) , .B ( phfnn_3817 ) , 
    .CI ( \DP_OP_248_26668_65499_J1/N_30 ) , 
    .CO ( \DP_OP_248_26668_65499_J1/N_38 ) , 
    .S ( \DP_OP_248_26668_65499_J1/N_37 ) ) ;
FA1D0BWP30P140HVT \DP_OP_248_26668_65499_J1/U_22 ( 
    .A ( \DP_OP_248_26668_65499_J1/N_35 ) , 
    .B ( \DP_OP_248_26668_65499_J1/N_32 ) , 
    .CI ( \DP_OP_248_26668_65499_J1/N_37 ) , 
    .CO ( \DP_OP_248_26668_65499_J1/N_40 ) , 
    .S ( \DP_OP_248_26668_65499_J1/N_39 ) ) ;
FA1D0BWP30P140HVT \DP_OP_248_26668_65499_J1/U_24 ( 
    .A ( \DP_OP_248_26668_65499_J1/N_1 ) , 
    .B ( \DP_OP_248_26668_65499_J1/N_2 ) , .CI ( phfnn_3822 ) , 
    .CO ( \DP_OP_248_26668_65499_J1/N_43 ) , 
    .S ( \DP_OP_248_26668_65499_J1/N_42 ) ) ;
FA1D0BWP30P140HVT \DP_OP_248_26668_65499_J1/U_25 ( 
    .A ( \DP_OP_248_26668_65499_J1/N_4 ) , .B ( phfnn_827 ) , 
    .CI ( \DP_OP_248_26668_65499_J1/N_36 ) , 
    .CO ( \DP_OP_248_26668_65499_J1/N_45 ) , 
    .S ( \DP_OP_248_26668_65499_J1/N_44 ) ) ;
FA1D0BWP30P140HVT \DP_OP_248_26668_65499_J1/U_26 ( 
    .A ( \DP_OP_248_26668_65499_J1/N_42 ) , 
    .B ( \DP_OP_248_26668_65499_J1/N_38 ) , 
    .CI ( \DP_OP_248_26668_65499_J1/N_44 ) , 
    .CO ( \DP_OP_248_26668_65499_J1/N_47 ) , 
    .S ( \DP_OP_248_26668_65499_J1/N_46 ) ) ;
FA1D0BWP30P140HVT \DP_OP_248_26668_65499_J1/U_28 ( .A ( phfnn_827 ) , 
    .B ( \DP_OP_248_26668_65499_J1/N_43 ) , 
    .CI ( \DP_OP_248_26668_65499_J1/N_45 ) , 
    .CO ( \DP_OP_248_26668_65499_J1/N_50 ) , 
    .S ( \DP_OP_248_26668_65499_J1/N_49 ) ) ;
FA1D0BWP30P140HVT \DP_OP_248_26668_65499_J1/U_31 ( 
    .A ( \u_mac_and_scale/mult_4_3_bottom [0] ) , 
    .B ( \u_mac_and_scale/mult_4_3_top [0] ) , 
    .CI ( \DP_OP_248_26668_65499_J1/N_5 ) , 
    .CO ( \DP_OP_248_26668_65499_J1/N_54 ) , .S ( N263 ) ) ;
FA1D0BWP30P140HVT \DP_OP_248_26668_65499_J1/U_34 ( 
    .A ( \DP_OP_248_26668_65499_J1/N_7 ) , 
    .B ( \DP_OP_248_26668_65499_J1/N_9 ) , 
    .CI ( \DP_OP_248_26668_65499_J1/N_54 ) , 
    .CO ( \DP_OP_248_26668_65499_J1/N_58 ) , .S ( N262 ) ) ;
FA1D0BWP30P140HVT \DP_OP_248_26668_65499_J1/U_36 ( 
    .A ( \DP_OP_248_26668_65499_J1/N_10 ) , 
    .B ( \DP_OP_248_26668_65499_J1/N_15 ) , 
    .CI ( \DP_OP_248_26668_65499_J1/N_58 ) , 
    .CO ( \DP_OP_248_26668_65499_J1/N_61 ) , .S ( N261 ) ) ;
FA1D0BWP30P140HVT \DP_OP_248_26668_65499_J1/U_39 ( 
    .A ( \DP_OP_248_26668_65499_J1/N_16 ) , 
    .B ( \DP_OP_248_26668_65499_J1/N_21 ) , 
    .CI ( \DP_OP_248_26668_65499_J1/N_61 ) , 
    .CO ( \DP_OP_248_26668_65499_J1/N_65 ) , .S ( N260 ) ) ;
FA1D0BWP30P140HVT \DP_OP_248_26668_65499_J1/U_41 ( 
    .A ( \DP_OP_248_26668_65499_J1/N_25 ) , 
    .B ( \DP_OP_248_26668_65499_J1/N_27 ) , 
    .CI ( \DP_OP_248_26668_65499_J1/N_65 ) , 
    .CO ( \DP_OP_248_26668_65499_J1/N_68 ) , .S ( N259 ) ) ;
FA1D0BWP30P140HVT \DP_OP_248_26668_65499_J1/U_44 ( 
    .A ( \DP_OP_248_26668_65499_J1/N_28 ) , 
    .B ( \DP_OP_248_26668_65499_J1/N_33 ) , 
    .CI ( \DP_OP_248_26668_65499_J1/N_68 ) , 
    .CO ( \DP_OP_248_26668_65499_J1/N_72 ) , .S ( N258 ) ) ;
FA1D0BWP30P140HVT \DP_OP_248_26668_65499_J1/U_46 ( 
    .A ( \DP_OP_248_26668_65499_J1/N_34 ) , 
    .B ( \DP_OP_248_26668_65499_J1/N_39 ) , 
    .CI ( \DP_OP_248_26668_65499_J1/N_72 ) , 
    .CO ( \DP_OP_248_26668_65499_J1/N_75 ) , .S ( N257 ) ) ;
FA1D0BWP30P140HVT \DP_OP_248_26668_65499_J1/U_49 ( 
    .A ( \DP_OP_248_26668_65499_J1/N_40 ) , 
    .B ( \DP_OP_248_26668_65499_J1/N_46 ) , 
    .CI ( \DP_OP_248_26668_65499_J1/N_75 ) , 
    .CO ( \DP_OP_248_26668_65499_J1/N_79 ) , .S ( N256 ) ) ;
FA1D0BWP30P140HVT \DP_OP_248_26668_65499_J1/U_51 ( 
    .A ( \DP_OP_248_26668_65499_J1/N_47 ) , 
    .B ( \DP_OP_248_26668_65499_J1/N_49 ) , 
    .CI ( \DP_OP_248_26668_65499_J1/N_79 ) , 
    .CO ( \DP_OP_248_26668_65499_J1/N_82 ) , .S ( N255 ) ) ;
XOR3UD0BWP30P140HVT \DP_OP_249_24682_65499_J1/ctmi_17334 ( 
    .A1 ( \u_mac_and_scale/gated_hi_addend [31] ) , 
    .A2 ( \DP_OP_249_24682_65499_J1/N_108 ) , 
    .A3 ( \u_mac_and_scale/gated_hi_feedback [31] ) , .Z ( N264 ) ) ;
FA1D0BWP30P140HVT \DP_OP_249_24682_65499_J1/U_4 ( 
    .A ( \u_mac_and_scale/gated_hi_addend [1] ) , 
    .B ( \u_mac_and_scale/gated_hi_feedback [1] ) , 
    .CI ( \DP_OP_249_24682_65499_J1/N_3 ) , 
    .CO ( \DP_OP_249_24682_65499_J1/N_6 ) , .S ( N303 ) ) ;
FA1D0BWP30P140HVT \DP_OP_249_24682_65499_J1/U_7 ( 
    .A ( \u_mac_and_scale/gated_hi_addend [2] ) , 
    .B ( \u_mac_and_scale/gated_hi_feedback [2] ) , 
    .CI ( \DP_OP_249_24682_65499_J1/N_6 ) , 
    .CO ( \DP_OP_249_24682_65499_J1/N_10 ) , .S ( N302 ) ) ;
FA1D0BWP30P140HVT \DP_OP_249_24682_65499_J1/U_9 ( 
    .A ( \u_mac_and_scale/gated_hi_addend [3] ) , 
    .B ( \u_mac_and_scale/gated_hi_feedback [3] ) , 
    .CI ( \DP_OP_249_24682_65499_J1/N_10 ) , 
    .CO ( \DP_OP_249_24682_65499_J1/N_13 ) , .S ( N301 ) ) ;
FA1D0BWP30P140HVT \DP_OP_249_24682_65499_J1/U_12 ( 
    .A ( \u_mac_and_scale/gated_hi_addend [4] ) , 
    .B ( \u_mac_and_scale/gated_hi_feedback [4] ) , 
    .CI ( \DP_OP_249_24682_65499_J1/N_13 ) , 
    .CO ( \DP_OP_249_24682_65499_J1/N_17 ) , .S ( N300 ) ) ;
FA1D0BWP30P140HVT \DP_OP_249_24682_65499_J1/U_14 ( 
    .A ( \u_mac_and_scale/gated_hi_addend [5] ) , 
    .B ( \u_mac_and_scale/gated_hi_feedback [5] ) , 
    .CI ( \DP_OP_249_24682_65499_J1/N_17 ) , 
    .CO ( \DP_OP_249_24682_65499_J1/N_20 ) , .S ( N299 ) ) ;
FA1D0BWP30P140HVT \DP_OP_249_24682_65499_J1/U_17 ( 
    .A ( \u_mac_and_scale/gated_hi_addend [6] ) , 
    .B ( \u_mac_and_scale/gated_hi_feedback [6] ) , 
    .CI ( \DP_OP_249_24682_65499_J1/N_20 ) , 
    .CO ( \DP_OP_249_24682_65499_J1/N_24 ) , .S ( N298 ) ) ;
FA1D0BWP30P140HVT \DP_OP_249_24682_65499_J1/U_19 ( 
    .A ( \u_mac_and_scale/gated_hi_addend [7] ) , 
    .B ( \u_mac_and_scale/gated_hi_feedback [7] ) , 
    .CI ( \DP_OP_249_24682_65499_J1/N_24 ) , 
    .CO ( \DP_OP_249_24682_65499_J1/N_27 ) , .S ( N297 ) ) ;
FA1D0BWP30P140HVT \DP_OP_249_24682_65499_J1/U_22 ( .A ( phfnn_3900 ) , 
    .B ( \u_mac_and_scale/gated_hi_feedback [8] ) , 
    .CI ( \DP_OP_249_24682_65499_J1/N_27 ) , 
    .CO ( \DP_OP_249_24682_65499_J1/N_31 ) , .S ( N296 ) ) ;
FA1D0BWP30P140HVT \DP_OP_249_24682_65499_J1/U_24 ( .A ( phfnn_3901 ) , 
    .B ( \u_mac_and_scale/gated_hi_feedback [9] ) , 
    .CI ( \DP_OP_249_24682_65499_J1/N_31 ) , 
    .CO ( \DP_OP_249_24682_65499_J1/N_34 ) , .S ( N295 ) ) ;
FA1D0BWP30P140HVT \DP_OP_249_24682_65499_J1/U_27 ( .A ( phfnn_3902 ) , 
    .B ( \u_mac_and_scale/gated_hi_feedback [10] ) , 
    .CI ( \DP_OP_249_24682_65499_J1/N_34 ) , 
    .CO ( \DP_OP_249_24682_65499_J1/N_38 ) , .S ( N294 ) ) ;
FA1D0BWP30P140HVT \DP_OP_249_24682_65499_J1/U_29 ( .A ( phfnn_3903 ) , 
    .B ( \u_mac_and_scale/gated_hi_feedback [11] ) , 
    .CI ( \DP_OP_249_24682_65499_J1/N_38 ) , 
    .CO ( \DP_OP_249_24682_65499_J1/N_41 ) , .S ( N293 ) ) ;
FA1D0BWP30P140HVT \DP_OP_249_24682_65499_J1/U_32 ( .A ( phfnn_3904 ) , 
    .B ( \u_mac_and_scale/gated_hi_feedback [12] ) , 
    .CI ( \DP_OP_249_24682_65499_J1/N_41 ) , 
    .CO ( \DP_OP_249_24682_65499_J1/N_45 ) , .S ( N292 ) ) ;
FA1D0BWP30P140HVT \DP_OP_249_24682_65499_J1/U_34 ( .A ( phfnn_3905 ) , 
    .B ( \u_mac_and_scale/gated_hi_feedback [13] ) , 
    .CI ( \DP_OP_249_24682_65499_J1/N_45 ) , 
    .CO ( \DP_OP_249_24682_65499_J1/N_48 ) , .S ( N291 ) ) ;
FA1D0BWP30P140HVT \DP_OP_249_24682_65499_J1/U_37 ( .A ( phfnn_3906 ) , 
    .B ( \u_mac_and_scale/gated_hi_feedback [14] ) , 
    .CI ( \DP_OP_249_24682_65499_J1/N_48 ) , 
    .CO ( \DP_OP_249_24682_65499_J1/N_52 ) , .S ( N290 ) ) ;
FA1D0BWP30P140HVT \DP_OP_249_24682_65499_J1/U_39 ( .A ( phfnn_3908 ) , 
    .B ( \u_mac_and_scale/gated_hi_feedback [15] ) , 
    .CI ( \DP_OP_249_24682_65499_J1/N_52 ) , 
    .CO ( \DP_OP_249_24682_65499_J1/N_55 ) , .S ( N289 ) ) ;
FA1D0BWP30P140HVT \DP_OP_249_24682_65499_J1/U_42 ( 
    .A ( \u_mac_and_scale/gated_hi_addend [16] ) , 
    .B ( \u_mac_and_scale/gated_hi_feedback [16] ) , 
    .CI ( \DP_OP_249_24682_65499_J1/N_55 ) , 
    .CO ( \DP_OP_249_24682_65499_J1/N_59 ) , .S ( N288 ) ) ;
FA1D0BWP30P140HVT \DP_OP_249_24682_65499_J1/U_44 ( 
    .A ( \u_mac_and_scale/gated_hi_addend [17] ) , 
    .B ( \u_mac_and_scale/gated_hi_feedback [17] ) , 
    .CI ( \DP_OP_249_24682_65499_J1/N_59 ) , 
    .CO ( \DP_OP_249_24682_65499_J1/N_62 ) , .S ( N287 ) ) ;
FA1D0BWP30P140HVT \DP_OP_249_24682_65499_J1/U_47 ( 
    .A ( \u_mac_and_scale/gated_hi_addend [18] ) , 
    .B ( \u_mac_and_scale/gated_hi_feedback [18] ) , 
    .CI ( \DP_OP_249_24682_65499_J1/N_62 ) , 
    .CO ( \DP_OP_249_24682_65499_J1/N_66 ) , .S ( N286 ) ) ;
FA1D0BWP30P140HVT \DP_OP_249_24682_65499_J1/U_49 ( 
    .A ( \u_mac_and_scale/gated_hi_addend [19] ) , 
    .B ( \u_mac_and_scale/gated_hi_feedback [19] ) , 
    .CI ( \DP_OP_249_24682_65499_J1/N_66 ) , 
    .CO ( \DP_OP_249_24682_65499_J1/N_69 ) , .S ( N285 ) ) ;
FA1D0BWP30P140HVT \DP_OP_249_24682_65499_J1/U_52 ( 
    .A ( \u_mac_and_scale/gated_hi_addend [20] ) , 
    .B ( \u_mac_and_scale/gated_hi_feedback [20] ) , 
    .CI ( \DP_OP_249_24682_65499_J1/N_69 ) , 
    .CO ( \DP_OP_249_24682_65499_J1/N_73 ) , .S ( N284 ) ) ;
FA1D0BWP30P140HVT \DP_OP_249_24682_65499_J1/U_54 ( 
    .A ( \u_mac_and_scale/gated_hi_addend [21] ) , 
    .B ( \u_mac_and_scale/gated_hi_feedback [21] ) , 
    .CI ( \DP_OP_249_24682_65499_J1/N_73 ) , 
    .CO ( \DP_OP_249_24682_65499_J1/N_76 ) , .S ( N283 ) ) ;
FA1D0BWP30P140HVT \DP_OP_249_24682_65499_J1/U_57 ( 
    .A ( \u_mac_and_scale/gated_hi_addend [22] ) , 
    .B ( \u_mac_and_scale/gated_hi_feedback [22] ) , 
    .CI ( \DP_OP_249_24682_65499_J1/N_76 ) , 
    .CO ( \DP_OP_249_24682_65499_J1/N_80 ) , .S ( N282 ) ) ;
FA1D0BWP30P140HVT \DP_OP_249_24682_65499_J1/U_59 ( 
    .A ( \u_mac_and_scale/gated_hi_addend [23] ) , 
    .B ( \u_mac_and_scale/gated_hi_feedback [23] ) , 
    .CI ( \DP_OP_249_24682_65499_J1/N_80 ) , 
    .CO ( \DP_OP_249_24682_65499_J1/N_83 ) , .S ( N281 ) ) ;
FA1D0BWP30P140HVT \DP_OP_249_24682_65499_J1/U_62 ( 
    .A ( \u_mac_and_scale/gated_hi_addend [24] ) , 
    .B ( \u_mac_and_scale/gated_hi_feedback [24] ) , 
    .CI ( \DP_OP_249_24682_65499_J1/N_83 ) , 
    .CO ( \DP_OP_249_24682_65499_J1/N_87 ) , .S ( N280 ) ) ;
FA1D0BWP30P140HVT \DP_OP_249_24682_65499_J1/U_64 ( 
    .A ( \u_mac_and_scale/gated_hi_addend [25] ) , 
    .B ( \u_mac_and_scale/gated_hi_feedback [25] ) , 
    .CI ( \DP_OP_249_24682_65499_J1/N_87 ) , 
    .CO ( \DP_OP_249_24682_65499_J1/N_90 ) , .S ( N279 ) ) ;
FA1D0BWP30P140HVT \DP_OP_249_24682_65499_J1/U_67 ( 
    .A ( \u_mac_and_scale/gated_hi_addend [26] ) , 
    .B ( \u_mac_and_scale/gated_hi_feedback [26] ) , 
    .CI ( \DP_OP_249_24682_65499_J1/N_90 ) , 
    .CO ( \DP_OP_249_24682_65499_J1/N_94 ) , .S ( N278 ) ) ;
FA1D0BWP30P140HVT \DP_OP_249_24682_65499_J1/U_69 ( 
    .A ( \u_mac_and_scale/gated_hi_addend [27] ) , 
    .B ( \u_mac_and_scale/gated_hi_feedback [27] ) , 
    .CI ( \DP_OP_249_24682_65499_J1/N_94 ) , 
    .CO ( \DP_OP_249_24682_65499_J1/N_97 ) , .S ( N277 ) ) ;
FA1D0BWP30P140HVT \DP_OP_249_24682_65499_J1/U_72 ( 
    .A ( \u_mac_and_scale/gated_hi_addend [28] ) , 
    .B ( \u_mac_and_scale/gated_hi_feedback [28] ) , 
    .CI ( \DP_OP_249_24682_65499_J1/N_97 ) , 
    .CO ( \DP_OP_249_24682_65499_J1/N_101 ) , .S ( N267 ) ) ;
FA1D0BWP30P140HVT \DP_OP_249_24682_65499_J1/U_74 ( 
    .A ( \u_mac_and_scale/gated_hi_addend [29] ) , 
    .B ( \u_mac_and_scale/gated_hi_feedback [29] ) , 
    .CI ( \DP_OP_249_24682_65499_J1/N_101 ) , 
    .CO ( \DP_OP_249_24682_65499_J1/N_104 ) , .S ( N266 ) ) ;
FA1D0BWP30P140HVT \DP_OP_249_24682_65499_J1/U_77 ( 
    .A ( \u_mac_and_scale/gated_hi_addend [30] ) , 
    .B ( \u_mac_and_scale/gated_hi_feedback [30] ) , 
    .CI ( \DP_OP_249_24682_65499_J1/N_104 ) , 
    .CO ( \DP_OP_249_24682_65499_J1/N_108 ) , .S ( N265 ) ) ;
AN2D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/ctmi_275 ( 
    .A1 ( \RS_OP_250_54632_65499_J1/N14 ) , 
    .A2 ( \RS_OP_250_54632_65499_J1/N30 ) , 
    .Z ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_7 ) ) ;
IAO21D1BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/ctmi_280 ( 
    .A1 ( \RS_OP_250_54632_65499_J1/N31 ) , 
    .A2 ( \RS_OP_250_54632_65499_J1/N15 ) , 
    .B ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_5 ) , 
    .ZN ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_67 ) ) ;
IAO21D1BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/ctmi_281 ( 
    .A1 ( \RS_OP_250_54632_65499_J1/N30 ) , 
    .A2 ( \RS_OP_250_54632_65499_J1/N14 ) , 
    .B ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_7 ) , 
    .ZN ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_6 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_6 ( 
    .A ( \RS_OP_250_54632_65499_J1/N46 ) , 
    .B ( \RS_OP_250_54632_65499_J1/N62 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_5 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_9 ) , 
    .S ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_8 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_7 ( 
    .A ( \RS_OP_250_54632_65499_J1/N13 ) , 
    .B ( \RS_OP_250_54632_65499_J1/N29 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/N45 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_11 ) , 
    .S ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_10 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_8 ( 
    .A ( \RS_OP_250_54632_65499_J1/N61 ) , 
    .B ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_7 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_9 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_13 ) , 
    .S ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_12 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_9 ( 
    .A ( \RS_OP_250_54632_65499_J1/N12 ) , 
    .B ( \RS_OP_250_54632_65499_J1/N28 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/N44 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_15 ) , 
    .S ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_14 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_10 ( 
    .A ( \RS_OP_250_54632_65499_J1/N60 ) , 
    .B ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_11 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_14 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_17 ) , 
    .S ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_16 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_11 ( 
    .A ( \RS_OP_250_54632_65499_J1/N11 ) , 
    .B ( \RS_OP_250_54632_65499_J1/N27 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/N43 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_19 ) , 
    .S ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_18 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_12 ( 
    .A ( \RS_OP_250_54632_65499_J1/N59 ) , 
    .B ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_15 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_18 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_21 ) , 
    .S ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_20 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_13 ( 
    .A ( \RS_OP_250_54632_65499_J1/N10 ) , 
    .B ( \RS_OP_250_54632_65499_J1/N26 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/N42 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_23 ) , 
    .S ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_22 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_14 ( 
    .A ( \RS_OP_250_54632_65499_J1/N58 ) , 
    .B ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_19 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_22 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_25 ) , 
    .S ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_24 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_15 ( 
    .A ( \RS_OP_250_54632_65499_J1/N9 ) , 
    .B ( \RS_OP_250_54632_65499_J1/N25 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/N41 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_27 ) , 
    .S ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_26 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_16 ( 
    .A ( \RS_OP_250_54632_65499_J1/N57 ) , 
    .B ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_23 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_26 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_29 ) , 
    .S ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_28 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_17 ( 
    .A ( \RS_OP_250_54632_65499_J1/N8 ) , .B ( N202 ) , .CI ( N203 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_31 ) , 
    .S ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_30 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_18 ( 
    .A ( N204 ) , 
    .B ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_27 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_30 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_33 ) , 
    .S ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_32 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_19 ( 
    .A ( \RS_OP_250_54632_65499_J1/N7 ) , .B ( N217 ) , .CI ( N218 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_35 ) , 
    .S ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_34 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_20 ( 
    .A ( N219 ) , 
    .B ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_31 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_34 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_37 ) , 
    .S ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_36 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_21 ( 
    .A ( \RS_OP_250_54632_65499_J1/N6 ) , .B ( N220 ) , .CI ( N236 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_39 ) , 
    .S ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_38 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_22 ( 
    .A ( N268 ) , 
    .B ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_35 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_38 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_41 ) , 
    .S ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_40 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_23 ( 
    .A ( \RS_OP_250_54632_65499_J1/N5 ) , .B ( N269 ) , .CI ( N270 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_43 ) , 
    .S ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_42 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_24 ( 
    .A ( N271 ) , 
    .B ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_39 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_42 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_45 ) , 
    .S ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_44 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_25 ( 
    .A ( \u_mac_and_scale/mac8_in_0 [11] ) , .B ( N272 ) , .CI ( N273 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_47 ) , 
    .S ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_46 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_26 ( 
    .A ( N274 ) , 
    .B ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_43 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_46 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_49 ) , 
    .S ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_48 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_27 ( 
    .A ( \u_mac_and_scale/mac8_in_0 [12] ) , .B ( N275 ) , .CI ( N276 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_51 ) , 
    .S ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_50 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_28 ( 
    .A ( N305 ) , 
    .B ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_47 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_50 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_53 ) , 
    .S ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_52 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_29 ( 
    .A ( \u_mac_and_scale/mac8_in_0 [13] ) , .B ( N307 ) , .CI ( N308 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_55 ) , 
    .S ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_54 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_30 ( 
    .A ( N309 ) , 
    .B ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_51 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_54 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_57 ) , 
    .S ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_56 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_31 ( 
    .A ( \u_mac_and_scale/mac8_in_0 [14] ) , .B ( N310 ) , .CI ( N311 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_59 ) , 
    .S ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_58 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_32 ( 
    .A ( N312 ) , 
    .B ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_55 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_58 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_61 ) , 
    .S ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_60 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_33 ( 
    .A ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_0 ) , 
    .B ( N313 ) , .CI ( N314 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_63 ) , 
    .S ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_62 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_34 ( 
    .A ( N315 ) , 
    .B ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_59 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_62 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_65 ) , 
    .S ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_64 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_37 ( 
    .A ( \RS_OP_250_54632_65499_J1/N47 ) , 
    .B ( \RS_OP_250_54632_65499_J1/N63 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_67 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_69 ) , 
    .S ( \RS_OP_250_54632_65499_J1/N113 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_39 ( 
    .A ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_6 ) , 
    .B ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_8 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_69 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_72 ) , 
    .S ( \RS_OP_250_54632_65499_J1/N112 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_42 ( 
    .A ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_10 ) , 
    .B ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_12 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_72 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_76 ) , 
    .S ( \RS_OP_250_54632_65499_J1/N111 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_44 ( 
    .A ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_13 ) , 
    .B ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_16 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_76 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_79 ) , 
    .S ( \RS_OP_250_54632_65499_J1/N110 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_47 ( 
    .A ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_17 ) , 
    .B ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_20 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_79 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_83 ) , 
    .S ( \RS_OP_250_54632_65499_J1/N109 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_49 ( 
    .A ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_21 ) , 
    .B ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_24 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_83 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_86 ) , 
    .S ( \RS_OP_250_54632_65499_J1/N108 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_526 ( 
    .A ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_25 ) , 
    .B ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_28 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_86 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_90 ) , 
    .S ( \RS_OP_250_54632_65499_J1/N107 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_54 ( 
    .A ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_29 ) , 
    .B ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_32 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_90 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_93 ) , 
    .S ( \RS_OP_250_54632_65499_J1/N106 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_57 ( 
    .A ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_33 ) , 
    .B ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_36 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_93 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_97 ) , 
    .S ( \RS_OP_250_54632_65499_J1/N105 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_59 ( 
    .A ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_37 ) , 
    .B ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_40 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_97 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_100 ) , 
    .S ( \RS_OP_250_54632_65499_J1/N104 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_62 ( 
    .A ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_41 ) , 
    .B ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_44 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_100 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_104 ) , 
    .S ( \RS_OP_250_54632_65499_J1/N103 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_64 ( 
    .A ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_45 ) , 
    .B ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_48 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_104 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_107 ) , 
    .S ( \RS_OP_250_54632_65499_J1/N102 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_67 ( 
    .A ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_49 ) , 
    .B ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_52 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_107 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_111 ) , 
    .S ( \RS_OP_250_54632_65499_J1/N101 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_69 ( 
    .A ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_53 ) , 
    .B ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_56 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_111 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_114 ) , 
    .S ( \RS_OP_250_54632_65499_J1/N100 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_72 ( 
    .A ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_57 ) , 
    .B ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_60 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_114 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_118 ) , 
    .S ( \RS_OP_250_54632_65499_J1/N99 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_74 ( 
    .A ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_61 ) , 
    .B ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_64 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_118 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_121 ) , 
    .S ( \RS_OP_250_54632_65499_J1/N98 ) ) ;
FA1D0BWP30P140HVT \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/U_77 ( 
    .A ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_63 ) , 
    .B ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_65 ) , 
    .CI ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_121 ) , 
    .CO ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_125 ) , 
    .S ( \RS_OP_250_54632_65499_J1/N97 ) ) ;
ND2D0BWP30P140HVT A283 ( .A1 ( phfnn_3659 ) , .A2 ( ctmn_13315 ) , 
    .ZN ( N157 ) ) ;
IND2D1BWP30P140HVT A284 ( .A1 ( ctmn_15259 ) , .B1 ( ctmn_14305 ) , 
    .ZN ( N190 ) ) ;
NR2D0BWP30P140HVT A285 ( .A1 ( ctmn_14287 ) , .A2 ( ctmn_14285 ) , 
    .ZN ( N189 ) ) ;
NR2D0BWP30P140HVT A288 ( .A1 ( ctmn_13525 ) , .A2 ( ctmn_13526 ) , 
    .ZN ( N159 ) ) ;
NR2D0BWP30P140HVT A289 ( .A1 ( ctmn_13514 ) , .A2 ( ctmn_13509 ) , 
    .ZN ( N168 ) ) ;
NR2D0BWP30P140HVT A290 ( .A1 ( ctmn_13509 ) , .A2 ( ctmn_13552 ) , 
    .ZN ( N169 ) ) ;
NR2D0BWP30P140HVT A291 ( .A1 ( ctmn_13918 ) , .A2 ( ctmn_13908 ) , 
    .ZN ( N180 ) ) ;
NR2D0BWP30P140HVT A292 ( .A1 ( ctmn_13941 ) , .A2 ( ctmn_13923 ) , 
    .ZN ( N181 ) ) ;
NR2D0BWP30P140HVT A293 ( .A1 ( N932 ) , .A2 ( N11853 ) , .ZN ( N193 ) ) ;
IND2D1BWP30P140HVT A294 ( .A1 ( ctmn_15224 ) , .B1 ( ctmn_14225 ) , 
    .ZN ( N184 ) ) ;
NR2D0BWP30P140HVT A295 ( .A1 ( ctmn_14207 ) , .A2 ( ctmn_14205 ) , 
    .ZN ( N183 ) ) ;
NR2D0BWP30P140HVT A298 ( .A1 ( ctmn_13578 ) , .A2 ( ctmn_13579 ) , 
    .ZN ( N160 ) ) ;
NR2D0BWP30P140HVT A299 ( .A1 ( ctmn_13568 ) , .A2 ( ctmn_13563 ) , 
    .ZN ( N171 ) ) ;
NR2D0BWP30P140HVT A300 ( .A1 ( ctmn_13563 ) , .A2 ( ctmn_13607 ) , 
    .ZN ( N172 ) ) ;
NR2D0BWP30P140HVT A301 ( .A1 ( ctmn_13803 ) , .A2 ( ctmn_13795 ) , 
    .ZN ( N177 ) ) ;
NR2D0BWP30P140HVT A302 ( .A1 ( ctmn_13826 ) , .A2 ( ctmn_13808 ) , 
    .ZN ( N178 ) ) ;
NR2D0BWP30P140HVT A303 ( .A1 ( ctmn_13816 ) , .A2 ( N11590 ) , .ZN ( N192 ) ) ;
INR2D1BWP30P140HVT A304 ( .A1 ( ctmn_13736 ) , .B1 ( ctmn_13732 ) , 
    .ZN ( N197 ) ) ;
NR2D0BWP30P140HVT A307 ( .A1 ( ctmn_13634 ) , .A2 ( ctmn_13635 ) , 
    .ZN ( N161 ) ) ;
NR2D0BWP30P140HVT A308 ( .A1 ( ctmn_13623 ) , .A2 ( ctmn_13618 ) , 
    .ZN ( N174 ) ) ;
NR2D0BWP30P140HVT A309 ( .A1 ( ctmn_13618 ) , .A2 ( ctmn_13663 ) , 
    .ZN ( N175 ) ) ;
NR2D0BWP30P140HVT A310 ( .A1 ( ctmn_13700 ) , .A2 ( ctmn_13687 ) , 
    .ZN ( N176 ) ) ;
NR2D0BWP30P140HVT A311 ( .A1 ( ctmn_13713 ) , .A2 ( N11455 ) , .ZN ( N196 ) ) ;
NR2D0BWP30P140HVT A312 ( .A1 ( \DP_OP_245_33587_65499_J1/ctmn_15275 ) , 
    .A2 ( \DP_OP_245_33587_65499_J1/ctmn_15276 ) , .ZN ( N201 ) ) ;
IND2D1BWP30P140HVT A313 ( .A1 ( ctmn_15237 ) , .B1 ( ctmn_14265 ) , 
    .ZN ( N187 ) ) ;
NR2D0BWP30P140HVT A314 ( .A1 ( ctmn_14247 ) , .A2 ( ctmn_14245 ) , 
    .ZN ( N185 ) ) ;
NR2D0BWP30P140HVT A317 ( .A1 ( ctmn_13471 ) , .A2 ( ctmn_13472 ) , 
    .ZN ( N158 ) ) ;
NR2D0BWP30P140HVT A318 ( .A1 ( ctmn_13460 ) , .A2 ( ctmn_13452 ) , 
    .ZN ( N164 ) ) ;
NR2D0BWP30P140HVT A319 ( .A1 ( ctmn_13452 ) , .A2 ( ctmn_13498 ) , 
    .ZN ( N165 ) ) ;
NR2D0BWP30P140HVT A320 ( .A1 ( ctmn_13861 ) , .A2 ( ctmn_13851 ) , 
    .ZN ( N179 ) ) ;
NR2D0BWP30P140HVT A321 ( .A1 ( ctmn_13874 ) , .A2 ( N11723 ) , .ZN ( N195 ) ) ;
AN2D0BWP30P140HVT A322 ( .A1 ( \DP_OP_244_18871_65499_J1/N_100 ) , 
    .A2 ( ctmn_13664 ) , .Z ( N198 ) ) ;
AN2D0BWP30P140HVT A323 ( .A1 ( N199 ) , .A2 ( ctmn_13664 ) , .Z ( N200 ) ) ;
ND2D0BWP30P140HVT A351 ( .A1 ( phfnn_3833 ) , .A2 ( ctmn_14760 ) , 
    .ZN ( N162 ) ) ;
ND2D0BWP30P140HVT ctmi_708 ( .A1 ( ctmn_14720 ) , .A2 ( phfnn_3876 ) , 
    .ZN ( ctmn_14896 ) ) ;
AO211D0BWP30P140HVT ctmi_710 ( .A1 ( HFSNET_1 ) , .A2 ( phfnn_3839 ) , 
    .B ( ctmn_14792 ) , .C ( ctmn_14721 ) , .Z ( ctmn_15086 ) ) ;
AO22D0BWP30P140HVT ctmi_713 ( .A1 ( phfnn_878 ) , .A2 ( ctmn_15018 ) , 
    .B1 ( ctmn_14793 ) , .B2 ( phfnn_3876 ) , .Z ( ctmn_15020 ) ) ;
OA21D0BWP30P140HVT ctmi_716 ( .A1 ( ctmn_14812 ) , .A2 ( ctmn_14865 ) , 
    .B ( phfnn_874 ) , .Z ( ctmn_15129 ) ) ;
AO22D0BWP30P140HVT ctmi_717 ( .A1 ( phfnn_3881 ) , .A2 ( ctmn_14876 ) , 
    .B1 ( phfnn_2542 ) , .B2 ( ctmn_14873 ) , .Z ( ctmn_15133 ) ) ;
AO21D0BWP30P140HVT ctmi_718 ( .A1 ( ctmn_14873 ) , .A2 ( ctmn_14721 ) , 
    .B ( phfnn_899 ) , .Z ( ctmn_15149 ) ) ;
ND2D0BWP30P140HVT ctmi_721 ( .A1 ( ctmn_14686 ) , .A2 ( phfnn_3836 ) , 
    .ZN ( ctmn_14816 ) ) ;
AO22D0BWP30P140HVT ctmi_723 ( .A1 ( ctmn_14720 ) , .A2 ( ctmn_14806 ) , 
    .B1 ( phfnn_2014 ) , .B2 ( phfnn_3876 ) , .Z ( ctmn_15165 ) ) ;
AO22D0BWP30P140HVT ctmi_724 ( .A1 ( ctmn_15018 ) , .A2 ( ctmn_14736 ) , 
    .B1 ( ctmn_14726 ) , .B2 ( phfnn_3876 ) , .Z ( ctmn_15181 ) ) ;
ND2D0BWP30P140HVT ctmi_725 ( .A1 ( ctmn_14736 ) , .A2 ( phfnn_3878 ) , 
    .ZN ( ctmn_14916 ) ) ;
AO211D0BWP30P140HVT ctmi_727 ( .A1 ( phfnn_3876 ) , .A2 ( ctmn_14773 ) , 
    .B ( ctmn_14865 ) , .C ( phfnn_3871 ) , .Z ( ctmn_14869 ) ) ;
AO22D0BWP30P140HVT ctmi_730 ( .A1 ( HFSNET_0 ) , .A2 ( ctmn_14806 ) , 
    .B1 ( ctmn_14812 ) , .B2 ( ctmn_14879 ) , .Z ( ctmn_14921 ) ) ;
AN2D0BWP30P140HVT ctmi_734 ( .A1 ( HFSNET_25 ) , .A2 ( ctmn_14058 ) , 
    .Z ( ctmn_14059 ) ) ;
OR2D1BWP30P140HVT ctmi_735 ( .A1 ( ctmn_13321 ) , .A2 ( ctmn_13328 ) , 
    .Z ( ctmn_14058 ) ) ;
XNR3UD0BWP30P140HVT ctmi_742 ( .A1 ( ctmn_15235 ) , .A2 ( ctmn_15236 ) , 
    .A3 ( ctmn_15239 ) , .ZN ( \DP_OP_248_26668_65499_J1/N_2 ) ) ;
XNR3UD1BWP30P140HVT ctmi_744 ( .A1 ( ctmn_13743 ) , .A2 ( ctmn_13742 ) , 
    .A3 ( ctmn_13746 ) , .ZN ( ctmn_13747 ) ) ;
XNR3UD0BWP30P140HVT ctmi_746 ( .A1 ( ctmn_15257 ) , .A2 ( ctmn_15258 ) , 
    .A3 ( ctmn_15261 ) , .ZN ( \DP_OP_248_26668_65499_J1/N_4 ) ) ;
AN2D0BWP30P140HVT ctmi_749 ( .A1 ( N33 ) , .A2 ( HFSNET_5 ) , 
    .Z ( \u_mac_and_scale/gated_hi_addend [30] ) ) ;
AN2D0BWP30P140HVT ctmi_750 ( .A1 ( N34 ) , .A2 ( HFSNET_5 ) , 
    .Z ( \u_mac_and_scale/gated_hi_addend [29] ) ) ;
AN2D0BWP30P140HVT ctmi_751 ( .A1 ( N35 ) , .A2 ( HFSNET_5 ) , 
    .Z ( \u_mac_and_scale/gated_hi_addend [28] ) ) ;
AN2D0BWP30P140HVT ctmi_752 ( .A1 ( N36 ) , .A2 ( HFSNET_5 ) , 
    .Z ( \u_mac_and_scale/gated_hi_addend [27] ) ) ;
AN2D0BWP30P140HVT ctmi_753 ( .A1 ( N37 ) , .A2 ( HFSNET_5 ) , 
    .Z ( \u_mac_and_scale/gated_hi_addend [26] ) ) ;
AN2D0BWP30P140HVT ctmi_754 ( .A1 ( N38 ) , .A2 ( HFSNET_5 ) , 
    .Z ( \u_mac_and_scale/gated_hi_addend [25] ) ) ;
AN2D0BWP30P140HVT ctmi_755 ( .A1 ( N39 ) , .A2 ( HFSNET_5 ) , 
    .Z ( \u_mac_and_scale/gated_hi_addend [24] ) ) ;
AO22D0BWP30P140HVT ctmi_756 ( .A1 ( HFSNET_10 ) , .A2 ( phfnn_3907 ) , 
    .B1 ( N40 ) , .B2 ( HFSNET_5 ) , 
    .Z ( \u_mac_and_scale/gated_hi_addend [23] ) ) ;
AO22D0BWP30P140HVT ctmi_757 ( .A1 ( HFSNET_10 ) , .A2 ( N33 ) , .B1 ( N41 ) , 
    .B2 ( HFSNET_5 ) , .Z ( \u_mac_and_scale/gated_hi_addend [22] ) ) ;
AO22D0BWP30P140HVT ctmi_758 ( .A1 ( HFSNET_10 ) , .A2 ( N34 ) , .B1 ( N42 ) , 
    .B2 ( HFSNET_5 ) , .Z ( \u_mac_and_scale/gated_hi_addend [21] ) ) ;
AO22D0BWP30P140HVT ctmi_759 ( .A1 ( HFSNET_10 ) , .A2 ( N35 ) , .B1 ( N43 ) , 
    .B2 ( HFSNET_5 ) , .Z ( \u_mac_and_scale/gated_hi_addend [20] ) ) ;
AO22D0BWP30P140HVT ctmi_760 ( .A1 ( HFSNET_10 ) , .A2 ( N36 ) , .B1 ( N44 ) , 
    .B2 ( HFSNET_5 ) , .Z ( \u_mac_and_scale/gated_hi_addend [19] ) ) ;
AO22D0BWP30P140HVT ctmi_761 ( .A1 ( HFSNET_10 ) , .A2 ( N37 ) , .B1 ( N45 ) , 
    .B2 ( HFSNET_5 ) , .Z ( \u_mac_and_scale/gated_hi_addend [18] ) ) ;
AO22D0BWP30P140HVT ctmi_762 ( .A1 ( HFSNET_10 ) , .A2 ( N38 ) , .B1 ( N46 ) , 
    .B2 ( HFSNET_5 ) , .Z ( \u_mac_and_scale/gated_hi_addend [17] ) ) ;
AO22D0BWP30P140HVT ctmi_763 ( .A1 ( HFSNET_10 ) , .A2 ( N39 ) , .B1 ( N47 ) , 
    .B2 ( HFSNET_5 ) , .Z ( \u_mac_and_scale/gated_hi_addend [16] ) ) ;
AOI222D0BWP30P140HVT ctmi_764 ( .A1 ( HFSNET_10 ) , .A2 ( N40 ) , 
    .B1 ( HFSNET_8 ) , .B2 ( phfnn_3907 ) , .C1 ( N48 ) , .C2 ( HFSNET_5 ) , 
    .ZN ( ctmn_330 ) ) ;
AOI222D0BWP30P140HVT ctmi_766 ( .A1 ( HFSNET_10 ) , .A2 ( N41 ) , 
    .B1 ( HFSNET_8 ) , .B2 ( N33 ) , .C1 ( N49 ) , .C2 ( HFSNET_5 ) , 
    .ZN ( ctmn_331 ) ) ;
AOI222D0BWP30P140HVT ctmi_768 ( .A1 ( HFSNET_10 ) , .A2 ( N42 ) , 
    .B1 ( HFSNET_8 ) , .B2 ( N34 ) , .C1 ( N50 ) , .C2 ( HFSNET_5 ) , 
    .ZN ( ctmn_332 ) ) ;
AOI222D0BWP30P140HVT ctmi_770 ( .A1 ( HFSNET_10 ) , .A2 ( N43 ) , 
    .B1 ( HFSNET_8 ) , .B2 ( N35 ) , .C1 ( N51 ) , .C2 ( HFSNET_5 ) , 
    .ZN ( ctmn_333 ) ) ;
AOI222D0BWP30P140HVT ctmi_772 ( .A1 ( HFSNET_10 ) , .A2 ( N44 ) , 
    .B1 ( HFSNET_8 ) , .B2 ( N36 ) , .C1 ( N52 ) , .C2 ( HFSNET_5 ) , 
    .ZN ( ctmn_334 ) ) ;
AOI222D0BWP30P140HVT ctmi_774 ( .A1 ( HFSNET_10 ) , .A2 ( N45 ) , 
    .B1 ( HFSNET_8 ) , .B2 ( N37 ) , .C1 ( N53 ) , .C2 ( HFSNET_5 ) , 
    .ZN ( ctmn_335 ) ) ;
AOI222D0BWP30P140HVT ctmi_776 ( .A1 ( HFSNET_10 ) , .A2 ( N46 ) , 
    .B1 ( HFSNET_8 ) , .B2 ( N38 ) , .C1 ( N54 ) , .C2 ( HFSNET_5 ) , 
    .ZN ( ctmn_336 ) ) ;
AOI222D0BWP30P140HVT ctmi_778 ( .A1 ( HFSNET_10 ) , .A2 ( N47 ) , 
    .B1 ( HFSNET_8 ) , .B2 ( N39 ) , .C1 ( phfnn_3891 ) , .C2 ( HFSNET_5 ) , 
    .ZN ( ctmn_337 ) ) ;
ND2D0BWP30P140HVT ctmi_780 ( .A1 ( HFSNET_23 ) , .A2 ( N244 ) , 
    .ZN ( \DP_OP_245_33587_65499_J1/ctmn_15275 ) ) ;
INR2D1BWP30P140HVT ctmi_782 ( .A1 ( ctmn_13500 ) , .B1 ( ctmn_13502 ) , 
    .ZN ( N9449 ) ) ;
AN2D0BWP30P140HVT ctmi_788 ( .A1 ( ctmn_13672 ) , .A2 ( phfnn_3717 ) , 
    .Z ( N9792 ) ) ;
AN4D0BWP30P140HVT ctmi_789 ( .A1 ( ctmn_13672 ) , .A2 ( ctmn_13675 ) , 
    .A3 ( phfnn_3709 ) , .A4 ( phfnn_3713 ) , .Z ( N9796 ) ) ;
AN2D0BWP30P140HVT ctmi_792 ( .A1 ( ctmn_13842 ) , .A2 ( phfnn_3719 ) , 
    .Z ( N10208 ) ) ;
AN4D0BWP30P140HVT ctmi_793 ( .A1 ( ctmn_13842 ) , .A2 ( ctmn_13845 ) , 
    .A3 ( phfnn_3711 ) , .A4 ( phfnn_3715 ) , .Z ( N10212 ) ) ;
AOI31D0BWP30P140HVT ctmi_807 ( .A1 ( ctmn_14020 ) , .A2 ( phfnn_3760 ) , 
    .A3 ( phfnn_3746 ) , .B ( ctmn_340 ) , .ZN ( ctmn_341 ) ) ;
AOI221D0BWP30P140HVT ctmi_810 ( .A1 ( phfnn_3765 ) , .A2 ( phfnn_748 ) , 
    .B1 ( ctmn_14020 ) , .B2 ( phfnn_3746 ) , .C ( phfnn_3760 ) , 
    .ZN ( ctmn_340 ) ) ;
ND2D0BWP30P140HVT ctmi_816 ( .A1 ( HFSNET_23 ) , .A2 ( N246 ) , 
    .ZN ( ctmn_14086 ) ) ;
ND2D0BWP30P140HVT ctmi_818 ( .A1 ( HFSNET_23 ) , .A2 ( N247 ) , 
    .ZN ( ctmn_14088 ) ) ;
ND2D0BWP30P140HVT ctmi_820 ( .A1 ( HFSNET_23 ) , .A2 ( N248 ) , 
    .ZN ( ctmn_14090 ) ) ;
ND2D0BWP30P140HVT ctmi_822 ( .A1 ( HFSNET_23 ) , .A2 ( N249 ) , 
    .ZN ( ctmn_14092 ) ) ;
ND2D0BWP30P140HVT ctmi_824 ( .A1 ( HFSNET_23 ) , .A2 ( N250 ) , 
    .ZN ( ctmn_14094 ) ) ;
ND2D0BWP30P140HVT ctmi_826 ( .A1 ( HFSNET_23 ) , .A2 ( N251 ) , 
    .ZN ( ctmn_14096 ) ) ;
ND2D0BWP30P140HVT ctmi_834 ( .A1 ( N237 ) , .A2 ( HFSNET_22 ) , 
    .ZN ( \RS_OP_250_54632_65499_J1/DP_OP_257_41740_28757_J0/N_0 ) ) ;
endmodule


