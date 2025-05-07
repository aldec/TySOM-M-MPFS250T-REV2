#!/bin/sh
#
# tysom_m_test.sh - on-board peripherals tests for TySOM-M

# root privileges are required
if [ "$(whoami)" != 'root' ]; then
        echo "Must be root to run $0."
        exit 1;
fi

pushbutton=20


# PushButton
echo "########## User PushButton test ##########"
echo "$pushbutton" > /sys/class/gpio/export
echo in > /sys/class/gpio/gpio"$pushbutton"/direction

echo User PushButton binary value is:
cat /sys/class/gpio/gpio"$pushbutton"/value
pb_value1=`cat /sys/class/gpio/gpio"$pushbutton"/value`

printf "Press and hold pushbutton and press ENTER to check line state:"
read char

echo User PushButton binary value is:
cat /sys/class/gpio/gpio"$pushbutton"/value
pb_value2=`cat /sys/class/gpio/gpio"$pushbutton"/value`
echo "$pushbutton" > /sys/class/gpio/unexport

if [ ! $pb_value1 -eq $pb_value2 ]; then
         printf "Values are not the same. \e[1;32mTest finished with success!\n\n\e[0m"
          STATUS_PUSHBUTTON=1
  else
           printf "Values are the same. \e[1;31mTest failed!\n\n\e[0m"
fi



POWER_SYS_PATH=/sys/class/hwmon/hwmon0

# Check i2c power/current ina219 sensor
if [ -d "$POWER_SYS_PATH" ]; then
    echo "Starting ina219 power sensor test"
    cd $POWER_SYS_PATH
    NAME=$(cat name)
    echo "Sensor's name is $NAME"
    POWER=$(cat power1_input)
    echo "Current power consumption is $POWER uW"
    SHUNT_RESISTOR=$(cat shunt_resistor)
    echo "Shunt resistor is $SHUNT_RESISTOR uOhm"
    SHUNT_VOLTAGE=$(cat in0_input)
    BUS_VOLTAGE=$(cat in1_input)
    VOLTAGE=$(expr $BUS_VOLTAGE - $SHUNT_VOLTAGE) 
    echo "Voltage on shunt resistor is $VOLTAGE mV"
    CURRENT=$(cat curr1_input)
    echo "Current is $CURRENT mA"
    CALC_POWER=$(expr $VOLTAGE \* $CURRENT) 
    echo "Calculated power ($CURRENT * $VOLTAGE) = $CALC_POWER uW and should be simmilar to $POWER." 
    echo "Test complete, check output to view results"
else
    echo "Power sensor (ina219) was not detected in the system, check dmesg for more details"
fi
echo ""

