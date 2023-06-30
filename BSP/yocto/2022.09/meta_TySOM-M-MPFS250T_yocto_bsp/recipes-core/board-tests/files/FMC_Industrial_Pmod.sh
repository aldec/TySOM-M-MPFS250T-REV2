#!/bin/bash


FMC_I_Pmod=0x40000000

FMC_I_R=0x40000090
FMC_I_W=0x400000a0

echo "UART PMODE test - start"
echo "set fmc-industrial pmod as output enable"

 #set oe register gpio 0,2,4,6
  devmem2 $FMC_I_Pmod  w 0x5 &>/dev/null
  devmem2 $(expr $(($FMC_I_Pmod)) + $((0x8))) w 0x5 &>/dev/null
  devmem2 $(expr $(($FMC_I_Pmod)) + $((0x10))) w 0x5 &>/dev/null
  devmem2 $(expr $(($FMC_I_Pmod)) + $((0x18))) w 0x5 &>/dev/null
 echo "set fmc-industrial pmod as input"

 #set in | out register gpio 1,3,5,7
 devmem2 $(expr $(($FMC_I_Pmod)) + $((0x4)))  w 0x2 &>/dev/null
 devmem2 $(expr $(($FMC_I_Pmod)) + $((0xC))) w 0x2 &>/dev/null
 devmem2 $(expr $(($FMC_I_Pmod)) + $((0x14))) w 0x2 &>/dev/null
 devmem2 $(expr $(($FMC_I_Pmod)) + $((0x1C))) w 0x2 &>/dev/null
  
 devmem2 $FMC_I_W w 0x55 &>/dev/null
test_string=`devmem2 $FMC_I_R b`
HEX=`echo ${test_string: -4}`
DEC=$((HEX))
if [ ! $DEC -eq 170 ]; then
    echo "Read status value - $DEC is different than expected 170"
    printf "\e[1;31mTest failed\n\n\e[0m"
    exit 1
else 
    echo "Read status value - $DEC is as expected 170"
fi

 devmem2 $FMC_I_W w 0x00 &>/dev/null
test_string=`devmem2 $FMC_I_R b`
HEX=`echo ${test_string: -4}`
DEC=$((HEX))
if [ ! $DEC -eq 0 ]; then
    echo "Read status value - $DEC is different than expected 0"
    printf "\e[1;31mTest failed\n\n\e[0m"
    exit 1
else 
    echo "Read status value - $DEC is as expected 0"
fi
 printf "\e[1;32mTest passed\n\n\e[0m"
 
exit 0

