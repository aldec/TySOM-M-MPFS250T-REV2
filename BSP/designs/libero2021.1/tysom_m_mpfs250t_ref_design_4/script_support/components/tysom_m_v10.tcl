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
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_1_TXD_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_2_TXD_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_3_TXD_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_2_RXD_F2M} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_1_RXD_F2M} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_3_RXD_F2M} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VSC_8662_CMODE7} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VSC_8662_RESETN} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VSC_8662_SRESET} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_SEL} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_ULPI_RESET} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_SCL} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_SDA} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAN_0_RXBUS_F2M} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAN_0_TXBUS_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAN_0_STANDBY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_HSYNC} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_VSYNC} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_DE} -port_direction {OUT}
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
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_CLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_I2S0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_I2S1} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_I2S2} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_I2S3} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_SCLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_LRCLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_MCLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_PD_AD} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_SPDIF} -port_direction {OUT}

sd_create_bus_port -sd_name ${sd_name} -port_name {BA} -port_direction {OUT} -port_range {[1:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQ} -port_direction {INOUT} -port_range {[35:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQS} -port_direction {INOUT} -port_range {[4:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQS_N} -port_direction {INOUT} -port_range {[4:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {A} -port_direction {OUT} -port_range {[13:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {BG} -port_direction {OUT} -port_range {[1:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {data_r} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {data_g} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {data_b} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQ_0} -port_direction {INOUT} -port_range {[31:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQS_0} -port_direction {INOUT} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQS_N_0} -port_direction {INOUT} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DM_N} -port_direction {OUT} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {BG_0} -port_direction {OUT} -port_range {[1:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {BA_0} -port_direction {OUT} -port_range {[1:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {A_0} -port_direction {OUT} -port_range {[13:0]} -port_is_pad {1}

sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {VSC_8662_CMODE7} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {VSC_8662_SRESET} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {SD_SEL} -value {VCC}
sd_invert_pins -sd_name ${sd_name} -pin_names {USB_ULPI_RESET}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CAN_0_STANDBY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {HDMI_I2S0} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {HDMI_I2S1} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {HDMI_I2S2} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {HDMI_I2S3} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {HDMI_SCLK} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {HDMI_LRCLK} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {HDMI_MCLK} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {HDMI_PD_AD} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {HDMI_SPDIF} -value {GND}
# Add Aldec_MSSv2_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Aldec_MSSv2} -instance_name {Aldec_MSSv2_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:CAN_0_TX_EBL_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:FIC_0_DLL_LOCK_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:FIC_3_DLL_LOCK_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:FIC_3_APB_M_PSTRB}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:MMUART_1_TXD_OE_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:CAN_0_TX_EBL_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:PLL_CPU_LOCK_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:PLL_DDR_LOCK_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:MSS_RESET_N_M2F}
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



# Add BIBUF_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BIBUF_0:D} -value {GND}



# Add BIBUF_1 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_1}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BIBUF_1:D} -value {GND}



# Add CoreAPB3_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreAPB3_C0} -instance_name {CoreAPB3_C0_0}



# Add COREAXI4INTERCONNECT_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREAXI4INTERCONNECT_C0} -instance_name {COREAXI4INTERCONNECT_C0_0}



# Add CoreGPIO_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreGPIO_C0} -instance_name {CoreGPIO_C0_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_C0_0:GPIO_OUT} -pin_slices {[0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_C0_0:GPIO_OUT} -pin_slices {[1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_C0_0:GPIO_OUT} -pin_slices {[2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_C0_0:GPIO_OUT} -pin_slices {[3]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreGPIO_C0_0:INT}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CoreGPIO_C0_0:GPIO_IN} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreGPIO_C0_0:GPIO_OE}



# Add CORERESET_PF_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORERESET_PF_C0} -instance_name {CORERESET_PF_C0_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_0:EXT_RST_N} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_0:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_0:FF_US_RESTORE} -value {GND}



# Add CORERESET_PF_C0_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORERESET_PF_C0} -instance_name {CORERESET_PF_C0_1}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_1:EXT_RST_N} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_1:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_1:FF_US_RESTORE} -value {GND}



# Add data_unpacker_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {data_unpacker} -hdl_file {hdl/data_unpacker.vhd} -instance_name {data_unpacker_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {data_unpacker_0:data_i} -pin_slices {[14:8]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {data_unpacker_0:data_i[14:8]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {data_unpacker_0:data_i} -pin_slices {[15]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {data_unpacker_0:data_i} -pin_slices {[21:16]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {data_unpacker_0:data_i[21:16]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {data_unpacker_0:data_i} -pin_slices {[22]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {data_unpacker_0:data_i} -pin_slices {[23]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {data_unpacker_0:data_i} -pin_slices {[31:24]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {data_unpacker_0:data_i[31:24]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {data_unpacker_0:data_i} -pin_slices {[6:0]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {data_unpacker_0:data_i[6:0]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {data_unpacker_0:data_i} -pin_slices {[7]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {data_unpacker_0:beats_to_read_o}



# Add Display_Controller_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Display_Controller_C0} -instance_name {Display_Controller_C0_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Display_Controller_C0_0:ENABLE_I} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Display_Controller_C0_0:ENABLE_EXT_SYNC_I} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Display_Controller_C0_0:EXT_SYNC_SIGNAL_I} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Display_Controller_C0_0:H_ACTIVE_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Display_Controller_C0_0:V_ACTIVE_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Display_Controller_C0_0:DATA_TRIGGER_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Display_Controller_C0_0:FRAME_END_O}



# Add PF_CCC_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_CCC_C0} -instance_name {PF_CCC_C0_0}



# Add PF_CCC_C1_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_CCC_C1} -instance_name {PF_CCC_C1_0}



# Add PF_DDR4_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_DDR4_C0} -instance_name {PF_DDR4_C0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_DDR4_C0_0:PLL_LOCK}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_DDR4_C0_0:CTRLR_READY}



# Add PF_OSC_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_OSC_C0} -instance_name {PF_OSC_C0_0}



# Add PFSOC_INIT_MONITOR_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PFSOC_INIT_MONITOR_C0} -instance_name {PFSOC_INIT_MONITOR_C0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PFSOC_INIT_MONITOR_C0_0:PCIE_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PFSOC_INIT_MONITOR_C0_0:USRAM_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PFSOC_INIT_MONITOR_C0_0:SRAM_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PFSOC_INIT_MONITOR_C0_0:XCVR_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PFSOC_INIT_MONITOR_C0_0:USRAM_INIT_FROM_SNVM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PFSOC_INIT_MONITOR_C0_0:USRAM_INIT_FROM_UPROM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PFSOC_INIT_MONITOR_C0_0:USRAM_INIT_FROM_SPI_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PFSOC_INIT_MONITOR_C0_0:SRAM_INIT_FROM_SNVM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PFSOC_INIT_MONITOR_C0_0:SRAM_INIT_FROM_UPROM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PFSOC_INIT_MONITOR_C0_0:SRAM_INIT_FROM_SPI_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PFSOC_INIT_MONITOR_C0_0:AUTOCALIB_DONE}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:ACT_N" "ACT_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:ACT_N" "ACT_N_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:I2C_0_SCL_OE_M2F" "BIBUF_0:E" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_1:E" "Aldec_MSSv2_0:I2C_0_SDA_OE_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:I2C_0_SCL_F2M" "BIBUF_0:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_1:Y" "Aldec_MSSv2_0:I2C_0_SDA_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAN_0_RXBUS_F2M" "Aldec_MSSv2_0:CAN_0_RXBUS_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAN_0_TXBUS_M2F" "Aldec_MSSv2_0:CAN_0_TXBUS_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAS_N" "Aldec_MSSv2_0:CAS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:CAS_N" "CAS_N_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:CK0" "CK0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CK0_0" "PF_DDR4_C0_0:CK0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:CK0_N" "CK0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CK0_N_0" "PF_DDR4_C0_0:CK0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CKE" "PF_DDR4_C0_0:CKE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:CKE0" "CKE0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_unpacker_0:data_i[7]" "CoreGPIO_C0_0:GPIO_OUT[0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_unpacker_0:data_i[15]" "CoreGPIO_C0_0:GPIO_OUT[1]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_unpacker_0:data_i[22]" "CoreGPIO_C0_0:GPIO_OUT[2]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_C0_0:GPIO_OUT[3]" "data_unpacker_0:data_i[23]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_0:PLL_POWERDOWN_B" "PF_CCC_C0_0:PLL_POWERDOWN_N_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_unpacker_0:reset_i" "CORERESET_PF_C0_1:FABRIC_RESET_N" "Display_Controller_C0_0:RESETN_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_1:PLL_POWERDOWN_B" "PF_CCC_C1_0:PLL_POWERDOWN_N_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CS0_N" "Aldec_MSSv2_0:CS0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CS_N" "PF_DDR4_C0_0:CS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_unpacker_0:read_en_i" "Display_Controller_C0_0:DATA_ENABLE_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:EMMC_CLK" "EMMC_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"EMMC_CMD" "Aldec_MSSv2_0:EMMC_CMD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"EMMC_DATA0" "Aldec_MSSv2_0:EMMC_DATA0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"EMMC_DATA1" "Aldec_MSSv2_0:EMMC_DATA1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:EMMC_DATA2" "EMMC_DATA2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"EMMC_DATA3" "Aldec_MSSv2_0:EMMC_DATA3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:EMMC_RSTN" "EMMC_RSTN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:EMMC_STRB" "EMMC_STRB" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_1_20_IN" "Aldec_MSSv2_0:GPIO_1_20_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:GPIO_1_23_OUT" "GPIO_1_23_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Display_Controller_C0_0:SYS_CLK_I" "PF_CCC_C1_0:OUT0_FABCLK_0" "CORERESET_PF_C0_1:CLK" "data_unpacker_0:disp_clk_i" "HDMI_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_unpacker_0:data_valid_o" "HDMI_DE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Display_Controller_C0_0:H_SYNC_O" "HDMI_HSYNC" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_SCL" "BIBUF_0:PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_SDA" "BIBUF_1:PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_VSYNC" "Display_Controller_C0_0:V_SYNC_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:I2C_1_SCL" "I2C_1_SCL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:I2C_1_SDA" "I2C_1_SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MAC_1_MDC" "Aldec_MSSv2_0:MAC_1_MDC" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MAC_1_MDIO" "Aldec_MSSv2_0:MAC_1_MDIO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:MMUART_1_RXD_F2M" "MMUART_1_RXD_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:MMUART_1_TXD_M2F" "MMUART_1_TXD_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:MMUART_2_RXD_F2M" "MMUART_2_RXD_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MMUART_2_TXD_M2F" "Aldec_MSSv2_0:MMUART_2_TXD_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MMUART_3_RXD_F2M" "Aldec_MSSv2_0:MMUART_3_RXD_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MMUART_3_TXD_M2F" "Aldec_MSSv2_0:MMUART_3_TXD_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:MMUART_4_TXD_M2F" "Aldec_MSSv2_0:MMUART_4_RXD_F2M"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"ODT" "PF_DDR4_C0_0:ODT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ODT0" "Aldec_MSSv2_0:ODT0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4INTERCONNECT_C0_0:ACLK" "PF_CCC_C0_0:OUT0_FABCLK_0" "Aldec_MSSv2_0:FIC_3_PCLK" "CORERESET_PF_C0_0:CLK" "Aldec_MSSv2_0:FIC_0_ACLK" "CoreGPIO_C0_0:PCLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:PLL_REF_CLK" "PF_CCC_C0_0:OUT1_FABCLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_C0_0:PLL_LOCK_0" "CORERESET_PF_C0_0:PLL_LOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_C1_0:PLL_LOCK_0" "CORERESET_PF_C0_1:PLL_LOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4INTERCONNECT_C0_0:S_CLK0" "PF_DDR4_C0_0:SYS_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_C1_0:REF_CLK_0" "PF_OSC_C0_0:RCOSC_160MHZ_GL" "PF_CCC_C0_0:REF_CLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_0:BANK_y_VDDI_STATUS" "CORERESET_PF_C0_1:BANK_x_VDDI_STATUS" "PFSOC_INIT_MONITOR_C0_0:BANK_0_VDDI_STATUS" "CORERESET_PF_C0_0:BANK_x_VDDI_STATUS" "CORERESET_PF_C0_1:BANK_y_VDDI_STATUS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_0:INIT_DONE" "PFSOC_INIT_MONITOR_C0_0:DEVICE_INIT_DONE" "CORERESET_PF_C0_1:INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PFSOC_INIT_MONITOR_C0_0:FABRIC_POR_N" "CORERESET_PF_C0_0:FPGA_POR_N" "CORERESET_PF_C0_1:FPGA_POR_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RAS_N" "Aldec_MSSv2_0:RAS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:RAS_N" "RAS_N_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:REFCLK" "REFCLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"REFCLK_N" "Aldec_MSSv2_0:REFCLK_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:RESET_N" "RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RESET_N_0" "PF_DDR4_C0_0:RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:SGMII_RX0_N" "SGMII_RX0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SGMII_RX0_P" "Aldec_MSSv2_0:SGMII_RX0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:SGMII_RX1_N" "SGMII_RX1_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:SGMII_RX1_P" "SGMII_RX1_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SGMII_TX0_N" "Aldec_MSSv2_0:SGMII_TX0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SGMII_TX0_P" "Aldec_MSSv2_0:SGMII_TX0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:SGMII_TX1_N" "SGMII_TX1_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SGMII_TX1_P" "Aldec_MSSv2_0:SGMII_TX1_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SHIELD0" "PF_DDR4_C0_0:SHIELD0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SHIELD1" "PF_DDR4_C0_0:SHIELD1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:SHIELD2" "SHIELD2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SHIELD3" "PF_DDR4_C0_0:SHIELD3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:SPI_1_CLK" "SPI_1_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SPI_1_DI" "Aldec_MSSv2_0:SPI_1_DI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SPI_1_DO" "Aldec_MSSv2_0:SPI_1_DO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SPI_1_SS0" "Aldec_MSSv2_0:SPI_1_SS0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"USB_CLK" "Aldec_MSSv2_0:USB_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:USB_DATA0" "USB_DATA0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"USB_DATA1" "Aldec_MSSv2_0:USB_DATA1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"USB_DATA2" "Aldec_MSSv2_0:USB_DATA2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"USB_DATA3" "Aldec_MSSv2_0:USB_DATA3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:USB_DATA4" "USB_DATA4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"USB_DATA5" "Aldec_MSSv2_0:USB_DATA5" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"USB_DATA6" "Aldec_MSSv2_0:USB_DATA6" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"USB_DATA7" "Aldec_MSSv2_0:USB_DATA7" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"USB_DIR" "Aldec_MSSv2_0:USB_DIR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"USB_NXT" "Aldec_MSSv2_0:USB_NXT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"USB_STP" "Aldec_MSSv2_0:USB_STP" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4INTERCONNECT_C0_0:ARESETN" "PF_DDR4_C0_0:SYS_RESET_N" "USB_ULPI_RESET" "CoreGPIO_C0_0:PRESETN" "CORERESET_PF_C0_0:FABRIC_RESET_N" "VSC_8662_RESETN" "Aldec_MSSv2_0:MSS_RESET_N_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:WE_N" "WE_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"WE_N_0" "PF_DDR4_C0_0:WE_N" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:A" "A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:A" "A_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BA" "Aldec_MSSv2_0:BA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BA_0" "PF_DDR4_C0_0:BA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:BG" "BG" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:BG" "BG_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_b" "data_unpacker_0:data_b" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_g" "data_unpacker_0:data_g" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_r" "data_unpacker_0:data_r" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_unpacker_0:horz_resl_i" "Display_Controller_C0_0:H_RES_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:DM_N" "DM_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_0:DQ" "DQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQ_0" "PF_DDR4_C0_0:DQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQS" "Aldec_MSSv2_0:DQS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQS_0" "PF_DDR4_C0_0:DQS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQS_N" "Aldec_MSSv2_0:DQS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQS_N_0" "PF_DDR4_C0_0:DQS_N" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4INTERCONNECT_C0_0:AXI4mmaster0" "Aldec_MSSv2_0:FIC_0_AXI4_MASTER" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_C0_0:APB3mmaster" "Aldec_MSSv2_0:FIC_3_APB_MASTER" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_C0_0:APBmslave0" "CoreGPIO_C0_0:APB_bif" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4INTERCONNECT_C0_0:AXI4mslave0" "PF_DDR4_C0_0:AXI4slave0" }
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:QSPI_DATA_M2F} 
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:QSPI_DATA_OE_M2F} 
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:QSPI_SEL_M2F} 
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:QSPI_SEL_OE_M2F} 
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:QSPI_DATA_F2M} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:CAN_1_IN} -value {GND} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {Aldec_MSSv2_0:MMUART_0} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {Aldec_MSSv2_0:MMUART_0_IN} -port_name {} 
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_0:PLL_SGMII_LOCK_M2F} 
 

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign tysom_m_v10
generate_component -component_name ${sd_name}
