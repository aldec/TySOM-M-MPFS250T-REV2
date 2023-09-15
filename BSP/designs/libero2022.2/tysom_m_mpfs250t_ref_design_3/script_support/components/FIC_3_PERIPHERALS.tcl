# Creating SmartDesign FIC_3_PERIPHERALS
set sd_name {FIC_3_PERIPHERALS}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_MMASTER_in_penable} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_MMASTER_in_psel} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_MMASTER_in_pwrite} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PLL0_SW_DRI_INTERRUPT} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PRESETN} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {Q0_LANE0_DRI_INTERRUPT} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {Q0_LANE1_DRI_INTERRUPT} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {Q0_LANE2_DRI_INTERRUPT} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {Q0_LANE3_DRI_INTERRUPT} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_MMASTER_in_pready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_MMASTER_in_pslverr} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {Q0_LANE0_DRI_DRI_ARST_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {Q0_LANE0_DRI_DRI_CLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {fabric_sd_emmc_demux_select_out} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {APB_MMASTER_in_paddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APB_MMASTER_in_pwdata} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PLL0_SW_DRI_RDATA} -port_direction {IN} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PSTRB} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Q0_LANE0_DRI_RDATA} -port_direction {IN} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Q0_LANE1_DRI_RDATA} -port_direction {IN} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Q0_LANE2_DRI_RDATA} -port_direction {IN} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Q0_LANE3_DRI_RDATA} -port_direction {IN} -port_range {[32:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {APB_MMASTER_in_prdata} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PLL0_SW_DRI_CTRL} -port_direction {OUT} -port_range {[10:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Q0_LANE0_DRI_CTRL} -port_direction {OUT} -port_range {[10:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Q0_LANE0_DRI_DRI_WDATA} -port_direction {OUT} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Q0_LANE1_DRI_CTRL} -port_direction {OUT} -port_range {[10:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Q0_LANE2_DRI_CTRL} -port_direction {OUT} -port_range {[10:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Q0_LANE3_DRI_CTRL} -port_direction {OUT} -port_range {[10:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {Q0_LANE0_DRI} -port_bif_vlnv {Actel:busdef.dri:PF_DRI:1.0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"DRI_CLK:Q0_LANE0_DRI_DRI_CLK" \
"DRI_ARST_N:Q0_LANE0_DRI_DRI_ARST_N" \
"DRI_CTRL:Q0_LANE0_DRI_CTRL" \
"DRI_RDATA:Q0_LANE0_DRI_RDATA" \
"DRI_WDATA:Q0_LANE0_DRI_DRI_WDATA" \
"DRI_INTERRUPT:Q0_LANE0_DRI_INTERRUPT" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {Q0_LANE1_DRI} -port_bif_vlnv {Actel:busdef.dri:PF_DRI:1.0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"DRI_CLK:Q0_LANE0_DRI_DRI_CLK" \
"DRI_ARST_N:Q0_LANE0_DRI_DRI_ARST_N" \
"DRI_CTRL:Q0_LANE1_DRI_CTRL" \
"DRI_RDATA:Q0_LANE1_DRI_RDATA" \
"DRI_WDATA:Q0_LANE0_DRI_DRI_WDATA" \
"DRI_INTERRUPT:Q0_LANE1_DRI_INTERRUPT" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {Q0_LANE2_DRI} -port_bif_vlnv {Actel:busdef.dri:PF_DRI:1.0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"DRI_CLK:Q0_LANE0_DRI_DRI_CLK" \
"DRI_ARST_N:Q0_LANE0_DRI_DRI_ARST_N" \
"DRI_CTRL:Q0_LANE2_DRI_CTRL" \
"DRI_RDATA:Q0_LANE2_DRI_RDATA" \
"DRI_WDATA:Q0_LANE0_DRI_DRI_WDATA" \
"DRI_INTERRUPT:Q0_LANE2_DRI_INTERRUPT" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {Q0_LANE3_DRI} -port_bif_vlnv {Actel:busdef.dri:PF_DRI:1.0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"DRI_CLK:Q0_LANE0_DRI_DRI_CLK" \
"DRI_ARST_N:Q0_LANE0_DRI_DRI_ARST_N" \
"DRI_CTRL:Q0_LANE3_DRI_CTRL" \
"DRI_RDATA:Q0_LANE3_DRI_RDATA" \
"DRI_WDATA:Q0_LANE0_DRI_DRI_WDATA" \
"DRI_INTERRUPT:Q0_LANE3_DRI_INTERRUPT" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {PLL0_SW_DRI} -port_bif_vlnv {Actel:busdef.dri:PF_DRI:1.0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"DRI_CLK:Q0_LANE0_DRI_DRI_CLK" \
"DRI_ARST_N:Q0_LANE0_DRI_DRI_ARST_N" \
"DRI_CTRL:PLL0_SW_DRI_CTRL" \
"DRI_RDATA:PLL0_SW_DRI_RDATA" \
"DRI_WDATA:Q0_LANE0_DRI_DRI_WDATA" \
"DRI_INTERRUPT:PLL0_SW_DRI_INTERRUPT" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {APB_MMASTER} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredMaster} -port_bif_mapping {\
"PADDR:APB_MMASTER_in_paddr" \
"PSELx:APB_MMASTER_in_psel" \
"PENABLE:APB_MMASTER_in_penable" \
"PWRITE:APB_MMASTER_in_pwrite" \
"PRDATA:APB_MMASTER_in_prdata" \
"PWDATA:APB_MMASTER_in_pwdata" \
"PREADY:APB_MMASTER_in_pready" \
"PSLVERR:APB_MMASTER_in_pslverr" } 

# Add fabric_sd_emmc_demux_select_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {fabric_sd_emmc_demux_select} -instance_name {fabric_sd_emmc_demux_select_0}



# Add FIC_3_ADDRESS_GENERATION_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {FIC_3_ADDRESS_GENERATION} -instance_name {FIC_3_ADDRESS_GENERATION_1}



# Add RECONFIGURATION_INTERFACE_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {RECONFIGURATION_INTERFACE} -instance_name {RECONFIGURATION_INTERFACE_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {RECONFIGURATION_INTERFACE_0:PINTERRUPT}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {RECONFIGURATION_INTERFACE_0:PTIMEOUT}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {RECONFIGURATION_INTERFACE_0:BUSERROR}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCLK" "RECONFIGURATION_INTERFACE_0:PCLK" "fabric_sd_emmc_demux_select_0:pclk" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PRESETN" "RECONFIGURATION_INTERFACE_0:PRESETN" "fabric_sd_emmc_demux_select_0:presetn" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"fabric_sd_emmc_demux_select_0:fabric_sd_emmc_demux_select_out" "fabric_sd_emmc_demux_select_out" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"PSTRB" "RECONFIGURATION_INTERFACE_0:PSTRB" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_MMASTER" "FIC_3_ADDRESS_GENERATION_1:APB_MMASTER" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_3_ADDRESS_GENERATION_1:FIC_3_0x43xx_xxxx_0x48xx_xxxx" "RECONFIGURATION_INTERFACE_0:APBS_SLAVE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_3_ADDRESS_GENERATION_1:FIC_3_0x4FFF_FFxx" "fabric_sd_emmc_demux_select_0:APBslave" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PLL0_SW_DRI" "RECONFIGURATION_INTERFACE_0:PLL0_SW_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Q0_LANE0_DRI" "RECONFIGURATION_INTERFACE_0:Q0_LANE0_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Q0_LANE1_DRI" "RECONFIGURATION_INTERFACE_0:Q0_LANE1_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Q0_LANE2_DRI" "RECONFIGURATION_INTERFACE_0:Q0_LANE2_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Q0_LANE3_DRI" "RECONFIGURATION_INTERFACE_0:Q0_LANE3_DRI" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign FIC_3_PERIPHERALS
generate_component -component_name ${sd_name}
