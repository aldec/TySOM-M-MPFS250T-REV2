#!/bin/bash

GPIO_NUM=3
GPIO_ADDRESS=0x40000000

for (( i=0; $i < $GPIO_NUM ; i++ ))
do
	devmem2 $(expr $(($GPIO_ADDRESS)) + $((4*$i))) w 0x1 &>/dev/null
done

echo "Take a look at the HDMI screen" 

devmem2 $(expr $(($GPIO_ADDRESS)) + $((0xA0))) w 0x0 &>/dev/null
echo "Check if color boxes pattern is visible and press enter"
read char

devmem2 $(expr $(($GPIO_ADDRESS)) + $((0xA0))) w 0x4 &>/dev/null
echo "Check if vertical eight color bars are visible and press enter"
read char

devmem2 $(expr $(($GPIO_ADDRESS)) + $((0xA0))) w 0x5 &>/dev/null
echo "Check if horizontal eight color bars are visible and press enter"
read char

devmem2 $(expr $(($GPIO_ADDRESS)) + $((0xA0))) w 0x6 &>/dev/null
echo "Check if vertical graded bars from black to white is visible and press enter"
read char

devmem2 $(expr $(($GPIO_ADDRESS)) + $((0xA0))) w 0x7 &>/dev/null
echo "Check if  horizontal graded bars from black to white are visible and press enter"
read char

echo "The script ended successfully!"

exit 0
