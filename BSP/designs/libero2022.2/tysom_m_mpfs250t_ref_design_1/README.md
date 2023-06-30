<a href="https://www.aldec.com/en">
  <img src="https://www.aldec.com/files/file/Aldec_Crescent_rgb_sm.png" width="500" alt="Aldec, Inc. logo" />
</a>

# TySOM-M-MPFS250T Reference design 1

## Table of Content
- [Introduction](#introduction)
- [Supported Interfaces](#supported-interfaces)
- [Generating the design](#generating-design)
- [Using the reference design](#using-reference-design)

## Introduction <a name="introduction"/>

The reference design for TySOM-M-MPFS250T board is a basic design. The design is provided as a TCL script that will generate the design with the base components in the FPGA and the microprocessor subsystem from mss directory.

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
| CAN                   | 2022.2  |   2022.09   |
| I2C0                  | 2022.2  |   2022.09   |

## Generating the design <a name="generating-design"/>

The following steps needs to be performed to generate the reference design:
- start Libero and press **Project->Execute Script**
- select the desired TCL script:
  - TySOM-M-MPFS250T_SD.tcl will generate the design which will use the SD card,
- wait a few seconds for the design generation
- in the **Design Flow** tab double click on the **Generate FPGA Array Data** and wait until finish
- double click on **Configure Design Initialization Data and Memories** and select the eNVM tab
- press **Add->Add Boot Mode 1 Client** and select the *hss.hex* file built in the hss directory
- generate Bitstream, and Run PROGRAM action in Design Flow tab

## Using the reference design <a name="using-reference-design"/>
In order to run Linux using the reference design on the TySOM-M-MPFS250T:
- build HSS in the hss directory accordingly to the instruction provided in this directory.
- generate the reference Libero design using instruction provided in the designs directory
- build Linux image using the instruction provided in the yocto directory
- connect the board using the documentation and power it up
- program the board with bitfile (instruction is in the designs directory)
- copy the Linux files to the SDcard (instruction is inside the yocto directory)
