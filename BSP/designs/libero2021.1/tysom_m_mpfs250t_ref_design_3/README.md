<a href="https://www.aldec.com/en">
  <img src="https://www.aldec.com/files/file/Aldec_Crescent_rgb_sm.png" width="500" alt="Aldec, Inc. logo" />
</a>

# TySOM-M-MPFS250T Reference design 3

## Table of Content
- [Introduction](#introduction)
- [Supported Interfaces](#supported-interfaces)
- [Main features](#main-features)
- [Generating the design](#generating-design)
- [Linux support](#linux-support)
- [Runtime check](#runtime-check)

## Introduction <a name="introduction"/>

The reference TySOM-M-MPFS250T design #3 is an advanced design for this board.
The design is provided as a TCL script that will generate the Libero project with basic MSS functionality support with additional components implemented in the FPGA Fabric, such as Fabric DDR controller and PCIe host controller.

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
| PCIe                  | 2021.1  | Patch v1.0  |


## Main features <a name="main-features"/>

- Fabric DDR controller: 512 MB of additional system memory available in lower 32-bit memory space;
- PCIe: x4 Gen2 Root Complex.

## Generating the design <a name="generating-design"/>

- Open Libero and press Project->Execute Script;
- Select the desired TCL script. The TySOM-M-MPFS250T_SD.tcl will generate the design which will use the SD card, while the TySOM-M-MPFS250T_eMMC.tcl will generate the design which will use the eMMC;
- Wait few seconds for the design generation;
- In the Design Flow tab double click on the Generate FPGA Array Data and wait until finish;
- Double click on Configure Design Initialization Data and Memories and select the eNVM tab; 
- Press Add->Add Boot Mode 1 Client and select eather hss_emmc.hex (for eMMC boot) or hss_sd.hex (for SD card boot) file from extras/hss directory;
- Generate Bitstream, and Run PROGRAM action in Design Flow tab.

## Linux support <a name="linux-support"/>

- Yocto project image have to be re-generated after edited default .dts file in meta_TySOM-M-MPFS250T_yocto_bsp/recipes-kernel/linux/files/tysom-m-mpfs250t/tysom-m-mpfs250t.dts. Open files editor and uncomment PCI device in selected above file. 

## Runtime check <a name="runtime-check"/>

- Fabric DDR: additional system memory should be visible in /proc/meminfo (736 MB Low MSS DDR + 1 GB High MSS DDR + 512 MB Low Fabric DDR, 2272 MB Total);
- PCIe: type lspci to verify current PCIe bus hierarchy.
