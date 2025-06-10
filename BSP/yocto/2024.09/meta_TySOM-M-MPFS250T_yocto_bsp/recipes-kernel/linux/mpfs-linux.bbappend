FILESEXTRAPATHS:append := ":${THISDIR}/files"

SRC_URI:append:tysom-m-mpfs250t = " file://mpfs_cmdline.cfg \
                              file://qspi_flash.cfg \
                              file://rpi_sense_hat.cfg \
                              file://mcp23s08_spi.cfg \
                              file://mpfs-tysom-m.dts \
                              file://mpfs-tysom-m-fabric.dtsi \
                            "
SRC_URI:append:tysom-m-mpfs250t-amp = "file://mpfs_amp_cmdline.cfg \
                                    file://qspi_flash.cfg \
                                    file://rpi_sense_hat.cfg \
                                    file://mpfs-tysom-m.dts \
                                    file://mpfs-tysom-m-fabric.dtsi \
                            "
                                   
SRC_URI:append:tysom-m-mpfs250t-pcie = " file://mpfs_cmdline.cfg \
                              file://qspi_flash.cfg \
                              file://rpi_sense_hat.cfg \
                              file://mcp23s08_spi.cfg \
                              file://mpfs-tysom-m-pcie.dts \
                              file://mpfs-tysom-m-fabric.dtsi \
                              file://mpfs-v4l2.cfg \
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
    cp -f ${WORKDIR}/mpfs-tysom-m.dts ${S}/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts
}

COMPATIBLE_MACHINE = "(tysom-m-mpfs250t|tysom-m-mpfs250t-pcie|tysom-m-mpfs250t-amp)"
