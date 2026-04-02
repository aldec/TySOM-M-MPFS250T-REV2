puts "***** 4_source_components - source component scripts"

import_mss_component -file "$local_dir/$src_path/components/MSS_TySOM_M_HDMI/TySOM_M_HDMI.cxz"

#Sourcing the Tcl files in which HDL+ core definitions are created for HDL modules
source $local_dir/$src_path/components/ADV7611_RX.tcl 
build_design_hierarchy

#Sourcing the Tcl files for creating individual components under the top level
source $local_dir/$src_path/components/CORERESET_PF_C0.tcl 
source $local_dir/$src_path/components/CoreAPB3_C0.tcl 
source $local_dir/$src_path/components/CoreGPIO_C0.tcl 
source $local_dir/$src_path/components/DDR_AXI4_ARBITER_PF_C0.tcl 
source $local_dir/$src_path/components/DDR_Read_C0.tcl 
source $local_dir/$src_path/components/DDR_Write_C0.tcl 
source $local_dir/$src_path/components/DDR_CONTROL.tcl 
source $local_dir/$src_path/components/Display_Controller_C1.tcl 
source $local_dir/$src_path/components/PFSOC_INIT_MONITOR_C0.tcl 
source $local_dir/$src_path/components/PF_CCC_C0.tcl 
source $local_dir/$src_path/components/PF_CCC_C1.tcl 
source $local_dir/$src_path/components/PF_DDR4_C0.tcl 
source $local_dir/$src_path/components/PF_OSC_C0.tcl 
source $local_dir/$src_path/components/TYSOM_M_SYSTEM.tcl 
build_design_hierarchy
