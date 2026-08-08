# Clean up existing fillers
set fillers [get_cells -filter "ref_name =~ *FILL*"]
remove_cell $fillers

# Insert new standard cell fillers
create_stdcell_fillers \
-lib_cells {
tcbn28hpcplusbwp30p140/FILL64BWP30P140
tcbn28hpcplusbwp30p140/FILL32BWP30P140
tcbn28hpcplusbwp30p140/FILL16BWP30P140
tcbn28hpcplusbwp30p140/FILL8BWP30P140
tcbn28hpcplusbwp30p140/FILL4BWP30P140
tcbn28hpcplusbwp30p140/FILL3BWP30P140
tcbn28hpcplusbwp30p140/FILL2BWP30P140
tcbn28hpcplusbwp30p140/GFILLBWP30P140
tcbn28hpcplusbwp30p140/GFILL2BWP30P140
tcbn28hpcplusbwp30p140/GFILL3BWP30P140
tcbn28hpcplusbwp30p140/GFILL4BWP30P140
} \
-prefix FILLER

connect_pg_net -automatic
