# For range mapping synthesis
# read files
read_verilog ./rtl/defines.v
# read_verilog ./rtl/re_data.v
read_verilog ./rtl/re_lod32.v
read_verilog ./rtl/re_shifter32.v
read_verilog ./rtl/re_map.v
read_verilog ./rtl/re_top.v 

# constraints 
current_design remap_top
source "${script_path}/rm_constr.con" 

# design environment 
# set_load $MAX_OUTPUT_LOAD [all_outputs] 
# set_driving_cell -lib_cell $DRIVE_CELL [all_inputs]

# design constraints 
set_input_delay  $INPUT_DELAY -clock $CLK_PORT [all_inputs]
set_output_delay $OUTPUT_DELAY -clock $CLK_PORT [all_outputs]
set_max_area 0

# ungroup DesignWare parts 
set designware_cells [get_cells -filter "@is_oper==true" *]
if {[sizeof_collection $designware_cells] > 0} {
   set_ungroup $designware_cells true
}

set_fix_hold [all_clocks]
# compile_ultra
# write -format verilog -output ${netlist_path}/syn_$current_design.v -hier
# write -format ddc -hierarchy -output "${ddc_path}/${current_design}.ddc"
# write_sdf ${netlist_path}/syn_$current_design.sdf
# source "${script_path}/report.tcl"
