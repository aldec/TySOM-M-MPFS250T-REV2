# PolarFire SoC UIO CAN Example

can_sender is a simple example of using CAN via UIO from Linux user-space.

The example expects to find a CAN device mapped to /dev/uio0.

It initialises the CAN device, places it into normal mode, puts a single message in a TX buffer and sends it.

It waits for an TX_MSG interrupt and ends. 

Run the example program, first build it by running make:
```
make
```
Once built, it can be run:

```
./can_sender
```
A successful execution should look like:
```
root@tysom-m-mpfs250t:~/can_sender# ./can_sender 
located /dev/uio0
opened /dev/uio0 (r,w)
mapped 0x1000 bytes for /dev/uio0
setting can device at /dev/uio0 into loopback mode
sent msg: 'example'
CAN_INT_TX_MSG
unmapped /dev/uio0
closed /dev/uio0
```
