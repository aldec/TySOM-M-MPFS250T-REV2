
from smbus2 import SMBus, i2c_msg
from time import sleep
import random

length =32
addr=0x50
start_addr=[0x00, 0x00]
eeprom_addr = i2c_msg.write(addr, start_addr)

def write(bus, data):
    bus.i2c_rdwr(eeprom_addr)
    msg = i2c_msg.write(addr, start_addr+data)
    bus.i2c_rdwr(msg)
    sleep(0.01)

def read(bus, length):
    data = []
    msg = i2c_msg.read(addr, length)
    bus.i2c_rdwr(eeprom_addr, msg)
    data+= list(msg)
    sleep(0.01)
    return data

with SMBus(1) as bus:
    #set addr
    data = []
    for i in range(length):
        data.append(random.randint(0x00, 0xff))
    print ("write")
    write(bus, data)
    print ("read")
    result = read(bus, len(data))
    print ("write buf = ")
    print ([hex(x) for x in data] )
    print ("read buf = ")
    print ([hex(x) for x in result] )
    if result == data :
        print ("Test passed")
    else:
        print ("Test failed")

