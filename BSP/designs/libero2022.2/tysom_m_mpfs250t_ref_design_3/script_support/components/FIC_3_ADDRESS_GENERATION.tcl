# Creating SmartDesign FIC_3_ADDRESS_GENERATION
set sd_name {FIC_3_ADDRESS_GENERATION}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_MMASTER_in_penable} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_MMASTER_in_psel} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_MMASTER_in_pwrite} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave15_PREADYS15} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave15_PSLVERRS15} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave16_PREADYS16} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave16_PSLVERRS16} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_MMASTER_in_pready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_MMASTER_in_pslverr} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave15_PENABLES} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave15_PSELS15} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave15_PWRITES} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave16_PENABLES} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave16_PSELS16} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave16_PWRITES} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {APB_MMASTER_in_paddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APB_MMASTER_in_pwdata} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave15_PRDATAS15} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave16_PRDATAS16} -port_direction {IN} -port_range {[31:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {APB_MMASTER_in_prdata} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave15_PADDRS} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave15_PWDATAS} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave16_PADDRS} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave16_PWDATAS} -port_direction {OUT} -port_range {[31:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {FIC_3_0x4FFF_FFxx} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"PADDR:APBmslave15_PADDRS" \
"PSELx:APBmslave15_PSELS15" \
"PENABLE:APBmslave15_PENABLES" \
"PWRITE:APBmslave15_PWRITES" \
"PRDATA:APBmslave15_PRDATAS15" \
"PWDATA:APBmslave15_PWDATAS" \
"PREADY:APBmslave15_PREADYS15" \
"PSLVERR:APBmslave15_PSLVERRS15" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {FIC_3_0x43xx_xxxx_0x48xx_xxxx} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"PADDR:APBmslave16_PADDRS" \
"PSELx:APBmslave16_PSELS16" \
"PENABLE:APBmslave16_PENABLES" \
"PWRITE:APBmslave16_PWRITES" \
"PRDATA:APBmslave16_PRDATAS16" \
"PWDATA:APBmslave16_PWDATAS" \
"PREADY:APBmslave16_PREADYS16" \
"PSLVERR:APBmslave16_PSLVERRS16" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {APB_MMASTER} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredMaster} -port_bif_mapping {\
"PADDR:APB_MMASTER_in_paddr" \
"PSELx:APB_MMASTER_in_psel" \
"PENABLE:APB_MMASTER_in_penable" \
"PWRITE:APB_MMASTER_in_pwrite" \
"PRDATA:APB_MMASTER_in_prdata" \
"PWDATA:APB_MMASTER_in_pwdata" \
"PREADY:APB_MMASTER_in_pready" \
"PSLVERR:APB_MMASTER_in_pslverr" } 

# Add APB_ARBITER_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {APB_ARBITER} -instance_name {APB_ARBITER_0}
# Exporting Parameters of instance APB_ARBITER_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {APB_ARBITER_0} -params {\
"select_bit:28" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {APB_ARBITER_0}
sd_update_instance -sd_name ${sd_name} -instance_name {APB_ARBITER_0}



# Add APB_PASS_THROUGH_1 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {APB_PASS_THROUGH} -instance_name {APB_PASS_THROUGH_1}



# Add FIC_3_0x4FFF_Fxxx_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {FIC_3_0x4FFF_Fxxx} -instance_name {FIC_3_0x4FFF_Fxxx_0}



# Add FIC_3_0x4xxx_xxxx_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {FIC_3_0x4xxx_xxxx} -instance_name {FIC_3_0x4xxx_xxxx_0}





# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_ARBITER_0:APB_MASTER_low" "FIC_3_0x4xxx_xxxx_0:APB3mmaster" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_ARBITER_0:APB_MMASTER" "APB_MMASTER" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_PASS_THROUGH_1:APB_INITIATOR" "FIC_3_0x4FFF_Fxxx_0:APB3mmaster" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_PASS_THROUGH_1:APB_TARGET" "FIC_3_0x4xxx_xxxx_0:APBmslave15" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_3_0x43xx_xxxx_0x48xx_xxxx" "FIC_3_0x4xxx_xxxx_0:APBmslave16" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_3_0x4FFF_FFxx" "FIC_3_0x4FFF_Fxxx_0:APBmslave15" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign FIC_3_ADDRESS_GENERATION
generate_component -component_name ${sd_name}