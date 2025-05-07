# Creating SmartDesign System
set sd_name {System}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAN_0_RXBUS_F2M} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_1_20_IN} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_0_RXD} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_1_RXD_F2M} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_2_RXD_F2M} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_3_RXD_F2M} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REFCLK_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REFCLK} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPI_1_DI} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SW_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SW_1} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SW_2} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SW_3} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_CLK} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DIR} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_NXT} -port_direction {IN} -port_is_pad {1}

sd_create_scalar_port -sd_name ${sd_name} -port_name {ACT_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAN_0_STANDBY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAN_0_TXBUS_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAS_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK0_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CKE0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CS0_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_CLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_DE} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_HSYNC} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_I2S0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_I2S1} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_I2S2} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_I2S3} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_LRCLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_MCLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_PD_AD} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_SCLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_SPDIF} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_VSYNC} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED1} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED2} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED3} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_0_TXD} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_1_TXD_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_2_TXD_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_3_TXD_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ODT0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RAS_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESET_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_SEL} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPI_1_DO} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_STP} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_ULPI_RESET} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VSC_8662_CMODE7} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VSC_8662_RESETN} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VSC_8662_SRESET} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {WE_N} -port_direction {OUT} -port_is_pad {1}

sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_SCL} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_SDA} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {I2C_1_SCL} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {I2C_1_SDA} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPI_1_CLK} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPI_1_SS0} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA0} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA1} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA2} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA3} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA4} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA5} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA6} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA7} -port_direction {INOUT} -port_is_pad {1}

# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {A} -port_direction {OUT} -port_range {[13:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {BA} -port_direction {OUT} -port_range {[1:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {BG} -port_direction {OUT} -port_range {[1:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {data_b} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {data_g} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {data_r} -port_direction {OUT} -port_range {[7:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {DQS_N} -port_direction {INOUT} -port_range {[4:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQS} -port_direction {INOUT} -port_range {[4:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQ} -port_direction {INOUT} -port_range {[35:0]} -port_is_pad {1}

sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CAN_0_STANDBY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {HDMI_I2S0} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {HDMI_I2S1} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {HDMI_I2S2} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {HDMI_I2S3} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {HDMI_LRCLK} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {HDMI_MCLK} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {HDMI_PD_AD} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {HDMI_SCLK} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {HDMI_SPDIF} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {SD_SEL} -value {GND}
sd_invert_pins -sd_name ${sd_name} -pin_names {USB_ULPI_RESET}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {VSC_8662_CMODE7} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {VSC_8662_SRESET} -value {VCC}
# Add Aldec_MSS_2022_2_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {MSS_TySOM_M_VIDEO} -instance_name {Aldec_MSS_2022_2_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSS_2022_2_0:FIC_0_DLL_LOCK_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSS_2022_2_0:MMUART_1_TXD_OE_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSS_2022_2_0:CAN_0_TX_EBL_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSS_2022_2_0:PLL_CPU_LOCK_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSS_2022_2_0:PLL_DDR_LOCK_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Aldec_MSS_2022_2_0:MSS_RESET_N_M2F}



# Add BIBUF_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BIBUF_0:D} -value {GND}



# Add BIBUF_1 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_1}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BIBUF_1:D} -value {GND}



# Add CORERESET_PF_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORERESET_PF_C0} -instance_name {CORERESET_PF_C0_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_0:EXT_RST_N} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_0:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_0:FF_US_RESTORE} -value {GND}



# Add Display_Controller_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Display_Controller_New} -instance_name {Display_Controller_C0_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Display_Controller_C0_0:DATA_I} -pin_slices {[15:8]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Display_Controller_C0_0:DATA_I} -pin_slices {[23:16]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Display_Controller_C0_0:DATA_I} -pin_slices {[7:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Display_Controller_C0_0:DATA_O} -pin_slices {[15:8]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Display_Controller_C0_0:DATA_O} -pin_slices {[23:16]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Display_Controller_C0_0:DATA_O} -pin_slices {[7:0]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Display_Controller_C0_0:ENABLE_I} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Display_Controller_C0_0:V_ACTIVE_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Display_Controller_C0_0:H_RES_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Display_Controller_C0_0:V_RES_O}



# Add PF_CCC_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_CCC_C0} -instance_name {PF_CCC_C0_0}



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



