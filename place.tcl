compile_fusion -to initial_map
compile_fusion -from initial_map -to logic_opto
source tcl_files/pin_constraints.tcl
compile_fusion -from logic_opto -to initial_place
compile_fusion -from initial_place -to initial_drc
compile_fusion -from initial_drc -to initial_opto
compile_fusion -from initial_opto -to final_place
compile_fusion -from final_place -to final_opto
legalize_placement



