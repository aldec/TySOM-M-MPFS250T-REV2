FILESEXTRAPATHS_append := ":${THISDIR}/files"

SRC_URI_append_tysom-m-mpfs250t = " \
            file://tysom-m-mpfs250t.dts \
            file://0006-add-Aldec-TySOM-M-support.patch \
           "

SRC_URI_append_tysom-m-mpfs250t-amp = " \
            file://tysom-m-mpfs250t.dts \
            file://0006-add-Aldec-TySOM-M-support.patch \
           "
# Overwrite this for your server
TFTP_SERVER_IP ?= "127.0.0.1"

do_configure_prepend_tysom-m-mpfs250t() {
    cp -f ${WORKDIR}/tysom-m-mpfs250t.dts ${S}/arch/riscv/dts
    sed -i -e 's,@SERVERIP@,${TFTP_SERVER_IP},g' ${WORKDIR}/${UBOOT_ENV}.txt
    if [ -f "${WORKDIR}/${UBOOT_ENV}.txt" ]; then
        mkimage -O linux -T script -C none -n "U-Boot boot script" \
            -d ${WORKDIR}/${UBOOT_ENV}.txt ${WORKDIR}/boot.scr.uimg
    fi
}

do_configure_prepend_tysom-m-mpfs250t-amp() {
    cp -f ${WORKDIR}/tysom-m-mpfs250t.dts ${S}/arch/riscv/dts
    sed -i -e 's,@SERVERIP@,${TFTP_SERVER_IP},g' ${WORKDIR}/${UBOOT_ENV}.txt
    if [ -f "${WORKDIR}/${UBOOT_ENV}.txt" ]; then
        mkimage -O linux -T script -C none -n "U-Boot boot script" \
            -d ${WORKDIR}/${UBOOT_ENV}.txt ${WORKDIR}/boot.scr.uimg
    fi
}


do_deploy_append_tysom-m-mpfs250t() {
    if [ -f "${WORKDIR}/boot.scr.uimg" ]; then
        install -d ${DEPLOY_DIR_IMAGE}
        install -m 755 ${WORKDIR}/boot.scr.uimg ${DEPLOY_DIR_IMAGE}
    fi
}

do_deploy_append_tysom-m-mpfs250t-amp() {
    if [ -f "${WORKDIR}/boot.scr.uimg" ]; then
        install -d ${DEPLOY_DIR_IMAGE}
        install -m 755 ${WORKDIR}/boot.scr.uimg ${DEPLOY_DIR_IMAGE}
    fi
}

FILES_${PN}-env += "/boot/boot.scr.uimg"
COMPATIBLE_MACHINE = "(tysom-m-mpfs250t|tysom-m-mpfs250t-amp)"
