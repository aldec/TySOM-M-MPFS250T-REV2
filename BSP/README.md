<a href="https://www.aldec.com/en">
  <img src="https://www.aldec.com/files/file/Aldec_Crescent_rgb_sm.png" width="500" alt="Aldec, Inc. logo" />
</a>

# TySOM-M-MPFS250T BSP
This repository provides all necessary files for building and running Linux OS on TySOM-M-MPFS250T board.

## Table of Content
- [Introduction](#introduction)
- [Requirements](#requirements)
    - [Hardware](#requirements-hardware)
    - [Software](#requirements-software)
- [BSP structure](#bsp-structure)
- [Supported Interfaces](#supported-interfaces)
- [Reference designs](#reference-design)
- [Limitations](#limitations)
- [Known problems and issues](#known-problems)

## Introduction <a name="introduction"/>
[TySOM-M-MPFS250T](https://www.aldec.com/en/products/emulation/tysom_boards/polarfire_microchip/tysom_m) is Aldec board based on PolarFire SoC MPFS250T-ES, the first SoC FPGA with 64-bit RISC-V multi-core microprocessor subsystem. There are a few steps that needs to be done to boot Linux on the board:
1. Bitfile generation using Libero SoC with FPGA and microprocessor subsystem configuration.
In the designs/libero2022.2/reference_design directory there are files to generate reference design for TySOM-M-MPFS250T using Libero ( with SD Card ).
2. Building Hart Software Services baremetal application for TySOM-M-MPFS250T.
Aldec delivers a patch for official HSS repository which adds TySOM-M-MPFS250T support. HSS is the baremetal application which is zero stage boot loader (ZSBL) in this flow.
3. Linux OS
Aldec Yocto Project layer that needs to be added to the PolarFire SoC Yocto Project repository to build the Linux.

## Requirements <a name="requirements"/>

### Hardware <a name="requirements-hardware"/>
- TySOM-M-MPFS250T-REV2
- FlashPro 5 or FlashPro 6 programmer
- 2 x Micro USB Cable

### Software <a name="requirements-software"/>
- Libero 2022.2
- SoftConsole 2021.3
## BSP structure <a name="bsp-structure"/>

Aldec TySOM-M-MPFS250T BSP is composed of the following components:
- designs - A set of reference designs to demonstrate how to use different interfaces on the board.
- doc - Foder with documentations.
- hss - An Aldec patch for Hart Software Services for TySOM-M-MPFS250T board.
- mss - PolarFire SoC MSS Configuration project for TySOM-M-MPFS250T.
- yocto - Yocto Project layer for Aldec TySOM-M-MPFS250T board.

## Supported Interfaces <a name="supported-interfaces"/>

1. MSS Interfaces

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

2. Fabric Interfaces

| Interface Name | Version | HSS version |
| -------------- |:-------:|:-----------:|
| DDR-HSIO       | 2022.2  |   2022.09   |
| PMOD           | 2022.2  |   2022.09   |
| HDMI           | 2022.2  |   2022.09   |
| GPIO           | 2022.2  |   2022.09   |
| USER SWITCH    | 2022.2  |   2022.09   |
| CoreUartapb    | 2022.2  |   2022.09   |
| CAN            | 2022.2  |   2022.09   |

## Reference design <a name="reference-design"/>
The BSP package contains as well a set of [reference designs](https://github.com/aldec/TySOM-M-MPFS250T-REV2/tree/revision2.2/BSP/designs) which can be used by customers.

## Limitations <a name="limitations"/>
- The Aldec TySOM-M-MPFS250T-rev2 require Linux / Windows USB driver XR21V link (https://www.maxlinear.com/support/technical-documentation?doctypeid=14)
  Plug the device into the USB host.  You should see up to four devices created,
  typically /dev/ttyXRUSB[0-3].
  
   Check that the CDC-ACM driver was not installed for the Exar USB UART 

	ls /dev/tty*

	To remove the CDC-ACM driver and install the driver:
	
	rmmod cdc-acm
	
	modprobe -r usbserial
	
	modprobe usbserial
	
	insmod ./xr_usb_serial_common.ko

Note: Only Aldec TySOM-M-MPFS250T-rev1 use CDC-ACM driver for Linux / Windows. Other case Aldec TySOM-M-MPFS250T-rev2 use xr_usb_serial. To detect instaled driver use command lsmod. 

- USB Driver - The Microsemi Linux Device Driver for USB does not support the OTG mode. The USB works in the HOST mode when using Linux OS. The mini USB cable (with USB OD shorted to GND) must be plugged in before booting Linux, because the driver does not monitor the USB ID in runtime.

**WARNING: Connecting another USB device in Host mode when the USB VBUS voltage is provided can damage the FPGA and the board.**

- SPI Driver - Lack of Microsemi Linux Device Driver for PolarFire SPI controller.

- PolarFire SoC SPI Master programming mode using onboard memory is not supported on this release.

## Known problems and issues <a name="known-problems"/>
Below is the list of known problems and issues. The issues with (Microchip) label at the beginning are under investigation or development on the Microchip side.

Issue 1: The reboot Linux command cause the system crash.

Solution: Microchip recommends powering off/on the board instead of reboot command.

---

Issue 2: Programming the board via JTAG with bit file cause the Linux boot hangs after first run after the programming.

Solution: Microchip recommendation is to do power off/on the board after the programming.

---

Issue 3: The I2C Microchip Linux Device driver can cause hang of the I2C bus while communication with SI7055 temperature sensor.

Solution: The issue is under investigation. To restore I2C bus state the reboot is required.

---

---

Issue 4: The after driver instalation XR21V or other USB drivers Linux system activate ModenManager service. The ModemManager service grab /dev/ttyXRUSB[0:3] and send message on console as follow "ATE1 E0". 

Solution: The issue is under investigation. The workaround is as follow: (check on centos ) 

For working Linux system 

    systemctl stop ModemManager

next 

    systemctl disable ModemManager

---
