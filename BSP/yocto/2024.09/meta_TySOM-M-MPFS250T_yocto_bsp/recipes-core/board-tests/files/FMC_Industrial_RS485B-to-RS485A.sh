#!/bin/bash
#
FMC_RS485=0x43000000
FMC_RS485_R=0x43000090
FMC_RS485_W=0x430000a0
#
printf "Test transmit date between RS485B and RS485A.\n"
printf "Make sure if your FCM-INDUSTRIAL board has connection cable between [J1] Port B and [J1] Port D\n"
# Transmit RS485A on FMC1
devmem2 $FMC_RS485 b 0x05 &>/dev/null
devmem2 0x43000004 b 0x05 &>/dev/null
devmem2 $FMC_RS485_W b 0x0 &>/dev/null
#
printf "Open minicom in TySOM-M. Use command minicom -D /dev/ttyS2\n"
printf "Open any UART console terminal connect to /dev/ttyACM3\n\n"
printf "Press ENTER when minicom on TySOM-M in another window is launched and Host Uart console is ready:\n"
#
read name1
#
printf "Write eny message on HOST terminal connect to /dev/ttyACM3.\n"
sleep 1
#
printf "Press ENTER to Exit : Connection between RS485B (transmitter) and RS485A(receiver) is launched" 
#
read name2
#
