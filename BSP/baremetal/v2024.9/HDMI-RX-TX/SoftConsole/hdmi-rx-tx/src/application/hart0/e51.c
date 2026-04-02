#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include "mpfs_hal/mss_hal.h"
#include "mpfs_hal/mpfs_hal_version.h"
#include "inc/common.h"
#include "drivers/mss/mss_gpio/mss_gpio.h"
#include "drivers/mss/mss_i2c/mss_i2c.h"
#include "inc/hdmi/hdmi_tx.h"
#include "inc/hdmi/hdmi_rx.h"
#include "drivers/fpga_ip/CoreGPIO/core_gpio.h"

volatile uint32_t g_10ms_count;
mss_uart_instance_t *g_uart= &g_mss_uart0_lo ;
gpio_instance_t g_gpio_out;

#define RX_BUFF_SIZE    64U
uint8_t g_rx_buff[RX_BUFF_SIZE] = {0};
volatile uint8_t g_rx_size = 0U;
uint32_t uart0_mutex;

/**
 * idle in DTIM
 */
#ifdef E51_ENTER_SLEEP_STATE
__attribute__((section(".ram_codetext"))) static void loop_in_dtim(void)
{
    mb();
    /*Put this hart into WFI.*/
    while(1U)
    {
        do
        {
            __asm("wfi");
        }while(0 == (read_csr(mip) & MIP_MSIP));
    }
}
#endif

uint64_t uart_lock;
uint8_t int_num = 0U;

void uart_printf(const char *format, ...) {
    char buffer[256];
    va_list args;

    va_start(args, format);

    vsnprintf(buffer, sizeof(buffer), format, args);

    va_end(args);

    MSS_UART_polled_tx(g_uart, (const uint8_t*)buffer, (uint32_t)strlen(buffer));
}

#define GPIO_BASE_ADDR 0x40000000

mss_i2c_instance_t *adv7513_i2c = &g_mss_i2c1_lo;
mss_i2c_instance_t *adv7611_i2c = &g_mss_i2c0_lo;

/* Main function for the HART0(E51 processor).
 * Application code running on HART0 is placed here.
 */
void e51(void)
{

    clear_soft_interrupt();
    PLIC_init();
    __enable_irq();
    set_csr(mie, MIP_MSIP);

    (void)mss_config_clk_rst(MSS_PERIPH_MMUART0, (uint8_t) MPFS_HAL_FIRST_HART,
            PERIPHERAL_ON);
    (void)mss_config_clk_rst(MSS_PERIPH_CFM, (uint8_t) MPFS_HAL_FIRST_HART,
            PERIPHERAL_ON);
    (void)mss_config_clk_rst(MSS_PERIPH_GPIO0, (uint8_t) MPFS_HAL_FIRST_HART,
            PERIPHERAL_ON);
    (void)mss_config_clk_rst(MSS_PERIPH_GPIO1, (uint8_t) MPFS_HAL_FIRST_HART,
            PERIPHERAL_ON);
    (void)mss_config_clk_rst(MSS_PERIPH_GPIO2, (uint8_t) MPFS_HAL_FIRST_HART,
            PERIPHERAL_ON);
    (void)mss_config_clk_rst(MSS_PERIPH_CFM, (uint8_t) MPFS_HAL_FIRST_HART,
            PERIPHERAL_ON);
    (void)mss_config_clk_rst(MSS_PERIPH_I2C0, (uint8_t) MPFS_HAL_FIRST_HART,
            PERIPHERAL_ON);
    (void)mss_config_clk_rst(MSS_PERIPH_I2C1, (uint8_t) MPFS_HAL_FIRST_HART, PERIPHERAL_ON);

    MSS_UART_init( g_uart, MSS_UART_115200_BAUD, MSS_UART_DATA_8_BITS | MSS_UART_NO_PARITY | MSS_UART_ONE_STOP_BIT);

    uart_printf("TySOM-M  HDMI-RX-TX Demo\n\r");

    /* Configure Systick. The tick rate is configured in mss_sw_config.h */

    SysTick_Config();

//    Setting the corresponding bit
//    * in GPIO_INTERRUPT_FAB_CR(31:0) will enable GPIO2(31:0) corresponding
//    * interrupt on PLIC.

    SYSREG->GPIO_INTERRUPT_FAB_CR = 0xFFFFFFFFUL;

    PLIC_SetPriority_Threshold(0);

    for (int_num = 0u; int_num <= GPIO2_NON_DIRECT_PLIC; int_num++)
    {
        PLIC_SetPriority(GPIO0_BIT0_or_GPIO2_BIT0_PLIC_0 + int_num, 2u);
    }

    PLIC_SetPriority(FABRIC_F2H_0_PLIC, 2);
    PLIC_EnableIRQ(FABRIC_F2H_0_PLIC);

    MSS_GPIO_init(GPIO1_LO);
    MSS_GPIO_config(GPIO1_LO, MSS_GPIO_23, MSS_GPIO_OUTPUT_MODE);
    MSS_I2C_init(adv7611_i2c, 0x10, MSS_I2C_PCLK_DIV_256);
    MSS_I2C_init(adv7513_i2c, 0x10, MSS_I2C_PCLK_DIV_256);

    GPIO_init(&g_gpio_out, GPIO_BASE_ADDR, GPIO_APB_32_BITS_BUS);

    GPIO_config(&g_gpio_out, MSS_GPIO_0, GPIO_OUTPUT_MODE);
    GPIO_config(&g_gpio_out, MSS_GPIO_1, GPIO_OUTPUT_MODE);

    HDMI_tx_init();
    HDMI_RX_init();

    while(1){}
}
