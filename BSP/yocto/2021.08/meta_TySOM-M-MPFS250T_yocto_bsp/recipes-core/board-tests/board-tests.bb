DESCRIPTION = "board tests for TySOM-M-MPFS250T"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

RDEPENDS_${PN} += "bash"

SRC_URI = " file://tysom_m_test.sh \
            file://eeprom.py \
            file://mma8652.py \
            file://change_colours.sh \
            file://config_adv7511.sh \
            file://DDR4_PL_test.sh \
            file://FMC1_test.sh \
            file://FMC2_test.sh \
            file://SWITCH_test.sh \
            file://LED_test.sh \
            file://QSFP_test.sh \
			file://CLK_test.sh \
"

S = "${WORKDIR}"

do_install () {
    install -d ${D}/root
    install -m 0744 ${WORKDIR}/tysom_m_test.sh ${D}/root
    install -m 0744 ${WORKDIR}/eeprom.py ${D}/root
    install -m 0744 ${WORKDIR}/mma8652.py ${D}/root
    install -m 0744 ${WORKDIR}/change_colours.sh ${D}/root
    install -m 0744 ${WORKDIR}/config_adv7511.sh ${D}/root
    install -m 0744 ${WORKDIR}/DDR4_PL_test.sh ${D}/root
    install -m 0744 ${WORKDIR}/FMC1_test.sh ${D}/root
    install -m 0744 ${WORKDIR}/FMC2_test.sh ${D}/root
    install -m 0744 ${WORKDIR}/SWITCH_test.sh ${D}/root
    install -m 0744 ${WORKDIR}/LED_test.sh ${D}/root
    install -m 0744 ${WORKDIR}/QSFP_test.sh ${D}/root
	install -m 0744 ${WORKDIR}/CLK_test.sh ${D}/root
}
FILES_${PN} += "/root"
