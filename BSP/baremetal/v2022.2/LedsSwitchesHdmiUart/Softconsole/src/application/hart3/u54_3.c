/*******************************************************************************
 * Copyright 2019-2022 Microchip FPGA Embedded Systems Solution.
 *
 * SPDX-License-Identifier: MIT
 *
 * MPFS HAL Embedded Software example
 *
 */
/*******************************************************************************
 *
 * Code running on U54 hart 3
 *
 */
#include <stdio.h>
#include <string.h>
#include "mpfs_hal/mss_hal.h"
#include "inc/common.h"

volatile uint32_t count_sw_ints_h3 = 0U;

/* Main function for the HART3(U54_3 processor).
 * Application code running on HART3 is placed here
 *
 * The HART3 goes into WFI. HART0 brings it out of WFI when it raises the first
 * Software interrupt to this HART
 */
void u54_3(void)
{
    volatile uint32_t icount = 0U;

    /* Clear pending software interrupt in case there was any.
       Enable only the software interrupt so that the E51 core can bring this
       core out of WFI by raising a software interrupt. */
    clear_soft_interrupt();
    set_csr(mie, MIP_MSIP);

    /*put this hart into WFI.*/
    do
    {
        __asm("wfi");
    }while(0 == (read_csr(mip) & MIP_MSIP));

    /* The hart is out of WFI, clear the SW interrupt. Hear onwards Application
     * can enable and use any interrupts as required */
    clear_soft_interrupt();

    __enable_irq();

    while (1U)
    {
        icount++;
        if (0x100000U == icount)
        {
            icount = 0U;
        }
    }
}

/* HART3 Software interrupt handler */
void Software_h3_IRQHandler(void)
{
    count_sw_ints_h3++;
}
