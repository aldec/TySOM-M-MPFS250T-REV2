/*
 * hdmi_config.h
 *
 *  Created on: Jan 20, 2016
 *      Author: Microsemi
 *  Modified on: Jan 05, 2017
 *  	Author: Microsemi
 */

#ifndef HDMI_TX_H_
#define HDMI_TX_H_

#include "drivers/mss/mss_gpio/mss_gpio.h"
#include "drivers/mss/mss_i2c/mss_i2c.h"

#define I2C_HDMI_OUT_ADDR 0x39

#define IIC_HDMI_OUT_CONFIG_LEN  (27)

void HDMI_tx_init(void);

#endif /* HDMI_TX_H_ */
