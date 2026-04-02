
############# presynth
if {[file exists presynth/presynth.lib ]} {
   echo "/nDeleting existing lib presynth"
   adel -lib presynth -all
   amap -del presynth
   echo "Done/n"
}
alib presynth
amap presynth presynth
set worklib presynth

############# COREAPB3_LIB
if {[file exists COREAPB3_LIB/COREAPB3_LIB.lib ]} {
   echo "/nDeleting existing lib COREAPB3_LIB"
   adel -lib COREAPB3_LIB -all
   amap -del COREAPB3_LIB
   echo "Done/n"
}
alib COREAPB3_LIB
amap COREAPB3_LIB COREAPB3_LIB

# compile C file
ccomp -dpi dpi_terminal.c -o dpi_terminal

############# compilation
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C1/COREFIFO_C1_0/rtl/vlog/core/corefifo_fwft.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C1/COREFIFO_C1_0/rtl/vlog/core/corefifo_sync_scntr.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C1/COREFIFO_C1_0/rtl/vlog/core/corefifo_sync.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C1/COREFIFO_C1_0/rtl/vlog/core/corefifo_graytobinconv.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C1/COREFIFO_C1_0/rtl/vlog/core/corefifo_nstagessync.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C1/COREFIFO_C1_0/rtl/vlog/core/corefifo_async.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C1/COREFIFO_C1_0/rtl/vlog/core/COREFIFO_C1_COREFIFO_C1_0_USRAM_top.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C1/COREFIFO_C1_0/rtl/vlog/core/COREFIFO_C1_COREFIFO_C1_0_ram_wrapper.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C1/COREFIFO_C1_0/rtl/vlog/core/COREFIFO.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C1/COREFIFO_C1.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C2/COREFIFO_C2_0/rtl/vlog/core/corefifo_fwft.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C2/COREFIFO_C2_0/rtl/vlog/core/corefifo_sync_scntr.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C2/COREFIFO_C2_0/rtl/vlog/core/corefifo_sync.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C2/COREFIFO_C2_0/rtl/vlog/core/corefifo_graytobinconv.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C2/COREFIFO_C2_0/rtl/vlog/core/corefifo_nstagessync.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C2/COREFIFO_C2_0/rtl/vlog/core/corefifo_async.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C2/COREFIFO_C2_0/rtl/vlog/core/COREFIFO_C2_COREFIFO_C2_0_USRAM_top.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C2/COREFIFO_C2_0/rtl/vlog/core/COREFIFO_C2_COREFIFO_C2_0_ram_wrapper.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C2/COREFIFO_C2_0/rtl/vlog/core/COREFIFO.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C2/COREFIFO_C2.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C3/COREFIFO_C3_0/rtl/vlog/core/corefifo_fwft.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C3/COREFIFO_C3_0/rtl/vlog/core/corefifo_sync_scntr.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C3/COREFIFO_C3_0/rtl/vlog/core/corefifo_sync.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C3/COREFIFO_C3_0/rtl/vlog/core/corefifo_graytobinconv.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C3/COREFIFO_C3_0/rtl/vlog/core/corefifo_nstagessync.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C3/COREFIFO_C3_0/rtl/vlog/core/corefifo_async.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C3/COREFIFO_C3_0/rtl/vlog/core/COREFIFO_C3_COREFIFO_C3_0_LSRAM_top.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C3/COREFIFO_C3_0/rtl/vlog/core/COREFIFO_C3_COREFIFO_C3_0_ram_wrapper.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C3/COREFIFO_C3_0/rtl/vlog/core/COREFIFO.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C3/COREFIFO_C3.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/Microsemi/SolutionCore/LiteFast/1.0.6/core_encrypted/LiteFast.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/LiteFast_RX/LiteFast_RX.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/LiteFast_receiver/LiteFast_receiver.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C0/COREFIFO_C0_0/rtl/vlog/core/corefifo_fwft.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C0/COREFIFO_C0_0/rtl/vlog/core/corefifo_sync_scntr.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C0/COREFIFO_C0_0/rtl/vlog/core/corefifo_sync.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C0/COREFIFO_C0_0/rtl/vlog/core/corefifo_graytobinconv.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C0/COREFIFO_C0_0/rtl/vlog/core/corefifo_nstagessync.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C0/COREFIFO_C0_0/rtl/vlog/core/corefifo_async.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C0/COREFIFO_C0_0/rtl/vlog/core/COREFIFO_C0_COREFIFO_C0_0_USRAM_top.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C0/COREFIFO_C0_0/rtl/vlog/core/COREFIFO_C0_COREFIFO_C0_0_ram_wrapper.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C0/COREFIFO_C0_0/rtl/vlog/core/COREFIFO.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C0/COREFIFO_C0.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/LiteFast_TX/LiteFast_TX.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/hdl/pulse_extender.sv"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/hdl/valid_first_only.sv"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/hdl/pass_data_to_litefast.sv"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/LiteFast_transmitter/LiteFast_transmitter.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREUART_C0/COREUART_C0_0/rtl/vlog/core/fifo_256x8_g5.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREUART_C0/COREUART_C0_0/rtl/vlog/core/Clock_gen.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREUART_C0/COREUART_C0_0/rtl/vlog/core/Rx_async.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREUART_C0/COREUART_C0_0/rtl/vlog/core/Tx_async.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREUART_C0/COREUART_C0_0/rtl/vlog/core/CoreUART.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/COREUART_C0/COREUART_C0.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/hdl/Reset_Synchronizer.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/hdl/litefast_to_uart.sv"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/hdl/uart_to_litefast.sv"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/UART_IF/UART_IF.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/PF_TX_PLL_C0/PF_TX_PLL_C0_0/PF_TX_PLL_C0_PF_TX_PLL_C0_0_PF_TX_PLL.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/PF_TX_PLL_C0/PF_TX_PLL_C0.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/PF_XCVR_ERM_C0/I_XCVR/PF_XCVR_ERM_C0_I_XCVR_PF_XCVR.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/PF_XCVR_ERM_C0/PF_XCVR_ERM_C0.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/PF_XCVR_REF_CLK_C0/PF_XCVR_REF_CLK_C0_0/PF_XCVR_REF_CLK_C0_PF_XCVR_REF_CLK_C0_0_PF_XCVR_REF_CLK.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/PF_XCVR_REF_CLK_C0/PF_XCVR_REF_CLK_C0.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/transceiver/transceiver.v"
alog -sv2k5 -dbg -work presynth "${PROJECT_DIR}/component/work/top/top.v"
alog "+incdir+${PROJECT_DIR}/stimulus" -sv2k5 -dbg -work presynth "${PROJECT_DIR}/stimulus/dpi_uart.sv"
alog "+incdir+${PROJECT_DIR}/stimulus" -sv2k5 -dbg -work presynth "${PROJECT_DIR}/stimulus/tb_uart_dpi.sv"

asim +access +r -PL PolarFire -L presynth -L COREAPB3_LIB  -t 1ps presynth.tb -sv_lib dpi_terminal
do "wave_riviera.do"
log -rec /*
run -all
