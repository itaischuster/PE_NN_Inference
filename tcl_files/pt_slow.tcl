set link_path "* \
/data/tsmc/28HPCPMMWAVE/dig_libs/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn28hpcplusbwp30p140lvt_180a/tcbn28hpcplusbwp30p140lvtssg0p81v125c.db \
/data/tsmc/28HPCPMMWAVE/dig_libs/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn28hpcplusbwp30p140_180a/tcbn28hpcplusbwp30p140ssg0p81v125c.db \
/data/tsmc/28HPCPMMWAVE/dig_libs/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn28hpcplusbwp30p140hvt_180a/tcbn28hpcplusbwp30p140hvtssg0p81v125c.db"
read_verilog netlist/PE_filler.v
link
read_parasitics -keep_capacitive_coupling spef_dir/PE_slow.spef
read_sdc constraints/PE_4ns.sdc
update_timing
report_timing
report_qor
report_constraint -all_violators
