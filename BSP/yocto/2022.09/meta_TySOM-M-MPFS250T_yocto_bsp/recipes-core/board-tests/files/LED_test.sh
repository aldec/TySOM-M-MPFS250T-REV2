#!/bin/bash


LED_BASE=0x45000000


LED_R=0x45000090
LED_W=0x450000a0


 echo "Configure leds"

 #set oe register gpio 0,1,2
  devmem2 $LED_BASE  w 0x5 &>/dev/null
  devmem2 $(expr $(( $LED_BASE)) + $((0x4)))   w 0x5 &>/dev/null
  devmem2 $(expr $(( $LED_BASE)) + $((0x8))) w 0x5 &>/dev/null
  devmem2 $LED_W b 0x7
  echo "Check if D3, D4 and D5 LEDS are on and press enter"
  read char
  devmem2 $LED_W b 0x3
  echo "Check if D3 and D4 LEDS are on and press enter"
  read char
  devmem2 $LED_W b 0x1
  echo "CHECK if D3 is on and press enter"
  read char
  devmem2 $LED_W b 0x0
  echo "All leds should be turned off"

exit 0

