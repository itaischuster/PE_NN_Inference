set_individual_pin_constraints -ports [get_ports operand_B*] -sides 1
set_individual_pin_constraints -ports [get_ports operand_A*] -sides 3
set_individual_pin_constraints -ports [get_ports rst] -sides 2
set_individual_pin_constraints -ports [get_ports chp_slct] -sides 2
set_individual_pin_constraints -ports [get_ports valid_opcode] -sides 2
set_individual_pin_constraints -ports [get_ports pe_opcode*] -sides 2
set_individual_pin_constraints -ports [get_ports clk] -sides 2 -offset 20
set_individual_pin_constraints -ports [get_ports valid_A] -sides 2
set_individual_pin_constraints -ports [get_ports valid_B] -sides 2
set_individual_pin_constraints -ports [get_ports data_out*] -sides 4
set_individual_pin_constraints -ports [get_ports pe_ready] -sides 4
set_individual_pin_constraints -ports [get_ports valid_output] -sides 4
place_pins -self
