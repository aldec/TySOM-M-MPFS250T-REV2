from smbus2 import SMBus, i2c_msg
from time import sleep

addr = 0x1d
MMA8652_STATUS_00           = 0x00
MMA8652_OUT_X_MSB              = 0x01
MMA8652_OUT_X_LSB              = 0x02
MMA8652_OUT_Y_MSB              = 0x03
MMA8652_OUT_Y_lSB              = 0x04
MMA8652_OUT_Z_MSB              = 0x05
MMA8652_OUT_Z_LSB              = 0x06
MMA8652_RSVD_0                 = 0x07  
MMA8652_RSVD_1                 = 0x08  
MMA8652_F_SETUP                = 0x09
MMA8652_TRIG_CFG               = 0x0A
MMA8652_SYSMOD                 = 0x0B
MMA8652_INT_SOURCE             = 0x0C
MMA8652_WHO_AM_I               = 0x0D
MMA8652_XYZ_DATA_CFG           = 0x0E
MMA8652_HP_FILTER_CUTOFF       = 0x0F
MMA8652_PL_STATUS              = 0x10
MMA8652_PL_CFG                 = 0x11
MMA8652_PL_COUNT               = 0x12
MMA8652_PL_BF_ZCOMP            = 0x13
MMA8652_PL_P_L_THS_REG         = 0x14
MMA8652_FF_MT_CFG              = 0x15
MMA8652_FF_MT_SRC              = 0x16
MMA8652_FF_MT_THS              = 0x17
MMA8652_FF_MT_COUNT            = 0x18
MMA8652_RSVD_2                 = 0x19  
MMA8652_RSVD_3                 = 0x1A  
MMA8652_RSVD_4                 = 0x1B  
MMA8652_RSVD_5                 = 0x1C  
MMA8652_TRANSIENT_CFG          = 0x1D
MMA8652_TRANSIENT_SRC          = 0x1E
MMA8652_TRANSIENT_THS          = 0x1F
MMA8652_TRANSIENT_COUNT        = 0x20
MMA8652_PULSE_CFG              = 0x21
MMA8652_PULSE_SRC              = 0x22
MMA8652_PULSE_THSX             = 0x23
MMA8652_PULSE_THSY             = 0x24
MMA8652_PULSE_THSZ             = 0x25
MMA8652_PULSE_TMLT             = 0x26
MMA8652_PULSE_LTCY             = 0x27
MMA8652_PULSE_WIND             = 0x28
MMA8652_ASLP_COUNT             = 0x29
MMA8652_CTRL_REG1              = 0x2A
MMA8652_CTRL_REG2              = 0x2B
MMA8652_CTRL_REG3              = 0x2C
MMA8652_CTRL_REG4              = 0x2D
MMA8652_CTRL_REG5              = 0x2E
MMA8652_OFF_X                  = 0x2F
MMA8652_OFF_Y                  = 0x30
MMA8652_OFF_Z                   = 0x31

ST_MASK       =        0x80
RST_MASK      =        0x40
SMODS1_MASK   =        0x10
SMODS0_MASK   =        0x08
SLPE_MASK     =        0x04
MODS1_MASK    =        0x02
MODS0_MASK    =        0x01
SMODS_MASK    =        0x18
MODS_MASK     =        0x03

def standBy(bus):
    msg = i2c_msg.write(addr, [MMA8652_CTRL_REG1, 0])
    bus.i2c_rdwr(msg)

def write(bus, reg, data):
    msg = i2c_msg.write(addr, [reg, data])
    bus.i2c_rdwr(msg)

def read(bus, reg, length):
    data=[]
    msg = i2c_msg.write(addr, [reg])
    bus.i2c_rdwr(msg)
    rd = i2c_msg.read(addr, 7)
    bus.i2c_rdwr(rd)
    data+=list(rd)
    return data

def active(bus):
    write(bus, MMA8652_CTRL_REG1, 0x49);

def reset(bus):
    standBy(bus)
    sleep(1)
    write(MMA8652_CTRL_REG2, RST_MASK)
    sleep(1)
    active(bus)

def twos_comp(val, bits):
    if (val & (1 << (bits - 1))) != 0:
        val = val - (1 << bits)
    return val

def readXYZ(bus):
    buf = read(bus, MMA8652_STATUS_00, 7)
    twoCompl = ((buf[1] << 8) | buf[2]) >> 4
    if buf[1]>0x7f:
        x = (twos_comp(twoCompl, 12))
    else:
        x=twoCompl
    twoCompl = ((buf[3] << 8) | buf[4]) >> 4
    if buf[3]>0x7f:
        y=(twos_comp(twoCompl, 12))
    else:
        y=twoCompl
    twoCompl = ((buf[5] << 8) | buf[6]) >> 4
    if buf[5]>0x7f:
        z=(twos_comp(twoCompl, 12))
    else:
        z=twoCompl
    return [x,y,z]

def init(bus):
    standBy(bus)
    sleep(1)
    #Accelerometer range of +/-2g range with 0.244mg/LSB
    write(bus, MMA8652_XYZ_DATA_CFG, 0)
    sleep(1)
    write(bus, MMA8652_CTRL_REG3, 0x39)
    sleep(1)
    write(bus, MMA8652_CTRL_REG4, 0)
    sleep(1)
    write(bus, MMA8652_CTRL_REG5, 0)
    sleep(1)
    active(bus)


if __name__ == '__main__':
    with SMBus(1) as bus:
        print("Initializing accel") 
        init(bus)
        print("reading axis")
        while(1):
            print(readXYZ(bus))
            sleep(1)
            #readPosition(bus)
            #sleep(1)
     
