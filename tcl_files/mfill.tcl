set_app_options -name signoff.create_metal_fill.runset -value /data/tsmc/28HPCPMMWAVE/synopsys/ICV/Dummy/Metal/2.1b/Dummy_Metal_Via_ICV_28nm.21b
signoff_create_metal_fill
set_app_options -name signoff.check_drc.runset -value /data/tsmc/28HPCPMMWAVE/synopsys/ICV/DRC/2.2a/LOGIC_TopMr_DRC/ICVLN28HP_9M_6X1Y1R_002.22a.encrypt
set_app_options -name signoff.check_drc.max_errors_per_rule -value 1000
set_app_options -name signoff.check_drc.run_dir -value "./signoff_drc_run"
set_app_options -name signoff.physical.layer_map_file -value /data/tsmc/28HPCPMMWAVE/dig_libs/PRTF/PRTF_ICC_28nm_Syn_V19_1a/PR_tech/Synopsys/GdsOutMap/gdsout_6X1Y1R.map
set_app_options -name signoff.fix_drc.init_drc_error_db -value "./signoff_drc_run"
signoff_fix_drc
write_verilog -hierarchy all netlist/PE_filler.v
