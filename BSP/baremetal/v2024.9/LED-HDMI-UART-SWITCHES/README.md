# LED Demo on TySOM-M board

This example project demonstrates the usage of LEDs, Switches, HDMI and UART.

## Using the example

- Open the Libero 2024.2 project from the .tcl script
- In the Design Flow Run Generate FPGA Array Data
- After successfullly finish Run PROGRAM Action to porgram TySOM-M board
- Open Softconsole and import tysom-led-blink project
- Build project
- Run Polarfire SoC program non-secure boot mode 1
- Open terminal on ChA
- Wait until the first message appears in the terminal
- Using the switches and keys 1 and 2 you can change the displayed image and switch the LEDs.

## Known issues

- Some monitors don't support this example.
- Sometimes the board needs to be reset by switching OFF/ON to initialize the HDMI.
