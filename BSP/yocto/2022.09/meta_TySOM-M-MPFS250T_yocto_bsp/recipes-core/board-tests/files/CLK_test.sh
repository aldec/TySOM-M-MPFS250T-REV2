#!/bin/bash


CLK_MEASURE_BASE=0x72000000

echo "Frequency meter test - start"
echo "Measuring CLK0"
test_string=`devmem2 $(expr $((CLK_MEASURE_BASE))  + $((0x20))) b`
HEX=`echo ${test_string: -4}`
DEC=$((HEX))
if [  $DEC -ge 36 ]; then
    echo "Read value - $DEC MHz is different than expected 33MHz"
    printf "\e[1;31mTest failed\n\n\e[0m"
 
elif [  $DEC -le 30 ]; then
    echo "Read value - $DEC MHz is different than expected 33MHz"
    printf "\e[1;31mTest failed\n\n\e[0m"
else 
    echo "Read value - $DEC MHz is as expected"
fi


echo "Measuring CLK1"
test_string=`devmem2 $(expr $((CLK_MEASURE_BASE))  + $((0x22))) b`
HEX=`echo ${test_string: -4}`
DEC=$((HEX))
if [  $DEC -ge 52 ]; then
    echo "Read value - $DEC MHz is different than expected 49MHz"
    printf "\e[1;31mTest failed\n\n\e[0m"
elif [  $DEC -le 46 ]; then
    echo "Read value - $DEC MHz is different than expected 49MHz"
    printf "\e[1;31mTest failed\n\n\e[0m"
   
else 
    echo "Read value - $DEC MHz is as expected"
fi

echo "MEASURE CLK2"
test_string=`devmem2 $(expr $((CLK_MEASURE_BASE))  + $((0x28))) b`
HEX=`echo ${test_string: -4}`
DEC=$((HEX))
if [  $DEC -ge 127 ]; then
    echo "Read value - $DEC MHz is different than expected 124MHz"
    printf "\e[1;31mTest failed\n\n\e[0m"
elif [  $DEC -le 121 ]; then
    echo "Read value - $DEC MHz is different than expected 124MHz"
    printf "\e[1;31mTest failed\n\n\e[0m"
   

else 
    echo "Read value - $DEC MHz is as expected"
fi

printf "\e[1;32mTest passed\n\n\e[0m"
exit 0

