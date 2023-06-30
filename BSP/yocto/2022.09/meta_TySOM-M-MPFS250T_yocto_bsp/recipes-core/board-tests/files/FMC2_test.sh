#!/bin/bash


FMC_OUT=0x40000000
FMC_IN=0x41000000

GPIO_NUM=32

FMC_OUT_REST=0x42000000
FMC_IN_REST=0x43000000

GPIO_NUM_REST=2


 #set input and output registers enable
 for (( i=0; $i < $GPIO_NUM ; i++ ))
 do
	devmem2 $(expr $(($FMC_IN)) + $(expr 4 '*' "$i")) w 0x2 &>/dev/null
	devmem2 $(expr $(($FMC_OUT)) + $(expr 4 '*' "$i")) w 0x1 &>/dev/null
 done
 for (( i=0; $i < $GPIO_NUM_REST ; i++ ))
 do
	devmem2 $(expr $(($FMC_IN_REST)) + $(expr 4 '*' "$i")) w 0x2 &>/dev/null
	devmem2 $(expr $(($FMC_OUT_REST)) + $(expr 4 '*' "$i")) w 0x1 &>/dev/null
 done


 echo "FMC Test - start"
 echo "Setting FMC Output to zero and reading it back via FMC Input"
 devmem2 $(expr $(($FMC_OUT)) + $((0xA0))) w 0x0 &>/dev/null
 result=`devmem2 $(expr $(($FMC_IN)) + $((0x90)))`
 HEX=`echo ${result: -10}`
 DEC=$((HEX))
 echo $DEC
 if [ -z "$HEX" ]; then
     echo "Read switch value $HEX is different than expected 0x00000000"
     printf "\e[1;31mTest failed\n\n\e[0m"
     exit 1
 elif [ $DEC -ne 0 ]; then
     echo "Read switch value $HEX is different than expected 0x00000000"
     printf "\e[1;31mTest failed\n\n\e[0m"
     exit 1
 else
     echo "Read value - $HEX - is ok"
 fi

 echo "Setting FMC Output to 0xFFFFFFFF and reading it back via FMC Input"
 devmem2 $(expr $(($FMC_OUT)) + $((0xA0))) w 0xFFFFFFFF &>/dev/null
 result=`devmem2 $(expr $(($FMC_IN)) + $((0x90)))`
 HEX=`echo ${result: -10}`
 DEC=$((HEX))
 if [ -z "$HEX" ]; then
     echo "Read switch value $HEX is different than expected 0x00000000"
     printf "\e[1;31mTest failed\n\n\e[0m"
     exit 1
 elif [ ! $DEC -eq 4294967295 ]; then
     echo "Read switch value $HEX is different than expected 0xFFFFFFFF"
     printf "\e[1;31mTest failed\n\n\e[0m"
     exit 1
 else
     echo "Read value - $HEX - is ok"
 fi

 echo "FMC Test next - start"
 echo "Setting FMC Output to zero and reading it back via FMC Input"
 devmem2 $(expr $(($FMC_OUT_REST)) + $((0xA0))) w 0x0 &>/dev/null
 result=`devmem2 $(expr $(($FMC_IN_REST)) + $((0x90)))`
 HEX=`echo ${result: -10}`
 DEC=$((HEX))
 if [ -z "$HEX" ]; then
     echo "Read switch value $HEX is different than expected 0x00000000"
     printf "\e[1;31mTest failed\n\n\e[0m"
     exit 1
 elif [ ! $DEC -eq 0 ]; then
     echo "Read switch value $HEX is different than expected 0x00000000"
     printf "\e[1;31mTest failed\n\n\e[0m"
     exit 1
 else
     echo "Read value - $HEX - is ok"
 fi
 echo "Setting FMC Output to 0xFFFFFFFF and reading it back via FMC Input"
 devmem2 $(expr $(($FMC_OUT_REST)) + $((0xA0))) w 0xFFFFFFFF &>/dev/null
 result=`devmem2 $(expr $(($FMC_IN_REST)) + $((0x90)))`
 HEX=`echo ${result: -10}`
 DEC=$((HEX))
 if [ -z "$HEX" ]; then
     echo "Read switch value $HEX is different than expected 0x00000000"
     printf "\e[1;31mTest failed\n\n\e[0m"
     exit 1
 elif [ ! $DEC -eq 3 ]; then
     echo "Read switch value $HEX is different than expected 0x00000003"
     printf "\e[1;31mTest failed\n\n\e[0m"
     exit 1
 else
     echo "Read value - $HEX - is ok"
 fi
 
printf "\e[1;32mTest passed\n\n\e[0m"
exit 0

