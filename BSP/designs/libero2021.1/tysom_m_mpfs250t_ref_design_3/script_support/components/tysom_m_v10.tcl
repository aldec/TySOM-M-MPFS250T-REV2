# Creating SmartDesign tysom_m_v10
set sd_name {tysom_m_v10}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {I2C_1_SCL} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {I2C_1_SDA} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MAC_1_MDIO} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MAC_1_MDC} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_1_20_IN} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_1_23_OUT} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_CLK} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DIR} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_NXT} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_STP} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA0} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA1} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA2} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA3} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA4} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA5} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA6} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA7} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPI_1_DO} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPI_1_DI} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPI_1_SS0} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPI_1_CLK} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {EMMC_CLK} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {EMMC_CMD} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {EMMC_DATA0} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {EMMC_DATA1} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {EMMC_DATA2} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {EMMC_DATA3} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {EMMC_DATA4} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {EMMC_DATA5} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {EMMC_DATA6} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {EMMC_DATA7} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {EMMC_STRB} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {EMMC_RSTN} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_RX1_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_RX1_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_RX0_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_RX0_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_TX1_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_TX1_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_TX0_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_TX0_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REFCLK} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REFCLK_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESET_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CKE0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CS0_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ODT0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK0_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RAS_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {WE_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAS_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ACT_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_0_TXD_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_1_TXD_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_2_TXD_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_3_TXD_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_2_RXD_F2M} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_0_RXD_F2M} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_1_RXD_F2M} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_3_RXD_F2M} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VSC_8662_CMODE6} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VSC_8662_CMODE5} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VSC_8662_CMODE4} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VSC_8662_CMODE3} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VSC_8662_CMODE7} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VSC_8662_RESETN} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VSC_8662_SRESET} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_SEL} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_ULPI_RESET} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {I2C0_SDA} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {I2C0_SCL} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD0_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD0_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD1_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD1_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD2_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD2_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD3_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD3_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD0_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD0_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD1_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD1_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD2_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD2_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD3_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD3_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIE_1_PERST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CKE} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CS_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ODT} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RAS_N_0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAS_N_0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {WE_N_0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ACT_N_0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESET_N_0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK0_0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK0_N_0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD1} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD2} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD3} -port_direction {OUT} -port_is_pad {1}

