

if {[file isdirectory $local_dir/script_support/components/MSS_eMMC]} {
	file delete -force $local_dir/script_support/components/MSS_eMMC
}
file mkdir $local_dir/script_support/components/MSS_eMMC
exec $mss_config_loc -CONFIGURATION_FILE:$local_dir/../../../mss/libero2021.1/Aldec_MSSv2.cfg -OUTPUT_DIR:$local_dir/script_support/components/MSS_eMMC
import_mss_component -file "$local_dir/../../../mss/libero2021.1/Aldec_MSSv2.cxz"
source script_support/components/CORERESET_PF_C0.tcl 
source script_support/components/PFSOC_INIT_MONITOR_C0.tcl 
source script_support/components/PF_CCC_C0.tcl 
source script_support/components/PF_OSC_C0.tcl 
source script_support/components/PMOD.tcl
source script_support/components/PF_DDR4_C0.tcl
source script_support/components/COREAXI4INTERCONNECT_C0.tcl
source script_support/components/RS485.tcl
source script_support/components/GATE.tcl
source script_support/components/CoreAPB3_C0.tcl
source script_support/components/tysom_m_v10.tcl 
build_design_hierarchy
set_root -module {tysom_m_v10::work} 
