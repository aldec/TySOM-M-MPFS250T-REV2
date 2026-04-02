add wave -divider tb
add wave /tb/*

add wave -divider UART
add wave /tb/top_0/UART_IF_0/start_o
add wave /tb/top_0/UART_IF_0/payload_error_o
add wave /tb/top_0/UART_IF_0/crc_error_o
add wave /tb/top_0/UART_IF_0/clear_o

add wave -divider UART_IF
add wave /tb/top_0/UART_IF_0/*

add wave -divider COREUART
add wave /tb/top_0/UART_IF_0/COREUART_C0_0/*

add wave -divider "COREUART tx_fifo"
add wave /tb/top_0/UART_IF_0/COREUART_C0_0/COREUART_C0_0/genblk2/tx_fifo/*

add wave -divider "COREUART 0"
add wave /tb/top_0/UART_IF_0/COREUART_C0_0/COREUART_C0_0/*

add wave -divider DecodeUART
add wave /tb/top_0/UART_IF_0/DecodeUART_0/*
add wave /tb/top_0/UART_IF_0/DecodeUART_0/data_out_counter_q
add wave /tb/top_0/UART_IF_0/DecodeUART_0/lane_counter_q
add wave /tb/top_0/UART_IF_0/DecodeUART_0/ending_counter_q
add wave /tb/top_0/UART_IF_0/DecodeUART_0/transmit_data_out_q
add wave /tb/top_0/UART_IF_0/DecodeUART_0/check_outputs_q
add wave /tb/top_0/UART_IF_0/DecodeUART_0/tx_words_ascii
add wave /tb/top_0/UART_IF_0/DecodeUART_0/rx_words_ascii
add wave /tb/top_0/UART_IF_0/DecodeUART_0/rx_error_counter_ascii
add wave /tb/top_0/UART_IF_0/DecodeUART_0/rx_error_counter_q
add wave /tb/top_0/UART_IF_0/DecodeUART_0/tx_words_ascii_valid
add wave /tb/top_0/UART_IF_0/DecodeUART_0/rx_words_ascii_valid
add wave /tb/top_0/UART_IF_0/DecodeUART_0/rx_error_counter_ascii_valid
add wave /tb/top_0/UART_IF_0/DecodeUART_0/crc_error_counter_ascii_valid
add wave /tb/top_0/UART_IF_0/DecodeUART_0/ascii_valid
add wave -ascii /tb/top_0/UART_IF_0/DecodeUART_0/uart_message
add wave -ascii /tb/top_0/UART_IF_0/DecodeUART_0/uart_message_q

add wave -divider tx_words_binary32_to_ascii_0
add wave /tb/top_0/UART_IF_0/DecodeUART_0/gen_bin_to_ascii\[0\]/tx_words_binary32_to_ascii/*
add wave -ascii /tb/top_0/UART_IF_0/DecodeUART_0/gen_bin_to_ascii\[0\]/tx_words_binary32_to_ascii/ascii_o

add wave -divider rx_words_binary32_to_ascii_0
add wave /tb/top_0/UART_IF_0/DecodeUART_0/gen_bin_to_ascii\[0\]/rx_words_binary32_to_ascii/*
add wave -ascii /tb/top_0/UART_IF_0/DecodeUART_0/gen_bin_to_ascii\[0\]/rx_words_binary32_to_ascii/ascii_o

add wave -divider rx_error_counter_binary16_to_ascii_0
add wave /tb/top_0/UART_IF_0/DecodeUART_0/gen_bin_to_ascii\[0\]/rx_error_counter_binary16_to_ascii/*
add wave -ascii /tb/top_0/UART_IF_0/DecodeUART_0/gen_bin_to_ascii\[0\]/rx_error_counter_binary16_to_ascii/ascii_o

add wave -divider crc_error_counter_binary16_to_ascii_0
add wave /tb/top_0/UART_IF_0/DecodeUART_0/gen_bin_to_ascii\[0\]/crc_error_counter_binary16_to_ascii/*
add wave -ascii /tb/top_0/UART_IF_0/DecodeUART_0/gen_bin_to_ascii\[0\]/crc_error_counter_binary16_to_ascii/ascii_o

add wave -divider LiteFast_Transmitters
add wave /tb/top_0/LiteFast_transmitter_0/*
add wave /tb/top_0/LiteFast_transmitter_1/*
add wave /tb/top_0/LiteFast_transmitter_2/*
add wave /tb/top_0/LiteFast_transmitter_3/*

add wave -divider "LiteFast_Transmitters / FIFO"
add wave /tb/top_0/LiteFast_transmitter_0/COREFIFO_C0_0/*

add wave -divider "LiteFast_Transmitters / Counter"
add wave /tb/top_0/LiteFast_transmitter_0/Counter_0/*
add wave /tb/top_0/LiteFast_transmitter_1/Counter_0/*
add wave /tb/top_0/LiteFast_transmitter_2/Counter_0/*
add wave /tb/top_0/LiteFast_transmitter_3/Counter_0/*

add wave -divider Transceiver
add wave /tb/top_0/transceiver_0/*

add wave -divider LiteFast_Receivers
add wave /tb/top_0/LiteFast_receiver_0/*
add wave /tb/top_0/LiteFast_receiver_1/*
add wave /tb/top_0/LiteFast_receiver_2/*
add wave /tb/top_0/LiteFast_receiver_3/*

add wave -divider "LiteFast_Receivers / Count_Checker"
add wave /tb/top_0/LiteFast_receiver_0/Count_Checker_0/*
add wave /tb/top_0/LiteFast_receiver_1/Count_Checker_0/*
add wave /tb/top_0/LiteFast_receiver_2/Count_Checker_0/*
add wave /tb/top_0/LiteFast_receiver_3/Count_Checker_0/*
