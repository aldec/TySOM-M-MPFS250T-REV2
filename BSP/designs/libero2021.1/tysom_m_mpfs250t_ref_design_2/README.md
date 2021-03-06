<a href="https://www.aldec.com/en">
  <img src="https://www.aldec.com/files/file/Aldec_Crescent_rgb_sm.png" width="500" alt="Aldec, Inc. logo" />
</a>

# TySOM-M-MPFS250T Reference design 2 

## Table of Content
- [Introduction](#introduction)
- [Supported Interfaces](#supported-interfaces)
- [Generating the design](#generating-design)
- [Running QSFP test](#running-qsfp-test)

## Introduction <a name="introduction"/>

The reference TySOM-M-MPFS250T design is a basic design for this board. The design is provided as a TCL script that will generate the design with the base components in the FPGA (DDR, QSFP) and the microprocessor subsystem from mss directory. 

## Supported Interfaces <a name="supported-interfaces"/>

The following interfaces and modules are supported in this reference design.

1. MSS Interfaces/Modules

| Interface/Module Name | Version | HSS version |
| --------------------- |:-------:|:-----------:|
| DDR                   | 2021.1  | Patch v1.0  |
| USB                   | 2021.1  | Patch v1.0  |
| I2C1                  | 2021.1  | Patch v1.0  |
| ETH1                  | 2021.1  | Patch v1.0  |
| ETH2                  | 2021.1  | Patch v1.0  |
| ETH MDIO              | 2021.1  | Patch v1.0  |
| UART                  | 2021.1  | Patch v1.0  |
| uSD/eMMC              | 2021.1  | Patch v1.0  |
| GPIO LED0             | 2021.1  | Patch v1.0  |
| GPIO PUSHBUTTON       | 2021.1  | Patch v1.0  |
| eMMC                  | 2021.1  | Patch v1.0  |

2. Fabric Interfaces/Modules

| Interface/Module Name | Version | HSS version |
| --------------------- |:-------:|:-----------:|
| DDR                   | 2021.1  | Patch v1.0  |
| QSFP                  | 2021.1  | Patch v1.0  |

## Generating the design <a name="generating-design"/>

- open Libero and press Project->Execute Script
- select the desired TCL script:
  - TySOM-M-MPFS250T_SD.tcl will generate the design which will use the SD card,
  - TySOM-M-MPFS250T_eMMC.tcl will generate the design which will use the eMMC.
- wait few seconds for the design generation
- In the Design Flow tab double click on the Generate FPGA Array Data and wait until finish
- double click on Configure Design Initialization Data and Memories and select the eNVM tab. 
- press Add->Add Boot Mode 1 Client and select the hss.hex file built in the hss directory.
- Generate Bitstream, and Run PROGRAM action in Design Flow tab.

## Running QSFP test <a name="running-qsfp-test"/>

1. Go to the directory with the QSFP bash scripts:

```
cd ../../root
```

2. Execute the script to test QSFP Interface: (the loopback connector is needed for QSFP interface)

```
./QSFP_test.sh

```

   Take a look at the console message is as below:

```
root@tysom-m-mpfs250t:/root# ./QSFP_test.sh 
QSFP test - start
set QSFP configuration output
set QSFP configuration input
Read initial status value - 51 is as expected 51
set QSFP transmision
Read transmision status value - 221 is as expected 221
Test passed
```

