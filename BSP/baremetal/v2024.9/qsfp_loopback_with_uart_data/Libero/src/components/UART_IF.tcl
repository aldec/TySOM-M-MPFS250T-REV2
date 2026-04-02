# Creating SmartDesign "UART_IF"
set sd_name {UART_IF}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {RX} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {clk_125} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {data_valid_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {reset_n} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {TX} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {data_valid_o} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {data_i} -port_direction {IN} -port_range {[7:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {data_o} -port_direction {OUT} -port_range {[7:0]}


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



# Add litefast_to_uart_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {litefast_to_uart} -hdl_file {hdl/litefast_to_uart.sv} -instance_name {litefast_to_uart_0}



# Add Reset_Synchronizer_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {Reset_Synchronizer} -instance_name {Reset_Synchronizer_0}



# Add uart_to_litefast_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {uart_to_litefast} -hdl_file {hdl/uart_to_litefast.sv} -instance_name {uart_to_litefast_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREUART_C0_0:CLK" "Reset_Synchronizer_0:clk_i" "clk_125" "litefast_to_uart_0:clk" "uart_to_litefast_0:clk" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREUART_C0_0:OEN" "uart_to_litefast_0:uart_oen_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREUART_C0_0:RESET_N" "Reset_Synchronizer_0:reset_n_o" "litefast_to_uart_0:reset_n" "uart_to_litefast_0:reset_n" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREUART_C0_0:RX" "RX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREUART_C0_0:RXRDY" "uart_to_litefast_0:uart_rxrdy" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREUART_C0_0:TX" "TX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREUART_C0_0:TXRDY" "litefast_to_uart_0:uart_txrdy" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREUART_C0_0:WEN" "litefast_to_uart_0:uart_wen_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Reset_Synchronizer_0:lock_i" "Reset_Synchronizer_0:reset_n_i" "reset_n" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_valid_i" "litefast_to_uart_0:litefast_data_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_valid_o" "uart_to_litefast_0:litefast_data_valid_o" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREUART_C0_0:DATA_IN" "litefast_to_uart_0:uart_data_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREUART_C0_0:DATA_OUT" "uart_to_litefast_0:uart_data_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_i" "litefast_to_uart_0:litefast_data_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_o" "uart_to_litefast_0:litefast_data_o" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "UART_IF"
generate_component -component_name ${sd_name}
