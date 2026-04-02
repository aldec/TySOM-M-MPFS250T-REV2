# Creating SmartDesign "top"
set sd_name {top}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_PMA_ARST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RXD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RXD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_PMA_ARST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_RXD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_RXD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_PMA_ARST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_RXD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_RXD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_PMA_ARST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_RXD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_RXD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RX} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {clk_125} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {reset_n} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_TXD_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_TXD_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_TXD_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_TXD_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_TXD_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_TXD_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_TXD_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_TXD_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TX} -port_direction {OUT}



# Add AND4_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND4} -instance_name {AND4_0}



# Add LiteFast_receiver_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {LiteFast_receiver} -instance_name {LiteFast_receiver_0}
sd_create_pin_group -sd_name ${sd_name} -group_name {clk} -instance_name {LiteFast_receiver_0} -pin_names {"clk_tx_i" "clk_125_i" "clk_rx_i" }



# Add LiteFast_receiver_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {LiteFast_receiver} -instance_name {LiteFast_receiver_1}
sd_create_pin_group -sd_name ${sd_name} -group_name {clk} -instance_name {LiteFast_receiver_1} -pin_names {"clk_125_i" "clk_tx_i" "clk_rx_i" }



# Add LiteFast_receiver_2 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {LiteFast_receiver} -instance_name {LiteFast_receiver_2}
sd_create_pin_group -sd_name ${sd_name} -group_name {clk} -instance_name {LiteFast_receiver_2} -pin_names {"clk_125_i" "clk_tx_i" "clk_rx_i" }



# Add LiteFast_receiver_3 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {LiteFast_receiver} -instance_name {LiteFast_receiver_3}
sd_create_pin_group -sd_name ${sd_name} -group_name {clk} -instance_name {LiteFast_receiver_3} -pin_names {"clk_125_i" "clk_tx_i" "clk_rx_i" }



# Add LiteFast_transmitter_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {LiteFast_transmitter} -instance_name {LiteFast_transmitter_0}



# Add LiteFast_transmitter_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {LiteFast_transmitter} -instance_name {LiteFast_transmitter_1}



# Add LiteFast_transmitter_2 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {LiteFast_transmitter} -instance_name {LiteFast_transmitter_2}



# Add LiteFast_transmitter_3 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {LiteFast_transmitter} -instance_name {LiteFast_transmitter_3}



# Add transceiver_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {transceiver} -instance_name {transceiver_0}
sd_create_pin_group -sd_name ${sd_name} -group_name {RX_CLK_R} -instance_name {transceiver_0} -pin_names {"LANE2_RX_CLK_R" "LANE0_RX_CLK_R" "LANE1_RX_CLK_R" "LANE3_RX_CLK_R" }
sd_create_pin_group -sd_name ${sd_name} -group_name {RX_VAL} -instance_name {transceiver_0} -pin_names {"LANE3_RX_VAL" "LANE0_RX_VAL" "LANE1_RX_VAL" "LANE2_RX_VAL" }
sd_create_pin_group -sd_name ${sd_name} -group_name {TX_CLK_STABLE} -instance_name {transceiver_0} -pin_names {"LANE1_TX_CLK_STABLE" "LANE0_TX_CLK_STABLE" "LANE2_TX_CLK_STABLE" "LANE3_TX_CLK_STABLE" }
sd_create_pin_group -sd_name ${sd_name} -group_name {TX_CLK_R} -instance_name {transceiver_0} -pin_names {"LANE0_TX_CLK_R" "LANE3_TX_CLK_R" "LANE2_TX_CLK_R" "LANE1_TX_CLK_R" }
sd_create_pin_group -sd_name ${sd_name} -group_name {RX_DATA} -instance_name {transceiver_0} -pin_names {"LANE0_RX_DATA" "LANE3_RX_DATA" "LANE1_RX_DATA" "LANE2_RX_DATA" }
sd_create_pin_group -sd_name ${sd_name} -group_name {L_8B10B_RX_K} -instance_name {transceiver_0} -pin_names {"LANE2_8B10B_RX_K" "LANE0_8B10B_RX_K" "LANE1_8B10B_RX_K" "LANE3_8B10B_RX_K" }
sd_create_pin_group -sd_name ${sd_name} -group_name {PADs_OUT} -instance_name {transceiver_0} -pin_names {"LANE3_TXD_P" "LANE0_TXD_N" "LANE0_TXD_P" "LANE1_TXD_N" "LANE1_TXD_P" "LANE2_TXD_P" "LANE2_TXD_N" "LANE3_TXD_N" }
sd_create_pin_group -sd_name ${sd_name} -group_name {PADs_IN} -instance_name {transceiver_0} -pin_names {"LANE2_RXD_P" "LANE0_RXD_N" "LANE0_RXD_P" "LANE1_RXD_N" "LANE1_RXD_P" "LANE2_RXD_N" "LANE3_RXD_P" "LANE3_RXD_N" }
sd_create_pin_group -sd_name ${sd_name} -group_name {L_8B10B_TX_K} -instance_name {transceiver_0} -pin_names {"LANE2_8B10B_TX_K" "LANE0_8B10B_TX_K" "LANE1_8B10B_TX_K" "LANE3_8B10B_TX_K" }
sd_create_pin_group -sd_name ${sd_name} -group_name {TX_DATA} -instance_name {transceiver_0} -pin_names {"LANE0_TX_DATA" "LANE1_TX_DATA" "LANE2_TX_DATA" "LANE3_TX_DATA" }



