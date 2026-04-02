# Creating SmartDesign "LiteFast_receiver"
set sd_name {LiteFast_receiver}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {clk_125_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {clk_rx_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {clk_tx_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {reset_n_i} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {crc_error_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {data_valid_rx_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {lane_aligned_rx_o} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {lane_data_rx_i} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {lane_k_rx_i} -port_direction {IN} -port_range {[3:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {data_rx_o} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {local_token_o} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {remote_token_o} -port_direction {OUT} -port_range {[7:0]}


# Add FIFO_local_token instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREFIFO_C1} -instance_name {FIFO_local_token}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {FIFO_local_token:DATA} -value {00111111}



# Add FIFO_remote_token_crc_err_rx instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREFIFO_C2} -instance_name {FIFO_remote_token_crc_err_rx}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {FIFO_remote_token_crc_err_rx:DATA} -pin_slices {[7:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {FIFO_remote_token_crc_err_rx:DATA} -pin_slices {[8:8]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {FIFO_remote_token_crc_err_rx:Q} -pin_slices {[7:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {FIFO_remote_token_crc_err_rx:Q} -pin_slices {[8:8]}



# Add FIFO_usr_data_rx instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREFIFO_C3} -instance_name {FIFO_usr_data_rx}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {FIFO_usr_data_rx:DATA} -pin_slices {[7:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {FIFO_usr_data_rx:DATA} -pin_slices {[8:8]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {FIFO_usr_data_rx:Q} -pin_slices {[7:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {FIFO_usr_data_rx:Q} -pin_slices {[8:8]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {FIFO_usr_data_rx:FULL}



# Add INV_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {INV} -instance_name {INV_0}



# Add INV_0_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {INV} -instance_name {INV_0_0}



# Add INV_0_0_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {INV} -instance_name {INV_0_0_0}



# Add INV_1 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {INV} -instance_name {INV_1}



# Add INV_2 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {INV} -instance_name {INV_2}



# Add LiteFast_RX_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {LiteFast_RX} -instance_name {LiteFast_RX_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {LiteFast_RX_0:usr_data_rx_o} -pin_slices {[15:8]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {LiteFast_RX_0:usr_data_rx_o[15:8]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {LiteFast_RX_0:usr_data_rx_o} -pin_slices {[23:16]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {LiteFast_RX_0:usr_data_rx_o[23:16]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {LiteFast_RX_0:usr_data_rx_o} -pin_slices {[31:24]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {LiteFast_RX_0:usr_data_rx_o[31:24]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {LiteFast_RX_0:usr_data_rx_o} -pin_slices {[7:0]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {LiteFast_RX_0:word_aligned_rx_i} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {LiteFast_RX_0:block_aligned_rx_o}



# Add valid_first_only_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {valid_first_only} -hdl_file {hdl/valid_first_only.sv} -instance_name {valid_first_only_0}



# Add we_extender instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {pulse_extender} -instance_name {we_extender}
# Exporting Parameters of instance we_extender
sd_configure_core_instance -sd_name ${sd_name} -instance_name {we_extender} -params {\
"N:2" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {we_extender}
sd_update_instance -sd_name ${sd_name} -instance_name {we_extender}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIFO_local_token:EMPTY" "INV_0:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIFO_local_token:FULL" "INV_0_0:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIFO_local_token:RCLOCK" "FIFO_remote_token_crc_err_rx:RCLOCK" "clk_tx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIFO_local_token:RE" "INV_0:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIFO_local_token:RRESET_N" "FIFO_local_token:WRESET_N" "FIFO_remote_token_crc_err_rx:RRESET_N" "FIFO_remote_token_crc_err_rx:WRESET_N" "FIFO_usr_data_rx:RRESET_N" "FIFO_usr_data_rx:WRESET_N" "LiteFast_RX_0:rst_n_rx_i" "LiteFast_RX_0:serdes_rx_val_i" "reset_n_i" "valid_first_only_0:reset_n" "we_extender:reset_n" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIFO_local_token:WCLOCK" "FIFO_remote_token_crc_err_rx:WCLOCK" "FIFO_usr_data_rx:WCLOCK" "LiteFast_RX_0:clk_rx_i" "clk_rx_i" "we_extender:clk" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIFO_local_token:WE" "INV_0_0:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIFO_remote_token_crc_err_rx:DATA[8:8]" "LiteFast_RX_0:crc_err_rx_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIFO_remote_token_crc_err_rx:EMPTY" "INV_2:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIFO_remote_token_crc_err_rx:FULL" "INV_1:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIFO_remote_token_crc_err_rx:Q[8:8]" "crc_error_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIFO_remote_token_crc_err_rx:RE" "INV_2:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIFO_remote_token_crc_err_rx:WE" "INV_1:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIFO_usr_data_rx:DATA[8:8]" "LiteFast_RX_0:usr_data_val_rx_o" "we_extender:pulse_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIFO_usr_data_rx:EMPTY" "INV_0_0_0:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIFO_usr_data_rx:Q[8:8]" "valid_first_only_0:valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIFO_usr_data_rx:RCLOCK" "clk_125_i" "valid_first_only_0:clk" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIFO_usr_data_rx:RE" "INV_0_0_0:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIFO_usr_data_rx:WE" "we_extender:pulse_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_RX_0:lane_aligned_rx_o" "lane_aligned_rx_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_valid_rx_o" "valid_first_only_0:valid_o" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIFO_local_token:Q" "local_token_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIFO_remote_token_crc_err_rx:DATA[7:0]" "LiteFast_RX_0:remote_token_rx_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIFO_remote_token_crc_err_rx:Q[7:0]" "remote_token_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIFO_usr_data_rx:DATA[7:0]" "LiteFast_RX_0:usr_data_rx_o[7:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIFO_usr_data_rx:Q[7:0]" "valid_first_only_0:data_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_RX_0:lane_data_rx_i" "lane_data_rx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_RX_0:lane_k_rx_i" "lane_k_rx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_rx_o" "valid_first_only_0:data_o" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "LiteFast_receiver"
generate_component -component_name ${sd_name}
