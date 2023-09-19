# LED Demo on TySOM-M board

This example project demonstrates the usage of LEDs, Switches, HDMI and UART.

## Using the example

- Open the Libero 2022.2 project from the .tcl script
- In the Design Flow Run Generate FPGA Array Data
- After successfullly finish Run PROGRAM Action to porgram TySOM-M board
- Open Softconsole 2021.3 and import tysom-led-blink project
- Build project
- Run Polarfire SoC program non-secure boot mode 1
- Open terminal on ChA
- The following menu should appear
Hello World
Press 1 to switch all LEDs ON.
Press 2 to switch all LEDs OFF.
Use switches to switch a specific diode ON and change colour.

## Known issues

- Some monitors don't support this example.
- Sometimes the board needs to be reset by switching OFF/ON to initialize the HDMI.
