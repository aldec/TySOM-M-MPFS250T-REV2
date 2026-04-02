puts "***** 4_source_components - source component scripts"

#Sourcing the Tcl files in which HDL+ core definitions are created for HDL modules
source $local_dir/$src_path/components/pulse_extender.tcl
source $local_dir/$src_path/components/Reset_Synchronizer.tcl
build_design_hierarchy

#Sourcing the Tcl files for creating individual components under the top level
source $local_dir/$src_path/components/CORERESET_PF_C0.tcl
source $local_dir/$src_path/components/PFSOC_INIT_MONITOR_C0.tcl
source $local_dir/$src_path/components/PF_CCC_C0.tcl
source $local_dir/$src_path/components/PF_OSC_C1.tcl
source $local_dir/$src_path/components/COREFIFO_C1.tcl
source $local_dir/$src_path/components/COREFIFO_C2.tcl
source $local_dir/$src_path/components/COREFIFO_C3.tcl
source $local_dir/$src_path/components/LiteFast_RX.tcl
source $local_dir/$src_path/components/LiteFast_receiver.tcl
source $local_dir/$src_path/components/COREFIFO_C0.tcl
source $local_dir/$src_path/components/LiteFast_TX.tcl
source $local_dir/$src_path/components/LiteFast_transmitter.tcl
source $local_dir/$src_path/components/COREUART_C0.tcl
source $local_dir/$src_path/components/UART_IF.tcl
source $local_dir/$src_path/components/PF_TX_PLL_C0.tcl
source $local_dir/$src_path/components/PF_XCVR_ERM_C0.tcl
source $local_dir/$src_path/components/PF_XCVR_REF_CLK_C0.tcl
source $local_dir/$src_path/components/transceiver.tcl
source $local_dir/$src_path/components/top.tcl
source $local_dir/$src_path/components/TySOM_M_SYSTEM.tcl
build_design_hierarchy
