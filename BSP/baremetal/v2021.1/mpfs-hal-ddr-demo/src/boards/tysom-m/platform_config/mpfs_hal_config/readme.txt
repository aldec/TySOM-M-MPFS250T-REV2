Before starting, change the following settings in the file 
src/boards/tysom-m/platform_config/mpfs_hal_config/mss_sw_config.h:

#define LIBERO_SETTING_TIP_CFG_PARAMS    0x07CFE00FUL
#define USE_SW_BCLK_SCK_TRAINING    0x00000001UL
#define SW_TRAING_BCLK_SCLK_OFFSET  0x00000006UL
#define DEBUG_DDR_INIT
//#define DEBUG_DDR_RD_RW_FAIL
//#define DEBUG_DDR_RD_RW_PASS
//#define DEBUG_DDR_CFG_DDR_SGMII_PHY
#define DEBUG_DDR_DDRCFG

and comment line below in file: src/platform/mpfs_hal/common/nwc/mss_ddr.c:
2005: //config_ddr_io_pull_up_downs_rpc_bits();