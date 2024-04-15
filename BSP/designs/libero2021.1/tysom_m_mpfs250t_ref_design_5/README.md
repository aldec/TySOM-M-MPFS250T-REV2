<a href="https://www.aldec.com/en">
  <img src="https://www.aldec.com/files/file/Aldec_Crescent_rgb_sm.png" width="500" alt="Aldec, Inc. logo" />
</a>

# TySOM-M-MPFS250T Reference design 5

## Table of Content
- [Introduction](#introduction)
- [Supported Interfaces](#supported-interfaces)
- [Generating the design](#generating-design)
- [Running FMC tests](#running-fmc-tests)

## Introduction <a name="introduction"/>

The reference TySOM-M-MPFS250T design is a basic design for this board. The design is provided as a TCL script that will generate the design with the base components in the FPGA (DDR and FMC2 connector) and the microprocessor subsystem from mss directory. 

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
| FMC2                  |         |             |

3. FMC Cards and interfaces

    a. FMC-INDUSTRIAL


| Interface/Module Name |
| --------------------- |
| Digilent Pmod Header  |
| RS485                 |
| CAN                   |

## Generating the design <a name="generating-design"/>
- open Libero and press Project->Execute Script
- select the desired TCL script. The TySOM-M-MPFS250T_SD.tcl will generate the design which will use the SD card, while the TySOM-M-MPFS250T_eMMC.tcl will generate the design which will use the eMMC
- wait few seconds for the design generation
- In the Design Flow tab double click on the Generate FPGA Array Data and wait until finish
- double click on Configure Design Initialization Data and Memories and select the eNVM tab. 
- press Add->Add Boot Mode 1 Client and select the hss.hex file built in the hss directory.
- Generate Bitstream, and Run PROGRAM action in Design Flow tab.

## Running FMC tests <a name="running-fmc-tests"/>
1. Go to the directory with the FMC bash scripts:

```
cd ../../root`
```

2. Execute the script to test FMC-INDUSTRIAL Pmod interface (need short circuit jumper on FMC-INDUSTRIAL Pmod between 1->2, 3->4, 5->6, 7->8 pins :

```
./FMC_Industrial_Pmode.sh`
```

3. Execute CAN test (need connect CAN bus between FMC-INDUSTRIAL board and TySOM-M-MPFS250T CAN interface : TX, RX, GND):

```
cd ../../root/can_fmc_loopback/`
make clean`
make`	
./can_fmc_loopback`
```

4. Execute DDR4 PL test:

```
./ DDR4_PL_test.sh`
```

5. Script to test FMC-INDUSTRIAL RS485A interface (need connect RS bus between RS485A and RS485B on FMC-INDUSTRIAL board):
5.1.  Execute the script (Transmitted from RS485A to RS485B):

```
./FMC_Industrial_RS485A-to-RS485B.sh`
```

5.2.  Execute the script (Transmitted from RS485B to RS485A):

```
./FMC_Industrial_RS485B-to-RS485A.sh`
```

During test observe log on console
