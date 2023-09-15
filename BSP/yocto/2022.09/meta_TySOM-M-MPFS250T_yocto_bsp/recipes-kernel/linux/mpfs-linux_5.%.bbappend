FILESEXTRAPATHS:append := ":${THISDIR}/files"

SRC_URI:append:tysom-m-mpfs250t = " \
    file://mpfs-tysom-m.dts \
    file://mpfs.dtsi \
    file://mpfs-tysom-m-fabric.dtsi \
    file://bsp_cmdline.cfg \
 "
 
SRC_URI:append:tysom-m-mpfs250t-pcie = " \
    file://mpfs-tysom-m-pcie.dts \
    file://mpfs.dtsi \
    file://mpfs-tysom-m-fabric.dtsi \
    file://bsp_cmdline.cfg \
 "
 
SRC_URI:append:tysom-m-mpfs250t-amp = " \
    file://mpfs-tysom-m-amp.dts \
    file://mpfs.dtsi \
    file://mpfs-tysom-m-fabric.dtsi \
    file://bsp_cmdline.cfg \
 "

do_configure:prepend:tysom-m-mpfs250t() {
    cp -f ${WORKDIR}/mpfs-tysom-m.dts ${S}/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts
    cp -f ${WORKDIR}/mpfs-tysom-m-fabric.dtsi ${S}/arch/riscv/boot/dts/microchip/mpfs-tysom-m-fabric.dtsi
}

do_configure:prepend:tysom-m-mpfs250t-pcie() {
    cp -f ${WORKDIR}/mpfs-tysom-m-pcie.dts ${S}/arch/riscv/boot/dts/microchip/mpfs-tysom-m-pcie.dts
    cp -f ${WORKDIR}/mpfs-tysom-m-fabric.dtsi ${S}/arch/riscv/boot/dts/microchip/mpfs-tysom-m-fabric.dtsi
}

do_configure:prepend:tysom-m-mpfs250t-amp() {
    cp -f ${WORKDIR}/mpfs-tysom-m-context-a.dts ${S}/arch/riscv/boot/dts/microchip/mpfs-tysom-m-context-a.dts
}

SRC_URI:append:tysom-m-mpfs250t = " file://defconfig"
SRC_URI:append:tysom-m-mpfs250t-pcie = " file://defconfig"
SRC_URI:append:tysom-m-mpfs250t-amp = " file://defconfig"

COMPATIBLE_MACHINE = "(tysom-m-mpfs250t|tysom-m-mpfs250t-pcie|tysom-m-mpfs250t-amp)"
