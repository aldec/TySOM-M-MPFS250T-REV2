# Exporting Component Description of CLK_160MHz_to_CLK_80MHz to TCL
# Family: PolarFireSoC
# Part Number: MPFS250T_ES-1FCG1152E
# Create and Configure the core component CLK_160MHz_to_CLK_80MHz
create_and_configure_core -core_vlnv {Actel:SgCore:PF_CLK_DIV:1.0.103} -component_name {CLK_160MHz_to_CLK_80MHz} -params {\
"DIVIDER:2"  \
"ENABLE_BIT_SLIP:false"  \
"ENABLE_SRESET:false"   }
# Exporting Component Description of CLK_160MHz_to_CLK_80MHz to TCL done
