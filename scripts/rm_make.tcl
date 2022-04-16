# For range mapping synthesis
# read files
read_verilog ./rtl/rm_lod32_rom.v
read_verilog ./rtl/rm_logshifter32.v
read_verilog ./rtl/rm_mapping.v
read_verilog ./rtl/rm_errorcorrection.v
read_verilog ./rtl/rm_top.v 

set rpt_file "rm_report.rpt"

# constraints 
current_design m_rangemapping 
source "${script_path}/constr.con" 

# design environment 
#set_load $MAX_OUTPUT_LOAD [all_outputs] 
#set_driving_cell -lib_cell $DRIVE_CELL [all_inputs]

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
compile_ultra
write -format verilog -output ${netlist_path}/syn_$current_design.v -hier
write -format ddc -hierarchy -output "${ddc_path}/${current_design}.ddc"
write_sdf ${netlist_path}/syn_$current_design.sdf
source "${script_path}/rpt.tcl"
