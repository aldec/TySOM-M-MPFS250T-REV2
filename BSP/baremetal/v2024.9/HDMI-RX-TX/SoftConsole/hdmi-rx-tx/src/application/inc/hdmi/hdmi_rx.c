#include "drivers/mss/mss_i2c/mss_i2c.h"
#include "drivers/fpga_ip/CoreGPIO/core_gpio.h"
#include "hdmi_rx.h"

#define ADV7611_I2C_ADDR      0x4C
#define ADV7611_HDMI_ADDR     0x34
#define ADV7611_CP_ADDR       0x22
#define ADV7611_KSV_ADDR      0x32
#define ADV7611_EDID_ADDR     0x36
#define ADV7611_DPLL_ADDR     0x26
#define ADV7611_INFO_ADDR     0x3E
#define ADV7611_CEC_ADDR      0x40

typedef struct {
    uint8_t slave_addr;
    uint8_t reg;
    uint8_t val;
} my_i2c_struct;

extern mss_i2c_instance_t g_mss_i2c0_lo;
extern gpio_instance_t g_gpio_out;
extern void uart_printf(const char *format, ...);

static my_i2c_struct adv7611_hdmi_config_table[] = {
        {ADV7611_I2C_ADDR, 0x01, 0x06}, // Prim_Mode =110b HDMI-GR
        {ADV7611_I2C_ADDR, 0x02, 0xF2}, // Auto CSC, YCrCb out, Set op_656 bit
        {ADV7611_I2C_ADDR, 0x03, 0x40}, // 16-Bit SDR ITU-R BT.656 4:2:2 Mode 0
        {ADV7611_I2C_ADDR, 0x04, 0x62}, // OP_CH_SEL[2:0] = 011b - (P[15:8] Y, P[7:0] CrCb), XTAL_FREQ[1:0] = 01b (28.63636 MHz)
        {ADV7611_I2C_ADDR, 0x05, 0x28}, // AV Codes on

        {ADV7611_CP_ADDR, 0x7B, 0x05}, //

        {ADV7611_I2C_ADDR, 0x0B, 0x44}, // Power up part
        {ADV7611_I2C_ADDR, 0x0C, 0x42}, // Power up part
        {ADV7611_I2C_ADDR, 0x14, 0x7F}, // Max Drive Strength
        {ADV7611_I2C_ADDR, 0x15, 0x80}, // Disable Tristate of Pins
        {ADV7611_I2C_ADDR, 0x06, 0xA0}, // LLC polarity (INV_LLC_POL = 1)
        {ADV7611_I2C_ADDR, 0x19, 0x80}, // LLC DLL phase (delay = 0)
        {ADV7611_I2C_ADDR, 0x33, 0x40}, // LLC DLL enable

        {ADV7611_CP_ADDR, 0xBA, 0x01}, // Set HDMI FreeRun

        {ADV7611_KSV_ADDR, 0x40, 0x81}, // Disable HDCP 1.1 features

        {ADV7611_HDMI_ADDR, 0x9B, 0x03}, // ADI recommended setting
        {ADV7611_HDMI_ADDR, 0xC1, 0x01}, // ADI recommended setting
        {ADV7611_HDMI_ADDR, 0xC2, 0x01}, // ADI recommended setting
        {ADV7611_HDMI_ADDR, 0xC3, 0x01}, // ADI recommended setting
        {ADV7611_HDMI_ADDR, 0xC4, 0x01}, // ADI recommended setting
        {ADV7611_HDMI_ADDR, 0xC5, 0x01}, // ADI recommended setting
        {ADV7611_HDMI_ADDR, 0xC6, 0x01}, // ADI recommended setting
        {ADV7611_HDMI_ADDR, 0xC7, 0x01}, // ADI recommended setting
        {ADV7611_HDMI_ADDR, 0xC8, 0x01}, // ADI recommended setting
        {ADV7611_HDMI_ADDR, 0xC9, 0x01}, // ADI recommended setting
        {ADV7611_HDMI_ADDR, 0xCA, 0x01}, // ADI recommended setting
        {ADV7611_HDMI_ADDR, 0xCB, 0x01}, // ADI recommended setting
        {ADV7611_HDMI_ADDR, 0xCC, 0x01}, // ADI recommended setting
        {ADV7611_HDMI_ADDR, 0x00, 0x08}, // Set HDMI Input Port A  (BG_MEAS_PORT_SEL = 001b)
        {ADV7611_HDMI_ADDR, 0x02, 0x03}, // Enable Ports A & B in background mode
        {ADV7611_HDMI_ADDR, 0x83, 0xFC}, // Enable clock terminators for port A & B
        {ADV7611_HDMI_ADDR, 0x6F, 0x0C}, // ADI recommended setting
        {ADV7611_HDMI_ADDR, 0x85, 0x1F}, // ADI recommended setting
        {ADV7611_HDMI_ADDR, 0x87, 0x70}, // ADI recommended setting
        {ADV7611_HDMI_ADDR, 0x8D, 0x04}, // LFG Port A
        {ADV7611_HDMI_ADDR, 0x8E, 0x1E}, // HFG Port A
        {ADV7611_HDMI_ADDR, 0x1A, 0x8A}, // Unmute audio
        {ADV7611_HDMI_ADDR, 0x57, 0xDA}, // ADI recommended setting
        {ADV7611_HDMI_ADDR, 0x58, 0x01}, // ADI recommended setting
        {ADV7611_HDMI_ADDR, 0x75, 0x10}, // DDC drive strength
        {ADV7611_HDMI_ADDR, 0x90, 0x04}, // LFG Port B
        {ADV7611_HDMI_ADDR, 0x91, 0x1E},  // HFG Port B
        {0xDE, 0xAD, 0x00}
};

