# Creating SmartDesign tysom_m_2022_2
set sd_name {tysom_m_2022_2}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_1_20_IN} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_0_RXD} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_1_RXD_F2M} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_2_RXD_F2M} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_3_RXD_F2M} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD0_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD0_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD1_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD1_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD2_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD2_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD3_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD3_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REFCLK_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REFCLK} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_50MHz} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_CD_EMMC_STRB} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_WP_EMMC_RSTN} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPI_1_DI} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_CLK} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DIR} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_NXT} -port_direction {IN} -port_is_pad {1}

sd_create_scalar_port -sd_name ${sd_name} -port_name {ACT_N_0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ACT_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAS_N_0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAS_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK0_0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK0_N_0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK0_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CKE0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CKE} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CS0_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CS_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_1_23_OUT} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_0_TXD} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_1_TXD_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_2_TXD_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_3_TXD_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ODT0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ODT} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD0_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD0_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD1_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD1_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD2_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD2_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD3_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD3_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIE_1_PERST_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RAS_N_0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RAS_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESET_N_0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESET_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_CLK_EMMC_CLK} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_POW_EMMC_DATA4} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_SEL} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_VOLT_CMD_DIR_EMMC_DATA7} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_VOLT_DIR_0_EMMC_UNUSED} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_VOLT_DIR_1_3_EMMC_UNUSED} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_VOLT_EN_EMMC_DATA6} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_VOLT_SEL_EMMC_DATA5} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD1} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD2} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD3} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPI_1_DO} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_STP} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_ULPI_RESET} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VSC_8662_CMODE7} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VSC_8662_RESETN} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VSC_8662_SRESET} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {WE_N_0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {WE_N} -port_direction {OUT} -port_is_pad {1}

sd_create_scalar_port -sd_name ${sd_name} -port_name {I2C0_SCL} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {I2C0_SDA} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {I2C_1_SCL} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {I2C_1_SDA} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_CMD_EMMC_CMD} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_DATA0_EMMC_DATA0} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_DATA1_EMMC_DATA1} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_DATA2_EMMC_DATA2} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_DATA3_EMMC_DATA3} -port_direction {INOUT} -port_is_pad {1}
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
sd_create_bus_port -sd_name ${sd_name} -port_name {A_0} -port_direction {OUT} -port_range {[13:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {A} -port_direction {OUT} -port_range {[13:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {BA_0} -port_direction {OUT} -port_range {[1:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {BA} -port_direction {OUT} -port_range {[1:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {BG_0} -port_direction {OUT} -port_range {[1:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {BG} -port_direction {OUT} -port_range {[1:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DM_N} -port_direction {OUT} -port_range {[3:0]} -port_is_pad {1}

sd_create_bus_port -sd_name ${sd_name} -port_name {DQS_0} -port_direction {INOUT} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQS_N_0} -port_direction {INOUT} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQS_N} -port_direction {INOUT} -port_range {[4:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQS} -port_direction {INOUT} -port_range {[4:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQ_0} -port_direction {INOUT} -port_range {[31:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQ} -port_direction {INOUT} -port_range {[35:0]} -port_is_pad {1}

sd_invert_pins -sd_name ${sd_name} -pin_names {USB_ULPI_RESET}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {VSC_8662_CMODE7} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {VSC_8662_SRESET} -value {VCC}
# Add ALDEC_MSS_2022_2 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Aldec_MSS_2022_2_PCIe} -instance_name {ALDEC_MSS_2022_2}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {ALDEC_MSS_2022_2:MSS_INT_F2M} -pin_slices {[0:0]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {ALDEC_MSS_2022_2:MSS_INT_F2M[0:0]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {ALDEC_MSS_2022_2:MSS_INT_F2M} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {ALDEC_MSS_2022_2:MSS_INT_F2M} -pin_slices {[2:2]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {ALDEC_MSS_2022_2:MSS_INT_F2M[2:2]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {ALDEC_MSS_2022_2:MSS_INT_F2M} -pin_slices {[3:3]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {ALDEC_MSS_2022_2:MSS_INT_F2M[3:3]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {ALDEC_MSS_2022_2:MSS_INT_F2M} -pin_slices {[4:58]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {ALDEC_MSS_2022_2:MSS_INT_F2M[4:58]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {ALDEC_MSS_2022_2:MSS_INT_F2M} -pin_slices {[59:59]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {ALDEC_MSS_2022_2:MSS_INT_F2M[59:59]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {ALDEC_MSS_2022_2:MSS_INT_F2M} -pin_slices {[60:60]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {ALDEC_MSS_2022_2:MSS_INT_F2M[60:60]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {ALDEC_MSS_2022_2:MSS_INT_F2M} -pin_slices {[61:61]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {ALDEC_MSS_2022_2:MSS_INT_F2M[61:61]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {ALDEC_MSS_2022_2:MSS_INT_F2M} -pin_slices {[62:62]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {ALDEC_MSS_2022_2:MSS_INT_F2M[62:62]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {ALDEC_MSS_2022_2:MSS_INT_F2M} -pin_slices {[63:63]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {ALDEC_MSS_2022_2:MSS_INT_F2M[63:63]} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ALDEC_MSS_2022_2:PLL_CPU_LOCK_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {ALDEC_MSS_2022_2:PLL_DDR_LOCK_M2F}



# Add AND4_MSS_DLL_LOCKS instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND4} -instance_name {AND4_MSS_DLL_LOCKS}



# Add BIBUF_I2C0_SCL instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_I2C0_SCL}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BIBUF_I2C0_SCL:D} -value {GND}



# Add BIBUF_I2C0_SDA instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_I2C0_SDA}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BIBUF_I2C0_SDA:D} -value {GND}



# Add CLOCKS_AND_RESETS instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CLOCKS_AND_RESETS} -instance_name {CLOCKS_AND_RESETS}



# Add DDR4_INITIATOR_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {DDR4_INITIATOR} -instance_name {DDR4_INITIATOR_0}



# Add FIC_1_PERIPHERALS_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {FIC_1_PERIPHERALS} -instance_name {FIC_1_PERIPHERALS_1}



# Add FIC_3_PERIPHERALS_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {FIC_3_PERIPHERALS} -instance_name {FIC_3_PERIPHERALS_1}



# Add INV_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {INV} -instance_name {INV_0}



# Add PF_DDR4_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_DDR4_C0} -instance_name {PF_DDR4_C0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_DDR4_C0_0:PLL_LOCK}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_DDR4_C0_0:CTRLR_READY}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACT_N" "ALDEC_MSS_2022_2:ACT_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACT_N_0" "PF_DDR4_C0_0:ACT_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:CAS_N" "CAS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:CK0" "CK0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:CK0_N" "CK0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:CKE0" "CKE0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:CS0_N" "CS0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:FIC_0_ACLK" "CLOCKS_AND_RESETS:FIC_0_CLK" "PF_DDR4_C0_0:PLL_REF_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:FIC_0_DLL_LOCK_M2F" "AND4_MSS_DLL_LOCKS:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:FIC_1_ACLK" "CLOCKS_AND_RESETS:FIC_1_CLK" "FIC_1_PERIPHERALS_1:ACLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:FIC_1_DLL_LOCK_M2F" "AND4_MSS_DLL_LOCKS:B" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:FIC_2_ACLK" "CLOCKS_AND_RESETS:FIC_2_CLK" "DDR4_INITIATOR_0:ACLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:FIC_2_DLL_LOCK_M2F" "AND4_MSS_DLL_LOCKS:C" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:FIC_3_DLL_LOCK_M2F" "AND4_MSS_DLL_LOCKS:D" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:FIC_3_PCLK" "CLOCKS_AND_RESETS:FIC_3_CLK" "FIC_1_PERIPHERALS_1:PCLK" "FIC_3_PERIPHERALS_1:PCLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:GPIO_1_20_IN" "GPIO_1_20_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:GPIO_1_23_OUT" "GPIO_1_23_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:I2C_0_SCL_F2M" "BIBUF_I2C0_SCL:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:I2C_0_SCL_OE_M2F" "BIBUF_I2C0_SCL:E" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:I2C_0_SDA_F2M" "BIBUF_I2C0_SDA:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:I2C_0_SDA_OE_M2F" "BIBUF_I2C0_SDA:E" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:I2C_1_SCL" "I2C_1_SCL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:I2C_1_SDA" "I2C_1_SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:MMUART_0_RXD" "MMUART_0_RXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:MMUART_0_TXD" "MMUART_0_TXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:MMUART_1_RXD_F2M" "MMUART_1_RXD_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:MMUART_1_TXD_M2F" "MMUART_1_TXD_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:MMUART_2_RXD_F2M" "MMUART_2_RXD_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:MMUART_2_TXD_M2F" "MMUART_2_TXD_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:MMUART_3_RXD_F2M" "MMUART_3_RXD_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:MMUART_3_TXD_M2F" "MMUART_3_TXD_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:MMUART_4_RXD_F2M" "ALDEC_MSS_2022_2:MMUART_4_TXD_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:MSS_INT_F2M[1:1]" "FIC_1_PERIPHERALS_1:PCIe_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:MSS_RESET_N_F2M" "CLOCKS_AND_RESETS:RESETN_FIC_0_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:MSS_RESET_N_M2F" "CLOCKS_AND_RESETS:EXT_RST_N" "DDR4_INITIATOR_0:ARESETN" "PF_DDR4_C0_0:SYS_RESET_N" "USB_ULPI_RESET" "VSC_8662_RESETN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:ODT0" "ODT0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:RAS_N" "RAS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:REFCLK" "REFCLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:REFCLK_N" "REFCLK_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:RESET_N" "RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:SD_CD_EMMC_STRB" "SD_CD_EMMC_STRB" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:SD_CLK_EMMC_CLK" "SD_CLK_EMMC_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:SD_CMD_EMMC_CMD" "SD_CMD_EMMC_CMD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:SD_DATA0_EMMC_DATA0" "SD_DATA0_EMMC_DATA0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:SD_DATA1_EMMC_DATA1" "SD_DATA1_EMMC_DATA1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:SD_DATA2_EMMC_DATA2" "SD_DATA2_EMMC_DATA2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:SD_DATA3_EMMC_DATA3" "SD_DATA3_EMMC_DATA3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:SD_POW_EMMC_DATA4" "SD_POW_EMMC_DATA4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:SD_VOLT_CMD_DIR_EMMC_DATA7" "SD_VOLT_CMD_DIR_EMMC_DATA7" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:SD_VOLT_DIR_0_EMMC_UNUSED" "SD_VOLT_DIR_0_EMMC_UNUSED" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:SD_VOLT_DIR_1_3_EMMC_UNUSED" "SD_VOLT_DIR_1_3_EMMC_UNUSED" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:SD_VOLT_EN_EMMC_DATA6" "SD_VOLT_EN_EMMC_DATA6" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:SD_VOLT_SEL_EMMC_DATA5" "SD_VOLT_SEL_EMMC_DATA5" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:SD_WP_EMMC_RSTN" "SD_WP_EMMC_RSTN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:SPI_1_CLK" "SPI_1_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:SPI_1_DI" "SPI_1_DI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:SPI_1_DO" "SPI_1_DO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:SPI_1_SS0" "SPI_1_SS0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:USB_CLK" "USB_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:USB_DATA0" "USB_DATA0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:USB_DATA1" "USB_DATA1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:USB_DATA2" "USB_DATA2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:USB_DATA3" "USB_DATA3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:USB_DATA4" "USB_DATA4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:USB_DATA5" "USB_DATA5" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:USB_DATA6" "USB_DATA6" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:USB_DATA7" "USB_DATA7" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:USB_DIR" "USB_DIR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:USB_NXT" "USB_NXT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:USB_STP" "USB_STP" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:WE_N" "WE_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_MSS_DLL_LOCKS:Y" "CLOCKS_AND_RESETS:MSS_PLL_LOCKS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_I2C0_SCL:PAD" "I2C0_SCL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_I2C0_SDA:PAD" "I2C0_SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAS_N_0" "PF_DDR4_C0_0:CAS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CK0_0" "PF_DDR4_C0_0:CK0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CK0_N_0" "PF_DDR4_C0_0:CK0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CKE" "PF_DDR4_C0_0:CKE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:PCIE_INIT_DONE" "FIC_1_PERIPHERALS_1:PCIe_INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:PCIe_CLK_125MHz" "FIC_1_PERIPHERALS_1:PCIe_CLK_125MHz" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:PCIe_REFERENCE_CLK" "FIC_1_PERIPHERALS_1:PCIe_REFERENCE_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:REF_CLK_50MHz" "REF_CLK_50MHz" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:REF_CLK_PAD_N" "REF_CLK_PAD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:REF_CLK_PAD_P" "REF_CLK_PAD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:RESETN_FIC_1_CLK" "FIC_1_PERIPHERALS_1:ARESETN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:RESETN_FIC_3_CLK" "FIC_1_PERIPHERALS_1:PRESETN" "FIC_3_PERIPHERALS_1:PRESETN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CS_N" "PF_DDR4_C0_0:CS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_INITIATOR_0:S_CLK0" "PF_DDR4_C0_0:SYS_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:PCIESS_LANE_RXD0_N" "PCIESS_LANE_RXD0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:PCIESS_LANE_RXD0_P" "PCIESS_LANE_RXD0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:PCIESS_LANE_RXD1_N" "PCIESS_LANE_RXD1_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:PCIESS_LANE_RXD1_P" "PCIESS_LANE_RXD1_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:PCIESS_LANE_RXD2_N" "PCIESS_LANE_RXD2_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:PCIESS_LANE_RXD2_P" "PCIESS_LANE_RXD2_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:PCIESS_LANE_RXD3_N" "PCIESS_LANE_RXD3_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:PCIESS_LANE_RXD3_P" "PCIESS_LANE_RXD3_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:PCIESS_LANE_TXD0_N" "PCIESS_LANE_TXD0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:PCIESS_LANE_TXD0_P" "PCIESS_LANE_TXD0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:PCIESS_LANE_TXD1_N" "PCIESS_LANE_TXD1_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:PCIESS_LANE_TXD1_P" "PCIESS_LANE_TXD1_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:PCIESS_LANE_TXD2_N" "PCIESS_LANE_TXD2_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:PCIESS_LANE_TXD2_P" "PCIESS_LANE_TXD2_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:PCIESS_LANE_TXD3_N" "PCIESS_LANE_TXD3_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:PCIESS_LANE_TXD3_P" "PCIESS_LANE_TXD3_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:PCIE_1_PERST_N" "PCIE_1_PERST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_3_PERIPHERALS_1:fabric_sd_emmc_demux_select_out" "INV_0:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"INV_0:Y" "SD_SEL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ODT" "PF_DDR4_C0_0:ODT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:RAS_N" "RAS_N_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:RESET_N" "RESET_N_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:SHIELD0" "SHIELD0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:SHIELD1" "SHIELD1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:SHIELD2" "SHIELD2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:SHIELD3" "SHIELD3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:WE_N" "WE_N_0" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"A" "ALDEC_MSS_2022_2:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:BA" "BA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:BG" "BG" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:DQ" "DQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:DQS" "DQS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:DQS_N" "DQS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:FIC_3_APB_M_PSTRB" "FIC_3_PERIPHERALS_1:PSTRB" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"A_0" "PF_DDR4_C0_0:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BA_0" "PF_DDR4_C0_0:BA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BG_0" "PF_DDR4_C0_0:BG" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DM_N" "PF_DDR4_C0_0:DM_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQS_0" "PF_DDR4_C0_0:DQS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQS_N_0" "PF_DDR4_C0_0:DQS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQ_0" "PF_DDR4_C0_0:DQ" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:FIC_0_AXI4_INITIATOR" "DDR4_INITIATOR_0:AXI4mmaster0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:FIC_1_AXI4_INITIATOR" "FIC_1_PERIPHERALS_1:AXI4mmaster0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:FIC_1_AXI4_TARGET" "FIC_1_PERIPHERALS_1:AXI4mslave0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ALDEC_MSS_2022_2:FIC_3_APB_INITIATOR" "FIC_3_PERIPHERALS_1:APB_MMASTER" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:CLKS_TO_XCVR" "FIC_1_PERIPHERALS_1:TX_PLL_CLKS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_INITIATOR_0:AXI4mslave0" "PF_DDR4_C0_0:AXI4slave0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:Q0_LANE0_DRI_SLAVE" "FIC_3_PERIPHERALS_1:Q0_LANE0_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:Q0_LANE1_DRI_SLAVE" "FIC_3_PERIPHERALS_1:Q0_LANE1_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:Q0_LANE2_DRI_SLAVE" "FIC_3_PERIPHERALS_1:Q0_LANE2_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_PERIPHERALS_1:Q0_LANE3_DRI_SLAVE" "FIC_3_PERIPHERALS_1:Q0_LANE3_DRI" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign tysom_m_2022_2
generate_component -component_name ${sd_name}
