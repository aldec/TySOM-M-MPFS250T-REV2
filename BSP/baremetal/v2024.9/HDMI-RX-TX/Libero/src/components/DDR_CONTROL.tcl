# Creating SmartDesign "DDR_CONTROL"
set sd_name {DDR_CONTROL}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Stream_Target_IF_TVALID_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AlphaBlend_Read_ARVALID_I_1} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR_READ_frame_start_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR_READ_pixel_clk_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR_READ_read_en_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR_WRITE_data_valid_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR_WRITE_frame_start_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR_WRITE_pixel_clk_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR_WRITE_rstn_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4_arready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4_awready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4_bvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4_rlast} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4_rvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4_wready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ddr_clk_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ddr_clk_rstn_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ddr_ctrl_ready_i} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Stream_Target_IF_TREADY_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AlphaBlend_Read_ARREADY_O_1} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AlphaBlend_Read_BUSER_O_r1} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AlphaBlend_Read_RLAST_O_1} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AlphaBlend_Read_RVALID_O_1} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4_arvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4_awvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4_bready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4_rready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4_wlast} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4_wvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {data_valid_o} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Stream_Target_IF_TDATA_I} -port_direction {IN} -port_range {[23:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Stream_Target_IF_TUSER_I} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AlphaBlend_Read_ARADDR_I_1} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AlphaBlend_Read_ARSIZE_I_1} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4_bid} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4_bresp} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4_rdata} -port_direction {IN} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4_rid} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4_rresp} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {data_i} -port_direction {IN} -port_range {[9:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {horz_resl_i} -port_direction {IN} -port_range {[15:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {AlphaBlend_Read_RDATA_O_1} -port_direction {OUT} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4_araddr} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4_arburst} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4_arcache} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4_arid} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4_arlen} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4_arlock} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4_arprot} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4_arsize} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4_awaddr} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4_awburst} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4_awcache} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4_awid} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4_awlen} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4_awlock} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4_awprot} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4_awsize} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4_wdata} -port_direction {OUT} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4_wstrb} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {data_o} -port_direction {OUT} -port_range {[23:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4Stream_Target_IF} -port_bif_vlnv {AMBA:AMBA4:AXI4Stream:r0p0_1} -port_bif_role {slave} -port_bif_mapping {\
"TVALID:AXI4Stream_Target_IF_TVALID_I" \
"TREADY:AXI4Stream_Target_IF_TREADY_O" \
"TDATA:AXI4Stream_Target_IF_TDATA_I" \
"TUSER:AXI4Stream_Target_IF_TUSER_I" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {AlphaBlend_Read} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {slave} -port_bif_mapping {\
"ARADDR:AlphaBlend_Read_ARADDR_I_1" \
"ARSIZE:AlphaBlend_Read_ARSIZE_I_1" \
"ARVALID:AlphaBlend_Read_ARVALID_I_1" \
"ARREADY:AlphaBlend_Read_ARREADY_O_1" \
"RDATA:AlphaBlend_Read_RDATA_O_1" \
"RLAST:AlphaBlend_Read_RLAST_O_1" \
"RVALID:AlphaBlend_Read_RVALID_O_1" \
"BUSER:AlphaBlend_Read_BUSER_O_r1" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {MIRRORED_SLAVE_AXI4} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"AWID:MIRRORED_SLAVE_AXI4_awid" \
"AWADDR:MIRRORED_SLAVE_AXI4_awaddr" \
"AWLEN:MIRRORED_SLAVE_AXI4_awlen" \
"AWSIZE:MIRRORED_SLAVE_AXI4_awsize" \
"AWBURST:MIRRORED_SLAVE_AXI4_awburst" \
"AWLOCK:MIRRORED_SLAVE_AXI4_awlock" \
"AWCACHE:MIRRORED_SLAVE_AXI4_awcache" \
"AWPROT:MIRRORED_SLAVE_AXI4_awprot" \
"AWVALID:MIRRORED_SLAVE_AXI4_awvalid" \
"AWREADY:MIRRORED_SLAVE_AXI4_awready" \
"WDATA:MIRRORED_SLAVE_AXI4_wdata" \
"WSTRB:MIRRORED_SLAVE_AXI4_wstrb" \
"WLAST:MIRRORED_SLAVE_AXI4_wlast" \
"WVALID:MIRRORED_SLAVE_AXI4_wvalid" \
"WREADY:MIRRORED_SLAVE_AXI4_wready" \
"BID:MIRRORED_SLAVE_AXI4_bid" \
"BRESP:MIRRORED_SLAVE_AXI4_bresp" \
"BVALID:MIRRORED_SLAVE_AXI4_bvalid" \
"BREADY:MIRRORED_SLAVE_AXI4_bready" \
"ARID:MIRRORED_SLAVE_AXI4_arid" \
"ARADDR:MIRRORED_SLAVE_AXI4_araddr" \
"ARLEN:MIRRORED_SLAVE_AXI4_arlen" \
"ARSIZE:MIRRORED_SLAVE_AXI4_arsize" \
"ARBURST:MIRRORED_SLAVE_AXI4_arburst" \
"ARLOCK:MIRRORED_SLAVE_AXI4_arlock" \
"ARCACHE:MIRRORED_SLAVE_AXI4_arcache" \
"ARPROT:MIRRORED_SLAVE_AXI4_arprot" \
"ARVALID:MIRRORED_SLAVE_AXI4_arvalid" \
"ARREADY:MIRRORED_SLAVE_AXI4_arready" \
"RID:MIRRORED_SLAVE_AXI4_rid" \
"RDATA:MIRRORED_SLAVE_AXI4_rdata" \
"RRESP:MIRRORED_SLAVE_AXI4_rresp" \
"RLAST:MIRRORED_SLAVE_AXI4_rlast" \
"RVALID:MIRRORED_SLAVE_AXI4_rvalid" \
"RREADY:MIRRORED_SLAVE_AXI4_rready" } 

# Add DDR_AXI4_ARBITER_PF_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {DDR_AXI4_ARBITER_PF_C0} -instance_name {DDR_AXI4_ARBITER_PF_C0_0}



# Add DDR_Read_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {DDR_Read_C0} -instance_name {DDR_Read_C0_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {DDR_Read_C0_0:line_gap_i} -value {0001000000000000}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {DDR_Read_C0_0:h_offset_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {DDR_Read_C0_0:v_offset_i} -value {GND}



# Add DDR_Write_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {DDR_Write_C0} -instance_name {DDR_Write_C0_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {DDR_Write_C0_0:line_gap_i} -value {0001000000000000}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {DDR_Write_C0_0:frame_ddr_addr_i} -value {00000000}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_AXI4_ARBITER_PF_C0_0:ddr_ctrl_ready_i" "ddr_ctrl_ready_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_AXI4_ARBITER_PF_C0_0:reset_i" "DDR_Read_C0_0:reset_i" "DDR_Write_C0_0:ddr_clk_rstn_i" "ddr_clk_rstn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_AXI4_ARBITER_PF_C0_0:sys_clk_i" "DDR_Read_C0_0:ddr_clk_i" "DDR_Write_C0_0:ddr_clk_i" "ddr_clk_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_READ_frame_start_i" "DDR_Read_C0_0:frame_start_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_READ_pixel_clk_i" "DDR_Read_C0_0:pixel_clk_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_READ_read_en_i" "DDR_Read_C0_0:read_en_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_C0_0:data_valid_o" "data_valid_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_WRITE_pixel_clk_i" "DDR_Write_C0_0:pixel_clk_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_WRITE_rstn_i" "DDR_Write_C0_0:rstn_i" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_C0_0:data_o" "data_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_C0_0:frame_start_addr_i" "DDR_Write_C0_0:display_frame_addr_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Read_C0_0:horz_resl_i" "horz_resl_i" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4Stream_Target_IF" "DDR_Write_C0_0:AXI4Stream_Target_IF" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AlphaBlend_Read" "DDR_AXI4_ARBITER_PF_C0_0:Read_channel_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_AXI4_ARBITER_PF_C0_0:MIRRORED_SLAVE_AXI4" "MIRRORED_SLAVE_AXI4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_AXI4_ARBITER_PF_C0_0:Read_channel_0" "DDR_Read_C0_0:Read_channel" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_AXI4_ARBITER_PF_C0_0:Write_channel_0" "DDR_Write_C0_0:Write_channel" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "DDR_CONTROL"
generate_component -component_name ${sd_name}