# Add Test_Pattern_Generator_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Test_Pattern_Generator_C0} -instance_name {Test_Pattern_Generator_C0_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Test_Pattern_Generator_C0_0:PATTERN_SEL_I} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Test_Pattern_Generator_C0_0:PATTERN_SEL_I} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Test_Pattern_Generator_C0_0:PATTERN_SEL_I} -pin_slices {[2:2]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Test_Pattern_Generator_C0_0:FRAME_END_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Test_Pattern_Generator_C0_0:LINE_END_O}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Test_Pattern_Generator_C0_0:BAYER_PATTERN_I} -value {00}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Test_Pattern_Generator_C0_0:BAYER_O}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACT_N" "Aldec_MSS_2022_2_0:ACT_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:CAN_0_RXBUS_F2M" "CAN_0_RXBUS_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:CAN_0_TXBUS_M2F" "CAN_0_TXBUS_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:CAS_N" "CAS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:CK0" "CK0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:CK0_N" "CK0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:CKE0" "CKE0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:CS0_N" "CS0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:FIC_0_ACLK" "CORERESET_PF_C0_0:CLK" "Display_Controller_C0_0:SYS_CLK_I" "HDMI_CLK" "PF_CCC_C0_0:OUT0_FABCLK_0" "Test_Pattern_Generator_C0_0:SYS_CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:GPIO_1_20_IN" "GPIO_1_20_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:GPIO_1_23_OUT" "LED0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:GPIO_2_F2M_20" "SW_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:GPIO_2_F2M_21" "SW_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:GPIO_2_F2M_22" "SW_2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:GPIO_2_F2M_23" "SW_3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:GPIO_2_M2F_16" "Test_Pattern_Generator_C0_0:PATTERN_SEL_I[0:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:GPIO_2_M2F_17" "LED2" "Test_Pattern_Generator_C0_0:PATTERN_SEL_I[1:1]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:GPIO_2_M2F_18" "LED3" "Test_Pattern_Generator_C0_0:PATTERN_SEL_I[2:2]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:I2C_0_SCL_F2M" "BIBUF_0:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:I2C_0_SCL_OE_M2F" "BIBUF_0:E" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:I2C_0_SDA_F2M" "BIBUF_1:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:I2C_0_SDA_OE_M2F" "BIBUF_1:E" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:I2C_1_SCL" "I2C_1_SCL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:I2C_1_SDA" "I2C_1_SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:MMUART_0_RXD" "MMUART_0_RXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:MMUART_0_TXD" "MMUART_0_TXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:MMUART_1_RXD_F2M" "MMUART_1_RXD_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:MMUART_1_TXD_M2F" "MMUART_1_TXD_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:MMUART_2_RXD_F2M" "MMUART_2_RXD_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:MMUART_2_TXD_M2F" "MMUART_2_TXD_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:MMUART_3_RXD_F2M" "MMUART_3_RXD_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:MMUART_3_TXD_M2F" "MMUART_3_TXD_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:MMUART_4_RXD_F2M" "Aldec_MSS_2022_2_0:MMUART_4_TXD_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:MSS_RESET_N_F2M" "CORERESET_PF_C0_0:FABRIC_RESET_N" "Display_Controller_C0_0:RESETN_I" "Test_Pattern_Generator_C0_0:RESET_N_I" "USB_ULPI_RESET" "VSC_8662_RESETN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:ODT0" "ODT0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:RAS_N" "RAS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:REFCLK" "REFCLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:REFCLK_N" "REFCLK_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:RESET_N" "RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:SPI_1_CLK" "SPI_1_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:SPI_1_DI" "SPI_1_DI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:SPI_1_DO" "SPI_1_DO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:SPI_1_SS0" "SPI_1_SS0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:USB_CLK" "USB_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:USB_DATA0" "USB_DATA0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:USB_DATA1" "USB_DATA1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:USB_DATA2" "USB_DATA2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:USB_DATA3" "USB_DATA3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:USB_DATA4" "USB_DATA4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:USB_DATA5" "USB_DATA5" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:USB_DATA6" "USB_DATA6" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:USB_DATA7" "USB_DATA7" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:USB_DIR" "USB_DIR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:USB_NXT" "USB_NXT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:USB_STP" "USB_STP" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:WE_N" "WE_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_0:PAD" "HDMI_SCL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_1:PAD" "HDMI_SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_0:BANK_x_VDDI_STATUS" "CORERESET_PF_C0_0:BANK_y_VDDI_STATUS" "PFSOC_INIT_MONITOR_C0_0:BANK_0_VDDI_STATUS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_0:FPGA_POR_N" "PFSOC_INIT_MONITOR_C0_0:FABRIC_POR_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_0:INIT_DONE" "PFSOC_INIT_MONITOR_C0_0:DEVICE_INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_0:PLL_LOCK" "PF_CCC_C0_0:PLL_LOCK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_0:PLL_POWERDOWN_B" "PF_CCC_C0_0:PLL_POWERDOWN_N_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Display_Controller_C0_0:DATA_TRIGGER_O" "Test_Pattern_Generator_C0_0:DATA_EN_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Display_Controller_C0_0:DATA_VALID_O" "HDMI_DE" "LED1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Display_Controller_C0_0:EXT_SYNC_SIGNAL_I" "Test_Pattern_Generator_C0_0:DATA_VALID_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Display_Controller_C0_0:FRAME_END_O" "Test_Pattern_Generator_C0_0:FRAME_END_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Display_Controller_C0_0:H_SYNC_O" "HDMI_HSYNC" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Display_Controller_C0_0:V_SYNC_O" "HDMI_VSYNC" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_C0_0:REF_CLK_0" "PF_OSC_C0_0:RCOSC_160MHZ_GL" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"A" "Aldec_MSS_2022_2_0:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:BA" "BA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:BG" "BG" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:DQ" "DQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:DQS" "DQS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Aldec_MSS_2022_2_0:DQS_N" "DQS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Display_Controller_C0_0:DATA_I[15:8]" "Test_Pattern_Generator_C0_0:GREEN_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Display_Controller_C0_0:DATA_I[23:16]" "Test_Pattern_Generator_C0_0:RED_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Display_Controller_C0_0:DATA_I[7:0]" "Test_Pattern_Generator_C0_0:BLUE_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Display_Controller_C0_0:DATA_O[15:8]" "data_g" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Display_Controller_C0_0:DATA_O[23:16]" "data_r" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Display_Controller_C0_0:DATA_O[7:0]" "data_b" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign System
generate_component -component_name ${sd_name}
