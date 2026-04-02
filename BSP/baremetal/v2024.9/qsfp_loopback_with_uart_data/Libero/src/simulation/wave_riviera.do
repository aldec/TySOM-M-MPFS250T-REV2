add wave -divider tb
add wave /tb/*

add wave -divider UART
add wave /tb/top_0/UART_IF_0/start_o
add wave /tb/top_0/UART_IF_0/payload_error_o
add wave /tb/top_0/UART_IF_0/crc_error_o
add wave /tb/top_0/UART_IF_0/clear_o

add wave -divider UART_IF
add wave /tb/top_0/UART_IF_0/*

add wave -divider "LiteFast_receiver_0 / valid_first_only"
add wave /tb/top_0/LiteFast_receiver_0/valid_first_only_0/*

add wave -divider COREUART
add wave /tb/top_0/UART_IF_0/COREUART_C0_0/*

add wave -divider "COREUART tx_fifo"
add wave /tb/top_0/UART_IF_0/COREUART_C0_0/COREUART_C0_0/genblk2/tx_fifo/*

add wave -divider "COREUART 0"
add wave /tb/top_0/UART_IF_0/COREUART_C0_0/COREUART_C0_0/*

add wave -divider litefast_to_uart
add wave /tb/top_0/UART_IF_0/litefast_to_uart_0/*

add wave -divider uart_to_litefast
add wave /tb/top_0/UART_IF_0/uart_to_litefast_0/*

add wave -divider LiteFast_Transmitter
add wave /tb/top_0/LiteFast_transmitter_0/*

add wave -divider LiteFast_TX
add wave /tb/top_0/LiteFast_transmitter_0/LiteFast_C2_0/*

add wave -divider "LiteFast_Transmitter / FIFO_uart_data"
add wave /tb/top_0/LiteFast_transmitter_0/FIFO_uart_data/*

add wave -divider "LiteFast_Transmitter / pass_data_to_litefast"
add wave /tb/top_0/LiteFast_transmitter_0/pass_data_to_litefast_0/*


add wave -divider Transceiver
add wave /tb/top_0/transceiver_0/*

add wave -divider LiteFast_Receiver
add wave /tb/top_0/LiteFast_receiver_0/*

add wave -divider LiteFast_RX
add wave /tb/top_0/LiteFast_receiver_0/LiteFast_RX_0_0/*

add wave -divider "LiteFast_Transmitter / FIFO_usr_data_rx"
add wave /tb/top_0/LiteFast_receiver_0/FIFO_usr_data_rx/*

add wave -divider "LiteFast_Transmitter / FIFO_remote_token_crc_err_rx"
add wave /tb/top_0/LiteFast_receiver_0/FIFO_remote_token_crc_err_rx/*