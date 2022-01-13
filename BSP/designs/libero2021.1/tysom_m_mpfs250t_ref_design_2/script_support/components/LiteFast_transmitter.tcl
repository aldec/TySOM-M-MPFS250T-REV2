# Creating SmartDesign LiteFast_transmitter
set sd_name {LiteFast_transmitter}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {clk_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DATA} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DATA_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DATA_1} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {start_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {local_rece_rdy_tx_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {WCLOCK} -port_direction {IN}

sd_create_bus_port -sd_name ${sd_name} -port_name {local_token_tx_i} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {remote_token_tx_i} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LiteFast_data_tx_o} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LiteFast_k_tx_o} -port_direction {OUT} -port_range {[3:0]}

# Add COREFIFO_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREFIFO_C0} -instance_name {COREFIFO_C0_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {COREFIFO_C0_0:DATA} -pin_slices {[0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {COREFIFO_C0_0:DATA} -pin_slices {[1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {COREFIFO_C0_0:DATA} -pin_slices {[2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {COREFIFO_C0_0:Q} -pin_slices {[0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {COREFIFO_C0_0:Q} -pin_slices {[1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {COREFIFO_C0_0:Q} -pin_slices {[2]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {COREFIFO_C0_0:WE} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {COREFIFO_C0_0:RE} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {COREFIFO_C0_0:FULL}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {COREFIFO_C0_0:EMPTY}



# Add Counter_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {Counter} -instance_name {Counter_0}



# Add LiteFast_C2_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {LiteFast_C2} -instance_name {LiteFast_C2_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {LiteFast_C2_0:simplex_en_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {LiteFast_C2_0:usr_data_rdy_tx_i} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {LiteFast_C2_0:min_remote_token_tx_i} -value {00001000}



# Add synchronizer_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {synchronizer} -instance_name {synchronizer_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_C2_0:clk_tx_i" "synchronizer_0:clk_i" "COREFIFO_C0_0:RCLOCK" "Counter_0:clk_i" "clk_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C0_0:Q[0]" "Counter_0:start_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_C2_0:crc_err_en_tx_i" "COREFIFO_C0_0:Q[1]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Counter_0:payload_error_i" "COREFIFO_C0_0:Q[2]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C0_0:DATA[0]" "DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C0_0:DATA[2]" "DATA_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C0_0:DATA[1]" "DATA_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_C2_0:req_usr_data_tx_o" "synchronizer_0:req_user_data_tx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_C2_0:local_rece_rdy_tx_i" "local_rece_rdy_tx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_C2_0:rst_n_tx_i" "COREFIFO_C0_0:RESET" "Counter_0:reset_n_i" "start_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_C2_0:usr_data_val_tx_i" "synchronizer_0:user_data_val_tx_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C0_0:WCLOCK" "WCLOCK" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"Counter_0:data_out_o" "LiteFast_C2_0:usr_data_tx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_C2_0:LiteFast_data_tx_o" "LiteFast_data_tx_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_C2_0:LiteFast_k_tx_o" "LiteFast_k_tx_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_C2_0:local_token_tx_i" "local_token_tx_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LiteFast_C2_0:remote_token_tx_i" "remote_token_tx_i" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign LiteFast_transmitter
generate_component -component_name ${sd_name}
