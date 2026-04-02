# Creating SmartDesign "top"
set sd_name {top}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_PMA_ARST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RXD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RXD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RX} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {clk_125} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {reset_n} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_TXD_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_TXD_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TX} -port_direction {OUT}



# Add LiteFast_receiver_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {LiteFast_receiver} -instance_name {LiteFast_receiver_0}
sd_create_pin_group -sd_name ${sd_name} -group_name {clk} -instance_name {LiteFast_receiver_0} -pin_names {"clk_tx_i" "clk_125_i" "clk_rx_i" }



# Add LiteFast_transmitter_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {LiteFast_transmitter} -instance_name {LiteFast_transmitter_0}



# Add transceiver_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {transceiver} -instance_name {transceiver_0}
sd_create_pin_group -sd_name ${sd_name} -group_name {PADs_OUT} -instance_name {transceiver_0} -pin_names {"LANE0_TXD_N" "LANE0_TXD_P" }
sd_create_pin_group -sd_name ${sd_name} -group_name {PADs_IN} -instance_name {transceiver_0} -pin_names {"LANE0_RXD_N" "LANE0_RXD_P" }
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {transceiver_0:LANE0_TX_CLK_STABLE}



# Add UART_IF_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {UART_IF} -instance_name {UART_IF_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_PMA_ARST_N" "transceiver_0:LANE0_PMA_ARST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RXD_N" "transceiver_0:LANE0_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RXD_P" "transceiver_0:LANE0_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_TXD_N" "transceiver_0:LANE0_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_TXD_P" "transceiver_0:LANE0_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:clk_125_i" "LiteFast_transmitter_0:clk_125_i" "UART_IF_0:clk_125" "clk_125" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:clk_rx_i" "transceiver_0:LANE0_RX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:clk_tx_i" "LiteFast_transmitter_0:clk_tx_i" "transceiver_0:LANE0_TX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:crc_error_o" "LiteFast_transmitter_0:crc_error_tx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:data_valid_rx_o" "UART_IF_0:data_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:lane_aligned_rx_o" "LiteFast_transmitter_0:local_rece_rdy_tx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:reset_n_i" "LiteFast_transmitter_0:reset_n_i" "transceiver_0:LANE0_RX_VAL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_transmitter_0:uart_data_valid_i" "UART_IF_0:data_valid_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"REF_CLK_PAD_N" "transceiver_0:REF_CLK_PAD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"REF_CLK_PAD_P" "transceiver_0:REF_CLK_PAD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RX" "UART_IF_0:RX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"TX" "UART_IF_0:TX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"UART_IF_0:reset_n" "reset_n" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:data_rx_o" "UART_IF_0:data_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:lane_data_rx_i" "transceiver_0:LANE0_RX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:lane_k_rx_i" "transceiver_0:LANE0_8B10B_RX_K" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:local_token_o" "LiteFast_transmitter_0:local_token_tx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:remote_token_o" "LiteFast_transmitter_0:remote_token_tx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_transmitter_0:LiteFast_data_tx_o" "transceiver_0:LANE0_TX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_transmitter_0:LiteFast_k_tx_o" "transceiver_0:LANE0_8B10B_TX_K" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_transmitter_0:uart_data_i" "UART_IF_0:data_o" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "top"
generate_component -component_name ${sd_name}
