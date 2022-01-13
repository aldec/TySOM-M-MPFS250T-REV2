# Exporting Component Description of COREFIFO_C3 to TCL
# Family: PolarFire
# Part Number: MPFS250T_ES-1FCG1152E
# Create and Configure the core component COREFIFO_C3
create_and_configure_core -core_vlnv {Actel:DirectCore:COREFIFO:2.8.101} -component_name {COREFIFO_C3} -params {\
"AE_STATIC_EN:false"  \
"AEVAL:4"  \
"AF_STATIC_EN:false"  \
"AFVAL:1020"  \
"CTRL_TYPE:2"  \
"ECC:0"  \
"ESTOP:true"  \
"FSTOP:true"  \
"FWFT:false"  \
"NUM_STAGES:2"  \
"OVERFLOW_EN:false"  \
"PIPE:2"  \
"PREFETCH:false"  \
"RCLK_EDGE:1"  \
"RDCNT_EN:false"  \
"RDEPTH:512"  \
"RE_POLARITY:0"  \
"READ_DVALID:false"  \
"RESET_POLARITY:0"  \
"RWIDTH:36"  \
"SYNC:0"  \
"UNDERFLOW_EN:false"  \
"WCLK_EDGE:1"  \
"WDEPTH:512"  \
"WE_POLARITY:0"  \
"WRCNT_EN:false"  \
"WRITE_ACK:false"  \
"WWIDTH:36"   }
# Exporting Component Description of COREFIFO_C3 to TCL done
