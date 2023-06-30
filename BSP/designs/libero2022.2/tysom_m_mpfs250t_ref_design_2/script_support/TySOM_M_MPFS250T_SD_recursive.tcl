#This Tcl file sources other Tcl files to build the design(on which recursive export is run) in a bottom-up fashion

#Sourcing the Tcl file in which all the HDL source files used in the design are imported or linked
source $local_dir/script_support/hdl_source.tcl
build_design_hierarchy

#Sourcing the Tcl files in which HDL+ core definitions are created for HDL modules
source $local_dir/script_support/components/Count_Checker.tcl 
source $local_dir/script_support/components/Counter.tcl 
source $local_dir/script_support/components/synchronizer.tcl 
source $local_dir/script_support/components/Reset_Synchronizer.tcl 
source $local_dir/script_support/components/FabUART.tcl 
build_design_hierarchy

#Sourcing the Tcl files for creating individual components under the top level
source $local_dir/script_support/components/COREFIFO_C1.tcl 
source $local_dir/script_support/components/COREFIFO_C2.tcl 
source $local_dir/script_support/components/COREFIFO_C3.tcl 
source $local_dir/script_support/components/COREFIFO_C4.tcl 
source $local_dir/script_support/components/LiteFast_C3.tcl 
source $local_dir/script_support/components/LiteFast_receiver.tcl 
source $local_dir/script_support/components/COREFIFO_C0.tcl 
source $local_dir/script_support/components/LiteFast_C2.tcl 
source $local_dir/script_support/components/LiteFast_transmitter.tcl 
source $local_dir/script_support/components/COREUART_C0.tcl 
source $local_dir/script_support/components/UART_IF.tcl 
source $local_dir/script_support/components/PF_TX_PLL_C0.tcl 
source $local_dir/script_support/components/PF_XCVR_ERM_C0.tcl 
source $local_dir/script_support/components/PF_XCVR_REF_CLK_C0.tcl 
source $local_dir/script_support/components/transceiver.tcl 
source  $local_dir/script_support/components/top.tcl 
build_design_hierarchy


if {[file isdirectory $local_dir/script_support/components/MSS]} {
	file delete -force $local_dir/script_support/components/MSS
}
file mkdir $local_dir/script_support/components/MSS
exec $mss_config_loc -CONFIGURATION_FILE:$local_dir/mss/Aldec_MSS_2022_2/Aldec_MSS_2022_2.cfg -OUTPUT_DIR:$local_dir/script_support/components/MSS
import_mss_component -file "$local_dir/mss/Aldec_MSS_2022_2/Aldec_MSS_2022_2.cxz"
source $local_dir/script_support/components/CORERESET_PF_C0.tcl 
source $local_dir/script_support/components/PFSOC_INIT_MONITOR_C0.tcl 
source $local_dir/script_support/components/PF_CCC_C0.tcl
source $local_dir/script_support/components/PF_OSC_C1.tcl 
source $local_dir/script_support/components/PF_DDR4_C0.tcl
source $local_dir/script_support/components/LANE.tcl
source $local_dir/script_support/components/CoreAPB3_C0.tcl
source $local_dir/script_support/components/COREAXI4INTERCONNECT_C0.tcl
source $local_dir/script_support/components/tysom_m_2022_2_SD.tcl 
build_design_hierarchy
set_root -module {tysom_m_2022_2_SD::work} 