FILESEXTRAPATHS:append = ":${THISDIR}/files"

EXAMPLE_FILES:append:tysom-m-mpfs250t-amp = "\
    amp/rpmsg-pingpong \
    amp/rpmsg-tty-example \
    "
SYSTEMD_SERVICE:${PN}:append:tysom-m-mpfs250t = "collectdiio.service"
SYSTEMD_AUTO_ENABLE:${PN}:append:tysom-m-mpfs250t = "disable"

SYSTEMD_SERVICE:${PN}:append:tysom-m-mpfs250t-amp = "collectdiio.service"
SYSTEMD_AUTO_ENABLE:${PN}:append:tysom-m-mpfs250t-amp = "disable"
