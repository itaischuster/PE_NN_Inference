# Timing reports generation


redirect -file timing_reports/worst_100_setup.rpt { \
report_timing -delay_type max -max_paths 100 -capacitance -nosplit }

redirect -file timing_reports/worst_100_hold.rpt { \
report_timing -delay_type min -max_paths 100 -capacitance -nosplit }

redirect -file timing_reports/worst_50_in2reg.rpt { \
report_timing -max_paths 50 -from [all_inputs] -to [all_registers] -capacitance -nosplit } 

redirect -file timing_reports/worst_50_reg2reg.rpt { \
report_timing -max_paths 50 -from [all_registers] -to [all_registers] -capacitance -nosplit }

redirect -file timing_reports/worst_50_reg2out.rpt { \
report_timing -max_paths 50 -from [all_registers] -to [all_outputs] -capacitance -nosplit }

redirect -file timing_reports/worst_50_in2out.rpt { \
report_timing -max_paths 50 -from [all_inputs] -to [all_outputs] -capacitance -nosplit }

 
