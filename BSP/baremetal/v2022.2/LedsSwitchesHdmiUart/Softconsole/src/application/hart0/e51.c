/*******************************************************************************
 * Copyright 2019-2022 Microchip FPGA Embedded Systems Solutions.
 *
 * SPDX-License-Identifier: MIT
 *
 * MPFS HAL Embedded Software example
 *
 */
/*******************************************************************************
 *
 * Code running on E51
 *
 */

#include <stdio.h>
#include <string.h>
#include "mpfs_hal/mss_hal.h"
#include "mpfs_hal/mpfs_hal_version.h"
#include "inc/common.h"
#include "drivers/mss/mss_gpio/mss_gpio.h"
#include "drivers/mss/mss_i2c/mss_i2c.h"
#include "inc/hdmi/hdmi_tx.h"


volatile uint32_t g_10ms_count;
mss_uart_instance_t *g_uart= &g_mss_uart0_lo ;

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


uint8_t gpio1_bit6_or_gpio2_bit20_plic_20_IRQHandler(void)
{
    MSS_GPIO_set_output(GPIO2_LO, MSS_GPIO_16, 0x1u);

    MSS_GPIO_clear_irq(GPIO2_LO, MSS_GPIO_20);
    return EXT_IRQ_KEEP_ENABLED;
}


uint8_t gpio1_bit7_or_gpio2_bit21_plic_21_IRQHandler(void)
{
    MSS_GPIO_set_output(GPIO2_LO, MSS_GPIO_17, 0x1u);

    MSS_GPIO_clear_irq(GPIO2_LO, MSS_GPIO_21);
    return EXT_IRQ_KEEP_ENABLED;
}


uint8_t gpio1_bit8_or_gpio2_bit22_plic_22_IRQHandler(void)
{
    MSS_GPIO_set_output(GPIO2_LO, MSS_GPIO_18, 0x1u);
    MSS_GPIO_clear_irq(GPIO2_LO, MSS_GPIO_22);
    return EXT_IRQ_KEEP_ENABLED;
}

uint8_t gpio1_bit9_or_gpio2_bit23_plic_23_IRQHandler(void)
{
    MSS_GPIO_set_output(GPIO1_LO, MSS_GPIO_23, 0x1u);
    MSS_GPIO_clear_irq(GPIO2_LO, MSS_GPIO_23);
    return EXT_IRQ_KEEP_ENABLED;
}


char info_string[200];

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

    MSS_UART_init( g_uart,
            MSS_UART_115200_BAUD,
            MSS_UART_DATA_8_BITS | MSS_UART_NO_PARITY | MSS_UART_ONE_STOP_BIT);

    sprintf(info_string,
            "\r\nHello World\r\n\
Press 1 to switch all LEDs ON.\r\n\
Press 2 to switch all LEDs OFF.\r\n\
Use switches to switch a specific diode ON.");

    MSS_UART_polled_tx(g_uart, (const uint8_t*)info_string,
            (uint32_t)strlen(info_string));

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

    MSS_GPIO_init(GPIO2_LO);
    MSS_GPIO_init(GPIO1_LO);


    MSS_GPIO_config(GPIO2_LO, MSS_GPIO_16, MSS_GPIO_OUTPUT_MODE);
    MSS_GPIO_config(GPIO2_LO, MSS_GPIO_17, MSS_GPIO_OUTPUT_MODE);
    MSS_GPIO_config(GPIO2_LO, MSS_GPIO_18, MSS_GPIO_OUTPUT_MODE);

    MSS_GPIO_config(GPIO1_LO, MSS_GPIO_23, MSS_GPIO_OUTPUT_MODE);

    MSS_GPIO_config(GPIO2_LO, MSS_GPIO_20, MSS_GPIO_INPUT_MODE | MSS_GPIO_IRQ_EDGE_BOTH);
    MSS_GPIO_config(GPIO2_LO, MSS_GPIO_21, MSS_GPIO_INPUT_MODE | MSS_GPIO_IRQ_EDGE_BOTH);
    MSS_GPIO_config(GPIO2_LO, MSS_GPIO_22, MSS_GPIO_INPUT_MODE | MSS_GPIO_IRQ_EDGE_BOTH);
    MSS_GPIO_config(GPIO2_LO, MSS_GPIO_23, MSS_GPIO_INPUT_MODE | MSS_GPIO_IRQ_EDGE_BOTH);

    HDMI_tx_init();

    MSS_GPIO_enable_irq(GPIO2_LO, MSS_GPIO_20);
    MSS_GPIO_enable_irq(GPIO2_LO, MSS_GPIO_21);
    MSS_GPIO_enable_irq(GPIO2_LO, MSS_GPIO_22);
    MSS_GPIO_enable_irq(GPIO2_LO, MSS_GPIO_23);

    while (1u)
    {
        g_rx_size = MSS_UART_get_rx(g_uart, g_rx_buff,
                                            sizeof(g_rx_buff));

        if (g_rx_size > 0u)
        {
            switch (g_rx_buff[0u])
            {
            case '1':
                MSS_GPIO_set_output(GPIO2_LO, MSS_GPIO_16, 0x1);
                MSS_GPIO_set_output(GPIO2_LO, MSS_GPIO_17, 0x1);
                MSS_GPIO_set_output(GPIO2_LO, MSS_GPIO_18, 0x1);
                MSS_GPIO_set_output(GPIO1_LO, MSS_GPIO_23, 0x1);
                break;

            case '2':
                MSS_GPIO_set_output(GPIO2_LO, MSS_GPIO_16, 0x0);
                MSS_GPIO_set_output(GPIO2_LO, MSS_GPIO_17, 0x0);
                MSS_GPIO_set_output(GPIO2_LO, MSS_GPIO_18, 0x0);
                MSS_GPIO_set_output(GPIO1_LO, MSS_GPIO_23, 0x0);
                break;

            default:

                /* Echo the characters received from the terminal */

                MSS_UART_polled_tx_string(g_uart,
                                   g_rx_buff );
            }

            g_rx_size = 0;
        }
    }
}
