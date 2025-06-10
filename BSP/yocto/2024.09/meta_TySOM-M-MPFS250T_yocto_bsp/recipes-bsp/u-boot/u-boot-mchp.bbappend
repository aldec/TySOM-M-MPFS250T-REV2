FILESEXTRAPATHS:append := "${THISDIR}/files:"

SRC_URI:append:tysom-m-mpfs250t = "\
	file://mpfs-tysom-m.dts \
	file://mpfs-tysom-m-u-boot.dtsi \
	file://${UBOOT_ENV}.cmd \
        file://${MACHINE}.cfg \
        file://uEnv.txt \
	"
	
SRC_URI:append:tysom-m-mpfs250t-pcie = "\
	file://mpfs-tysom-m.dts \
	file://mpfs-tysom-m-u-boot.dtsi \
	file://${UBOOT_ENV}.cmd \
        file://${MACHINE}.cfg \
        file://uEnv.txt \
	"

SRC_URI:append:tysom-m-mpfs250t-amp = "\
	file://mpfs-tysom-m.dts \
	file://mpfs-tysom-m-u-boot.dtsi \
	file://${UBOOT_ENV}.cmd \
        file://${MACHINE}.cfg \
        file://uEnv.txt \
	"

DEPENDS:append:tysom-m-mpfs250t-amp = " polarfire-soc-amp-examples"

do_configure:prepend:tysom-m-mpfs250t() {
    cp -f ${WORKDIR}/mpfs-tysom-m.dts ${S}/arch/riscv/dts
}

do_configure:prepend:tysom-m-mpfs250t-pcie() {
    cp -f ${WORKDIR}/mpfs-tysom-m.dts ${S}/arch/riscv/dts
}

do_configure:prepend:tysom-m-mpfs250t-amp() {
    cp -f ${WORKDIR}/mpfs-tysom-m.dts ${S}/arch/riscv/dts
}

COMPATIBLE_MACHINE = "(tysom-m-mpfs250t|tysom-m-mpfs250t-pcie|tysom-m-mpfs250t-amp)"


