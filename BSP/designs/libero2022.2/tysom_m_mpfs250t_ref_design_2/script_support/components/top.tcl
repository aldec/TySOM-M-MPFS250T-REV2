# Creating SmartDesign top
set sd_name {top}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLK_125} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RXD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RXD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_RXD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_RXD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESET} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RX} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {start_test} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_TXD_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_TXD_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_TX_CLK_STABLE} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_TXD_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_TXD_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_TX_CLK_STABLE} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TX} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {error_o_link0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {error_o_link1} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {lock_o_link0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {lock_o_link1} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {rx_val_o_link0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {rx_val_o_link1} -port_direction {OUT}



# Add AND2_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_0}



# Add LiteFast_receiver_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {LiteFast_receiver} -instance_name {LiteFast_receiver_0}



# Add LiteFast_receiver_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {LiteFast_receiver} -instance_name {LiteFast_receiver_1}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {LiteFast_receiver_1:crc_error_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {LiteFast_receiver_1:data_rx_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {LiteFast_receiver_1:data_tx_o}



# Add LiteFast_transmitter_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {LiteFast_transmitter} -instance_name {LiteFast_transmitter_0}



# Add LiteFast_transmitter_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {LiteFast_transmitter} -instance_name {LiteFast_transmitter_1}



# Add transceiver_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {transceiver} -instance_name {transceiver_0}
sd_create_pin_group -sd_name ${sd_name} -group_name {PADs_IN} -instance_name {transceiver_0} -pin_names {"LANE1_RXD_P" "LANE1_RXD_N" }
sd_create_pin_group -sd_name ${sd_name} -group_name {PADs_OUT} -instance_name {transceiver_0} -pin_names {"LANE1_TXD_P" "LANE1_TXD_N" }



# Add UART_IF_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {UART_IF} -instance_name {UART_IF_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:A" "transceiver_0:LANE0_RX_VAL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:B" "transceiver_0:LANE1_RX_VAL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:Y" "LiteFast_receiver_0:RESET" "LiteFast_receiver_1:RESET" "LiteFast_transmitter_0:start_i" "LiteFast_transmitter_1:start_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK_125" "UART_IF_0:CLK_125" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RXD_N" "transceiver_0:LANE0_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RXD_P" "transceiver_0:LANE0_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_TXD_N" "transceiver_0:LANE0_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_TXD_P" "transceiver_0:LANE0_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_TX_CLK_STABLE" "transceiver_0:LANE0_TX_CLK_STABLE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_RXD_N" "transceiver_0:LANE1_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_RXD_P" "transceiver_0:LANE1_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_TXD_N" "transceiver_0:LANE1_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_TXD_P" "transceiver_0:LANE1_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_TX_CLK_STABLE" "transceiver_0:LANE1_TX_CLK_STABLE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:DATA" "LiteFast_receiver_1:DATA" "LiteFast_transmitter_0:DATA" "LiteFast_transmitter_1:DATA" "UART_IF_0:start_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:DATA_0" "LiteFast_receiver_1:DATA_0" "UART_IF_0:clear_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:RCLOCK" "LiteFast_transmitter_0:clk_i" "transceiver_0:LANE0_TX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:WCLOCK" "transceiver_0:LANE0_RX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:WCLOCK_0" "LiteFast_receiver_1:WCLOCK_0" "LiteFast_transmitter_0:WCLOCK" "LiteFast_transmitter_1:WCLOCK" "UART_IF_0:UART_IF_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:crc_error_o" "UART_IF_0:crc_error_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:error_o" "UART_IF_0:payload_err_i" "UART_IF_0:rx_error_i" "error_o_link0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:lane_aligned_rx_o" "LiteFast_transmitter_0:local_rece_rdy_tx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:lock_o" "UART_IF_0:rx_lock_i" "lock_o_link0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:rx_val_o" "UART_IF_0:rx_val_i" "rx_val_o_link0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_1:RCLOCK" "LiteFast_transmitter_1:clk_i" "transceiver_0:LANE1_TX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_1:WCLOCK" "transceiver_0:LANE1_RX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_1:error_o" "error_o_link1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_1:lane_aligned_rx_o" "LiteFast_transmitter_1:local_rece_rdy_tx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_1:lock_o" "lock_o_link1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_1:rx_val_o" "rx_val_o_link1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_transmitter_0:DATA_0" "LiteFast_transmitter_1:DATA_0" "UART_IF_0:payload_err_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_transmitter_0:DATA_1" "LiteFast_transmitter_1:DATA_1" "UART_IF_0:crc_err_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"REF_CLK_PAD_N" "transceiver_0:REF_CLK_PAD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"REF_CLK_PAD_P" "transceiver_0:REF_CLK_PAD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RESET" "UART_IF_0:RESET" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RX" "UART_IF_0:RX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"TX" "UART_IF_0:TX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"UART_IF_0:start_test" "start_test" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:Local_Token_o" "LiteFast_transmitter_0:local_token_tx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:Remote_Token_o" "LiteFast_transmitter_0:remote_token_tx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:data_rx_o" "UART_IF_0:tx_words_in" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:data_tx_o" "UART_IF_0:rx_words_in" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:lane_data_rx_i" "transceiver_0:LANE0_RX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:lane_k_rx_i" "transceiver_0:LANE0_8B10B_RX_K" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_1:Local_Token_o" "LiteFast_transmitter_1:local_token_tx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_1:Remote_Token_o" "LiteFast_transmitter_1:remote_token_tx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_1:lane_data_rx_i" "transceiver_0:LANE1_RX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_1:lane_k_rx_i" "transceiver_0:LANE1_8B10B_RX_K" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_transmitter_0:LiteFast_data_tx_o" "transceiver_0:LANE0_TX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_transmitter_0:LiteFast_k_tx_o" "transceiver_0:LANE0_8B10B_TX_K" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_transmitter_1:LiteFast_data_tx_o" "transceiver_0:LANE1_TX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_transmitter_1:LiteFast_k_tx_o" "transceiver_0:LANE1_8B10B_TX_K" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign top
generate_component -component_name ${sd_name}
