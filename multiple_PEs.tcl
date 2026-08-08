lappend search_path scripts design_data 
set_host_options -max_cores 8

# Get tech file
set TECH_FILE     "/data/tsmc/28HPCPMMWAVE/synopsys/tsmcn28_9lm6X1Z1URDL.tf"

#######################################################################
## Physical Library Settings
#######################################################################

# Delete previous iterations
#catch { close_lib -purge -all } 
#file delete -force PE_5ns_area.dlib

#######################
## Area Optimization ##
#######################

# Create new library for the design
create_lib  -technology $TECH_FILE  -ref_libs {/data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140.ndm /data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140hvt.ndm /data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140lvt.ndm }  PE_5ns_area.dlib
open_lib PE_5ns_area.dlib

# Load parasitics
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/rcbest/crn28hpc+_1p09m+ut-alrdl_6x1z1u_rcbest.tluplus -name rcbest
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/rcworst/crn28hpc+_1p09m+ut-alrdl_6x1z1u_rcworst.tluplus -name rcworst
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/typical/crn28hpc+_1p09m+ut-alrdl_6x1z1u_typical.tluplus -name rctypical

save_lib

# SVF file for formality
#set_svf svf_files/PE.svf

# Logic elaborate step
analyze -format verilog [glob v_code/*.v] 
elaborate PE
set_top_module PE
start_gui
save_block -as PE/elaborate

# MCMM
# Remove all MCMM related info
remove_corners   -all
remove_modes     -all
remove_scenarios -all

# Create Corners
create_corner Fast
set_process_label FFG -corner Fast

create_corner Typical
set_process_label TT -corner Typical

create_corner Slow
set_process_label SSG -corner Slow

# Set parasitics parameters
set_parasitics_parameters -early_spec rcbest -late_spec  rcbest -corners {Fast}
set_parasitics_parameters -early_spec rctypical -late_spec rctypical -corners {Typical}
set_parasitics_parameters -early_spec rcworst -late_spec  rcworst -corners {Slow}

# Create mode
create_mode  FUNC
current_mode FUNC

# Create Scenarios
create_scenario -mode FUNC -corner Fast    -name FUNC_Fast
create_scenario -mode FUNC -corner Typical -name FUNC_Typical
create_scenario -mode FUNC -corner Slow    -name FUNC_Slow

# FAST SCENARIO
current_scenario FUNC_Fast
set_operating_conditions "ffg0p99v0c"
source constraints/PE_5ns.sdc

# TYPICAL SCENARIO
current_scenario FUNC_Typical
set_operating_conditions "tt0p9v85c"
source constraints/PE_5ns.sdc

# SLOW SCENARIO
current_scenario FUNC_Slow
set_operating_conditions "ssg0p81v125c"
source constraints/PE_5ns.sdc

# Die parameters initialization
initialize_floorplan -core_utilization 0.6 -side_ratio {1 1} -core_offset 2
#initialize_floorplan -control_type core -boundary {{0 0} {66.00 66.00}} -core_offset 2

# Continue w/o DFT clocks
set_app_options -name place.coarse.continue_on_missing_scandef -value true

# Compiling with datapath effort
#set_datapath_architecture_options -optimize_for speed

# Compiling with area effort
set_app_options -name compile.flow.high_effort_area -value true

# Prohibit 1 site spacing
set_placement_spacing_label -name {no_1X} -side both -lib_cells [get_lib_cells -filter "design_type != welltap && design_type != endcap && design_type != filler"]
set_placement_spacing_rule -labels {no_1X no_1X} {1 1}

# Place boundary and tap cells 
source tcl_files/bound_and_tap.tcl
save_block -as PE/BoundAndTap
save_lib

# Create power grid
source tcl_files/PG.tcl
save_block -as PE/Floorplan
save_lib

# Synthesize + Place
source tcl_files/place.tcl
save_block -as PE/Place
save_lib

# Generate netlist for formality
#write_verilog -hierarchy all netlist/PE_verilog.v

# Stop writing to svf
#set_svf -off

# CTS
source tcl_files/CTS.tcl
save_block -as PE/CTS
save_lib

# Route
source tcl_files/route.tcl
save_block -as PE/Route
save_lib

# Add filler cells 
source tcl_files/filler.tcl
save_block -as PE/Filler
save_lib

close_lib





# Create new library for the design
create_lib  -technology $TECH_FILE  -ref_libs {/data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140.ndm /data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140hvt.ndm /data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140lvt.ndm }  PE_4ns_area.dlib
open_lib PE_4ns_area.dlib

# Load parasitics
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/rcbest/crn28hpc+_1p09m+ut-alrdl_6x1z1u_rcbest.tluplus -name rcbest
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/rcworst/crn28hpc+_1p09m+ut-alrdl_6x1z1u_rcworst.tluplus -name rcworst
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/typical/crn28hpc+_1p09m+ut-alrdl_6x1z1u_typical.tluplus -name rctypical

save_lib

# SVF file for formality
#set_svf svf_files/PE.svf

# Logic elaborate step
analyze -format verilog [glob v_code/*.v] 
elaborate PE
set_top_module PE
start_gui
save_block -as PE/elaborate

# MCMM
# Remove all MCMM related info
remove_corners   -all
remove_modes     -all
remove_scenarios -all

# Create Corners
create_corner Fast
set_process_label FFG -corner Fast

create_corner Typical
set_process_label TT -corner Typical

create_corner Slow
set_process_label SSG -corner Slow

# Set parasitics parameters
set_parasitics_parameters -early_spec rcbest -late_spec  rcbest -corners {Fast}
set_parasitics_parameters -early_spec rctypical -late_spec rctypical -corners {Typical}
set_parasitics_parameters -early_spec rcworst -late_spec  rcworst -corners {Slow}

# Create mode
create_mode  FUNC
current_mode FUNC

# Create Scenarios
create_scenario -mode FUNC -corner Fast    -name FUNC_Fast
create_scenario -mode FUNC -corner Typical -name FUNC_Typical
create_scenario -mode FUNC -corner Slow    -name FUNC_Slow

# FAST SCENARIO
current_scenario FUNC_Fast
set_operating_conditions "ffg0p99v0c"
source constraints/PE_4ns.sdc

# TYPICAL SCENARIO
current_scenario FUNC_Typical
set_operating_conditions "tt0p9v85c"
source constraints/PE_4ns.sdc

# SLOW SCENARIO
current_scenario FUNC_Slow
set_operating_conditions "ssg0p81v125c"
source constraints/PE_4ns.sdc

# Die parameters initialization
initialize_floorplan -core_utilization 0.6 -side_ratio {1 1} -core_offset 2
#initialize_floorplan -control_type core -boundary {{0 0} {66.00 66.00}} -core_offset 2

# Continue w/o DFT clocks
set_app_options -name place.coarse.continue_on_missing_scandef -value true

# Compiling with datapath effort
#set_datapath_architecture_options -optimize_for speed

# Compiling with area effort
set_app_options -name compile.flow.high_effort_area -value true

# Prohibit 1 site spacing
set_placement_spacing_label -name {no_1X} -side both -lib_cells [get_lib_cells -filter "design_type != welltap && design_type != endcap && design_type != filler"]
set_placement_spacing_rule -labels {no_1X no_1X} {1 1}

# Place boundary and tap cells 
source tcl_files/bound_and_tap.tcl
save_block -as PE/BoundAndTap
save_lib

# Create power grid
source tcl_files/PG.tcl
save_block -as PE/Floorplan
save_lib

# Synthesize + Place
source tcl_files/place.tcl
save_block -as PE/Place
save_lib

# Generate netlist for formality
#write_verilog -hierarchy all netlist/PE_verilog.v

# Stop writing to svf
#set_svf -off

# CTS
source tcl_files/CTS.tcl
save_block -as PE/CTS
save_lib

# Route
source tcl_files/route.tcl
save_block -as PE/Route
save_lib

# Add filler cells 
source tcl_files/filler.tcl
save_block -as PE/Filler
save_lib

close_lib




# Create new library for the design
create_lib  -technology $TECH_FILE  -ref_libs {/data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140.ndm /data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140hvt.ndm /data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140lvt.ndm }  PE_3ns_area.dlib
open_lib PE_3ns_area.dlib

# Load parasitics
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/rcbest/crn28hpc+_1p09m+ut-alrdl_6x1z1u_rcbest.tluplus -name rcbest
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/rcworst/crn28hpc+_1p09m+ut-alrdl_6x1z1u_rcworst.tluplus -name rcworst
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/typical/crn28hpc+_1p09m+ut-alrdl_6x1z1u_typical.tluplus -name rctypical

save_lib

# SVF file for formality
#set_svf svf_files/PE.svf

# Logic elaborate step
analyze -format verilog [glob v_code/*.v] 
elaborate PE
set_top_module PE
start_gui
save_block -as PE/elaborate

# MCMM
# Remove all MCMM related info
remove_corners   -all
remove_modes     -all
remove_scenarios -all

# Create Corners
create_corner Fast
set_process_label FFG -corner Fast

create_corner Typical
set_process_label TT -corner Typical

create_corner Slow
set_process_label SSG -corner Slow

# Set parasitics parameters
set_parasitics_parameters -early_spec rcbest -late_spec  rcbest -corners {Fast}
set_parasitics_parameters -early_spec rctypical -late_spec rctypical -corners {Typical}
set_parasitics_parameters -early_spec rcworst -late_spec  rcworst -corners {Slow}

# Create mode
create_mode  FUNC
current_mode FUNC

# Create Scenarios
create_scenario -mode FUNC -corner Fast    -name FUNC_Fast
create_scenario -mode FUNC -corner Typical -name FUNC_Typical
create_scenario -mode FUNC -corner Slow    -name FUNC_Slow

# FAST SCENARIO
current_scenario FUNC_Fast
set_operating_conditions "ffg0p99v0c"
source constraints/PE_3ns.sdc

# TYPICAL SCENARIO
current_scenario FUNC_Typical
set_operating_conditions "tt0p9v85c"
source constraints/PE_3ns.sdc

# SLOW SCENARIO
current_scenario FUNC_Slow
set_operating_conditions "ssg0p81v125c"
source constraints/PE_3ns.sdc

# Die parameters initialization
initialize_floorplan -core_utilization 0.6 -side_ratio {1 1} -core_offset 2
#initialize_floorplan -control_type core -boundary {{0 0} {66.00 66.00}} -core_offset 2

# Continue w/o DFT clocks
set_app_options -name place.coarse.continue_on_missing_scandef -value true

# Compiling with datapath effort
#set_datapath_architecture_options -optimize_for speed

# Compiling with area effort
set_app_options -name compile.flow.high_effort_area -value true

# Prohibit 1 site spacing
set_placement_spacing_label -name {no_1X} -side both -lib_cells [get_lib_cells -filter "design_type != welltap && design_type != endcap && design_type != filler"]
set_placement_spacing_rule -labels {no_1X no_1X} {1 1}

# Place boundary and tap cells 
source tcl_files/bound_and_tap.tcl
save_block -as PE/BoundAndTap
save_lib

# Create power grid
source tcl_files/PG.tcl
save_block -as PE/Floorplan
save_lib

# Synthesize + Place
source tcl_files/place.tcl
save_block -as PE/Place
save_lib

# Generate netlist for formality
#write_verilog -hierarchy all netlist/PE_verilog.v

# Stop writing to svf
#set_svf -off

# CTS
source tcl_files/CTS.tcl
save_block -as PE/CTS
save_lib

# Route
source tcl_files/route.tcl
save_block -as PE/Route
save_lib

# Add filler cells 
source tcl_files/filler.tcl
save_block -as PE/Filler
save_lib

close_lib





# Create new library for the design
create_lib  -technology $TECH_FILE  -ref_libs {/data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140.ndm /data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140hvt.ndm /data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140lvt.ndm }  PE_2ns_area.dlib
open_lib PE_2ns_area.dlib

# Load parasitics
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/rcbest/crn28hpc+_1p09m+ut-alrdl_6x1z1u_rcbest.tluplus -name rcbest
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/rcworst/crn28hpc+_1p09m+ut-alrdl_6x1z1u_rcworst.tluplus -name rcworst
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/typical/crn28hpc+_1p09m+ut-alrdl_6x1z1u_typical.tluplus -name rctypical

save_lib

# SVF file for formality
#set_svf svf_files/PE.svf

# Logic elaborate step
analyze -format verilog [glob v_code/*.v] 
elaborate PE
set_top_module PE
start_gui
save_block -as PE/elaborate

# MCMM
# Remove all MCMM related info
remove_corners   -all
remove_modes     -all
remove_scenarios -all

# Create Corners
create_corner Fast
set_process_label FFG -corner Fast

create_corner Typical
set_process_label TT -corner Typical

create_corner Slow
set_process_label SSG -corner Slow

# Set parasitics parameters
set_parasitics_parameters -early_spec rcbest -late_spec  rcbest -corners {Fast}
set_parasitics_parameters -early_spec rctypical -late_spec rctypical -corners {Typical}
set_parasitics_parameters -early_spec rcworst -late_spec  rcworst -corners {Slow}

# Create mode
create_mode  FUNC
current_mode FUNC

# Create Scenarios
create_scenario -mode FUNC -corner Fast    -name FUNC_Fast
create_scenario -mode FUNC -corner Typical -name FUNC_Typical
create_scenario -mode FUNC -corner Slow    -name FUNC_Slow

# FAST SCENARIO
current_scenario FUNC_Fast
set_operating_conditions "ffg0p99v0c"
source constraints/PE_2ns.sdc

# TYPICAL SCENARIO
current_scenario FUNC_Typical
set_operating_conditions "tt0p9v85c"
source constraints/PE_2ns.sdc

# SLOW SCENARIO
current_scenario FUNC_Slow
set_operating_conditions "ssg0p81v125c"
source constraints/PE_2ns.sdc

# Die parameters initialization
initialize_floorplan -core_utilization 0.6 -side_ratio {1 1} -core_offset 2
#initialize_floorplan -control_type core -boundary {{0 0} {66.00 66.00}} -core_offset 2

# Continue w/o DFT clocks
set_app_options -name place.coarse.continue_on_missing_scandef -value true

# Compiling with datapath effort
#set_datapath_architecture_options -optimize_for speed

# Compiling with area effort
set_app_options -name compile.flow.high_effort_area -value true

# Prohibit 1 site spacing
set_placement_spacing_label -name {no_1X} -side both -lib_cells [get_lib_cells -filter "design_type != welltap && design_type != endcap && design_type != filler"]
set_placement_spacing_rule -labels {no_1X no_1X} {1 1}

# Place boundary and tap cells 
source tcl_files/bound_and_tap.tcl
save_block -as PE/BoundAndTap
save_lib

# Create power grid
source tcl_files/PG.tcl
save_block -as PE/Floorplan
save_lib

# Synthesize + Place
source tcl_files/place.tcl
save_block -as PE/Place
save_lib

# Generate netlist for formality
#write_verilog -hierarchy all netlist/PE_verilog.v

# Stop writing to svf
#set_svf -off

# CTS
source tcl_files/CTS.tcl
save_block -as PE/CTS
save_lib

# Route
source tcl_files/route.tcl
save_block -as PE/Route
save_lib

# Add filler cells 
source tcl_files/filler.tcl
save_block -as PE/Filler
save_lib

close_lib




# Create new library for the design
create_lib  -technology $TECH_FILE  -ref_libs {/data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140.ndm /data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140hvt.ndm /data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140lvt.ndm }  PE_5ns_power.dlib
open_lib PE_5ns_power.dlib

# Load parasitics
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/rcbest/crn28hpc+_1p09m+ut-alrdl_6x1z1u_rcbest.tluplus -name rcbest
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/rcworst/crn28hpc+_1p09m+ut-alrdl_6x1z1u_rcworst.tluplus -name rcworst
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/typical/crn28hpc+_1p09m+ut-alrdl_6x1z1u_typical.tluplus -name rctypical

save_lib

# SVF file for formality
#set_svf svf_files/PE.svf

# Logic elaborate step
analyze -format verilog [glob v_code/*.v] 
elaborate PE
set_top_module PE
start_gui
save_block -as PE/elaborate

# MCMM
# Remove all MCMM related info
remove_corners   -all
remove_modes     -all
remove_scenarios -all

# Create Corners
create_corner Fast
set_process_label FFG -corner Fast

create_corner Typical
set_process_label TT -corner Typical

create_corner Slow
set_process_label SSG -corner Slow

# Set parasitics parameters
set_parasitics_parameters -early_spec rcbest -late_spec  rcbest -corners {Fast}
set_parasitics_parameters -early_spec rctypical -late_spec rctypical -corners {Typical}
set_parasitics_parameters -early_spec rcworst -late_spec  rcworst -corners {Slow}

# Create mode
create_mode  FUNC
current_mode FUNC

# Create Scenarios
create_scenario -mode FUNC -corner Fast    -name FUNC_Fast
create_scenario -mode FUNC -corner Typical -name FUNC_Typical
create_scenario -mode FUNC -corner Slow    -name FUNC_Slow

# FAST SCENARIO
current_scenario FUNC_Fast
set_operating_conditions "ffg0p99v0c"
source constraints/PE_5ns.sdc

# TYPICAL SCENARIO
current_scenario FUNC_Typical
set_operating_conditions "tt0p9v85c"
source constraints/PE_5ns.sdc

# SLOW SCENARIO
current_scenario FUNC_Slow
set_operating_conditions "ssg0p81v125c"
source constraints/PE_5ns.sdc

# Die parameters initialization
#initialize_floorplan -core_utilization 0.6 -side_ratio {1 1} -core_offset 2
initialize_floorplan -control_type core -boundary {{0 0} {66.00 66.00}} -core_offset 2

# Continue w/o DFT clocks
set_app_options -name place.coarse.continue_on_missing_scandef -value true

# Compiling with datapath effort
#set_datapath_architecture_options -optimize_for speed

# Compiling with area effort
#set_app_options -name compile.flow.high_effort_area -value true

# Compilimg with power effort
set_app_options -name compile.flow.enable_power -value true

# Prohibit 1 site spacing
set_placement_spacing_label -name {no_1X} -side both -lib_cells [get_lib_cells -filter "design_type != welltap && design_type != endcap && design_type != filler"]
set_placement_spacing_rule -labels {no_1X no_1X} {1 1}

# Place boundary and tap cells 
source tcl_files/bound_and_tap.tcl
save_block -as PE/BoundAndTap
save_lib

# Create power grid
source tcl_files/PG.tcl
save_block -as PE/Floorplan
save_lib

# Synthesize + Place
source tcl_files/place.tcl
save_block -as PE/Place
save_lib

# Generate netlist for formality
#write_verilog -hierarchy all netlist/PE_verilog.v

# Stop writing to svf
#set_svf -off

# CTS
source tcl_files/CTS.tcl
save_block -as PE/CTS
save_lib

# Route
source tcl_files/route.tcl
save_block -as PE/Route
save_lib

# Add filler cells 
source tcl_files/filler.tcl
save_block -as PE/Filler
save_lib

close_lib




# Create new library for the design
create_lib  -technology $TECH_FILE  -ref_libs {/data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140.ndm /data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140hvt.ndm /data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140lvt.ndm }  PE_4ns_power.dlib
open_lib PE_4ns_power.dlib

# Load parasitics
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/rcbest/crn28hpc+_1p09m+ut-alrdl_6x1z1u_rcbest.tluplus -name rcbest
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/rcworst/crn28hpc+_1p09m+ut-alrdl_6x1z1u_rcworst.tluplus -name rcworst
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/typical/crn28hpc+_1p09m+ut-alrdl_6x1z1u_typical.tluplus -name rctypical

save_lib

# SVF file for formality
#set_svf svf_files/PE.svf

# Logic elaborate step
analyze -format verilog [glob v_code/*.v] 
elaborate PE
set_top_module PE
start_gui
save_block -as PE/elaborate

# MCMM
# Remove all MCMM related info
remove_corners   -all
remove_modes     -all
remove_scenarios -all

# Create Corners
create_corner Fast
set_process_label FFG -corner Fast

create_corner Typical
set_process_label TT -corner Typical

create_corner Slow
set_process_label SSG -corner Slow

# Set parasitics parameters
set_parasitics_parameters -early_spec rcbest -late_spec  rcbest -corners {Fast}
set_parasitics_parameters -early_spec rctypical -late_spec rctypical -corners {Typical}
set_parasitics_parameters -early_spec rcworst -late_spec  rcworst -corners {Slow}

# Create mode
create_mode  FUNC
current_mode FUNC

# Create Scenarios
create_scenario -mode FUNC -corner Fast    -name FUNC_Fast
create_scenario -mode FUNC -corner Typical -name FUNC_Typical
create_scenario -mode FUNC -corner Slow    -name FUNC_Slow

# FAST SCENARIO
current_scenario FUNC_Fast
set_operating_conditions "ffg0p99v0c"
source constraints/PE_4ns.sdc

# TYPICAL SCENARIO
current_scenario FUNC_Typical
set_operating_conditions "tt0p9v85c"
source constraints/PE_4ns.sdc

# SLOW SCENARIO
current_scenario FUNC_Slow
set_operating_conditions "ssg0p81v125c"
source constraints/PE_4ns.sdc

# Die parameters initialization
#initialize_floorplan -core_utilization 0.6 -side_ratio {1 1} -core_offset 2
initialize_floorplan -control_type core -boundary {{0 0} {66.00 66.00}} -core_offset 2

# Continue w/o DFT clocks
set_app_options -name place.coarse.continue_on_missing_scandef -value true

# Compiling with datapath effort
#set_datapath_architecture_options -optimize_for speed

# Compiling with area effort
#set_app_options -name compile.flow.high_effort_area -value true

# Compilimg with power effort
set_app_options -name compile.flow.enable_power -value true

# Prohibit 1 site spacing
set_placement_spacing_label -name {no_1X} -side both -lib_cells [get_lib_cells -filter "design_type != welltap && design_type != endcap && design_type != filler"]
set_placement_spacing_rule -labels {no_1X no_1X} {1 1}

# Place boundary and tap cells 
source tcl_files/bound_and_tap.tcl
save_block -as PE/BoundAndTap
save_lib

# Create power grid
source tcl_files/PG.tcl
save_block -as PE/Floorplan
save_lib

# Synthesize + Place
source tcl_files/place.tcl
save_block -as PE/Place
save_lib

# Generate netlist for formality
#write_verilog -hierarchy all netlist/PE_verilog.v

# Stop writing to svf
#set_svf -off

# CTS
source tcl_files/CTS.tcl
save_block -as PE/CTS
save_lib

# Route
source tcl_files/route.tcl
save_block -as PE/Route
save_lib

# Add filler cells 
source tcl_files/filler.tcl
save_block -as PE/Filler
save_lib

close_lib





# Create new library for the design
create_lib  -technology $TECH_FILE  -ref_libs {/data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140.ndm /data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140hvt.ndm /data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140lvt.ndm }  PE_3ns_power.dlib
open_lib PE_3ns_power.dlib

# Load parasitics
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/rcbest/crn28hpc+_1p09m+ut-alrdl_6x1z1u_rcbest.tluplus -name rcbest
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/rcworst/crn28hpc+_1p09m+ut-alrdl_6x1z1u_rcworst.tluplus -name rcworst
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/typical/crn28hpc+_1p09m+ut-alrdl_6x1z1u_typical.tluplus -name rctypical

save_lib

# SVF file for formality
#set_svf svf_files/PE.svf

# Logic elaborate step
analyze -format verilog [glob v_code/*.v] 
elaborate PE
set_top_module PE
start_gui
save_block -as PE/elaborate

# MCMM
# Remove all MCMM related info
remove_corners   -all
remove_modes     -all
remove_scenarios -all

# Create Corners
create_corner Fast
set_process_label FFG -corner Fast

create_corner Typical
set_process_label TT -corner Typical

create_corner Slow
set_process_label SSG -corner Slow

# Set parasitics parameters
set_parasitics_parameters -early_spec rcbest -late_spec  rcbest -corners {Fast}
set_parasitics_parameters -early_spec rctypical -late_spec rctypical -corners {Typical}
set_parasitics_parameters -early_spec rcworst -late_spec  rcworst -corners {Slow}

# Create mode
create_mode  FUNC
current_mode FUNC

# Create Scenarios
create_scenario -mode FUNC -corner Fast    -name FUNC_Fast
create_scenario -mode FUNC -corner Typical -name FUNC_Typical
create_scenario -mode FUNC -corner Slow    -name FUNC_Slow

# FAST SCENARIO
current_scenario FUNC_Fast
set_operating_conditions "ffg0p99v0c"
source constraints/PE_3ns.sdc

# TYPICAL SCENARIO
current_scenario FUNC_Typical
set_operating_conditions "tt0p9v85c"
source constraints/PE_3ns.sdc

# SLOW SCENARIO
current_scenario FUNC_Slow
set_operating_conditions "ssg0p81v125c"
source constraints/PE_3ns.sdc

# Die parameters initialization
#initialize_floorplan -core_utilization 0.6 -side_ratio {1 1} -core_offset 2
initialize_floorplan -control_type core -boundary {{0 0} {66.00 66.00}} -core_offset 2

# Continue w/o DFT clocks
set_app_options -name place.coarse.continue_on_missing_scandef -value true

# Compiling with datapath effort
#set_datapath_architecture_options -optimize_for speed

# Compiling with area effort
#set_app_options -name compile.flow.high_effort_area -value true

# Compilimg with power effort
set_app_options -name compile.flow.enable_power -value true

# Prohibit 1 site spacing
set_placement_spacing_label -name {no_1X} -side both -lib_cells [get_lib_cells -filter "design_type != welltap && design_type != endcap && design_type != filler"]
set_placement_spacing_rule -labels {no_1X no_1X} {1 1}

# Place boundary and tap cells 
source tcl_files/bound_and_tap.tcl
save_block -as PE/BoundAndTap
save_lib

# Create power grid
source tcl_files/PG.tcl
save_block -as PE/Floorplan
save_lib

# Synthesize + Place
source tcl_files/place.tcl
save_block -as PE/Place
save_lib

# Generate netlist for formality
#write_verilog -hierarchy all netlist/PE_verilog.v

# Stop writing to svf
#set_svf -off

# CTS
source tcl_files/CTS.tcl
save_block -as PE/CTS
save_lib

# Route
source tcl_files/route.tcl
save_block -as PE/Route
save_lib

# Add filler cells 
source tcl_files/filler.tcl
save_block -as PE/Filler
save_lib

close_lib




# Create new library for the design
create_lib  -technology $TECH_FILE  -ref_libs {/data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140.ndm /data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140hvt.ndm /data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140lvt.ndm }  PE_2ns_power.dlib
open_lib PE_2ns_power.dlib

# Load parasitics
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/rcbest/crn28hpc+_1p09m+ut-alrdl_6x1z1u_rcbest.tluplus -name rcbest
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/rcworst/crn28hpc+_1p09m+ut-alrdl_6x1z1u_rcworst.tluplus -name rcworst
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/typical/crn28hpc+_1p09m+ut-alrdl_6x1z1u_typical.tluplus -name rctypical

save_lib

# SVF file for formality
#set_svf svf_files/PE.svf

# Logic elaborate step
analyze -format verilog [glob v_code/*.v] 
elaborate PE
set_top_module PE
start_gui
save_block -as PE/elaborate

# MCMM
# Remove all MCMM related info
remove_corners   -all
remove_modes     -all
remove_scenarios -all

# Create Corners
create_corner Fast
set_process_label FFG -corner Fast

create_corner Typical
set_process_label TT -corner Typical

create_corner Slow
set_process_label SSG -corner Slow

# Set parasitics parameters
set_parasitics_parameters -early_spec rcbest -late_spec  rcbest -corners {Fast}
set_parasitics_parameters -early_spec rctypical -late_spec rctypical -corners {Typical}
set_parasitics_parameters -early_spec rcworst -late_spec  rcworst -corners {Slow}

# Create mode
create_mode  FUNC
current_mode FUNC

# Create Scenarios
create_scenario -mode FUNC -corner Fast    -name FUNC_Fast
create_scenario -mode FUNC -corner Typical -name FUNC_Typical
create_scenario -mode FUNC -corner Slow    -name FUNC_Slow

# FAST SCENARIO
current_scenario FUNC_Fast
set_operating_conditions "ffg0p99v0c"
source constraints/PE_2ns.sdc

# TYPICAL SCENARIO
current_scenario FUNC_Typical
set_operating_conditions "tt0p9v85c"
source constraints/PE_2ns.sdc

# SLOW SCENARIO
current_scenario FUNC_Slow
set_operating_conditions "ssg0p81v125c"
source constraints/PE_2ns.sdc

# Die parameters initialization
#initialize_floorplan -core_utilization 0.6 -side_ratio {1 1} -core_offset 2
initialize_floorplan -control_type core -boundary {{0 0} {66.00 66.00}} -core_offset 2

# Continue w/o DFT clocks
set_app_options -name place.coarse.continue_on_missing_scandef -value true

# Compiling with datapath effort
#set_datapath_architecture_options -optimize_for speed

# Compiling with area effort
#set_app_options -name compile.flow.high_effort_area -value true

# Compilimg with power effort
set_app_options -name compile.flow.enable_power -value true

# Prohibit 1 site spacing
set_placement_spacing_label -name {no_1X} -side both -lib_cells [get_lib_cells -filter "design_type != welltap && design_type != endcap && design_type != filler"]
set_placement_spacing_rule -labels {no_1X no_1X} {1 1}

# Place boundary and tap cells 
source tcl_files/bound_and_tap.tcl
save_block -as PE/BoundAndTap
save_lib

# Create power grid
source tcl_files/PG.tcl
save_block -as PE/Floorplan
save_lib

# Synthesize + Place
source tcl_files/place.tcl
save_block -as PE/Place
save_lib

# Generate netlist for formality
#write_verilog -hierarchy all netlist/PE_verilog.v

# Stop writing to svf
#set_svf -off

# CTS
source tcl_files/CTS.tcl
save_block -as PE/CTS
save_lib

# Route
source tcl_files/route.tcl
save_block -as PE/Route
save_lib

# Add filler cells 
source tcl_files/filler.tcl
save_block -as PE/Filler
save_lib

close_lib





# Create new library for the design
create_lib  -technology $TECH_FILE  -ref_libs {/data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140.ndm /data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140hvt.ndm /data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140lvt.ndm }  PE_5ns_timing.dlib
open_lib PE_5ns_timing.dlib

# Load parasitics
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/rcbest/crn28hpc+_1p09m+ut-alrdl_6x1z1u_rcbest.tluplus -name rcbest
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/rcworst/crn28hpc+_1p09m+ut-alrdl_6x1z1u_rcworst.tluplus -name rcworst
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/typical/crn28hpc+_1p09m+ut-alrdl_6x1z1u_typical.tluplus -name rctypical

save_lib

# SVF file for formality
#set_svf svf_files/PE.svf

# Logic elaborate step
analyze -format verilog [glob v_code/*.v] 
elaborate PE
set_top_module PE
start_gui
save_block -as PE/elaborate

# MCMM
# Remove all MCMM related info
remove_corners   -all
remove_modes     -all
remove_scenarios -all

# Create Corners
create_corner Fast
set_process_label FFG -corner Fast

create_corner Typical
set_process_label TT -corner Typical

create_corner Slow
set_process_label SSG -corner Slow

# Set parasitics parameters
set_parasitics_parameters -early_spec rcbest -late_spec  rcbest -corners {Fast}
set_parasitics_parameters -early_spec rctypical -late_spec rctypical -corners {Typical}
set_parasitics_parameters -early_spec rcworst -late_spec  rcworst -corners {Slow}

# Create mode
create_mode  FUNC
current_mode FUNC

# Create Scenarios
create_scenario -mode FUNC -corner Fast    -name FUNC_Fast
create_scenario -mode FUNC -corner Typical -name FUNC_Typical
create_scenario -mode FUNC -corner Slow    -name FUNC_Slow

# FAST SCENARIO
current_scenario FUNC_Fast
set_operating_conditions "ffg0p99v0c"
source constraints/PE_5ns.sdc

# TYPICAL SCENARIO
current_scenario FUNC_Typical
set_operating_conditions "tt0p9v85c"
source constraints/PE_5ns.sdc

# SLOW SCENARIO
current_scenario FUNC_Slow
set_operating_conditions "ssg0p81v125c"
source constraints/PE_5ns.sdc

# Die parameters initialization
#initialize_floorplan -core_utilization 0.6 -side_ratio {1 1} -core_offset 2
initialize_floorplan -control_type core -boundary {{0 0} {66.00 66.00}} -core_offset 2

# Continue w/o DFT clocks
set_app_options -name place.coarse.continue_on_missing_scandef -value true

# Compiling with datapath effort
set_datapath_architecture_options -optimize_for speed

# Compiling with area effort
#set_app_options -name compile.flow.high_effort_area -value true

# Compilimg with power effort
#set_app_options -name compile.flow.enable_power -value true

# Prohibit 1 site spacing
set_placement_spacing_label -name {no_1X} -side both -lib_cells [get_lib_cells -filter "design_type != welltap && design_type != endcap && design_type != filler"]
set_placement_spacing_rule -labels {no_1X no_1X} {1 1}

# Place boundary and tap cells 
source tcl_files/bound_and_tap.tcl
save_block -as PE/BoundAndTap
save_lib

# Create power grid
source tcl_files/PG.tcl
save_block -as PE/Floorplan
save_lib

# Synthesize + Place
source tcl_files/place.tcl
save_block -as PE/Place
save_lib

# Generate netlist for formality
#write_verilog -hierarchy all netlist/PE_verilog.v

# Stop writing to svf
#set_svf -off

# CTS
source tcl_files/CTS.tcl
save_block -as PE/CTS
save_lib

# Route
source tcl_files/route.tcl
save_block -as PE/Route
save_lib

# Add filler cells 
source tcl_files/filler.tcl
save_block -as PE/Filler
save_lib

close_lib




# Create new library for the design
create_lib  -technology $TECH_FILE  -ref_libs {/data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140.ndm /data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140hvt.ndm /data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140lvt.ndm }  PE_4ns_timing.dlib
open_lib PE_4ns_timing.dlib

# Load parasitics
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/rcbest/crn28hpc+_1p09m+ut-alrdl_6x1z1u_rcbest.tluplus -name rcbest
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/rcworst/crn28hpc+_1p09m+ut-alrdl_6x1z1u_rcworst.tluplus -name rcworst
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/typical/crn28hpc+_1p09m+ut-alrdl_6x1z1u_typical.tluplus -name rctypical

save_lib

# SVF file for formality
#set_svf svf_files/PE.svf

# Logic elaborate step
analyze -format verilog [glob v_code/*.v] 
elaborate PE
set_top_module PE
start_gui
save_block -as PE/elaborate

# MCMM
# Remove all MCMM related info
remove_corners   -all
remove_modes     -all
remove_scenarios -all

# Create Corners
create_corner Fast
set_process_label FFG -corner Fast

create_corner Typical
set_process_label TT -corner Typical

create_corner Slow
set_process_label SSG -corner Slow

# Set parasitics parameters
set_parasitics_parameters -early_spec rcbest -late_spec  rcbest -corners {Fast}
set_parasitics_parameters -early_spec rctypical -late_spec rctypical -corners {Typical}
set_parasitics_parameters -early_spec rcworst -late_spec  rcworst -corners {Slow}

# Create mode
create_mode  FUNC
current_mode FUNC

# Create Scenarios
create_scenario -mode FUNC -corner Fast    -name FUNC_Fast
create_scenario -mode FUNC -corner Typical -name FUNC_Typical
create_scenario -mode FUNC -corner Slow    -name FUNC_Slow

# FAST SCENARIO
current_scenario FUNC_Fast
set_operating_conditions "ffg0p99v0c"
source constraints/PE_4ns.sdc

# TYPICAL SCENARIO
current_scenario FUNC_Typical
set_operating_conditions "tt0p9v85c"
source constraints/PE_4ns.sdc

# SLOW SCENARIO
current_scenario FUNC_Slow
set_operating_conditions "ssg0p81v125c"
source constraints/PE_4ns.sdc

# Die parameters initialization
#initialize_floorplan -core_utilization 0.6 -side_ratio {1 1} -core_offset 2
initialize_floorplan -control_type core -boundary {{0 0} {66.00 66.00}} -core_offset 2

# Continue w/o DFT clocks
set_app_options -name place.coarse.continue_on_missing_scandef -value true

# Compiling with datapath effort
set_datapath_architecture_options -optimize_for speed

# Compiling with area effort
#set_app_options -name compile.flow.high_effort_area -value true

# Compilimg with power effort
#set_app_options -name compile.flow.enable_power -value true

# Prohibit 1 site spacing
set_placement_spacing_label -name {no_1X} -side both -lib_cells [get_lib_cells -filter "design_type != welltap && design_type != endcap && design_type != filler"]
set_placement_spacing_rule -labels {no_1X no_1X} {1 1}

# Place boundary and tap cells 
source tcl_files/bound_and_tap.tcl
save_block -as PE/BoundAndTap
save_lib

# Create power grid
source tcl_files/PG.tcl
save_block -as PE/Floorplan
save_lib

# Synthesize + Place
source tcl_files/place.tcl
save_block -as PE/Place
save_lib

# Generate netlist for formality
#write_verilog -hierarchy all netlist/PE_verilog.v

# Stop writing to svf
#set_svf -off

# CTS
source tcl_files/CTS.tcl
save_block -as PE/CTS
save_lib

# Route
source tcl_files/route.tcl
save_block -as PE/Route
save_lib

# Add filler cells 
source tcl_files/filler.tcl
save_block -as PE/Filler
save_lib

close_lib





# Create new library for the design
create_lib  -technology $TECH_FILE  -ref_libs {/data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140.ndm /data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140hvt.ndm /data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140lvt.ndm }  PE_3ns_timing.dlib
open_lib PE_3ns_timing.dlib

# Load parasitics
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/rcbest/crn28hpc+_1p09m+ut-alrdl_6x1z1u_rcbest.tluplus -name rcbest
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/rcworst/crn28hpc+_1p09m+ut-alrdl_6x1z1u_rcworst.tluplus -name rcworst
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/typical/crn28hpc+_1p09m+ut-alrdl_6x1z1u_typical.tluplus -name rctypical

save_lib

# SVF file for formality
#set_svf svf_files/PE.svf

# Logic elaborate step
analyze -format verilog [glob v_code/*.v] 
elaborate PE
set_top_module PE
start_gui
save_block -as PE/elaborate

# MCMM
# Remove all MCMM related info
remove_corners   -all
remove_modes     -all
remove_scenarios -all

# Create Corners
create_corner Fast
set_process_label FFG -corner Fast

create_corner Typical
set_process_label TT -corner Typical

create_corner Slow
set_process_label SSG -corner Slow

# Set parasitics parameters
set_parasitics_parameters -early_spec rcbest -late_spec  rcbest -corners {Fast}
set_parasitics_parameters -early_spec rctypical -late_spec rctypical -corners {Typical}
set_parasitics_parameters -early_spec rcworst -late_spec  rcworst -corners {Slow}

# Create mode
create_mode  FUNC
current_mode FUNC

# Create Scenarios
create_scenario -mode FUNC -corner Fast    -name FUNC_Fast
create_scenario -mode FUNC -corner Typical -name FUNC_Typical
create_scenario -mode FUNC -corner Slow    -name FUNC_Slow

# FAST SCENARIO
current_scenario FUNC_Fast
set_operating_conditions "ffg0p99v0c"
source constraints/PE_3ns.sdc

# TYPICAL SCENARIO
current_scenario FUNC_Typical
set_operating_conditions "tt0p9v85c"
source constraints/PE_3ns.sdc

# SLOW SCENARIO
current_scenario FUNC_Slow
set_operating_conditions "ssg0p81v125c"
source constraints/PE_3ns.sdc

# Die parameters initialization
#initialize_floorplan -core_utilization 0.6 -side_ratio {1 1} -core_offset 2
initialize_floorplan -control_type core -boundary {{0 0} {66.00 66.00}} -core_offset 2

# Continue w/o DFT clocks
set_app_options -name place.coarse.continue_on_missing_scandef -value true

# Compiling with datapath effort
set_datapath_architecture_options -optimize_for speed

# Compiling with area effort
#set_app_options -name compile.flow.high_effort_area -value true

# Compilimg with power effort
#set_app_options -name compile.flow.enable_power -value true

# Prohibit 1 site spacing
set_placement_spacing_label -name {no_1X} -side both -lib_cells [get_lib_cells -filter "design_type != welltap && design_type != endcap && design_type != filler"]
set_placement_spacing_rule -labels {no_1X no_1X} {1 1}

# Place boundary and tap cells 
source tcl_files/bound_and_tap.tcl
save_block -as PE/BoundAndTap
save_lib

# Create power grid
source tcl_files/PG.tcl
save_block -as PE/Floorplan
save_lib

# Synthesize + Place
source tcl_files/place.tcl
save_block -as PE/Place
save_lib

# Generate netlist for formality
#write_verilog -hierarchy all netlist/PE_verilog.v

# Stop writing to svf
#set_svf -off

# CTS
source tcl_files/CTS.tcl
save_block -as PE/CTS
save_lib

# Route
source tcl_files/route.tcl
save_block -as PE/Route
save_lib

# Add filler cells 
source tcl_files/filler.tcl
save_block -as PE/Filler
save_lib

close_lib




# Create new library for the design
create_lib  -technology $TECH_FILE  -ref_libs {/data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140.ndm /data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140hvt.ndm /data/tsmc/28HPCPMMWAVE/synopsys/libs/tcbn28hpcplusbwp30p140lvt.ndm }  PE_2ns_timing.dlib
open_lib PE_2ns_timing.dlib

# Load parasitics
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/rcbest/crn28hpc+_1p09m+ut-alrdl_6x1z1u_rcbest.tluplus -name rcbest
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/rcworst/crn28hpc+_1p09m+ut-alrdl_6x1z1u_rcworst.tluplus -name rcworst
read_parasitic_tech -tlup /data/tsmc/28HPCPMMWAVE/dig_libs/snpsflow/typical/crn28hpc+_1p09m+ut-alrdl_6x1z1u_typical.tluplus -name rctypical

save_lib

# SVF file for formality
#set_svf svf_files/PE.svf

# Logic elaborate step
analyze -format verilog [glob v_code/*.v] 
elaborate PE
set_top_module PE
start_gui
save_block -as PE/elaborate

# MCMM
# Remove all MCMM related info
remove_corners   -all
remove_modes     -all
remove_scenarios -all

# Create Corners
create_corner Fast
set_process_label FFG -corner Fast

create_corner Typical
set_process_label TT -corner Typical

create_corner Slow
set_process_label SSG -corner Slow

# Set parasitics parameters
set_parasitics_parameters -early_spec rcbest -late_spec  rcbest -corners {Fast}
set_parasitics_parameters -early_spec rctypical -late_spec rctypical -corners {Typical}
set_parasitics_parameters -early_spec rcworst -late_spec  rcworst -corners {Slow}

# Create mode
create_mode  FUNC
current_mode FUNC

# Create Scenarios
create_scenario -mode FUNC -corner Fast    -name FUNC_Fast
create_scenario -mode FUNC -corner Typical -name FUNC_Typical
create_scenario -mode FUNC -corner Slow    -name FUNC_Slow

# FAST SCENARIO
current_scenario FUNC_Fast
set_operating_conditions "ffg0p99v0c"
source constraints/PE_2ns.sdc

# TYPICAL SCENARIO
current_scenario FUNC_Typical
set_operating_conditions "tt0p9v85c"
source constraints/PE_2ns.sdc

# SLOW SCENARIO
current_scenario FUNC_Slow
set_operating_conditions "ssg0p81v125c"
source constraints/PE_2ns.sdc

# Die parameters initialization
#initialize_floorplan -core_utilization 0.6 -side_ratio {1 1} -core_offset 2
initialize_floorplan -control_type core -boundary {{0 0} {66.00 66.00}} -core_offset 2

# Continue w/o DFT clocks
set_app_options -name place.coarse.continue_on_missing_scandef -value true

# Compiling with datapath effort
set_datapath_architecture_options -optimize_for speed

# Compiling with area effort
#set_app_options -name compile.flow.high_effort_area -value true

# Compilimg with power effort
#set_app_options -name compile.flow.enable_power -value true

# Prohibit 1 site spacing
set_placement_spacing_label -name {no_1X} -side both -lib_cells [get_lib_cells -filter "design_type != welltap && design_type != endcap && design_type != filler"]
set_placement_spacing_rule -labels {no_1X no_1X} {1 1}

# Place boundary and tap cells 
source tcl_files/bound_and_tap.tcl
save_block -as PE/BoundAndTap
save_lib

# Create power grid
source tcl_files/PG.tcl
save_block -as PE/Floorplan
save_lib

# Synthesize + Place
source tcl_files/place.tcl
save_block -as PE/Place
save_lib

# Generate netlist for formality
#write_verilog -hierarchy all netlist/PE_verilog.v

# Stop writing to svf
#set_svf -off

# CTS
source tcl_files/CTS.tcl
save_block -as PE/CTS
save_lib

# Route
source tcl_files/route.tcl
save_block -as PE/Route
save_lib

# Add filler cells 
source tcl_files/filler.tcl
save_block -as PE/Filler
save_lib

close_lib
