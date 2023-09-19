#This Tcl file sources other Tcl files to build the design(on which recursive export is run) in a bottom-up fashion

#Sourcing the Tcl file in which all the HDL source files used in the design are imported or linked
source $local_dir/script_support/hdl_source.tcl
build_design_hierarchy
if {[file isdirectory $local_dir/script_support/components/MSS]} {
	file delete -force $local_dir/script_support/components/MSS
}
file mkdir $local_dir/script_support/components/MSS
exec $mss_config_loc -CONFIGURATION_FILE:$local_dir/script_support/Aldec_MSS_2022_2/Aldec_MSS_2022_2.cfg -OUTPUT_DIR:$local_dir/script_support/components/MSS
import_mss_component -file "$local_dir/script_support/Aldec_MSS_2022_2/Aldec_MSS_2022_2.cxz"

#Sourcing the Tcl files for creating individual components under the top level
source script_support/components/CORERESET_PF_C0.tcl 
source script_support/components/Display_Controller_C1.tcl 
source script_support/components/PFSOC_INIT_MONITOR_C0.tcl 
source script_support/components/PF_CCC_C0.tcl 
source script_support/components/PF_OSC_C0.tcl 
source script_support/components/tysom_m_2022_2_SD.tcl 
build_design_hierarchy
set_root -module {tysom_m_2022_2_sd::work} 
