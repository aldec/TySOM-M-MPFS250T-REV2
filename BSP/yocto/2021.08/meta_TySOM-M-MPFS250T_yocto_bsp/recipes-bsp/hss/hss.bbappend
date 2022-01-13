FILESEXTRAPATHS_append := ":${THISDIR}/files"

# NOTE: Only using the Payload generator from the HSS
do_configure_tysom-m-mpfs250t () {
        ## taking U-Boot binary and package for HSS
        cp -f ${DEPLOY_DIR_IMAGE}/u-boot.bin ${WORKDIR}/git/
        cp -f ${WORKDIR}/${HSS_PAYLOAD}.yaml ${WORKDIR}/git/tools/hss-payload-generator/
}

# NOTE: Only using the Payload generator from the HSS
do_configure_tysom-m-mpfs250t-amp () {
        ## taking U-Boot binary and package for HSS
        cp -f ${DEPLOY_DIR_IMAGE}/u-boot.bin ${WORKDIR}/git/
        cp -L ${DEPLOY_DIR_IMAGE}/amp-application.elf ${WORKDIR}/git/
        cp -f ${WORKDIR}/${HSS_PAYLOAD}.yaml ${WORKDIR}/git/tools/hss-payload-generator/
}

