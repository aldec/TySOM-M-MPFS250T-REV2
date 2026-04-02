puts "***** 4_source_components - source component scripts"

#Sourcing the Tcl files in which HDL+ core definitions are created for HDL modules
source $local_dir/$src_path/components/Count_Checker.tcl
source $local_dir/$src_path/components/Counter.tcl
source $local_dir/$src_path/components/synchronizer.tcl
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
source $local_dir/$src_path/components/COREFIFO_C4.tcl
source $local_dir/$src_path/components/LiteFast_C3.tcl
source $local_dir/$src_path/components/LiteFast_receiver.tcl
source $local_dir/$src_path/components/COREFIFO_C0.tcl
source $local_dir/$src_path/components/LiteFast_C2.tcl
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

# Replacing some files in CoreUART core, because FIFO with depth of 1024 bits is needed instead of 256.
# The name of the fifo_256x8_g5.v file is not changed, because changing it would require modifications in other files.
# The fifo_256x8_g5.v file contains the COREUART_C0_COREUART_C0_0_fifo_1024x8 module.
set source_dir $local_dir/$src_path/hdl/COREUART_modified
set destination_dir $project_dir/component/work/COREUART_C0/COREUART_C0_0/rtl/vlog/core

file delete $destination_dir/CoreUART.v
file delete $destination_dir/fifo_256x8_g5.v

file copy $source_dir/CoreUART.v $destination_dir
file copy $source_dir/fifo_256x8_g5.v $destination_dir

build_design_hierarchy
