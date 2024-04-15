build_design_hierarchy

import_mss_component -file "$local_dir/script_support/components/MSS_eMMC/Aldec_MSSv2_devel.cxz"

source script_support/components/CLK_125MHz_to_CLK_62_5MHz.tcl 
source script_support/components/CLK_160MHz_to_CLK_80MHz.tcl 
source script_support/components/FIC0_MASTER.tcl 
source script_support/components/FIC1_MASTER.tcl 
source script_support/components/FIC3_MASTER.tcl 
source script_support/components/GLITCHLESS_MUX.tcl 
source script_support/components/OSCILLATOR_160MHz.tcl 
source script_support/components/PCIE_MASTER.tcl 
source script_support/components/PCIE_REF_CLK.tcl 
source script_support/components/PFSOC_INIT_MONITOR_C0.tcl 
source script_support/components/PF_CCC_C1.tcl 
source script_support/components/PF_DDR4_C0.tcl 
source script_support/components/PF_PCIE_C0.tcl 
source script_support/components/RECONFIGURATION_INTERFACE.tcl 
source script_support/components/RESET_CLK_125MHz.tcl 
source script_support/components/RESET_CLK_62_5MHz.tcl 
source script_support/components/TRANSMIT_PLL.tcl 
source script_support/components/tysom_m_v10.tcl 
build_design_hierarchy

set_root -module {tysom_m_v10::work} 
