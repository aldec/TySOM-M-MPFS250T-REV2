# Creating SmartDesign "LiteFast_transmitter"
set sd_name {LiteFast_transmitter}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {clk_125_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {clk_tx_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {crc_error_tx_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {local_rece_rdy_tx_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {reset_n_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {uart_data_valid_i} -port_direction {IN}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {local_token_tx_i} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {remote_token_tx_i} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {uart_data_i} -port_direction {IN} -port_range {[7:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {LiteFast_data_tx_o} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LiteFast_k_tx_o} -port_direction {OUT} -port_range {[3:0]}


# Add FIFO_uart_data instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREFIFO_C0} -instance_name {FIFO_uart_data}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {FIFO_uart_data:DATA} -pin_slices {[7:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {FIFO_uart_data:DATA} -pin_slices {[8:8]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {FIFO_uart_data:Q} -pin_slices {[7:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {FIFO_uart_data:Q} -pin_slices {[8:8]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {FIFO_uart_data:FULL}



# Add INV_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {INV} -instance_name {INV_0}



# Add LiteFast_TX_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {LiteFast_TX} -instance_name {LiteFast_TX_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {LiteFast_TX_0:usr_data_tx_i} -pin_slices {[15:8]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {LiteFast_TX_0:usr_data_tx_i[15:8]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {LiteFast_TX_0:usr_data_tx_i} -pin_slices {[23:16]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {LiteFast_TX_0:usr_data_tx_i[23:16]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {LiteFast_TX_0:usr_data_tx_i} -pin_slices {[31:24]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {LiteFast_TX_0:usr_data_tx_i[31:24]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {LiteFast_TX_0:usr_data_tx_i} -pin_slices {[7:0]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {LiteFast_TX_0:simplex_en_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {LiteFast_TX_0:min_remote_token_tx_i} -value {00001000}



# Add pass_data_to_litefast_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {pass_data_to_litefast} -hdl_file {hdl/pass_data_to_litefast.sv} -instance_name {pass_data_to_litefast_0}



# Add usr_data_rdy_tx_extender instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {pulse_extender} -instance_name {usr_data_rdy_tx_extender}
# Exporting Parameters of instance usr_data_rdy_tx_extender
sd_configure_core_instance -sd_name ${sd_name} -instance_name {usr_data_rdy_tx_extender} -params {\
"N:3" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {usr_data_rdy_tx_extender}
sd_update_instance -sd_name ${sd_name} -instance_name {usr_data_rdy_tx_extender}



# Add we_extender instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {pulse_extender} -instance_name {we_extender}
# Exporting Parameters of instance we_extender
sd_configure_core_instance -sd_name ${sd_name} -instance_name {we_extender} -params {\
"N:2" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {we_extender}
sd_update_instance -sd_name ${sd_name} -instance_name {we_extender}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIFO_uart_data:DATA[8:8]" "uart_data_valid_i" "we_extender:pulse_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIFO_uart_data:EMPTY" "INV_0:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIFO_uart_data:Q[8:8]" "pass_data_to_litefast_0:valid_i" "usr_data_rdy_tx_extender:pulse_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIFO_uart_data:RCLOCK" "LiteFast_TX_0:clk_tx_i" "clk_tx_i" "pass_data_to_litefast_0:clk" "usr_data_rdy_tx_extender:clk" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIFO_uart_data:RE" "INV_0:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIFO_uart_data:RRESET_N" "FIFO_uart_data:WRESET_N" "LiteFast_TX_0:rst_n_tx_i" "pass_data_to_litefast_0:reset_n" "reset_n_i" "usr_data_rdy_tx_extender:reset_n" "we_extender:reset_n" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIFO_uart_data:WCLOCK" "clk_125_i" "we_extender:clk" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIFO_uart_data:WE" "we_extender:pulse_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_TX_0:crc_err_en_tx_i" "crc_error_tx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_TX_0:local_rece_rdy_tx_i" "local_rece_rdy_tx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_TX_0:req_usr_data_tx_o" "pass_data_to_litefast_0:litefast_req_usr_data_tx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_TX_0:usr_data_rdy_tx_i" "usr_data_rdy_tx_extender:pulse_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_TX_0:usr_data_val_tx_i" "pass_data_to_litefast_0:valid_o" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIFO_uart_data:DATA[7:0]" "uart_data_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIFO_uart_data:Q[7:0]" "pass_data_to_litefast_0:data_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_TX_0:LiteFast_data_tx_o" "LiteFast_data_tx_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_TX_0:LiteFast_k_tx_o" "LiteFast_k_tx_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_TX_0:local_token_tx_i" "local_token_tx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_TX_0:remote_token_tx_i" "remote_token_tx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_TX_0:usr_data_tx_i[7:0]" "pass_data_to_litefast_0:data_o" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "LiteFast_transmitter"
generate_component -component_name ${sd_name}