static uint8_t adv7611_edid_content[256] =
{
        0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00,
        0x06, 0xD4, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x16, 0x01, 0x03, 0x81, 0x46, 0x27, 0x78,
        0x0A, 0x32, 0x30, 0xA1, 0x54, 0x52, 0x9E, 0x26,
        0x0A, 0x49, 0x4B, 0xA3, 0x08, 0x00, 0x81, 0xC0,
        0x81, 0x00, 0x81, 0x0F, 0x81, 0x40, 0x81, 0x80,
        0x95, 0x00, 0xB3, 0x00, 0x01, 0x01, 0x02, 0x3A,
        0x80, 0x18, 0x71, 0x38, 0x2D, 0x40, 0x58, 0x2C,
        0x45, 0x00, 0xC4, 0x8E, 0x21, 0x00, 0x00, 0x1E,
        0xA9, 0x1A, 0x00, 0xA0, 0x50, 0x00, 0x16, 0x30,
        0x30, 0x20, 0x37, 0x00, 0xC4, 0x8E, 0x21, 0x00,
        0x00, 0x1A, 0x00, 0x00, 0x00, 0xFC, 0x00, 0x41,
        0x56, 0x4E, 0x45, 0x54, 0x2D, 0x45, 0x4D, 0x42,
        0x56, 0x0A, 0x20, 0x20, 0x00, 0x00, 0x00, 0xFD,
        0x00, 0x38, 0x4B, 0x20, 0x44, 0x11, 0x00, 0x0A,
        0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x01, 0x62,
        0x02, 0x03, 0x1F, 0x71, 0x4B, 0x90, 0x03, 0x04,
        0x05, 0x12, 0x13, 0x14, 0x1F, 0x20, 0x07, 0x16,
        0x26, 0x15, 0x07, 0x50, 0x09, 0x07, 0x01, 0x67,
        0x03, 0x0C, 0x00, 0x10, 0x00, 0x00, 0x1E, 0x01,
        0x1D, 0x00, 0x72, 0x51, 0xD0, 0x1E, 0x20, 0x6E,
        0x28, 0x55, 0x00, 0xC4, 0x8E, 0x21, 0x00, 0x00,
        0x1E, 0x01, 0x1D, 0x80, 0x18, 0x71, 0x1C, 0x16,
        0x20, 0x58, 0x2C, 0x25, 0x00, 0xC4, 0x8E, 0x21,
        0x00, 0x00, 0x9E, 0x8C, 0x0A, 0xD0, 0x8A, 0x20,
        0xE0, 0x2D, 0x10, 0x10, 0x3E, 0x96, 0x00, 0xC4,
        0x8E, 0x21, 0x00, 0x00, 0x18, 0x01, 0x1D, 0x80,
        0x3E, 0x73, 0x38, 0x2D, 0x40, 0x7E, 0x2C, 0x45,
        0x80, 0xC4, 0x8E, 0x21, 0x00, 0x00, 0x1E, 0x1A,
        0x36, 0x80, 0xA0, 0x70, 0x38, 0x1F, 0x40, 0x30,
        0x20, 0x25, 0x00, 0xC4, 0x8E, 0x21, 0x00, 0x00,
        0x1A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01
};

