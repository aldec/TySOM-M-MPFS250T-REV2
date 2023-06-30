# Linux for TySOM-M-MPFS250T
This directory contains TySOM-M-MPFS250T Yocto Project layer. In order to build Linux the PolarFire SoC repository must be downloaded

## Table of Content
1. [Prepare repository](#prepare_repo)
2. [Building Linux OS](#building_linux)
3. [Running Linux OS on the TySOM-M-MPFS250T](#running_linux)

## 1. Prepare repository <a name="prepare_repo"/>
a). "repo" tool installation
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
- Test repo is working
```bash
 $ repo --help
```

b). Download PolarFire SoC repository
- change directory to the yocto/2022.09 directory in Aldec TySOM-M-MPFS250T repository
- initialize repo, synchronize it and rebase
```bash
$ repo init -u https://github.com/polarfire-soc/meta-polarfire-soc-yocto-bsp.git -b 2022.09 -m tools/manifests/riscv-yocto.xml
$ repo sync
$ repo rebase
```
- [OPTIONAL] For older OS, prepare build tools in proper version e.g. tar 3.x and gcc 10.x
```bash
$ cd ./openembedded-core/scripts
$ ./install-buildtools --with-extended-buildtools --url http://downloads.yoctoproject.org/releases/yocto/yocto-3.0.2/
$ cd ../..
```

c). Environment setting
- [OPTIONAL] If you have downloaded the optional tools for older OS in point b) then source it:
```bash
$ source ./openembedded-core/buildtools/environment-setup-x86_64-pokysdk-linux
```
- Source PolarFire Yocto project setup script
```bash
$ source ./meta-polarfire-soc-yocto-bsp/polarfire-soc_yocto_setup.sh
```

d). Add meta_TySOM-M-MPFS250T_yocto_bsp layer
- go to build directory and add the layer using below command:
```bash
$ bitbake-layers add-layer ../meta_TySOM-M-MPFS250T_yocto_bsp
```

## 2. Building Linux OS <a name="building_linux"/>
a). In order to build Linux the environment should be set (Point 1.c Environment setting).
b). After point 1.c you should be in the build directory. Bitbake Linux files:
```bash
$ MACHINE=tysom-m-mpfs250t bitbake mpfs-dev-cli
```
After successfull build the Yocto Project Image and Binaries will be available in:
```bash
build/tmp-glibc/deploy/images/tysom-m-mpfs250t
```

## 3. Running Linux OS on the TySOM-M-MPFS250T <a name="running_linux"/>
To be able to boot Linux OS the TySOM-M-MPFS250T, the board must be programmed with a bitfile and HSS application. Linux OS can be loaded from SD card. Please use the bitfile and HSS for the desired mode (More information can be found in the reference_design directory in this repository)

Preparing SD Card  (Host PC with Linux OS):
- insert SD Card into SD card reader and connect it to your workstation
- check with dmesg command the label of the SD card and use it in the below command instead of **sdX**
```bash
zcat ./tmp-glibc/deploy/images/tysom-m-mpfs250t/mpfs-dev-cli-tysom-m-mpfs250t.wic.gz | sudo dd of=/dev/sdX bs=4M iflag=fullblock oflag=direct conv=fsync status=progress
```
- when the command is complete plug the SD card into the TySOM-M-MPFS250T board, connect micro USB cable to board J6 and power on the board. The Linux console should be visible on the UART1, while the HSS is on the UART0

