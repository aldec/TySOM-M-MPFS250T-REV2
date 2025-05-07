#!/bin/sh

git clone https://github.com/polarfire-soc/hart-software-services

cd hart-software-services
git checkout v2024.09
git apply ../tysom-m.patch

export PATH=$PATH:$SC_INSTALL_DIR/python3/bin:$SC_INSTALL_DIR/riscv-unknown-elf-gcc/bin