static my_i2c_struct adv7611_set_slave_table[] = {
        {ADV7611_I2C_ADDR, 0xF4, (ADV7611_CEC_ADDR << 1)},  // CEC
        {ADV7611_I2C_ADDR, 0xF5, (ADV7611_INFO_ADDR << 1)}, // InfoFrame
        {ADV7611_I2C_ADDR, 0xF8, (ADV7611_DPLL_ADDR << 1)}, // DPLL
        {ADV7611_I2C_ADDR, 0xF9, (ADV7611_KSV_ADDR << 1)},  // KSV
        {ADV7611_I2C_ADDR, 0xFA, (ADV7611_EDID_ADDR << 1)}, // EDID
        {ADV7611_I2C_ADDR, 0xFB, (ADV7611_HDMI_ADDR << 1)}, // HDMI
        {ADV7611_I2C_ADDR, 0xFD, (ADV7611_CP_ADDR << 1)},   // CP
        {0xDE, 0xAD, 0x00},
};

static my_i2c_struct adv7611_set_edid_0_table[] = {
        {ADV7611_KSV_ADDR, 0x77, 0x00},
        {0xDE, 0xAD, 0x00},
};

static my_i2c_struct adv7611_set_edid_1_table[] = {
        {ADV7611_KSV_ADDR, 0x77, 0x00}, // Set the Most Significant Bit of the SPA location to 0
        {ADV7611_KSV_ADDR, 0x52, 0x20}, // Set the SPA for port B.
        {ADV7611_KSV_ADDR, 0x53, 0x00}, // Set the SPA for port B.
        {ADV7611_KSV_ADDR, 0x70, 0x9E}, // Set the Least Significant Byte of the SPA location
        {ADV7611_KSV_ADDR, 0x74, 0x03}, // Enable the Internal EDID for Ports
        {0xDE, 0xAD, 0x00},
};

static void adv7611_write(my_i2c_struct table[]) {
    uint8_t tx_buffer[2];

    int i = 0;
    while(1){
        if ((table[i].slave_addr == 0xDE) && (table[i].reg == 0xAD)){
            break;
        }

        tx_buffer[0] = table[i].reg;
        tx_buffer[1] = table[i].val;

        mss_i2c_status_t status;

        // Save register and value
        MSS_I2C_write(&g_mss_i2c0_lo, table[i].slave_addr, tx_buffer, 2, MSS_I2C_RELEASE_BUS);

        // Wait for end of transmission
        status = MSS_I2C_wait_complete(&g_mss_i2c0_lo, MSS_I2C_NO_TIMEOUT);

        if (status != MSS_I2C_SUCCESS) {
            uart_printf("Error I2C Addr: 0x%02X, Reg: 0x%02X\r\n", table[i].slave_addr, table[i].reg);
        }
        i++;
    }
}

static void adv7611_load_edid(void) {

    int i = 0;
    uint8_t tx_buffer[2];
    mss_i2c_status_t status;
    volatile uint32_t delay = 0U;
    for (i = 0; i < 256; i++)
    {
        delay = 0U;
        tx_buffer[0] = i;
        tx_buffer[1] = adv7611_edid_content[i];
        MSS_I2C_write(&g_mss_i2c0_lo, ADV7611_EDID_ADDR, tx_buffer, 2, MSS_I2C_RELEASE_BUS);

        // Wait for end of transmission
        status = MSS_I2C_wait_complete(&g_mss_i2c0_lo, MSS_I2C_NO_TIMEOUT);
        do{
            delay++;
        } while(0x1000U != delay);
        if (status != MSS_I2C_SUCCESS) {
            uart_printf("Error while loading edid\r\n");
        }
    }
}

void HDMI_RX_init(void) {
    // HW Reset
    GPIO_set_output(&g_gpio_out, MSS_GPIO_0, 0);
    for(volatile int k=0; k<100000; k++);
    GPIO_set_output(&g_gpio_out, MSS_GPIO_0, 1);
    for(volatile int k=0; k<100000; k++);
    GPIO_set_output(&g_gpio_out, MSS_GPIO_0, 0);
    for(volatile int k=0; k<5000000; k++);
    // Main configuration
    adv7611_write(adv7611_set_slave_table);

    GPIO_set_output(&g_gpio_out, MSS_GPIO_1, 0); // Turn off HPD
    adv7611_write(adv7611_set_edid_0_table);
    adv7611_load_edid();
    adv7611_write(adv7611_set_edid_1_table);
    GPIO_set_output(&g_gpio_out, MSS_GPIO_1, 1); // Turn on HPD

    adv7611_write(adv7611_hdmi_config_table);

    uart_printf("ADV7611 initializing done.\r\n");
}
