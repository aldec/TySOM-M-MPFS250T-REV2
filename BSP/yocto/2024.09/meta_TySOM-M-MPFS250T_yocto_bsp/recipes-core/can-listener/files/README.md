# PolarFire SoC UIO CAN Example

can_listener is a simple example of using CAN via UIO from Linux user-space.

The example expects to find a CAN device mapped to /dev/uio0.

It initialises the CAN device, places it into normal mode and waits for an RX_MSG interrupt, extracts the message from an RX buffer and prints it.

Run the example program, first build it by running make:
```
make
```
Once built, it can be run:

```
./can_listener
```
A successful execution should look like:
```
root@tysom-m-mpfs250t:~/can_listener# ./can_listener 
located /dev/uio0
opened /dev/uio0 (r,w)
mapped 0x1000 bytes for /dev/uio0
setting can device at /dev/uio0 into loopback mode
Start device
waiting for interrupt in listener
CAN_INT_RX_MSG
received msg: 'example'
unmapped /dev/uio0
closed /dev/uio0
```
