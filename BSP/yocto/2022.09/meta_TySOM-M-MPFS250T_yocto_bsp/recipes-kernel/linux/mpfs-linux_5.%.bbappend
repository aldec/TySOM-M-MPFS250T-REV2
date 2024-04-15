FILESEXTRAPATHS:append := ":${THISDIR}/files"

SRC_URI:append:tysom-m-mpfs250t = " \
    file://mpfs-tysom-m.dts \
    file://bsp_cmdline.cfg \
 "
 
SRC_URI:append:tysom-m-mpfs250t-pcie = " \
    file://mpfs-tysom-m-pcie.dts \
    file://bsp_cmdline.cfg \
 "
 
SRC_URI:append:tysom-m-mpfs250t-amp = " \
    file://mpfs-tysom-m-amp.dts \
    file://bsp_cmdline.cfg \
 "

do_configure:prepend:tysom-m-mpfs250t() {
    cp -f ${WORKDIR}/mpfs-tysom-m.dts ${S}/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts
}

do_configure:prepend:tysom-m-mpfs250t-pcie() {
    cp -f ${WORKDIR}/mpfs-tysom-m-pcie.dts ${S}/arch/riscv/boot/dts/microchip/mpfs-tysom-m-pcie.dts
}

do_configure:prepend:tysom-m-mpfs250t-amp() {
    cp -f ${WORKDIR}/mpfs-tysom-m-amp.dts ${S}/arch/riscv/boot/dts/microchip/mpfs-tysom-m-amp.dts
}

SRC_URI:append:tysom-m-mpfs250t = " file://defconfig"
SRC_URI:append:tysom-m-mpfs250t-pcie = " file://defconfig"
SRC_URI:append:tysom-m-mpfs250t-amp = " file://defconfig"

COMPATIBLE_MACHINE = "(tysom-m-mpfs250t|tysom-m-mpfs250t-pcie|tysom-m-mpfs250t-amp)"
