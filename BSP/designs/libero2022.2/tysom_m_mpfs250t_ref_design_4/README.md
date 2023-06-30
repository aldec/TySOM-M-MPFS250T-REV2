<a href="https://www.aldec.com/en">
  <img src="https://www.aldec.com/files/file/Aldec_Crescent_rgb_sm.png" width="500" alt="Aldec, Inc. logo" />
</a>

# TySOM-M-MPFS250T Reference design 4

## Table of Content
- [Introduction](#introduction)
- [Supported Interfaces](#supported-interfaces)
- [Generating the design](#generating-design)
- [Running HDMI test](#running-hdmi-test)

## Introduction <a name="introduction"/>

The reference TySOM-M-MPFS250T design is a basic design for this board. The design is provided as a TCL script that will generate the design with the base components in the FPGA (HDMI, DDR) and the microprocessor subsystem from mss directory. 

## Supported Interfaces <a name="supported-interfaces"/>

The following interfaces and modules are supported in this reference design.

1. MSS Interfaces/Modules

| Interface Name  | Version | HSS version |
| --------------- |:-------:|:-----------:|
| DDR             | 2022.2  |   2022.09   |
| USB             | 2022.2  |   2022.09   |
| I2C1            | 2022.2  |   2022.09   |
| ETH1            | 2022.2  |   2022.09   |
| ETH2            | 2022.2  |   2022.09   |
| ETH MDIO        | 2022.2  |   2022.09   |
| UART            | 2022.2  |   2022.09   |
| uSD             | 2022.2  |   2022.09   |
| GPIO LED0       | 2022.2  |   2022.09   |
| GPIO PUSHBUTTON | 2022.2  |   2022.09   |

2. Fabric Interfaces/Modules

| Interface/Module Name | Version | HSS version |
| --------------------- |:-------:|:-----------:|
| DDR                   | 2022.2  |   2022.09   |
| HDMI                  | 2022.2  |   2022.09   |

## Generating the design <a name="generating-design"/>

The following steps needs to be performed to generate the reference design:
- open Libero and press **Project->Execute Script**
- select the desired TCL script
  - The TySOM-M-MPFS250T_SD.tcl will generate the design which will use the SD card,
- wait few seconds for the design generation
- in the Design Flow tab double click on the Generate FPGA Array Data and wait until finish
- double click on Configure Design Initialization Data and Memories and select the eNVM tab
- press Add->Add Boot Mode 1 Client and select the hss.hex file built in the hss directory
- generate Bitstream, and Run PROGRAM action in Design Flow tab

## Running HDMI test <a name="running-hdmi-test"/>

1. Go to the directory with the HDMI bash scripts:

`   cd ../../root`

2. Execute the script to initialize the ADV7511 module:

`   ./config_adv7511.sh`

3. Execute the script that starts the color change procedure:

`   ./change_colours.sh`

4. Example log from running script:

```
   Take a look at the HDMI screen. 
   Check if RED is visible and press enter

   Check if GREEN is visible and press enter

   Check if BLUE is visible and press enter

   Check if GRAY is visible and press enter

   Check if BLACK is visible and press enter

   The script ended successfully! 
```

