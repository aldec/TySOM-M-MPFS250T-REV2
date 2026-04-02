# Exporting core ADV7611_RX to TCL
# Exporting Create HDL core command for module ADV7611_RX
create_hdl_core -file {hdl/ADV7611_RX.vhd} -module {ADV7611_RX} -library {work} -package {}
# Exporting BIF information of  HDL core command for module ADV7611_RX
hdl_core_add_bif -hdl_core_name {ADV7611_RX} -bif_definition {AXI4Stream:AMBA:AMBA4:master} -bif_name {M_AXIS} -signal_map {\
"TVALID:m_axis_tvalid" \
"TREADY:m_axis_tready" \
"TDATA:m_axis_tdata" \
"TLAST:m_axis_tlast" \
"TUSER:m_axis_tuser" }
