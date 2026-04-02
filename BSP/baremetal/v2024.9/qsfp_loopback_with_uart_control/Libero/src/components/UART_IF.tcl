# Creating SmartDesign "UART_IF"
set sd_name {UART_IF}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {RX} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {clk_125} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {lane0_crc_error_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {lane0_payload_error_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {lane0_rx_error_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {lane0_rx_lock_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {lane0_rx_valid_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {lane0_tx_clk_stable} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {lane1_crc_error_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {lane1_payload_error_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {lane1_rx_error_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {lane1_rx_lock_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {lane1_rx_valid_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {lane1_tx_clk_stable} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {lane2_crc_error_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {lane2_payload_error_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {lane2_rx_error_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {lane2_rx_lock_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {lane2_rx_valid_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {lane2_tx_clk_stable} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {lane3_crc_error_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {lane3_payload_error_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {lane3_rx_error_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {lane3_rx_lock_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {lane3_rx_valid_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {lane3_tx_clk_stable} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {reset_n} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {TX} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {clear_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {crc_error_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {payload_error_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {start_o} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {lane0_rx_words_in} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {lane0_tx_words_in} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {lane1_rx_words_in} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {lane1_tx_words_in} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {lane2_rx_words_in} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {lane2_tx_words_in} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {lane3_rx_words_in} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {lane3_tx_words_in} -port_direction {IN} -port_range {[31:0]}


# Add COREUART_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREUART_C0} -instance_name {COREUART_C0_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {COREUART_C0_0:BIT8} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {COREUART_C0_0:CSN} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {COREUART_C0_0:ODD_N_EVEN} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {COREUART_C0_0:OVERFLOW}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {COREUART_C0_0:PARITY_EN} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {COREUART_C0_0:PARITY_ERR}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {COREUART_C0_0:FRAMING_ERR}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {COREUART_C0_0:BAUD_VAL} -value {0000001000011}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {COREUART_C0_0:BAUD_VAL_FRACTION} -value {111}



# Add DecodeUART_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {DecodeUART} -hdl_file {hdl/DecodeUART.sv} -instance_name {DecodeUART_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DecodeUART_0:rx_valid_i} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DecodeUART_0:rx_valid_i} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DecodeUART_0:rx_valid_i} -pin_slices {[2:2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DecodeUART_0:rx_valid_i} -pin_slices {[3:3]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DecodeUART_0:rx_lock_i} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DecodeUART_0:rx_lock_i} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DecodeUART_0:rx_lock_i} -pin_slices {[2:2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DecodeUART_0:rx_lock_i} -pin_slices {[3:3]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DecodeUART_0:rx_error_i} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DecodeUART_0:rx_error_i} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DecodeUART_0:rx_error_i} -pin_slices {[2:2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DecodeUART_0:rx_error_i} -pin_slices {[3:3]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DecodeUART_0:payload_error_i} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DecodeUART_0:payload_error_i} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DecodeUART_0:payload_error_i} -pin_slices {[2:2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DecodeUART_0:payload_error_i} -pin_slices {[3:3]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DecodeUART_0:crc_error_i} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DecodeUART_0:crc_error_i} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DecodeUART_0:crc_error_i} -pin_slices {[2:2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DecodeUART_0:crc_error_i} -pin_slices {[3:3]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DecodeUART_0:tx_clk_stable_i} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DecodeUART_0:tx_clk_stable_i} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DecodeUART_0:tx_clk_stable_i} -pin_slices {[2:2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DecodeUART_0:tx_clk_stable_i} -pin_slices {[3:3]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DecodeUART_0:tx_words_in} -pin_slices {[127:96]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DecodeUART_0:tx_words_in} -pin_slices {[31:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DecodeUART_0:tx_words_in} -pin_slices {[63:32]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DecodeUART_0:tx_words_in} -pin_slices {[95:64]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DecodeUART_0:rx_words_in} -pin_slices {[127:96]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DecodeUART_0:rx_words_in} -pin_slices {[31:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DecodeUART_0:rx_words_in} -pin_slices {[63:32]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DecodeUART_0:rx_words_in} -pin_slices {[95:64]}



# Add Reset_Synchronizer_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {Reset_Synchronizer} -instance_name {Reset_Synchronizer_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREUART_C0_0:CLK" "DecodeUART_0:clk" "Reset_Synchronizer_0:clk_i" "clk_125" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREUART_C0_0:OEN" "DecodeUART_0:uart_oen" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREUART_C0_0:RESET_N" "DecodeUART_0:reset_n" "Reset_Synchronizer_0:reset_n_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREUART_C0_0:RX" "RX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREUART_C0_0:RXRDY" "DecodeUART_0:uart_rxrdy" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREUART_C0_0:TX" "TX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREUART_C0_0:TXRDY" "DecodeUART_0:uart_txrdy" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREUART_C0_0:WEN" "DecodeUART_0:uart_wen" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:clear_o" "clear_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:crc_error_i[0:0]" "lane0_crc_error_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:crc_error_i[1:1]" "lane1_crc_error_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:crc_error_i[2:2]" "lane2_crc_error_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:crc_error_i[3:3]" "lane3_crc_error_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:crc_error_o" "crc_error_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:payload_error_i[0:0]" "lane0_payload_error_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:payload_error_i[1:1]" "lane1_payload_error_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:payload_error_i[2:2]" "lane2_payload_error_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:payload_error_i[3:3]" "lane3_payload_error_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:payload_error_o" "payload_error_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:rx_error_i[0:0]" "lane0_rx_error_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:rx_error_i[1:1]" "lane1_rx_error_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:rx_error_i[2:2]" "lane2_rx_error_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:rx_error_i[3:3]" "lane3_rx_error_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:rx_lock_i[0:0]" "lane0_rx_lock_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:rx_lock_i[1:1]" "lane1_rx_lock_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:rx_lock_i[2:2]" "lane2_rx_lock_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:rx_lock_i[3:3]" "lane3_rx_lock_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:rx_valid_i[0:0]" "lane0_rx_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:rx_valid_i[1:1]" "lane1_rx_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:rx_valid_i[2:2]" "lane2_rx_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:rx_valid_i[3:3]" "lane3_rx_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:start_o" "start_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:tx_clk_stable_i[0:0]" "lane0_tx_clk_stable" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:tx_clk_stable_i[1:1]" "lane1_tx_clk_stable" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:tx_clk_stable_i[2:2]" "lane2_tx_clk_stable" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:tx_clk_stable_i[3:3]" "lane3_tx_clk_stable" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Reset_Synchronizer_0:lock_i" "Reset_Synchronizer_0:reset_n_i" "reset_n" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREUART_C0_0:DATA_IN" "DecodeUART_0:uart_data_out" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREUART_C0_0:DATA_OUT" "DecodeUART_0:uart_data_in" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:rx_words_in[127:96]" "lane3_rx_words_in" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:rx_words_in[31:0]" "lane0_rx_words_in" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:rx_words_in[63:32]" "lane1_rx_words_in" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:rx_words_in[95:64]" "lane2_rx_words_in" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:tx_words_in[127:96]" "lane3_tx_words_in" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:tx_words_in[31:0]" "lane0_tx_words_in" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:tx_words_in[63:32]" "lane1_tx_words_in" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DecodeUART_0:tx_words_in[95:64]" "lane2_tx_words_in" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "UART_IF"
generate_component -component_name ${sd_name}
