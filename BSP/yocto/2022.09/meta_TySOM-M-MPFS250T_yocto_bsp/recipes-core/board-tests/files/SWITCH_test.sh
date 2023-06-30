#!/bin/bash


SWITCH_BASE=0x46000000


SWITCH_R=0x46000090
SWITCH_W=0x460000a0

echo "DIP SWITCH test - start"
#set oe register gpio 0,1,2
devmem2 $SWITCH_BASE  w 0x2 &>/dev/null
devmem2 $(expr $(( $SWITCH_BASE)) + $((0x4)))  w 0x2 &>/dev/null
devmem2 $(expr $(( $SWITCH_BASE)) + $((0x8)))  w 0x2 &>/dev/null
devmem2 $(expr $(( $SWITCH_BASE)) + $((0xc)))  w 0x2 &>/dev/null
printf "Set all the switches (S3 S2 S1 S0) to OFF state and press Enter."
read char
result=`devmem2 $SWITCH_R`
HEX=`echo ${result: -10}`
DEC=$((HEX))
if [ ! $DEC -eq 15 ]; then
    echo "Read switch value $HEX is different than expected 0x0000000F"
    printf "\e[1;31mTest failed\n\n\e[0m"
    exit 1
else
    echo "Switch state - $HEX - is ok"
fi

printf "Set all the switches (S3 S2 S1 S0) to ON state and press Enter."
read char
result=`devmem2 $SWITCH_R`
HEX=`echo ${result: -10}`
DEC=$((HEX))

if [ ! $DEC -eq 0 ]; then
    echo "Read switch value $HEX is different than expected 0x00000000"
    printf "\e[1;31mTest failed\n\n\e[0m"
    exit 1
else
    echo "Switch state - $HEX - is ok"
fi
printf "\e[1;32mTest passed\n\n\e[0m"
exit 0

