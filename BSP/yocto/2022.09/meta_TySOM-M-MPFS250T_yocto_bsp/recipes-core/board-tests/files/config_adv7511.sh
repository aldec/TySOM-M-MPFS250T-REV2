#!/bin/bash
	
	I2C_BUS=0x0
	DEV_ADDR=0x39
	
	#Fixed I2C Addr
	i2cset -f -y $I2C_BUS $DEV_ADDR 0xF9 0x00 b
	#Power-up the Tx (HPD must be high)
	i2cset -f -y $I2C_BUS $DEV_ADDR 0x41 0x10 b # all circuits powered up 0x41[6]  sync adjustment disabled 0x41[1]

	#Fixed registers that must be set on power up
	i2cset -f -y $I2C_BUS $DEV_ADDR 0x98 0x03 b # ADI Recommended Write - IMP
	i2cset -f -y $I2C_BUS $DEV_ADDR 0x9A 0xE0 b # ADI Recommended Write - IMP
	i2cset -f -y $I2C_BUS $DEV_ADDR 0x9C 0x30 b # ADI Recommended Write - IMP
	i2cset -f -y $I2C_BUS $DEV_ADDR 0x9D 0x61 b # Set clock divide-no clock division & 0x9d[1:0] = '01'
	i2cset -f -y $I2C_BUS $DEV_ADDR 0xA2 0xA4 b # ADI Recommended Write - IMP
	i2cset -f -y $I2C_BUS $DEV_ADDR 0xA3 0xA4 b # ADI Recommended Write - IMP
	i2cset -f -y $I2C_BUS $DEV_ADDR 0xE0 0xD0 b # ADI Recommended Write - IMP
	i2cset -f -y $I2C_BUS $DEV_ADDR 0xF9 0x00 b # ADI Recommended Write - IMP
	i2cset -f -y $I2C_BUS $DEV_ADDR 0xDE 0x10 b # ADI Recommended Write - 0xDE[3] = '0'  Normal TMDS Clock
	i2cset -f -y $I2C_BUS $DEV_ADDR 0x94 0x00 b # Disable All Interrupts
	i2cset -f -y $I2C_BUS $DEV_ADDR 0xA1 0x40 b # 0xA1[6] - Monitor Sense monitoring disabled Channels 0,1,2 and clock driver power up
	i2cset -f -y $I2C_BUS $DEV_ADDR 0xBA 0x60 b # Programmable delay for input video clock = 011 = no delay
	i2cset -f -y $I2C_BUS $DEV_ADDR 0xD6 0xC0 b #HPD is always high [7:6] soft TMDS clock on disabled [4] video input and clock not gated[0]

	# Set up the video input mode
	i2cset -f -y $I2C_BUS $DEV_ADDR 0x15 0x00 b # Input YCbCr 4:2:2 with embedded syncs
	#Set video output format
	#i2cset -f -y $I2C_BUS $DEV_ADDR 0x16 0x38 b                         #    R0x16[ 7] = Output Video Format = 0 (4:4:4)
                                        #    R0x16[5:4] = Input Video Color Depth = 11 (8 bits/color)
                                        #    R0x16[3:2] = Input video Style = 10 (style 1)
                                        #    R0x16[  1] = DDR Input Edge = 0 (falling edge)
                                        #    ROx16[  0] = Output Color Space = 4 (RGB)

	i2cset -f -y $I2C_BUS $DEV_ADDR 0x16 0x30 b                         #    R0x16[ 7] = Output Video Format = 0 (4:4:4)
	                                        #    R0x16[5:4] = Input Video Color Depth = 11 (8 bits/color)
	                                        #    R0x16[3:2] = Input video Style = 00 (not valid)
						#    R0x16[  1] = DDR Input Edge = 0 (falling edge)
	                                        #    ROx16[  0] = Output Color Space = 4 (RGB)

	# Set up the video output mode
	i2cset -f -y $I2C_BUS $DEV_ADDR 0x17 0x02 b # Vsync polarity = high Hsync Polarity = high Aspect ration = 16:9 and DE generator disabled

	i2cset -f -y $I2C_BUS $DEV_ADDR 0xD0 0x30 b  # Delay adjust for negative DDR capture = disabled   R0xD0[1] = 0;sync adjustment then DE generation

	i2cset -f -y $I2C_BUS $DEV_ADDR 0x18 0x00 b # Color space conversion
	                                      #    R0x18[  7] = CSC enable = 1 (CSC enabled)
	                                      #    R0x18[6:5] = CSC Scaling Factor = 10 (+/- 4.0 -16384 - 16380)
	                                      #    R0x18[4:0] = CSC coefficient A1[12:8]
	i2cset -f -y $I2C_BUS $DEV_ADDR 0x40 0x80 b # General Control packet enable
	i2cset -f -y $I2C_BUS $DEV_ADDR 0x48 0x00 b # Video Input Justification
	                                      #    R0x48[8:7] = Video Input Justification = 10 (left justified)
	i2cset -f -y $I2C_BUS $DEV_ADDR 0x49 0xA8 b # Bit trimming mode = 101010 (truncate)
	i2cset -f -y $I2C_BUS $DEV_ADDR 0x4C 0x00 b # Color Depth = 0000 (color depth not indicated)
	i2cset -f -y $I2C_BUS $DEV_ADDR 0x55 0x00 b  # Set RGB in AVinfo Frame #    R0x55[6:5] = Output Format = 00 (RGB)
	i2cset -f -y $I2C_BUS $DEV_ADDR 0x56 0x08 b                           #    R0x56[5:4] = Picture Aspect Ratio = 00 (no data)
	                                      #    R0x56[3:0] = Active Format Aspect Ratio = 1000 (Same as Aspect Ratio 16:9)
	i2cset -f -y $I2C_BUS $DEV_ADDR 0xAF 0x06 b # Set HDMI Mode
	                                      #    R0xAF[  7] = HDCP Enable = 0 (HDCP disabled)
	                                      #    R0xAF[  4] = Frame Encryption = 0 (Current frame NOT HDCP encrypted)
	                                      #    R0xAF[3:2] = 01 (fixed)
	                                      #    R0xAF[  1] = HDMI/DVI Mode Select = 1 (HDMI Mode)
	                                      
exit 0	                                      
