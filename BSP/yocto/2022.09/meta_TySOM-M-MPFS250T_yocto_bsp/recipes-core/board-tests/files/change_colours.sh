#!/bin/bash

GPIO_NUM=4
GPIO_ADDRESS=0x40000000

for (( i=0; $i < $GPIO_NUM ; i++ ))
do
	devmem2 $(expr $(($GPIO_ADDRESS)) + $((4*$i))) w 0x1 &>/dev/null
done

echo "Take a look at the HDMI screen" 

devmem2 $(expr $(($GPIO_ADDRESS)) + $((0xA0))) w 0x8 &>/dev/null
echo "Check if RED is visible and press enter"
read char

devmem2 $(expr $(($GPIO_ADDRESS)) + $((0xA0))) w 0x2 &>/dev/null
echo "Check if GREEN is visible and press enter"
read char

devmem2 $(expr $(($GPIO_ADDRESS)) + $((0xA0))) w 0x1 &>/dev/null
echo "Check if BLUE is visible and press enter"
read char

devmem2 $(expr $(($GPIO_ADDRESS)) + $((0xA0))) w 0xB &>/dev/null
echo "Check if GRAY is visible and press enter"
read char

devmem2 $(expr $(($GPIO_ADDRESS)) + $((0xA0))) w 0x0 &>/dev/null
echo "Check if BLACK is visible and press enter"
read char

echo "The script ended successfully!"

exit 0
