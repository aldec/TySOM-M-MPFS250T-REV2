#!/bin/bash


DDR4_PL=0x60000000
DDR4_TEST_SIZE=1M

echo "TEST START"
#memtester -p $DDR4_PL $DDR4_TEST_SIZE 1
result=`memtester -p $DDR4_PL $DDR4_TEST_SIZE 1`
ERROR=`echo $result | grep "FAILURE" -oi | wc -l`

if [ -z "$result" ]; then
    echo "memtester output is empty"
    printf "\e[1;31mTest failed\n\n\e[0m" 
    exit 1
elif [ $ERROR -ne 0 ]; then
    echo "$ERROR memtester tests failed"
    printf "\e[1;31mTest failed\n\n\e[0m"
    exit 1
else
    printf "\e[1;32mTest passed\n\n\e[0m"
fi
echo "TEST FINISH"
exit 0

