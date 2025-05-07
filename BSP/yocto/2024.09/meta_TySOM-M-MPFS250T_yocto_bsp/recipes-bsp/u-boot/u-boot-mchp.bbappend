FILESEXTRAPATHS:append := "${THISDIR}/files:"

SRC_URI:append:tysom-m-mpfs250t = "\
	file://mpfs-tysom-m.dts \
	file://mpfs-tysom-m-u-boot.dtsi \
	"

DEPENDS:append:tysom-m-mpfs250t-amp = " polarfire-soc-amp-examples"

do_configure:prepend:tysom-m-mpfs250t() {
    cp -f ${WORKDIR}/mpfs-tysom-m.dts ${S}/arch/riscv/dts
}

COMPATIBLE_MACHINE = "(tysom-m-mpfs250t)"


