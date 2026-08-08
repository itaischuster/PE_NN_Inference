
# Insert Boundary cells
create_boundary_cells \
-left_boundary_cell tcbn28hpcplusbwp30p140/BOUNDARY_LEFTBWP30P140 \
-right_boundary_cell tcbn28hpcplusbwp30p140/BOUNDARY_RIGHTBWP30P140 \
-prefix BOUND
# Insert TAP cells to ensure well and substrate ties
create_tap_cells \
-lib_cell tcbn28hpcplusbwp30p140/TAPCELLBWP30P140 \
-distance 30 \
-pattern stagger \
-skip_fixed_cells
#Checking legality of placement
legalize_placement -incremental

