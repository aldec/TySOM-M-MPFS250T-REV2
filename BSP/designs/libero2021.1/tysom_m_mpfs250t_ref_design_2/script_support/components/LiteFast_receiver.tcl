# Creating SmartDesign LiteFast_receiver
set sd_name {LiteFast_receiver}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESET} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {WCLOCK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RCLOCK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {lane_aligned_rx_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {WCLOCK_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DATA} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DATA_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {rx_val_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {lock_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {error_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {crc_error_o} -port_direction {OUT}

sd_create_bus_port -sd_name ${sd_name} -port_name {Local_Token_o} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {lane_data_rx_i} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {lane_k_rx_i} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {data_tx_o} -port_direction {OUT} -port_range {[31:16]}
sd_create_bus_port -sd_name ${sd_name} -port_name {data_rx_o} -port_direction {OUT} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Remote_Token_o} -port_direction {OUT} -port_range {[7:0]}

# Add COREFIFO_C1_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREFIFO_C1} -instance_name {COREFIFO_C1_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {COREFIFO_C1_0:WE} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {COREFIFO_C1_0:RE} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {COREFIFO_C1_0:FULL}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {COREFIFO_C1_0:EMPTY}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {COREFIFO_C1_0:DATA} -value {00111111}



# Add COREFIFO_C2_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREFIFO_C2} -instance_name {COREFIFO_C2_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {COREFIFO_C2_0:DATA} -pin_slices {[0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {COREFIFO_C2_0:DATA} -pin_slices {[1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {COREFIFO_C2_0:Q} -pin_slices {[0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {COREFIFO_C2_0:Q} -pin_slices {[1]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {COREFIFO_C2_0:WE} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {COREFIFO_C2_0:RE} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {COREFIFO_C2_0:FULL}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {COREFIFO_C2_0:EMPTY}



# Add COREFIFO_C3_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREFIFO_C3} -instance_name {COREFIFO_C3_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {COREFIFO_C3_0:DATA} -pin_slices {[15:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {COREFIFO_C3_0:DATA} -pin_slices {[31:16]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {COREFIFO_C3_0:DATA} -pin_slices {[32]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {COREFIFO_C3_0:DATA} -pin_slices {[33]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {COREFIFO_C3_0:DATA} -pin_slices {[34]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {COREFIFO_C3_0:DATA} -pin_slices {[35]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {COREFIFO_C3_0:Q} -pin_slices {[15:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {COREFIFO_C3_0:Q} -pin_slices {[31:16]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {COREFIFO_C3_0:Q} -pin_slices {[32]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {COREFIFO_C3_0:Q} -pin_slices {[33]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {COREFIFO_C3_0:Q} -pin_slices {[34]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {COREFIFO_C3_0:Q} -pin_slices {[35]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {COREFIFO_C3_0:WE} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {COREFIFO_C3_0:RE} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {COREFIFO_C3_0:FULL}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {COREFIFO_C3_0:EMPTY}



# Add COREFIFO_C4_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREFIFO_C4} -instance_name {COREFIFO_C4_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {COREFIFO_C4_0:WE} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {COREFIFO_C4_0:RE} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {COREFIFO_C4_0:FULL}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {COREFIFO_C4_0:EMPTY}



# Add Count_Checker_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {Count_Checker} -instance_name {Count_Checker_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Count_Checker_0:data_tx_o} -pin_slices {[15:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Count_Checker_0:data_tx_o} -pin_slices {[31:16]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Count_Checker_0:data_tx_o[31:16]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Count_Checker_0:data_rx_o} -pin_slices {[15:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Count_Checker_0:data_rx_o} -pin_slices {[31:16]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Count_Checker_0:data_rx_o[31:16]}



# Add LiteFast_C3_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {LiteFast_C3} -instance_name {LiteFast_C3_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {LiteFast_C3_0:word_aligned_rx_i} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {LiteFast_C3_0:block_aligned_rx_o}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C2_0:Q[0]" "Count_Checker_0:start_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C2_0:Q[1]" "Count_Checker_0:clear_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C3_0:DATA[32]" "Count_Checker_0:crc_error_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C3_0:DATA[33]" "Count_Checker_0:error_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C3_0:DATA[34]" "Count_Checker_0:lock_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C3_0:DATA[35]" "Count_Checker_0:rx_val_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C3_0:Q[32]" "crc_error_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C2_0:DATA[0]" "DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C2_0:DATA[1]" "DATA_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C3_0:Q[33]" "error_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_C3_0:lane_aligned_rx_o" "lane_aligned_rx_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Count_Checker_0:crc_error_result_i" "LiteFast_C3_0:crc_err_rx_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Count_Checker_0:usr_data_valid_i" "LiteFast_C3_0:usr_data_val_rx_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C3_0:Q[34]" "lock_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C1_0:RCLOCK" "COREFIFO_C4_0:RCLOCK" "RCLOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C1_0:RESET" "COREFIFO_C2_0:RESET" "COREFIFO_C3_0:RESET" "COREFIFO_C4_0:RESET" "Count_Checker_0:reset_n_i" "Count_Checker_0:rx_val_in" "LiteFast_C3_0:rst_n_rx_i" "LiteFast_C3_0:serdes_rx_val_i" "RESET" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C3_0:Q[35]" "rx_val_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C1_0:WCLOCK" "COREFIFO_C2_0:RCLOCK" "COREFIFO_C3_0:WCLOCK" "COREFIFO_C4_0:WCLOCK" "Count_Checker_0:clk_i" "LiteFast_C3_0:clk_rx_i" "WCLOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C2_0:WCLOCK" "COREFIFO_C3_0:RCLOCK" "WCLOCK_0" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C3_0:DATA[31:16]" "Count_Checker_0:data_rx_o[15:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C3_0:DATA[15:0]" "Count_Checker_0:data_tx_o[15:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C3_0:Q[15:0]" "data_rx_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C3_0:Q[31:16]" "data_tx_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_C3_0:lane_data_rx_i" "lane_data_rx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_C3_0:lane_k_rx_i" "lane_k_rx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C4_0:DATA" "LiteFast_C3_0:remote_token_rx_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_C3_0:usr_data_rx_o" "Count_Checker_0:data_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C1_0:Q" "Local_Token_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Remote_Token_o" "COREFIFO_C4_0:Q" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign LiteFast_receiver
generate_component -component_name ${sd_name}
