# PolarFire SoC UIO CAN Example

can_fmc_loopback is a simple example of using CAN via UIO from Linux user-space.

The example expects to find a CAN device mapped to /dev/uio0 and /dev/uio1. One is can on TySOM-M-MPFS250T board, and the second is on FMC-INDUSTRY.

It initialises the CAN devices, places it into normal mode, sends message via uio0 and reads it via uio1.  

Run the example program, first build it by running make:
```
make
```
Once built, it can be run:

```
./can_fmc_loopback
```
A successful execution should look like:
```
located /dev/uio1
opened /dev/uio1 (r,w)
located /dev/uio0
opened /dev/uio0 (r,w)
mapped 0x1000 bytes for /dev/uio0
mapped 0x1000 bytes for /dev/uio1
setting can device at /dev/uio0 into normal mode
setting can device at /dev/uio1 into normal mode
Start devices
Start listener thread
Start writing message
sent msg: 'example'
MSG sent, waiting for interrupt
waiting for interrupt in listener
CAN_INT_RX_MSG
received msg: 'example'
CAN_INT_TX_MSG
Wait for thread to join
unmapped /dev/uio0
closed /dev/uio0
unmapped /dev/uio1
closed /dev/uio1
```
