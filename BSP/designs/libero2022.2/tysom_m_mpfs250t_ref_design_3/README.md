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
| DDR                   | 2022.2  |   2022.09   |
| USB                   | 2022.2  |   2022.09   |
| I2C1                  | 2022.2  |   2022.09   |
| ETH1                  | 2022.2  |   2022.09   |
| ETH2                  | 2022.2  |   2022.09   |
| ETH MDIO              | 2022.2  |   2022.09   |
| UART                  | 2022.2  |   2022.09   |
| uSD/eMMC              | 2022.2  |   2022.09   |
| GPIO LED0             | 2022.2  |   2022.09   |
| GPIO PUSHBUTTON       | 2022.2  |   2022.09   |

2. Fabric Interfaces/Modules

| Interface/Module Name | Version | HSS version |
| --------------------- |:-------:|:-----------:|
| DDR                   | 2022.2  |   2022.09   |
| PCIe                  | 2022.2  |   2022.09   |


## Main features <a name="main-features"/>

- Fabric DDR controller: 512 MB of additional system memory available in lower 32-bit memory space;
- PCIe: x4 Gen2 Root Complex.

## Generating the design <a name="generating-design"/>

- Open Libero and press Project->Execute Script;
- Select the TySOM-M-MPFS250T.tcl TCL script.
- Wait few seconds for the design generation;
- In the Design Flow tab double click on the Generate FPGA Array Data and wait until finish;
- Double click on Configure Design Initialization Data and Memories and select the eNVM tab; 
- Press Add->Add Boot Mode 1 Client and select HSS_PCIe.hex file from extras/HSS directory;
- Generate Bitstream, and Run PROGRAM action in Design Flow tab.

## Linux support <a name="linux-support"/>

- For this example is required to build image with PCIe support. To do this, follow steps from Yocto README but change MACHINE from "tysom-m-mpfs250t" to "tysom-m-mpfs250t-pcie". After build, disk should be called "mpfs-dev-cli-tysom-m-mpfs250t-pcie.wic.gz". 

## Runtime check <a name="runtime-check"/>

- Fabric DDR: additional system memory should be visible in /proc/meminfo (736 MB Low MSS DDR + 1 GB High MSS DDR + 512 MB Low Fabric DDR, 2272 MB Total);
- PCIe: type lspci to verify current PCIe bus hierarchy.

