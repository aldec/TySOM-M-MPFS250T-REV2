FILESEXTRAPATHS_append := ":${THISDIR}/files"

SRCREV = "83d430636703ef330a7dca55207874fc85a7f1ff"


do_deploy_append_tysom-m-mpfs250t-amp () {
    install -d ${DEPLOY_DIR_IMAGE}
    install -m 755 ${S}/Default/mpfs-amp-freertos.elf ${DEPLOY_DIR_IMAGE}
    ln -sf ${DEPLOY_DIR_IMAGE}/mpfs-amp-freertos.elf ${DEPLOY_DIR_IMAGE}/amp-application.elf 
}



