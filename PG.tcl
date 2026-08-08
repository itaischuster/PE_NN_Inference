remove_pg_via_master_rules -all
remove_pg_patterns -all
remove_pg_strategies -all
remove_pg_strategy_via_rules -all
remove_routes -ring -stripe -lib_cell_pin_connect

#### Set PG net attribute
set_attribute -objects [get_nets VDD] -name net_type -value power
set_attribute -objects [get_nets VSS] -name net_type -value ground

#### Create VIA strategy rule VIA_NIL
#set_pg_strategy_via_rule VIA_NIL -via_rule { {intersection: undefined} {via_master: NIL} }

#### Create PG Rails for standard cells
create_pg_std_cell_conn_pattern M1_rail -layers M1 -rail_width 0.15

#### Connect all cess to pg nets
connect_pg_net -automatic

#### set the PG strategy for M1 cells straps
set_pg_strategy M1_rail_strategy -core -pattern {{name: M1_rail} {nets: {VDD VSS}}}

#### create pg for the cells on the rows
compile_pg -strategies M1_rail_strategy

#### Create PG Rings
create_pg_ring_pattern \
                 PG_Ring_Higher \
                 -horizontal_layer M7  -vertical_layer M6  \
                 -horizontal_width 1 -vertical_width 1 \
                 -horizontal_spacing 1 -vertical_spacing 1

set_pg_strategy PG_Ring_Higher -core -pattern {{ name: PG_Ring_Higher} { nets: {VDD VSS} } {offset: 0.5}}

create_pg_ring_pattern \
                 PG_Ring_Lower \
                 -horizontal_layer M5  -vertical_layer M4 \
                 -horizontal_width 1 -vertical_width 1 \
                 -horizontal_spacing 1 -vertical_spacing 1

set_pg_strategy PG_Ring_Lower -core -pattern {{ name: PG_Ring_Lower} { nets: {VDD VSS} } {offset: 0.5}}

compile_pg -strategies { PG_Ring_Lower PG_Ring_Higher }

### Create M4 Veritcal PG Straps
create_pg_mesh_pattern M4_PG -layers { {vertical_layer: M4} {width: 1.6} {spacing: interleaving} {pitch: 16} {offset: 4.0} }
set_pg_strategy M4_PG_Strategy -core -pattern { {name: M4_PG} {nets:{VSS VDD}} } -extension { {stop: design_boundary} }
compile_pg -strategies {M4_PG_Strategy} 

#### Create M5 Horizontal PG Straps
create_pg_mesh_pattern M5_PG -layers { {horizontal_layer: M5} {width: 1.6} {spacing: interleaving} {pitch: 16} {offset: 4.0} }
set_pg_strategy M5_PG_Strategy -core -pattern { {name: M5_PG} {nets:{VSS VDD}} } -extension { {stop: design_boundary} }
compile_pg -strategies {M5_PG_Strategy} 

#### Create M6 Vertical PG Straps
create_pg_mesh_pattern M6_PG -layers { {vertical_layer: M6} {width: 1.6} {spacing: interleaving} {pitch: 16} {offset: 4.0} }
set_pg_strategy M6_PG_Strategy -core -pattern { {name: M6_PG} {nets:{VSS VDD}} } -extension { {stop: design_boundary} }
compile_pg -strategies {M6_PG_Strategy} 

#### Create M7 Horizontal PG Straps
create_pg_mesh_pattern M7_PG -layers { {horizontal_layer: M7} {width: 1.6} {spacing: interleaving} {pitch: 16} {offset: 4.0} }
set_pg_strategy M7_PG_Strategy -core -pattern { {name: M7_PG} {nets:{VSS VDD}} } -extension { {stop: design_boundary} }
compile_pg -strategies {M7_PG_Strategy}

#### Create Vias on non-PG layers
create_pg_vias -from_layers M4 -to_layers M1 -via_masters default -nets {VDD VSS}
create_pg_vias -from_layers M5 -to_layers M4 -via_masters default -nets {VDD VSS}
create_pg_vias -from_layers M6 -to_layers M5 -via_masters default -nets {VDD VSS}
create_pg_vias -from_layers M7 -to_layers M6 -via_masters default -nets {VDD VSS}

#### Connect all pg nets
connect_pg_net -automatic


