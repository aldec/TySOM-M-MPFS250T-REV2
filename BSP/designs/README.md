<a href="https://www.aldec.com/en">
  <img src="https://www.aldec.com/files/file/Aldec_Crescent_rgb_sm.png" width="500" alt="Aldec, Inc. logo" />
</a>

# Reference designs for Aldec TySOM-M-MPFS250T board

This directory contains the Libero design for TySOM-M-MPFS250T board.

## Table of Content
- [List of reference designs](#ref-desing-list)
  - [tysom_m_mpfs250t_ref_design_1](#ref-desing-1)
  - [tysom_m_mpfs250t_ref_design_2](#ref-desing-2)
  - [tysom_m_mpfs250t_ref_design_4](#ref-desing-4)
  - [tysom_m_mpfs250t_ref_design_5](#ref-desing-5)

## List of reference designs <a name="ref-desing-list"/>

Here is a list of all provided reference desings for TySOM-M-MPFS250T board.
The designs differ in the supported interface in the FPGA Fabric.

All the reference desings support the following MSS interfaces:

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

A reference design folder contains a comprehensive instruction on building and using a reference design.

### [tysom_m_mpfs250t_ref_design_1](https://github.com/aldec/TySOM-M-MPFS250T-REV2/tree/main/BSP/designs/libero2021.1/tysom_m_mpfs250t_ref_design_1) <a name="ref-desing-1"/>

Supported Fabric Interfaces:

| Interface/Module Name | Version | HSS version |
| --------------------- |:-------:|:-----------:|
| CAN                   | 2022.2  |   2022.09   |
| I2C0                  | 2022.2  |   2022.09   |

### [tysom_m_mpfs250t_ref_design_3](https://github.com/aldec/TySOM-M-MPFS250T-REV2/tree/main/BSP/designs/libero2021.1/tysom_m_mpfs250t_ref_design_3) <a name="ref-desing-2"/>

Supported Fabric Interfaces:

| Interface/Module Name | Version | HSS version |
| --------------------- |:-------:|:-----------:|
| DDR                   | 2022.2  |   2022.09   |
| PCIe                  | 2022.2  |   2022.09   |

### [tysom_m_mpfs250t_ref_design_4](https://github.com/aldec/TySOM-M-MPFS250T-REV2/tree/main/BSP/designs/libero2021.1/tysom_m_mpfs250t_ref_design_4) <a name="ref-desing-4"/>

Supported Fabric Interfaces:

| Interface/Module Name | Version | HSS version |
| --------------------- |:-------:|:-----------:|
| DDR                   | 2022.2  |   2022.09   |
| HDMI                  | 2022.2  |   2022.09   |

### [tysom_m_mpfs250t_ref_design_5](https://github.com/aldec/TySOM-M-MPFS250T-REV2/tree/main/BSP/designs/libero2021.1/tysom_m_mpfs250t_ref_design_5) <a name="ref-desing-5"/>

Supported Fabric Interfaces:

| Interface/Module Name | Version | HSS version |
| --------------------- |:-------:|:-----------:|
| DDR                   | 2022.2  |   2022.09   |
| FMC2                  |         |             |

FMC Cards and interfaces

a. FMC-INDUSTRIAL

| Interface/Module Name |
| --------------------- |
| Digilent Pmod Header  |
| RS485                 |
| CAN                   |
