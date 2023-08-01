if {[file isdirectory $local_dir/script_support/components/MSS]} {
	file delete -force $local_dir/script_support/components/MSS
}
file mkdir $local_dir/script_support/components/MSS
exec $mss_config_loc -CONFIGURATION_FILE:$local_dir/../../../mss/libero2022.2/Aldec_MSS_2022_2/Aldec_MSS_2022_2.cfg -OUTPUT_DIR:$local_dir/script_support/components/MSS
import_mss_component -file "$local_dir/../../../mss/libero2022.2/Aldec_MSS_2022_2/Aldec_MSS_2022_2.cxz"
#Sourcing the Tcl file in which all the HDL source files used in the design are imported or linked
source $local_dir/script_support/hdl_source.tcl
build_design_hierarchy

#Sourcing the Tcl files in which HDL+ core definitions are created for HDL modules
source script_support/components/APB_ARBITER.tcl 
source script_support/components/APB_PASS_THROUGH.tcl 
source script_support/components/fabric_sd_emmc_demux_select.tcl 
build_design_hierarchy

#Sourcing the Tcl files for creating individual components under the top level
source script_support/components/CORERESET_PF_C0.tcl 
source script_support/components/FIC_3_0x4FFF_Fxxx.tcl 
source script_support/components/FIC_3_0x4xxx_xxxx.tcl 
source script_support/components/PFSOC_INIT_MONITOR_C0.tcl 
source script_support/components/PF_CCC_C0.tcl 
source script_support/components/PF_OSC_C0.tcl 
source script_support/components/tysom_m_2022_2.tcl 
build_design_hierarchy
set_root -module {tysom_m_2022_2::work} 
