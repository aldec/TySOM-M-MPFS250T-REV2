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
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_CLK} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_CMD} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_DATA0} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_DATA1} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_DATA2} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_DATA3} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_CD} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_WP} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_POW} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_VOLT_SEL} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_VOLT_EN} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_VOLT_CMD_DIR} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_VOLT_DIR_0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_VOLT_DIR_1_3} -port_direction {OUT} -port_is_pad {1}

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
sd_create_scalar_port -sd_name ${sd_name} -port_name {PLL_SGMII_LOCK_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_ULPI_RESET} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {I2C_0_SCL} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {I2C_0_SDA} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAN_0_RXBUS_F2M} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAN_0_TXBUS_M2F} -port_direction {OUT}
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
sd_create_scalar_port -sd_name ${sd_name} -port_name {RS485A_DE} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RS485A_RE_N} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RS485B_RE_N} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RS485B_DE} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GATE1_INA} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GATE1_INB} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GATE1_EN} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAN_FMC_ON} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAN_FMC_S} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAN_FMC_RE_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RS485B_ON} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RS485B_TE} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RS485B_DOUT} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PMOD1_7} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PMOD1_0} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PMOD1_1} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PMOD1_6} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PMOD1_5} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PMOD1_4} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PMOD1_3} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PMOD1_2} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAN_1_RXBUS_F2M} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RS485B_RXD} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RS485B_TXD} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAN_1_TXBUS_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RS485A_RXD} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RS485A_TXD} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAN_1_STANDBY} -port_direction {OUT}

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
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {SD_SEL} -value {GND}
sd_invert_pins -sd_name ${sd_name} -pin_names {USB_ULPI_RESET}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CAN_FMC_ON} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CAN_FMC_S} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CAN_FMC_RE_N} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CAN_1_STANDBY} -value {GND}
# Add Aldec_MSSv2_sd_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Aldec_MSSv2_sd} -instance_name {Aldec_MSSv2_sd_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Aldec_MSSv2_sd_0:MMUART_4_RXD_F2M} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_sd_0:FIC_0_DLL_LOCK_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_sd_0:FIC_3_DLL_LOCK_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_sd_0:FIC_3_APB_M_PSTRB}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_sd_0:MMUART_0_TXD_OE_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_sd_0:MMUART_1_TXD_OE_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_sd_0:MMUART_4_TXD_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_sd_0:CAN_0_TX_EBL_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_sd_0:CAN_1_TX_EBL_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_sd_0:PLL_CPU_LOCK_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_sd_0:PLL_DDR_LOCK_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_sd_0:MSS_RESET_N_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_sd_0:MAC_0_TSU_SOF_TX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_sd_0:MAC_0_TSU_SYNC_FRAME_TX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_sd_0:MAC_0_TSU_DELAY_REQ_TX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_sd_0:MAC_0_TSU_PDELAY_REQ_TX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_sd_0:MAC_0_TSU_PDELAY_RESP_TX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_sd_0:MAC_0_TSU_SOF_RX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_sd_0:MAC_0_TSU_SYNC_FRAME_RX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_sd_0:MAC_0_TSU_DELAY_REQ_RX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_sd_0:MAC_0_TSU_PDELAY_REQ_RX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_sd_0:MAC_0_TSU_PDELAY_RESP_RX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_sd_0:MAC_1_TSU_SOF_TX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_sd_0:MAC_1_TSU_SYNC_FRAME_TX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_sd_0:MAC_1_TSU_DELAY_REQ_TX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_sd_0:MAC_1_TSU_PDELAY_REQ_TX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_sd_0:MAC_1_TSU_PDELAY_RESP_TX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_sd_0:MAC_1_TSU_SOF_RX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_sd_0:MAC_1_TSU_SYNC_FRAME_RX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_sd_0:MAC_1_TSU_DELAY_REQ_RX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_sd_0:MAC_1_TSU_PDELAY_REQ_RX_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSSv2_sd_0:MAC_1_TSU_PDELAY_RESP_RX_M2F}



# Add BIBUF_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BIBUF_0:D} -value {GND}



# Add BIBUF_1 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_1}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BIBUF_1:D} -value {GND}



# Add BIBUF_2 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_2}



# Add BIBUF_3 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_3}



# Add BIBUF_4 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_4}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {BIBUF_4:Y}



