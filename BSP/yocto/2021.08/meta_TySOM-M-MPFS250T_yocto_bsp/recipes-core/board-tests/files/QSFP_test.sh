#!/bin/bash


QSFP_OUT=0x41000000
QSFP_IN=0x40000000

echo "QSFP test - start"
echo "set QSFP configuration output"
devmem2 $(expr $(($QSFP_OUT))) w 0x1 &>/dev/null
echo "set QSFP configuration input"
devmem2 $(expr $(($QSFP_IN))) w 0x2 &>/dev/null
devmem2$(expr $(($QSFP_IN)) + $((0x04))) w 0x2 &>/dev/null
devmem2$(expr $(($QSFP_IN)) + $((0x08))) w 0x2 &>/dev/null
devmem2$(expr $(($QSFP_IN)) + $((0x0C))) w 0x2 &>/dev/null
devmem2$(expr $(($QSFP_IN)) + $((0x10))) w 0x2 &>/dev/null
devmem2$(expr $(($QSFP_IN)) + $((0x14))) w 0x2 &>/dev/null
devmem2$(expr $(($QSFP_IN)) + $((0x18))) w 0x2 &>/dev/null
devmem2$(expr $(($QSFP_IN)) + $((0x1C))) w 0x2 &>/dev/null
 
test_string=`devmem2 $(expr $(($QSFP_IN)) + $((0x90))) b`
HEX=`echo ${test_string: -4}`
DEC=$((HEX))
if [ ! $DEC -eq 51 ]; then
    echo "Read initial status value - $DEC is different than expected 51"
    printf "\e[1;31mTest failed\n\n\e[0m"
    exit 1
else 
    echo "Read initial status value - $DEC is as expected 51"
fi

 echo "set QSFP transmision"
 devmem2 $(expr $(($QSFP_OUT)) + $((0xA0))) w 0x1 &>/dev/null
 
test_string=`devmem2 $(expr $(($QSFP_IN)) + $((0x90))) b`
HEX=`echo ${test_string: -4}`
DEC=$((HEX))
if [ ! $DEC -eq 221 ]; then
    echo "Read transmision status value - $DEC is different than expected 221"
    printf "\e[1;31mTest failed\n\n\e[0m"
    exit 1
else 
    echo "Read transmision status value - $DEC is as expected 221"
fi
 printf "\e[1;32mTest passed\n\n\e[0m"
 
exit 0

