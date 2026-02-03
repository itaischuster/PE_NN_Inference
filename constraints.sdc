create_clock -name "vclk" -period 1.0
set_input_delay 0.2 -clock "vclk" [all_inputs]
set_output_delay 0.2 -clock "vclk" [all_outputs]


