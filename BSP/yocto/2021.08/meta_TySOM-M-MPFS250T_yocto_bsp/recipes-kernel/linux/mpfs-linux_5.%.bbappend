FILESEXTRAPATHS_append := ":${THISDIR}/files"



SRC_URI_append_tysom-m-mpfs250t = " \
    file://tysom-m-mpfs250t.dts \
    file://0004-TySOM-M-MPFS250T-Adding-DTS-makefile.patch \
 "
 
SRC_URI_append_tysom-m-mpfs250t-amp = " \
    file://tysom-m-mpfs250t-amp.dts \
    file://0004-TySOM-M-MPFS250T-Adding-DTS-makefile.patch \
 "
 
do_configure_prepend_tysom-m-mpfs250t() {
    cp -f ${WORKDIR}/tysom-m-mpfs250t.dts ${S}/arch/riscv/boot/dts/aldec/aldec-tysom-m-mpfs250t.dts
}

do_configure_prepend_tysom-m-mpfs250t-amp() {
    cp -f ${WORKDIR}/tysom-m-mpfs250t-amp.dts ${S}/arch/riscv/boot/dts/aldec/aldec-tysom-m-mpfs250t-amp.dts
}


SRC_URI_append_tysom-m-mpfs250t = " file://defconfig"
SRC_URI_append_tysom-m-mpfs250t-amp = " file://defconfig"

COMPATIBLE_MACHINE = "(tysom-m-mpfs250t|tysom-m-mpfs250t-amp)"