sd_create_bus_port -sd_name ${sd_name} -port_name {BA} -port_direction {OUT} -port_range {[1:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQ} -port_direction {INOUT} -port_range {[35:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQS} -port_direction {INOUT} -port_range {[4:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQS_N} -port_direction {INOUT} -port_range {[4:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {A} -port_direction {OUT} -port_range {[13:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {BG} -port_direction {OUT} -port_range {[1:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQ_0} -port_direction {INOUT} -port_range {[31:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQS_0} -port_direction {INOUT} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQS_N_0} -port_direction {INOUT} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DM_N} -port_direction {OUT} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {BG_0} -port_direction {OUT} -port_range {[1:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {BA_0} -port_direction {OUT} -port_range {[1:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {A_0} -port_direction {OUT} -port_range {[13:0]} -port_is_pad {1}

sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {VSC_8662_CMODE6} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {VSC_8662_CMODE5} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {VSC_8662_CMODE4} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {VSC_8662_CMODE3} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {VSC_8662_CMODE7} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {VSC_8662_SRESET} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {SD_SEL} -value {VCC}
sd_invert_pins -sd_name ${sd_name} -pin_names {USB_ULPI_RESET}
# Add Aldec_MSSv2_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Aldec_MSSv2_devel} -instance_name {Aldec_MSSv2_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Aldec_MSSv2_0:MSS_INT_F2M} -pin_slices {[0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Aldec_MSSv2_0:MSS_INT_F2M} -pin_slices {[63:1]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:MSS_INT_F2M[63:1]} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:FIC_3_APB_M_PSTRB}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:MMUART_0_TXD_OE_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:MMUART_1_TXD_OE_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:MSS_INT_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:PLL_CPU_LOCK_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:PLL_DDR_LOCK_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:PLL_SGMII_LOCK_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:MAC_0_TSU_SOF_TX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:MAC_0_TSU_SYNC_FRAME_TX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:MAC_0_TSU_DELAY_REQ_TX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:MAC_0_TSU_PDELAY_REQ_TX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:MAC_0_TSU_PDELAY_RESP_TX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:MAC_0_TSU_SOF_RX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:MAC_0_TSU_SYNC_FRAME_RX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:MAC_0_TSU_DELAY_REQ_RX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:MAC_0_TSU_PDELAY_REQ_RX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:MAC_0_TSU_PDELAY_RESP_RX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:MAC_1_TSU_SOF_TX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:MAC_1_TSU_SYNC_FRAME_TX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:MAC_1_TSU_DELAY_REQ_TX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:MAC_1_TSU_PDELAY_REQ_TX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:MAC_1_TSU_PDELAY_RESP_TX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:MAC_1_TSU_SOF_RX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:MAC_1_TSU_SYNC_FRAME_RX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:MAC_1_TSU_DELAY_REQ_RX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:MAC_1_TSU_PDELAY_REQ_RX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:MAC_1_TSU_PDELAY_RESP_RX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:FIC_1_AXI4_SLAVE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:FIC_2_AXI4_SLAVE}



# Add AND4_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND4} -instance_name {AND4_0}



# Add BIBUF_I2C0_SCL instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_I2C0_SCL}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BIBUF_I2C0_SCL:D} -value {GND}



# Add BIBUF_I2C0_SDA instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_I2C0_SDA}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BIBUF_I2C0_SDA:D} -value {GND}



# Add CLK_125MHz_to_CLK_62_5MHz_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CLK_125MHz_to_CLK_62_5MHz} -instance_name {CLK_125MHz_to_CLK_62_5MHz_0}



# Add CLK_160MHz_to_CLK_80MHz_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CLK_160MHz_to_CLK_80MHz} -instance_name {CLK_160MHz_to_CLK_80MHz_0}



# Add FIC0_MASTER_IC_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {FIC0_MASTER} -instance_name {FIC0_MASTER_IC_0}



# Add FIC1_MASTER_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {FIC1_MASTER} -instance_name {FIC1_MASTER_0}



# Add FIC3_MASTER_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {FIC3_MASTER} -instance_name {FIC3_MASTER_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {FIC3_MASTER_0:APBmslave2}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {FIC3_MASTER_0:APBmslave15}



# Add GLITCHLESS_MUX_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {GLITCHLESS_MUX} -instance_name {GLITCHLESS_MUX_0}



# Add OSCILLATOR_160MHz_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {OSCILLATOR_160MHz} -instance_name {OSCILLATOR_160MHz_0}



# Add PCIe_LOCK instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {PCIe_LOCK}



# Add PCIE_MASTER_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PCIE_MASTER} -instance_name {PCIE_MASTER_0}



# Add PCIE_REF_CLK_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PCIE_REF_CLK} -instance_name {PCIE_REF_CLK_0}



# Add PF_CCC_C1_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_CCC_C1} -instance_name {PF_CCC_C1_0}



# Add PF_DDR4_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_DDR4_C0} -instance_name {PF_DDR4_C0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_DDR4_C0_0:PLL_LOCK}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_DDR4_C0_0:CTRLR_READY}



# Add PF_PCIE_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_PCIE_C0} -instance_name {PF_PCIE_C0_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_PCIE_C0_0:PCIE_1_INTERRUPT} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_PCIE_C0_0:PCIE_1_M_RDERR} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_PCIE_C0_0:PCIE_1_S_WDERR} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_PCIE_C0_0:PCIE_1_LTSSM}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_PCIE_C0_0:PCIE_1_M_WDERR}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_PCIE_C0_0:PCIE_1_S_RDERR}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_PCIE_C0_0:PCIE_1_L2_EXIT}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_PCIE_C0_0:PCIE_1_HOT_RST_EXIT}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_PCIE_C0_0:PCIE_1_DLUP_EXIT}



# Add PFSOC_INIT_MONITOR_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PFSOC_INIT_MONITOR_C0} -instance_name {PFSOC_INIT_MONITOR_C0_0}



# Add RECONFIGURATION_INTERFACE_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {RECONFIGURATION_INTERFACE} -instance_name {RECONFIGURATION_INTERFACE_0}



# Add RESET_CLK_62_5MHz_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {RESET_CLK_62_5MHz} -instance_name {RESET_CLK_62_5MHz_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {RESET_CLK_62_5MHz_0:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {RESET_CLK_62_5MHz_0:FF_US_RESTORE} -value {GND}



# Add RESET_CLK_125MHz_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {RESET_CLK_125MHz} -instance_name {RESET_CLK_125MHz_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {RESET_CLK_125MHz_0:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {RESET_CLK_125MHz_0:FF_US_RESTORE} -value {GND}



# Add SYSTEM_PLL_LOCK instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {SYSTEM_PLL_LOCK}



# Add TRANSMIT_PLL_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {TRANSMIT_PLL} -instance_name {TRANSMIT_PLL_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:ACT_N" "ACT_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:ACT_N" "ACT_N_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_0:A" "Aldec_MSSv2_0:FIC_0_DLL_LOCK_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_0:B" "Aldec_MSSv2_0:FIC_1_DLL_LOCK_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_0:C" "Aldec_MSSv2_0:FIC_2_DLL_LOCK_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:FIC_3_DLL_LOCK_M2F" "AND4_0:D" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:I2C_0_SCL_OE_M2F" "BIBUF_I2C0_SCL:E" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:I2C_0_SDA_OE_M2F" "BIBUF_I2C0_SDA:E" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RESET_CLK_125MHz_0:EXT_RST_N" "Aldec_MSSv2_0:MSS_RESET_N_M2F" "PF_DDR4_C0_0:SYS_RESET_N" "RESET_CLK_62_5MHz_0:EXT_RST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_0:Y" "SYSTEM_PLL_LOCK:B" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:I2C_0_SCL_F2M" "BIBUF_I2C0_SCL:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:I2C_0_SDA_F2M" "BIBUF_I2C0_SDA:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:CAS_N" "CAS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:CAS_N" "CAS_N_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:CK0" "CK0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:CK0" "CK0_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:CK0_N" "CK0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:CK0_N" "CK0_N_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:CKE" "CKE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:CKE0" "CKE0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RESET_CLK_62_5MHz_0:CLK" "RECONFIGURATION_INTERFACE_0:PCLK" "Aldec_MSSv2_0:FIC_3_PCLK" "CLK_125MHz_to_CLK_62_5MHz_0:CLK_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GLITCHLESS_MUX_0:CLK0" "CLK_160MHz_to_CLK_80MHz_0:CLK_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:CS0_N" "CS0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:CS_N" "CS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:EMMC_CLK" "EMMC_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"EMMC_CMD" "Aldec_MSSv2_0:EMMC_CMD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"EMMC_DATA0" "Aldec_MSSv2_0:EMMC_DATA0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:EMMC_DATA1" "EMMC_DATA1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:EMMC_DATA2" "EMMC_DATA2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:EMMC_DATA3" "EMMC_DATA3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:EMMC_DATA4" "EMMC_DATA4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:EMMC_DATA5" "EMMC_DATA5" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:EMMC_DATA6" "EMMC_DATA6" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:EMMC_DATA7" "EMMC_DATA7" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:EMMC_RSTN" "EMMC_RSTN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:EMMC_STRB" "EMMC_STRB" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_PCIE_C0_0:PCIE_1_TL_CLK_125MHz" "GLITCHLESS_MUX_0:CLK_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:GPIO_1_20_IN" "GPIO_1_20_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:GPIO_1_23_OUT" "GPIO_1_23_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"I2C0_SCL" "BIBUF_I2C0_SCL:PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_I2C0_SDA:PAD" "I2C0_SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:I2C_1_SCL" "I2C_1_SCL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:I2C_1_SDA" "I2C_1_SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:MAC_1_MDC" "MAC_1_MDC" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:MAC_1_MDIO" "MAC_1_MDIO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:MMUART_0_RXD_F2M" "MMUART_0_RXD_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:MMUART_0_TXD_M2F" "MMUART_0_TXD_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:MMUART_1_RXD_F2M" "MMUART_1_RXD_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:MMUART_1_TXD_M2F" "MMUART_1_TXD_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:MMUART_2_RXD_F2M" "MMUART_2_RXD_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:MMUART_2_TXD_M2F" "MMUART_2_TXD_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:MMUART_3_RXD_F2M" "MMUART_3_RXD_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:MMUART_3_TXD_M2F" "MMUART_3_TXD_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:ODT" "ODT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:ODT0" "ODT0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK_160MHz_to_CLK_80MHz_0:CLK_IN" "OSCILLATOR_160MHz_0:RCOSC_160MHZ_CLK_DIV" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_C1_0:REF_CLK_0" "OSCILLATOR_160MHz_0:RCOSC_160MHZ_GL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_PCIE_C0_0:PCIE_1_PERST_N" "PCIE_1_PERST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GLITCHLESS_MUX_0:SEL" "PCIe_LOCK:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE_REF_CLK_0:REF_CLK" "TRANSMIT_PLL_0:REF_CLK" "PF_PCIE_C0_0:PCIESS_LANE1_CDR_REF_CLK_0" "PF_PCIE_C0_0:PCIESS_LANE2_CDR_REF_CLK_0" "PF_PCIE_C0_0:PCIESS_LANE3_CDR_REF_CLK_0" "PF_PCIE_C0_0:PCIESS_LANE0_CDR_REF_CLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_PCIE_C0_0:PCIESS_LANE_RXD0_N" "PCIESS_LANE_RXD0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_PCIE_C0_0:PCIESS_LANE_RXD0_P" "PCIESS_LANE_RXD0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_PCIE_C0_0:PCIESS_LANE_RXD1_N" "PCIESS_LANE_RXD1_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_PCIE_C0_0:PCIESS_LANE_RXD1_P" "PCIESS_LANE_RXD1_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_PCIE_C0_0:PCIESS_LANE_RXD2_N" "PCIESS_LANE_RXD2_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIESS_LANE_RXD2_P" "PF_PCIE_C0_0:PCIESS_LANE_RXD2_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_PCIE_C0_0:PCIESS_LANE_RXD3_N" "PCIESS_LANE_RXD3_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_PCIE_C0_0:PCIESS_LANE_RXD3_P" "PCIESS_LANE_RXD3_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_PCIE_C0_0:PCIESS_LANE_TXD0_N" "PCIESS_LANE_TXD0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIESS_LANE_TXD0_P" "PF_PCIE_C0_0:PCIESS_LANE_TXD0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIESS_LANE_TXD1_N" "PF_PCIE_C0_0:PCIESS_LANE_TXD1_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_PCIE_C0_0:PCIESS_LANE_TXD1_P" "PCIESS_LANE_TXD1_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_PCIE_C0_0:PCIESS_LANE_TXD2_N" "PCIESS_LANE_TXD2_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_PCIE_C0_0:PCIESS_LANE_TXD2_P" "PCIESS_LANE_TXD2_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_PCIE_C0_0:PCIESS_LANE_TXD3_N" "PCIESS_LANE_TXD3_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_PCIE_C0_0:PCIESS_LANE_TXD3_P" "PCIESS_LANE_TXD3_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_C1_0:OUT0_FABCLK_0" "PF_DDR4_C0_0:PLL_REF_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC1_MASTER_0:S_CLK0" "PF_DDR4_C0_0:SYS_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:MSS_INT_F2M[0]" "PF_PCIE_C0_0:PCIE_1_INTERRUPT_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RESET_CLK_125MHz_0:BANK_x_VDDI_STATUS" "RESET_CLK_125MHz_0:BANK_y_VDDI_STATUS" "PFSOC_INIT_MONITOR_C0_0:BANK_1_VDDI_STATUS" "RESET_CLK_62_5MHz_0:BANK_x_VDDI_STATUS" "RESET_CLK_62_5MHz_0:BANK_y_VDDI_STATUS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PFSOC_INIT_MONITOR_C0_0:DEVICE_INIT_DONE" "RESET_CLK_62_5MHz_0:INIT_DONE" "RESET_CLK_125MHz_0:INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RESET_CLK_62_5MHz_0:FPGA_POR_N" "RESET_CLK_125MHz_0:FPGA_POR_N" "PFSOC_INIT_MONITOR_C0_0:FABRIC_POR_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PFSOC_INIT_MONITOR_C0_0:PCIE_INIT_DONE" "PCIe_LOCK:B" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:RAS_N" "RAS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:RAS_N" "RAS_N_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE_REF_CLK_0:REF_CLK_PAD_N" "REF_CLK_PAD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE_REF_CLK_0:REF_CLK_PAD_P" "REF_CLK_PAD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:REFCLK" "REFCLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:REFCLK_N" "REFCLK_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RECONFIGURATION_INTERFACE_0:PRESETN" "RESET_CLK_62_5MHz_0:FABRIC_RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_C1_0:PLL_POWERDOWN_N_0" "RESET_CLK_62_5MHz_0:PLL_POWERDOWN_B" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RESET_N" "Aldec_MSSv2_0:RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:RESET_N" "RESET_N_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:SGMII_RX0_N" "SGMII_RX0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:SGMII_RX0_P" "SGMII_RX0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:SGMII_RX1_N" "SGMII_RX1_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:SGMII_RX1_P" "SGMII_RX1_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:SGMII_TX0_N" "SGMII_TX0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:SGMII_TX0_P" "SGMII_TX0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:SGMII_TX1_N" "SGMII_TX1_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:SGMII_TX1_P" "SGMII_TX1_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:SHIELD0" "SHIELD0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:SHIELD1" "SHIELD1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:SHIELD2" "SHIELD2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:SHIELD3" "SHIELD3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SPI_1_CLK" "Aldec_MSSv2_0:SPI_1_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SPI_1_DI" "Aldec_MSSv2_0:SPI_1_DI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SPI_1_DO" "Aldec_MSSv2_0:SPI_1_DO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SPI_1_SS0" "Aldec_MSSv2_0:SPI_1_SS0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RESET_CLK_125MHz_0:PLL_LOCK" "RESET_CLK_62_5MHz_0:PLL_LOCK" "SYSTEM_PLL_LOCK:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE_MASTER_0:ACLK" "Aldec_MSSv2_0:FIC_1_ACLK" "RESET_CLK_125MHz_0:CLK" "TRANSMIT_PLL_0:CLK_125" "FIC1_MASTER_0:ACLK" "GLITCHLESS_MUX_0:CLK1" "FIC0_MASTER_IC_0:ACLK" "PF_PCIE_C0_0:AXI_CLK" "Aldec_MSSv2_0:FIC_0_ACLK" "CLK_125MHz_to_CLK_62_5MHz_0:CLK_IN" "Aldec_MSSv2_0:FIC_2_ACLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"TRANSMIT_PLL_0:PLL_LOCK" "SYSTEM_PLL_LOCK:A" "PCIe_LOCK:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:USB_CLK" "USB_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:USB_DATA0" "USB_DATA0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:USB_DATA1" "USB_DATA1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:USB_DATA2" "USB_DATA2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:USB_DATA3" "USB_DATA3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:USB_DATA4" "USB_DATA4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:USB_DATA5" "USB_DATA5" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:USB_DATA6" "USB_DATA6" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:USB_DATA7" "USB_DATA7" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:USB_DIR" "USB_DIR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:USB_NXT" "USB_NXT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:USB_STP" "USB_STP" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE_MASTER_0:ARESETN" "FIC1_MASTER_0:ARESETN" "RESET_CLK_125MHz_0:FABRIC_RESET_N" "PF_PCIE_C0_0:AXI_CLK_STABLE" "Aldec_MSSv2_0:MSS_RESET_N_F2M" "FIC0_MASTER_IC_0:ARESETN" "USB_ULPI_RESET" "VSC_8662_RESETN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:WE_N" "WE_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:WE_N" "WE_N_0" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:A" "A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:A" "A_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:BA" "BA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:BA" "BA_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:BG" "BG" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:BG" "BG_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:DM_N" "DM_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:DQ" "DQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:DQ" "DQ_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:DQS" "DQS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:DQS" "DQS_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:DQS_N" "DQS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:DQS_N" "DQS_N_0" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC0_MASTER_IC_0:AXI4mmaster0" "Aldec_MSSv2_0:FIC_0_AXI4_MASTER" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:FIC_1_AXI4_MASTER" "FIC1_MASTER_0:AXI4mmaster0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC3_MASTER_0:APB3mmaster" "Aldec_MSSv2_0:FIC_3_APB_MASTER" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC0_MASTER_IC_0:AXI4mslave0" "PF_PCIE_C0_0:AXI_1_SLAVE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:AXI4slave0" "FIC1_MASTER_0:AXI4mslave0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RECONFIGURATION_INTERFACE_0:APBS_SLAVE" "FIC3_MASTER_0:APBmslave16" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE_MASTER_0:AXI4mslave0" "Aldec_MSSv2_0:FIC_0_AXI4_SLAVE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE_MASTER_0:AXI4mmaster0" "PF_PCIE_C0_0:AXI_1_MASTER" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RECONFIGURATION_INTERFACE_0:PLL0_SW_DRI" "PF_CCC_C1_0:PLL0_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_PCIE_C0_0:PCIESS_LANE0_DRI_SLAVE" "RECONFIGURATION_INTERFACE_0:Q0_LANE0_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_PCIE_C0_0:PCIESS_LANE1_DRI_SLAVE" "RECONFIGURATION_INTERFACE_0:Q0_LANE1_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_PCIE_C0_0:PCIESS_LANE2_DRI_SLAVE" "RECONFIGURATION_INTERFACE_0:Q0_LANE2_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RECONFIGURATION_INTERFACE_0:Q0_LANE3_DRI" "PF_PCIE_C0_0:PCIESS_LANE3_DRI_SLAVE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"TRANSMIT_PLL_0:CLKS_TO_XCVR" "PF_PCIE_C0_0:CLKS_FROM_TXPLL_TO_PCIE_1" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign tysom_m_v10
generate_component -component_name ${sd_name}
