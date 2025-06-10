# Linux for TySOM-M-MPFS250T
This directory contains the TySOM-M-MPFS250T Yocto Project layer. In order to build Linux the PolarFire SoC repository must be downloaded.

## Table of Contents
1. [Prepare Repository](#prepare_repo)
2. [Building Linux OS](#building_linux)
3. [Running Linux OS on the TySOM-M-MPFS250T](#running_linux)

## 1. Prepare Repository <a name="prepare_repo"/>
### a) "repo" tool installation
- Go to the directory where you keep utilities and make sure it's in your PATH
```bash
 $ cd ~/bin/
```
- Download the repo script
```bash
 $ curl https://storage.googleapis.com/git-repo-downloads/repo > repo
```
- Make repo executable
```bash
 $ chmod a+x repo
```
- Test to see that repo is working
```bash
 $ repo --help
```
### b) Prepare Yocto environment
- For the first time, it is required to download all necessary repositories. To do this, it is provided dedicated yocto script:
```bash
./prepare_yocto.sh
```
- If you have already downloaded all repositories before, just source script below, before starting to build the linux image. 

```bash
source ./meta-polarfire-soc-yocto-bsp/polarfire-soc_yocto_setup.sh
```
## 2. Building Linux OS <a name="building_linux"/>
After steps from 1 b), you should be able to start building Linux image. To run basic version type:
```bash
$ MACHINE=tysom-m-mpfs250t bitbake mpfs-dev-cli
```
To build Linux with PCIe support (required for design 3) type:
```bash
$ MACHINE=tysom-m-mpfs250t-pcie bitbake mpfs-dev-cli
```
To build Linux in AMP mode type:
```bash
$ MACHINE=tysom-m-mpfs250t-amp bitbake mpfs-dev-cli
```

After successful build, the Yocto Project Image and Binaries will be available in:
```bash
build/tmp-glibc/deploy/images/tysom-m-mpfs250t
```
In the case of the PCIe variant in:
```bash
build/tmp-glibc/deploy/images/tysom-m-mpfs250t-pcie
```

In the case of the AMP variant in:
```bash
build/tmp-glibc/deploy/images/tysom-m-mpfs250t-amp
```

## 3. Running Linux OS on the TySOM-M-MPFS250T <a name="running_linux"/>
To be able to boot Linux OS on the TySOM-M-MPFS250T, the board must be programmed with a bitfile and HSS application. Linux OS can be loaded from an SD card or from eMMC, but not at the same time. Please use the bitfile and HSS for the desired mode (more information can be found in the reference_design directory in this repository)

a) Preparing SD Card  (Host PC with Linux OS):
- insert SD Card into SD card reader and connect it to your workstation
- Use the dmesg command to get the label of the SD card and use it in the following command, replacing **sdX**. Please note that if you are creating an image in PCIe mode or AMP mode, the file name and path will be different (**tysom-m-mpfs250t-pcie** or **tysom-m-mpfs250t-amp**):
```bash
zcat ./tmp-glibc/deploy/images/tysom-m-mpfs250t/mpfs-dev-cli-tysom-m-mpfs250t.wic.gz | sudo dd of=/dev/sdX bs=4M iflag=fullblock oflag=direct conv=fsync status=progress
```
- When the command is complete, plug the SD card into the TySOM-M-MPFS250T board, connect micro USB cable to board J6, and power on the board. The Linux console should be visible on the UART1, while the HSS is on the UART0

b) Programming eMMC memory (Host PC with Linux OS)
- In order to program eMMC, the board should be programmed with the bitfile and HSS, and the UARTs should be connected.
Connect the TySOM-M-MPFS250T (J5 micro USB connector) to the Host PC using micro USB
cable.
- Connect micro UART cable to board J6 and start terminal on the UART0 (on the Linux OS it
should be /dev/ttyXRUSB0).
- Power up the board and wait for the HSS. When you see the message below, press a key to
enter the HSS console.
```
[2.03609] HSS_MMCInit(): Attempting to select SDCARD ... [3.14030]
mmc_init_common(): MSS_MMC_init() returned unexpected 0
Failed
[3.22537] HSS_MMCInit(): Attempting to select eMMC ... Passed
Press a key to enter CLI, ESC to skip
Timeout in 5 seconds
.....
```
- Type in the `usbdmsc` command. This should make the eMMC visible for the Host PC.
- Use the `dmesg` command to get the label of the eMMC.
```
[5355529.920785] usb 1-3: new high-speed USB device number 61 using xhci_hcd
[5355530.073468] usb 1-3: New USB device found, idVendor=1514, idProduct=0001,
bcdDevice=30.00
[5355530.073474] usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[5355530.073477] usb 1-3: Product: PolarFireSoc-FlashDrive
[5355530.073480] usb 1-3: Manufacturer: Microchip Inc
[5355530.073483] usb 1-3: SerialNumber: 123456789ABCDEF151411111
[5355530.075893] usb-storage 1-3:1.0: USB Mass Storage device detected
[5355530.076519] scsi host6: usb-storage 1-3:1.0
[5355531.085180] scsi 6:0:0:0: Direct-Access MSCC PolarFireSoC_msd 1234 PQ: 0
ANSI: 4
[5355531.085437] sd 6:0:0:0: Attached scsi generic sg2 type 0
[5355531.091175] sd 6:0:0:0: [sdc] 15273600 512-byte logical blocks: (7.82 GB/7.28 GiB)
```
and use it in the command below, replacing **sdX**:
```
zcat ./tmp-glibc/deploy/images/tysom-m-mpfs250t/mpfs-dev-cli-tysom-m-
mpfs250t.wic.gz | sudo dd of=/dev/sdX bs=4096 iflag=fullblock oflag=direct conv=fsync
status=progress
```
- When the command is complete, power off the board and power it on again. The Linux
console should be visible on the UART1.