# Add BIBUF_5 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_5}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {BIBUF_5:Y}



# Add BIBUF_6 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_6}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BIBUF_6:D} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BIBUF_6:E} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {BIBUF_6:Y}



# Add BIBUF_7 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_7}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BIBUF_7:D} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BIBUF_7:E} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {BIBUF_7:Y}



# Add BIBUF_8 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_8}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BIBUF_8:D} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BIBUF_8:E} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {BIBUF_8:Y}



# Add BIBUF_9 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_9}



# Add BIBUF_10 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_10}



# Add BIBUF_11 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_11}



# Add BIBUF_12 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_12}



# Add BIBUF_13 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_13}



# Add BIBUF_14 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_14}



# Add BIBUF_15 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_15}



# Add BIBUF_16 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_16}



# Add CoreAPB3_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreAPB3_C0} -instance_name {CoreAPB3_C0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreAPB3_C0_0:APBmslave2}



# Add COREAXI4INTERCONNECT_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREAXI4INTERCONNECT_C0} -instance_name {COREAXI4INTERCONNECT_C0_0}



# Add CORERESET_PF_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORERESET_PF_C0} -instance_name {CORERESET_PF_C0_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_0:EXT_RST_N} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_0:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_0:FF_US_RESTORE} -value {GND}



# Add GATE_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {GATE} -instance_name {GATE_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {GATE_0:GPIO_IN} -pin_slices {[0]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {GATE_0:GPIO_IN[0]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {GATE_0:GPIO_IN} -pin_slices {[1]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {GATE_0:GPIO_IN[1]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {GATE_0:GPIO_IN} -pin_slices {[2]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {GATE_0:GPIO_IN[2]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {GATE_0:GPIO_OUT} -pin_slices {[0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {GATE_0:GPIO_OUT} -pin_slices {[1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {GATE_0:GPIO_OUT} -pin_slices {[2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {GATE_0:GPIO_OE} -pin_slices {[0]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {GATE_0:GPIO_OE[0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {GATE_0:GPIO_OE} -pin_slices {[1]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {GATE_0:GPIO_OE[1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {GATE_0:GPIO_OE} -pin_slices {[2]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {GATE_0:GPIO_OE[2]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {GATE_0:INT}



# Add INV_1 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {INV} -instance_name {INV_1}



# Add PF_CCC_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_CCC_C0} -instance_name {PF_CCC_C0_0}



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



# Add PMOD_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PMOD} -instance_name {PMOD_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PMOD_0:GPIO_IN} -pin_slices {[0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PMOD_0:GPIO_IN} -pin_slices {[1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PMOD_0:GPIO_IN} -pin_slices {[2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PMOD_0:GPIO_IN} -pin_slices {[3]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PMOD_0:GPIO_IN} -pin_slices {[4]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PMOD_0:GPIO_IN} -pin_slices {[5]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PMOD_0:GPIO_IN} -pin_slices {[6]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PMOD_0:GPIO_IN} -pin_slices {[7]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PMOD_0:GPIO_OUT} -pin_slices {[0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PMOD_0:GPIO_OUT} -pin_slices {[1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PMOD_0:GPIO_OUT} -pin_slices {[2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PMOD_0:GPIO_OUT} -pin_slices {[3]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PMOD_0:GPIO_OUT} -pin_slices {[4]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PMOD_0:GPIO_OUT} -pin_slices {[5]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PMOD_0:GPIO_OUT} -pin_slices {[6]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PMOD_0:GPIO_OUT} -pin_slices {[7]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PMOD_0:GPIO_OE} -pin_slices {[0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PMOD_0:GPIO_OE} -pin_slices {[1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PMOD_0:GPIO_OE} -pin_slices {[2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PMOD_0:GPIO_OE} -pin_slices {[3]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PMOD_0:GPIO_OE} -pin_slices {[4]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PMOD_0:GPIO_OE} -pin_slices {[5]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PMOD_0:GPIO_OE} -pin_slices {[6]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PMOD_0:GPIO_OE} -pin_slices {[7]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PMOD_0:INT}



