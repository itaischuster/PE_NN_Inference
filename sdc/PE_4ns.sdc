create_clock -name clk -period 4 [get_ports clk] 
set_clock_uncertainty -setup 0.2 [get_clocks clk]
set_clock_uncertainty -hold 0.01 [get_clocks clk]
set_clock_transition -max 0.5 [get_clocks clk]

set PE_inputs [get_ports {rst chp_slct valid_opcode pe_opcode valid_A valid_B operand_A operand_B}]
set_input_delay -max 0.4 -clock clk $PE_inputs
set_input_delay -min 0.05 -clock clk $PE_inputs
set_output_delay -max 0.4 -clock clk [all_outputs]
set_output_delay -min 0.05 -clock clk [all_outputs]
set_max_transition 0.4 [current_design]

set_driving_cell -lib_cell BUFFD2BWP30P140 -pin Z $PE_inputs

set_load 0.01 [all_outputs]
