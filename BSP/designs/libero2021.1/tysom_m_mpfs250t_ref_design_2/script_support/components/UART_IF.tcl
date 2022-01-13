# Creating SmartDesign UART_IF
set sd_name {UART_IF}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {crc_err_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {start_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {clear_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {payload_err_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {rx_val_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {rx_lock_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {rx_error_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {crc_error_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {payload_err_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TX} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RX} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {UART_IF_CLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLK_125} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESET} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {start_test} -port_direction {IN}

sd_create_bus_port -sd_name ${sd_name} -port_name {rx_words_in} -port_direction {IN} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {tx_words_in} -port_direction {IN} -port_range {[15:0]}

# Add COREUART_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREUART_C0} -instance_name {COREUART_C0_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {COREUART_C0_0:BIT8} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {COREUART_C0_0:CSN} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {COREUART_C0_0:ODD_N_EVEN} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {COREUART_C0_0:OVERFLOW}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {COREUART_C0_0:PARITY_EN} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {COREUART_C0_0:PARITY_ERR}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {COREUART_C0_0:FRAMING_ERR}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {COREUART_C0_0:BAUD_VAL} -value {0001100101100}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {COREUART_C0_0:BAUD_VAL_FRACTION} -value {110}



# Add FabUART_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {FabUART} -instance_name {FabUART_0}
# Exporting Parameters of instance FabUART_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {FabUART_0} -params {\
"INIT:0" \
"UART_TX1:3" \
"UART_TX2:5" \
"UART_TX3:19" \
"UART_TX4:21" \
"UART_TX5:23" \
"UART_TX_CMD:1" \
"UART_TX_CNT:6" \
"UART_TX_CNT1:8" \
"UART_TX_CNT2:10" \
"UART_TX_SCAN:12" \
"UART_TX_SCAN1:14" \
"UART_TX_SCAN2:16" \
"UART_WAIT0:2" \
"UART_WAIT1:4" \
"UART_WAIT1_EXT1:18" \
"UART_WAIT1_EXT2:20" \
"UART_WAIT1_EXT3:22" \
"UART_WAIT2:7" \
"UART_WAIT3:9" \
"UART_WAIT4:11" \
"UART_WAIT5:13" \
"UART_WAIT6:15" \
"UART_WAIT7:17" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {FabUART_0}
sd_update_instance -sd_name ${sd_name} -instance_name {FabUART_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {FabUART_0:connect_o}



# Add Reset_Synchronizer_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {Reset_Synchronizer} -instance_name {Reset_Synchronizer_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"FabUART_0:clear_o" "clear_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREUART_C0_0:CLK" "FabUART_0:clk" "Reset_Synchronizer_0:clk_i" "UART_IF_CLK" "CLK_125" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREUART_C0_0:RXRDY" "FabUART_0:uart_rxrdy" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREUART_C0_0:TXRDY" "FabUART_0:uart_txrdy" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FabUART_0:crc_err_o" "crc_err_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FabUART_0:crc_error_i" "crc_error_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREUART_C0_0:OEN" "FabUART_0:uart_oen" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREUART_C0_0:WEN" "FabUART_0:uart_wen" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FabUART_0:payload_err_i" "payload_err_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FabUART_0:payload_err_o" "payload_err_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Reset_Synchronizer_0:lock_i" "Reset_Synchronizer_0:reset_n_i" "RESET" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREUART_C0_0:RESET_N" "FabUART_0:reset" "Reset_Synchronizer_0:reset_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREUART_C0_0:RX" "RX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FabUART_0:rx_error_i" "rx_error_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FabUART_0:rx_lock_i" "rx_lock_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FabUART_0:rx_val_i" "rx_val_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FabUART_0:start_o" "start_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FabUART_0:start_test" "start_test" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREUART_C0_0:TX" "TX" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREUART_C0_0:DATA_OUT" "FabUART_0:uart_data_in" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FabUART_0:uart_data_out" "COREUART_C0_0:DATA_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FabUART_0:rx_words_in" "rx_words_in" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FabUART_0:tx_words_in" "tx_words_in" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign UART_IF
generate_component -component_name ${sd_name}