# Add RS485_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {RS485} -instance_name {RS485_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {RS485_0:GPIO_IN} -pin_slices {[0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {RS485_0:GPIO_IN} -pin_slices {[1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {RS485_0:GPIO_OUT} -pin_slices {[0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {RS485_0:GPIO_OUT} -pin_slices {[1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {RS485_0:GPIO_OE} -pin_slices {[0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {RS485_0:GPIO_OE} -pin_slices {[1]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {RS485_0:INT}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_sd_0:ACT_N" "ACT_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACT_N_0" "PF_DDR4_C0_0:ACT_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_0:E" "Aldec_MSSv2_sd_0:I2C_0_SCL_OE_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_1:E" "Aldec_MSSv2_sd_0:I2C_0_SDA_OE_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_0:Y" "Aldec_MSSv2_sd_0:I2C_0_SCL_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_sd_0:I2C_0_SDA_F2M" "BIBUF_1:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_2:Y" "RS485_0:GPIO_IN[1]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RS485_0:GPIO_IN[0]" "BIBUF_3:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_9:Y" "PMOD_0:GPIO_IN[7]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PMOD_0:GPIO_IN[0]" "BIBUF_10:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PMOD_0:GPIO_IN[1]" "BIBUF_11:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_12:Y" "PMOD_0:GPIO_IN[6]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_13:Y" "PMOD_0:GPIO_IN[5]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_14:Y" "PMOD_0:GPIO_IN[4]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_15:Y" "PMOD_0:GPIO_IN[3]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_16:Y" "PMOD_0:GPIO_IN[2]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAN_0_RXBUS_F2M" "Aldec_MSSv2_sd_0:CAN_0_RXBUS_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAN_0_TXBUS_M2F" "Aldec_MSSv2_sd_0:CAN_0_TXBUS_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAN_1_RXBUS_F2M" "Aldec_MSSv2_sd_0:CAN_1_RXBUS_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAN_1_TXBUS_M2F" "Aldec_MSSv2_sd_0:CAN_1_TXBUS_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_sd_0:CAS_N" "CAS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:CAS_N" "CAS_N_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_sd_0:CK0" "CK0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:CK0" "CK0_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_sd_0:CK0_N" "CK0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:CK0_N" "CK0_N_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:CKE" "CKE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CKE0" "Aldec_MSSv2_sd_0:CKE0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_0:PLL_POWERDOWN_B" "PF_CCC_C0_0:PLL_POWERDOWN_N_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_sd_0:CS0_N" "CS0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:CS_N" "CS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_CD" "Aldec_MSSv2_sd_0:SD_CD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_WP" "Aldec_MSSv2_sd_0:SD_WP" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_CLK" "Aldec_MSSv2_sd_0:SD_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_sd_0:SD_CMD" "SD_CMD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_sd_0:SD_DATA0" "SD_DATA0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_sd_0:SD_DATA1" "SD_DATA1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_DATA2" "Aldec_MSSv2_sd_0:SD_DATA2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_DATA3" "Aldec_MSSv2_sd_0:SD_DATA3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_POW" "Aldec_MSSv2_sd_0:SD_POW" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_sd_0:SD_VOLT_CMD_DIR" "SD_VOLT_CMD_DIR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_sd_0:SD_VOLT_DIR_0" "SD_VOLT_DIR_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_sd_0:SD_VOLT_DIR_1_3" "SD_VOLT_DIR_1_3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_VOLT_EN" "Aldec_MSSv2_sd_0:SD_VOLT_EN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_VOLT_SEL" "Aldec_MSSv2_sd_0:SD_VOLT_SEL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GATE_0:GPIO_OUT[2]" "GATE1_EN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GATE1_INA" "GATE_0:GPIO_OUT[0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GATE1_INB" "GATE_0:GPIO_OUT[1]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_sd_0:GPIO_1_20_IN" "GPIO_1_20_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_1_23_OUT" "Aldec_MSSv2_sd_0:GPIO_1_23_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"I2C_0_SCL" "BIBUF_0:PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_1:PAD" "I2C_0_SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"I2C_1_SCL" "Aldec_MSSv2_sd_0:I2C_1_SCL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"I2C_1_SDA" "Aldec_MSSv2_sd_0:I2C_1_SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"INV_1:Y" "BIBUF_5:D" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_sd_0:MAC_1_MDC" "MAC_1_MDC" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_sd_0:MAC_1_MDIO" "MAC_1_MDIO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MMUART_0_RXD_F2M" "Aldec_MSSv2_sd_0:MMUART_0_RXD_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_sd_0:MMUART_0_TXD_M2F" "MMUART_0_TXD_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MMUART_1_RXD_F2M" "Aldec_MSSv2_sd_0:MMUART_1_RXD_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MMUART_1_TXD_M2F" "Aldec_MSSv2_sd_0:MMUART_1_TXD_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MMUART_2_RXD_F2M" "Aldec_MSSv2_sd_0:MMUART_2_RXD_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MMUART_2_TXD_M2F" "Aldec_MSSv2_sd_0:MMUART_2_TXD_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:ODT" "ODT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_sd_0:ODT0" "ODT0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GATE_0:PCLK" "COREAXI4INTERCONNECT_C0_0:ACLK" "RS485_0:PCLK" "CORERESET_PF_C0_0:CLK" "Aldec_MSSv2_sd_0:FIC_0_ACLK" "PMOD_0:PCLK" "PF_CCC_C0_0:OUT0_FABCLK_0" "Aldec_MSSv2_sd_0:FIC_3_PCLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:PLL_REF_CLK" "PF_CCC_C0_0:OUT1_FABCLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_C0_0:PLL_LOCK_0" "CORERESET_PF_C0_0:PLL_LOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:SYS_CLK" "COREAXI4INTERCONNECT_C0_0:S_CLK0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_C0_0:REF_CLK_0" "PF_OSC_C0_0:RCOSC_160MHZ_GL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PFSOC_INIT_MONITOR_C0_0:BANK_0_VDDI_STATUS" "CORERESET_PF_C0_0:BANK_x_VDDI_STATUS" "CORERESET_PF_C0_0:BANK_y_VDDI_STATUS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PFSOC_INIT_MONITOR_C0_0:DEVICE_INIT_DONE" "CORERESET_PF_C0_0:INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PFSOC_INIT_MONITOR_C0_0:FABRIC_POR_N" "CORERESET_PF_C0_0:FPGA_POR_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PLL_SGMII_LOCK_M2F" "Aldec_MSSv2_sd_0:PLL_SGMII_LOCK_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_10:PAD" "PMOD1_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_11:PAD" "PMOD1_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_16:PAD" "PMOD1_2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_15:PAD" "PMOD1_3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PMOD1_4" "BIBUF_14:PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PMOD1_5" "BIBUF_13:PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_12:PAD" "PMOD1_6" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PMOD1_7" "BIBUF_9:PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_10:E" "PMOD_0:GPIO_OE[0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PMOD_0:GPIO_OE[1]" "BIBUF_11:E" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PMOD_0:GPIO_OE[2]" "BIBUF_16:E" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PMOD_0:GPIO_OE[3]" "BIBUF_15:E" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_14:E" "PMOD_0:GPIO_OE[4]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_13:E" "PMOD_0:GPIO_OE[5]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PMOD_0:GPIO_OE[6]" "BIBUF_12:E" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_9:E" "PMOD_0:GPIO_OE[7]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_10:D" "PMOD_0:GPIO_OUT[0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PMOD_0:GPIO_OUT[1]" "BIBUF_11:D" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PMOD_0:GPIO_OUT[2]" "BIBUF_16:D" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_15:D" "PMOD_0:GPIO_OUT[3]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_14:D" "PMOD_0:GPIO_OUT[4]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_13:D" "PMOD_0:GPIO_OUT[5]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_12:D" "PMOD_0:GPIO_OUT[6]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_9:D" "PMOD_0:GPIO_OUT[7]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_sd_0:RAS_N" "RAS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:RAS_N" "RAS_N_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_sd_0:REFCLK" "REFCLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"REFCLK_N" "Aldec_MSSv2_sd_0:REFCLK_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_sd_0:RESET_N" "RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:RESET_N" "RESET_N_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RS485_0:GPIO_OE[0]" "BIBUF_4:E" "BIBUF_3:E" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_2:E" "BIBUF_5:E" "RS485_0:GPIO_OE[1]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RS485_0:GPIO_OUT[0]" "BIBUF_4:D" "BIBUF_3:D" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_2:D" "RS485_0:GPIO_OUT[1]" "INV_1:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_2:PAD" "RS485A_DE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_3:PAD" "RS485A_RE_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RS485A_RXD" "Aldec_MSSv2_sd_0:MMUART_3_RXD_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RS485A_TXD" "Aldec_MSSv2_sd_0:MMUART_3_TXD_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_5:PAD" "RS485B_DE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_8:PAD" "RS485B_DOUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_6:PAD" "RS485B_ON" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_4:PAD" "RS485B_RE_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RS485B_RXD" "MMUART_3_TXD_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RS485B_TE" "BIBUF_7:PAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RS485B_TXD" "MMUART_3_RXD_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SGMII_RX0_N" "Aldec_MSSv2_sd_0:SGMII_RX0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_sd_0:SGMII_RX0_P" "SGMII_RX0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SGMII_RX1_N" "Aldec_MSSv2_sd_0:SGMII_RX1_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_sd_0:SGMII_RX1_P" "SGMII_RX1_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_sd_0:SGMII_TX0_N" "SGMII_TX0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SGMII_TX0_P" "Aldec_MSSv2_sd_0:SGMII_TX0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_sd_0:SGMII_TX1_N" "SGMII_TX1_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SGMII_TX1_P" "Aldec_MSSv2_sd_0:SGMII_TX1_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:SHIELD0" "SHIELD0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SHIELD1" "PF_DDR4_C0_0:SHIELD1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SHIELD2" "PF_DDR4_C0_0:SHIELD2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:SHIELD3" "SHIELD3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SPI_1_CLK" "Aldec_MSSv2_sd_0:SPI_1_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SPI_1_DI" "Aldec_MSSv2_sd_0:SPI_1_DI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_sd_0:SPI_1_DO" "SPI_1_DO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_sd_0:SPI_1_SS0" "SPI_1_SS0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_sd_0:USB_CLK" "USB_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_sd_0:USB_DATA0" "USB_DATA0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_sd_0:USB_DATA1" "USB_DATA1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_sd_0:USB_DATA2" "USB_DATA2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_sd_0:USB_DATA3" "USB_DATA3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"USB_DATA4" "Aldec_MSSv2_sd_0:USB_DATA4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_sd_0:USB_DATA5" "USB_DATA5" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"USB_DATA6" "Aldec_MSSv2_sd_0:USB_DATA6" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"USB_DATA7" "Aldec_MSSv2_sd_0:USB_DATA7" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"USB_DIR" "Aldec_MSSv2_sd_0:USB_DIR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"USB_NXT" "Aldec_MSSv2_sd_0:USB_NXT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"USB_STP" "Aldec_MSSv2_sd_0:USB_STP" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RS485_0:PRESETN" "USB_ULPI_RESET" "PF_DDR4_C0_0:SYS_RESET_N" "VSC_8662_RESETN" "CORERESET_PF_C0_0:FABRIC_RESET_N" "PMOD_0:PRESETN" "COREAXI4INTERCONNECT_C0_0:ARESETN" "GATE_0:PRESETN" "Aldec_MSSv2_sd_0:MSS_RESET_N_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"WE_N" "Aldec_MSSv2_sd_0:WE_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"WE_N_0" "PF_DDR4_C0_0:WE_N" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_sd_0:A" "A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"A_0" "PF_DDR4_C0_0:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BA" "Aldec_MSSv2_sd_0:BA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:BA" "BA_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BG" "Aldec_MSSv2_sd_0:BG" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BG_0" "PF_DDR4_C0_0:BG" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DM_N" "PF_DDR4_C0_0:DM_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQ" "Aldec_MSSv2_sd_0:DQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:DQ" "DQ_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQS" "Aldec_MSSv2_sd_0:DQS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQS_0" "PF_DDR4_C0_0:DQS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_sd_0:DQS_N" "DQS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:DQS_N" "DQS_N_0" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4INTERCONNECT_C0_0:AXI4mmaster0" "Aldec_MSSv2_sd_0:FIC_0_AXI4_MASTER" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSSv2_sd_0:FIC_3_APB_MASTER" "CoreAPB3_C0_0:APB3mmaster" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PMOD_0:APB_bif" "CoreAPB3_C0_0:APBmslave0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_C0_0:APBmslave1" "GATE_0:APB_bif" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RS485_0:APB_bif" "CoreAPB3_C0_0:APBmslave3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:AXI4slave0" "COREAXI4INTERCONNECT_C0_0:AXI4mslave0" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign tysom_m_v10
generate_component -component_name ${sd_name}