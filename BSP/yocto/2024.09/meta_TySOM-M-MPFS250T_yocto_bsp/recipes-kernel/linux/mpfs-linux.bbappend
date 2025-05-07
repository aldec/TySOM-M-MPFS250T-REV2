FILESEXTRAPATHS:append := ":${THISDIR}/files"

SRC_URI:append:tysom-m-mpfs250t = " file://mpfs_cmdline.cfg \
                              file://qspi_flash.cfg \
                              file://rpi_sense_hat.cfg \
                              file://mcp23s08_spi.cfg \
                            "

SRC_URI:append:tysom-m-mpfs250t-pcie = " file://defconfig"
SRC_URI:append:tysom-m-mpfs250t-amp = " file://defconfig"

COMPATIBLE_MACHINE = "(tysom-m-mpfs250t)"
