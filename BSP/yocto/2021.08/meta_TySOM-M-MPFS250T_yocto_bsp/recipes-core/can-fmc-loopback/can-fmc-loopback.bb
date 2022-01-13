DESCRIPTION = "can listener app for TySOM-M-MPFS250T"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

SRC_URI = " \
    file://can_fmc_loopback.c\
    file://LICENSE \
    file://Makefile \
    file://README.md \
"

do_compile[noexec] = "1"

S = "${WORKDIR}"

do_install () {
    install -d ${D}/root
    install -d ${D}/root/can_fmc_loopback
    install -m 0744 ${WORKDIR}/can_fmc_loopback.c ${D}/root/can_fmc_loopback
    install -m 0744 ${WORKDIR}/LICENSE ${D}/root/can_fmc_loopback
    install -m 0744 ${WORKDIR}/Makefile ${D}/root/can_fmc_loopback
    install -m 0744 ${WORKDIR}/README.md ${D}/root/can_fmc_loopback
}
FILES_${PN} += "/root"
