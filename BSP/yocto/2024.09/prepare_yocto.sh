repo init -u https://github.com/polarfire-soc/polarfire-soc-yocto-manifests.git -b 2024.09 -m default.xml
repo sync
repo rebase
mv -r meta_TySOM-M-MPFS250T_yocto_bsp meta-polarfire-soc-yocto-bsp
source ./meta-polarfire-soc-yocto-bsp/polarfire-soc_yocto_setup.sh
bitbake-layers add-layer ../meta_TySOM-M-MPFS250T_yocto_bsp
