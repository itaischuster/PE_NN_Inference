# Define Shielding Rules (Reserve the space)
create_routing_rule CLK_NDR \
    -default_reference_rule \
    -multiplier_width 2 \
    -multiplier_spacing 2 \
    -shield \
    -snap_to_track

set_clock_routing_rules -rules CLK_NDR \
    -min_routing_layer M2 \
    -max_routing_layer M5

# Connect PG nets
connect_pg_net -net VDD [get_pins -hierarchical */VDD]
connect_pg_net -net VSS [get_pins -hierarchical */VSS]

# Execute Clock Tree Synthesis (Synthesize, Place, and Route Clocks)
clock_opt

