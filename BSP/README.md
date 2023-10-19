<a href="https://www.aldec.com/en">
  <img src="https://www.aldec.com/files/file/Aldec_Crescent_rgb_sm.png" width="500" alt="Aldec, Inc. logo" />
</a>

# TySOM-M-MPFS250T BSP
This repository provides all necessary files for building and running Linux OS on a TySOM-M-MPFS250T board.

## Table of Contents
- [Introduction](#introduction)
- [Requirements](#requirements)
- [BSP structure](#bsp-structure)
- [Supported Interfaces](#supported-interfaces)
- [Reference designs](#reference-design)
- [Limitations](#limitations)
- [Known problems and issues](#known-problems)

## Introduction <a name="introduction"/>
[TySOM-M-MPFS250T](https://www.aldec.com/en/products/emulation/tysom_boards/polarfire_microchip/tysom_m) is an Aldec board based on PolarFire SoC MPFS250T-ES, the first SoC FPGA with 64-bit RISC-V multi-core microprocessor subsystem. There are a few steps that need to be done to boot Linux on the board:
1. Generate bitfile using Libero SoC with FPGA and microprocessor subsystem configuration.
In the designs/libero2022.2/reference_design directory there are files to generate reference design for TySOM-M-MPFS250T using Libero.
2. Build the Hart Software Services baremetal application for TySOM-M-MPFS250T.
Aldec delivers a patch for the official HSS repository which adds TySOM-M-MPFS250T support. HSS is the baremetal application that acts as the zero stage bootloader (ZSBL) in this flow.
3. Add the Linux OS Aldec Yocto Project layer to the PolarFire SoC Yocto Project repository to build the Linux.

## Requirements <a name="requirements"/>

### Hardware <a name="requirements-hardware"/>
- TySOM-M-MPFS250T-REV2
- FlashPro 5 or FlashPro 6 programmer
- 2 x Micro USB Cable

### Software <a name="requirements-software"/>
- Libero 2022.2
- SoftConsole 2021.3
## BSP structure <a name="bsp-structure"/>

The Aldec TySOM-M-MPFS250T BSP contains the following subdirectories:
- baremetal - A set of baremetal applications to use with the board.
- designs - A set of reference designs.
- doc - Folder containing documentations.
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
| uSD/eMMC        | 2022.2  |   2022.09   |
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
| PCIe           | 2022.2  |   2022.09   |

## Reference design <a name="reference-design"/>
In this BSP, users can access a set of [reference designs](https://github.com/aldec/TySOM-M-MPFS250T-REV2/tree/revision2.2/BSP/designs) that demonstrate how to use different interfaces on the board.

## Limitations <a name="limitations"/>
- The Aldec TySOM-M-MPFS250T-rev2 require Linux / Windows USB driver XR21V (https://www.maxlinear.com/support/technical-documentation?doctypeid=14)

Plug the device into the USB host. You should see up to four devices created, typically /dev/ttyXRUSB[0-3].
  
Verify that the Exar USB UART does not have the CDC-ACM driver installed:

```
ls /dev/tty*
```

To remove the CDC-ACM driver and install the driver:
	
```
rmmod cdc-acm
```
```
modprobe -r usbserial
```
```
modprobe usbserial
```
```
insmod ./xr_usb_serial_common.ko
```

Note: Only Aldec TySOM-M-MPFS250T-rev1 uses CDC-ACM driver for Linux / Windows. The Aldec TySOM-M-MPFS250T-rev2 uses xr_usb_serial. To detect the installed driver, use the command lsmod. 

- USB Driver - The Microsemi Linux Device Driver for USB does not support the OTG mode. The USB works in the HOST mode when using Linux OS. The mini USB cable (with USB OD shorted to GND) must be plugged in before booting Linux as the driver does not monitor the USB ID in runtime.

**WARNING: Connecting another USB device in Host mode when the USB VBUS voltage is provided can damage the FPGA and the board.**

- SPI Driver - Microsemi Linux Device Driver for the PolarFire SPI controlleris absent.

- PolarFire SoC SPI Master programming mode using onboard memory is not supported on this release.

## Known problems and issues <a name="known-problems"/>
Below is the list of known problems and issues. The issues with (Microchip) label at the beginning are under investigation or development on the Microchip side.

Issue 1: The reboot Linux command causes the system to crash.

Solution: Microchip recommends powering off/on the board instead of using the reboot command.

---

Issue 2: Programming the board via JTAG with bit file causes the Linux boot to hang after first run after the programming.

Solution: Microchip recommendation is to power off/on the board after the programming.

---

Issue 3: The I2C Microchip Linux Device driver may cause the I2C bus to hang during communication with the SI7055 temperature sensor.

Solution: The issue is under investigation. To restore I2C bus state a reboot is required.

---

---

Issue 4: After installing the XR21V driver or other USB drivers, the Linux system activates the ModemManager service. This service grabs /dev/ttyXRUSB[0:3] and sends the message “ATE1 E0” to the console. 

Solution: The issue is under investigation. The workaround is as follows: (check on centos) 

For working Linux system: 

    systemctl stop ModemManager

next 

    systemctl disable ModemManager

---
