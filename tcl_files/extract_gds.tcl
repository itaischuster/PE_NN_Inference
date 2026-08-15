write_gds -design PE \
-layer_map /data/tsmc/28HPCPMMWAVE/dig_libs/PRTF/PRTF_ICC_28nm_Syn_V19_1a/PR_tech/Synopsys/GdsOutMap/gdsout_6X1Z1U.map \
-keep_data_type \
-fill include \
-output_pin all \
-merge_files { \
/data/tsmc/28HPCPMMWAVE/dig_libs/TSMCHOME/digital/Back_End/gds/tcbn28hpcplusbwp30p140_110a/tcbn28hpcplusbwp30p140.gds \
/data/tsmc/28HPCPMMWAVE/dig_libs/TSMCHOME/digital/Back_End/gds/tcbn28hpcplusbwp30p140hvt_110a/tcbn28hpcplusbwp30p140hvt.gds \
/data/tsmc/28HPCPMMWAVE/dig_libs/TSMCHOME/digital/Back_End/gds/tcbn28hpcplusbwp30p140lvt_110a/tcbn28hpcplusbwp30p140lvt.gds } \
-long_names \
-lib_cell_view frame \
-units 1000 \
PE.gds