# Add UART_IF_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {UART_IF} -instance_name {UART_IF_0}
sd_create_pin_group -sd_name ${sd_name} -group_name {crc_error} -instance_name {UART_IF_0} -pin_names {"lane2_crc_error_i" "lane0_crc_error_i" "lane1_crc_error_i" "lane3_crc_error_i" }
sd_create_pin_group -sd_name ${sd_name} -group_name {payload_error} -instance_name {UART_IF_0} -pin_names {"lane3_payload_error_i" "lane0_payload_error_i" "lane1_payload_error_i" "lane2_payload_error_i" }
sd_create_pin_group -sd_name ${sd_name} -group_name {rx_error} -instance_name {UART_IF_0} -pin_names {"lane2_rx_error_i" "lane0_rx_error_i" "lane1_rx_error_i" "lane3_rx_error_i" }
sd_create_pin_group -sd_name ${sd_name} -group_name {rx_lock} -instance_name {UART_IF_0} -pin_names {"lane3_rx_lock_i" "lane0_rx_lock_i" "lane1_rx_lock_i" "lane2_rx_lock_i" }
sd_create_pin_group -sd_name ${sd_name} -group_name {rx_valid} -instance_name {UART_IF_0} -pin_names {"lane3_rx_valid_i" "lane0_rx_valid_i" "lane1_rx_valid_i" "lane2_rx_valid_i" }
sd_create_pin_group -sd_name ${sd_name} -group_name {tx_clk_stable} -instance_name {UART_IF_0} -pin_names {"lane2_tx_clk_stable" "lane0_tx_clk_stable" "lane1_tx_clk_stable" "lane3_tx_clk_stable" }
sd_create_pin_group -sd_name ${sd_name} -group_name {tx_words} -instance_name {UART_IF_0} -pin_names {"lane2_tx_words_in" "lane0_tx_words_in" "lane1_tx_words_in" "lane3_tx_words_in" }
sd_create_pin_group -sd_name ${sd_name} -group_name {rx_words} -instance_name {UART_IF_0} -pin_names {"lane0_rx_words_in" "lane1_rx_words_in" "lane2_rx_words_in" "lane3_rx_words_in" }



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_0:A" "transceiver_0:LANE0_RX_VAL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_0:B" "transceiver_0:LANE1_RX_VAL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_0:C" "transceiver_0:LANE2_RX_VAL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_0:D" "transceiver_0:LANE3_RX_VAL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_0:Y" "LiteFast_receiver_0:reset_n_i" "LiteFast_receiver_1:reset_n_i" "LiteFast_receiver_2:reset_n_i" "LiteFast_receiver_3:reset_n_i" "LiteFast_transmitter_0:reset_n_i" "LiteFast_transmitter_1:reset_n_i" "LiteFast_transmitter_2:reset_n_i" "LiteFast_transmitter_3:reset_n_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_PMA_ARST_N" "transceiver_0:LANE0_PMA_ARST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RXD_N" "transceiver_0:LANE0_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RXD_P" "transceiver_0:LANE0_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_TXD_N" "transceiver_0:LANE0_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_TXD_P" "transceiver_0:LANE0_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_PMA_ARST_N" "transceiver_0:LANE1_PMA_ARST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_RXD_N" "transceiver_0:LANE1_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_RXD_P" "transceiver_0:LANE1_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_TXD_N" "transceiver_0:LANE1_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_TXD_P" "transceiver_0:LANE1_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE2_PMA_ARST_N" "transceiver_0:LANE2_PMA_ARST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE2_RXD_N" "transceiver_0:LANE2_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE2_RXD_P" "transceiver_0:LANE2_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE2_TXD_N" "transceiver_0:LANE2_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE2_TXD_P" "transceiver_0:LANE2_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE3_PMA_ARST_N" "transceiver_0:LANE3_PMA_ARST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE3_RXD_N" "transceiver_0:LANE3_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE3_RXD_P" "transceiver_0:LANE3_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE3_TXD_N" "transceiver_0:LANE3_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE3_TXD_P" "transceiver_0:LANE3_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:clear_i" "LiteFast_receiver_1:clear_i" "LiteFast_receiver_2:clear_i" "LiteFast_receiver_3:clear_i" "UART_IF_0:clear_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:clk_125_i" "LiteFast_receiver_1:clk_125_i" "LiteFast_receiver_2:clk_125_i" "LiteFast_receiver_3:clk_125_i" "LiteFast_transmitter_0:clk_125_i" "LiteFast_transmitter_1:clk_125_i" "LiteFast_transmitter_2:clk_125_i" "LiteFast_transmitter_3:clk_125_i" "UART_IF_0:clk_125" "clk_125" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:clk_rx_i" "transceiver_0:LANE0_RX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:clk_tx_i" "LiteFast_transmitter_0:clk_tx_i" "transceiver_0:LANE0_TX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:crc_error_o" "UART_IF_0:lane0_crc_error_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:error_o" "UART_IF_0:lane0_payload_error_i" "UART_IF_0:lane0_rx_error_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:lane_aligned_rx_o" "LiteFast_transmitter_0:local_rece_rdy_tx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:lock_o" "UART_IF_0:lane0_rx_lock_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:rx_valid_o" "UART_IF_0:lane0_rx_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:start_i" "LiteFast_receiver_1:start_i" "LiteFast_receiver_2:start_i" "LiteFast_receiver_3:start_i" "LiteFast_transmitter_0:start_i" "LiteFast_transmitter_1:start_i" "LiteFast_transmitter_2:start_i" "LiteFast_transmitter_3:start_i" "UART_IF_0:start_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_1:clk_rx_i" "transceiver_0:LANE1_RX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_1:clk_tx_i" "LiteFast_transmitter_1:clk_tx_i" "transceiver_0:LANE1_TX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_1:crc_error_o" "UART_IF_0:lane1_crc_error_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_1:error_o" "UART_IF_0:lane1_payload_error_i" "UART_IF_0:lane1_rx_error_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_1:lane_aligned_rx_o" "LiteFast_transmitter_1:local_rece_rdy_tx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_1:lock_o" "UART_IF_0:lane1_rx_lock_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_1:rx_valid_o" "UART_IF_0:lane1_rx_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_2:clk_rx_i" "transceiver_0:LANE2_RX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_2:clk_tx_i" "LiteFast_transmitter_2:clk_tx_i" "transceiver_0:LANE2_TX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_2:crc_error_o" "UART_IF_0:lane2_crc_error_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_2:error_o" "UART_IF_0:lane2_payload_error_i" "UART_IF_0:lane2_rx_error_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_2:lane_aligned_rx_o" "LiteFast_transmitter_2:local_rece_rdy_tx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_2:lock_o" "UART_IF_0:lane2_rx_lock_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_2:rx_valid_o" "UART_IF_0:lane2_rx_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_3:clk_rx_i" "transceiver_0:LANE3_RX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_3:clk_tx_i" "LiteFast_transmitter_3:clk_tx_i" "transceiver_0:LANE3_TX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_3:crc_error_o" "UART_IF_0:lane3_crc_error_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_3:error_o" "UART_IF_0:lane3_payload_error_i" "UART_IF_0:lane3_rx_error_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_3:lane_aligned_rx_o" "LiteFast_transmitter_3:local_rece_rdy_tx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_3:lock_o" "UART_IF_0:lane3_rx_lock_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_3:rx_valid_o" "UART_IF_0:lane3_rx_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_transmitter_0:crc_error_tx_i" "LiteFast_transmitter_1:crc_error_tx_i" "LiteFast_transmitter_2:crc_error_tx_i" "LiteFast_transmitter_3:crc_error_tx_i" "UART_IF_0:crc_error_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_transmitter_0:payload_error_tx_i" "LiteFast_transmitter_1:payload_error_tx_i" "LiteFast_transmitter_2:payload_error_tx_i" "LiteFast_transmitter_3:payload_error_tx_i" "UART_IF_0:payload_error_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"REF_CLK_PAD_N" "transceiver_0:REF_CLK_PAD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"REF_CLK_PAD_P" "transceiver_0:REF_CLK_PAD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RX" "UART_IF_0:RX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"TX" "UART_IF_0:TX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"UART_IF_0:lane0_tx_clk_stable" "transceiver_0:LANE0_TX_CLK_STABLE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"UART_IF_0:lane1_tx_clk_stable" "transceiver_0:LANE1_TX_CLK_STABLE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"UART_IF_0:lane2_tx_clk_stable" "transceiver_0:LANE2_TX_CLK_STABLE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"UART_IF_0:lane3_tx_clk_stable" "transceiver_0:LANE3_TX_CLK_STABLE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"UART_IF_0:reset_n" "reset_n" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:Local_Token_o" "LiteFast_transmitter_0:local_token_tx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:Remote_Token_o" "LiteFast_transmitter_0:remote_token_tx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:data_rx_o" "UART_IF_0:lane0_rx_words_in" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:data_tx_o" "UART_IF_0:lane0_tx_words_in" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:lane_data_rx_i" "transceiver_0:LANE0_RX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_0:lane_k_rx_i" "transceiver_0:LANE0_8B10B_RX_K" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_1:Local_Token_o" "LiteFast_transmitter_1:local_token_tx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_1:Remote_Token_o" "LiteFast_transmitter_1:remote_token_tx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_1:data_rx_o" "UART_IF_0:lane1_rx_words_in" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_1:data_tx_o" "UART_IF_0:lane1_tx_words_in" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_1:lane_data_rx_i" "transceiver_0:LANE1_RX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_1:lane_k_rx_i" "transceiver_0:LANE1_8B10B_RX_K" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_2:Local_Token_o" "LiteFast_transmitter_2:local_token_tx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_2:Remote_Token_o" "LiteFast_transmitter_2:remote_token_tx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_2:data_rx_o" "UART_IF_0:lane2_rx_words_in" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_2:data_tx_o" "UART_IF_0:lane2_tx_words_in" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_2:lane_data_rx_i" "transceiver_0:LANE2_RX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_2:lane_k_rx_i" "transceiver_0:LANE2_8B10B_RX_K" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_3:Local_Token_o" "LiteFast_transmitter_3:local_token_tx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_3:Remote_Token_o" "LiteFast_transmitter_3:remote_token_tx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_3:data_rx_o" "UART_IF_0:lane3_rx_words_in" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_3:data_tx_o" "UART_IF_0:lane3_tx_words_in" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_3:lane_data_rx_i" "transceiver_0:LANE3_RX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_receiver_3:lane_k_rx_i" "transceiver_0:LANE3_8B10B_RX_K" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_transmitter_0:LiteFast_data_tx_o" "transceiver_0:LANE0_TX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_transmitter_0:LiteFast_k_tx_o" "transceiver_0:LANE0_8B10B_TX_K" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_transmitter_1:LiteFast_data_tx_o" "transceiver_0:LANE1_TX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_transmitter_1:LiteFast_k_tx_o" "transceiver_0:LANE1_8B10B_TX_K" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_transmitter_2:LiteFast_data_tx_o" "transceiver_0:LANE2_TX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_transmitter_2:LiteFast_k_tx_o" "transceiver_0:LANE2_8B10B_TX_K" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_transmitter_3:LiteFast_data_tx_o" "transceiver_0:LANE3_TX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_transmitter_3:LiteFast_k_tx_o" "transceiver_0:LANE3_8B10B_TX_K" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "top"
generate_component -component_name ${sd_name}
