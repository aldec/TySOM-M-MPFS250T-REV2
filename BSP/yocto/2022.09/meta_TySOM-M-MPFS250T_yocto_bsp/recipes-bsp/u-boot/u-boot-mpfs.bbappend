FILESEXTRAPATHS:append := "${THISDIR}/files:"

SRC_URI:append:tysom-m-mpfs250t = "\
	file://mpfs-tysom-m.dts \
	file://mpfs-tysom-m-u-boot.dtsi \
	file://0001-aldec_uboot_v5.patch \
	"

SRC_URI:append:tysom-m-mpfs250t-amp = "\
	file://mpfs-tysom-m-amp.dts \
	file://mpfs-tysom-m-u-boot.dtsi \
	file://0001-aldec_uboot_v5.patch \
	file://0001-aldec_amp.patch \
	"

DEPENDS:append:tysom-m-mpfs250t-amp = " polarfire-soc-amp-examples"

do_configure:prepend:tysom-m-mpfs250t() {
    cp -f ${WORKDIR}/mpfs-tysom-m.dts ${S}/arch/riscv/dts
}

do_configure:prepend:tysom-m-mpfs250t-amp() {
    cp -f ${WORKDIR}/mpfs-tysom-m-amp.dts ${S}/arch/riscv/dts
}

COMPATIBLE_MACHINE = "(tysom-m-mpfs250t|tysom-m-mpfs250t-amp)"


