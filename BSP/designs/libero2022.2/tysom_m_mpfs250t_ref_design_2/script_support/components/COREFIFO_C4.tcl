# Exporting Component Description of COREFIFO_C4 to TCL
# Family: PolarFireSoC
# Part Number: MPFS250T_ES-1FCG1152E
# Create and Configure the core component COREFIFO_C4
create_and_configure_core -core_vlnv {Actel:DirectCore:COREFIFO:3.0.101} -component_name {COREFIFO_C4} -params {\
"AE_STATIC_EN:false"  \
"AEVAL:4"  \
"AF_STATIC_EN:false"  \
"AFVAL:60"  \
"CTRL_TYPE:3"  \
"ECC:0"  \
"ESTOP:true"  \
"FSTOP:true"  \
"FWFT:false"  \
"NUM_STAGES:2"  \
"OVERFLOW_EN:false"  \
"PIPE:2"  \
"PREFETCH:false"  \
"RDCNT_EN:false"  \
"RDEPTH:32"  \
"RE_POLARITY:0"  \
"READ_DVALID:false"  \
"RWIDTH:8"  \
"SYNC:0"  \
"UNDERFLOW_EN:false"  \
"WDEPTH:32"  \
"WE_POLARITY:0"  \
"WRCNT_EN:false"  \
"WRITE_ACK:false"  \
"WWIDTH:8"   }
# Exporting Component Description of COREFIFO_C4 to TCL done
