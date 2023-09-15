#This Tcl file sources other Tcl files to build the design(on which recursive export is run) in a bottom-up fashion

#Sourcing the Tcl file in which all the HDL source files used in the design are imported or linked
source $local_dir/script_support/hdl_source.tcl
build_design_hierarchy

if {[file isdirectory $local_dir/script_support/components/MSS]} {
	file delete -force $local_dir/script_support/components/MSS
}
file mkdir $local_dir/script_support/components/MSS
exec $mss_config_loc -CONFIGURATION_FILE:$local_dir/../../../mss/libero2022.2/Aldec_MSS_2022_2_PCIe/Aldec_MSS_2022_2_PCIe.cfg -OUTPUT_DIR:$local_dir/script_support/components/MSS
import_mss_component -file "$local_dir/../../../mss/libero2022.2/Aldec_MSS_2022_2_PCIe/Aldec_MSS_2022_2_PCIe.cxz"

#Sourcing the Tcl files in which HDL+ core definitions are created for HDL modules
source script_support/components/AXI_ADDRESS_SHIM.tcl 
source script_support/components/APB_ARBITER.tcl 
source script_support/components/APB_PASS_THROUGH.tcl 
source script_support/components/fabric_sd_emmc_demux_select.tcl 
build_design_hierarchy

#Sourcing the Tcl files for creating individual components under the top level
source script_support/components/CLK_DIV.tcl 
source script_support/components/CORERESET.tcl 
source script_support/components/GLITCHLESS_MUX.tcl 
source script_support/components/INIT_MONITOR.tcl 
source script_support/components/OSCILLATOR_160MHz.tcl 
source script_support/components/PCIE_REF_CLK.tcl 
source script_support/components/PF_CCC_C0.tcl 
source script_support/components/TRANSMIT_PLL.tcl 
source script_support/components/CLOCKS_AND_RESETS.tcl 
source script_support/components/DDR4_INITIATOR.tcl 
source script_support/components/FIC_1_INITIATOR.tcl 
source script_support/components/PCIE_INITIATOR.tcl 
source script_support/components/PF_PCIE_C0.tcl 
source script_support/components/FIC_1_PERIPHERALS.tcl 
source script_support/components/FIC_3_0x4FFF_Fxxx.tcl 
source script_support/components/FIC_3_0x4xxx_xxxx.tcl 
source script_support/components/FIC_3_ADDRESS_GENERATION.tcl 
source script_support/components/RECONFIGURATION_INTERFACE.tcl 
source script_support/components/FIC_3_PERIPHERALS.tcl 
source script_support/components/PF_DDR4_C0.tcl 
source script_support/components/tysom_m_2022_2.tcl 

build_design_hierarchy
set_root -module {tysom_m_2022_2::work} 