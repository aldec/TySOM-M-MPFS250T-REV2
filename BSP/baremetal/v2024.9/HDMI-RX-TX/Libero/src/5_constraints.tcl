puts "***** 5_constraints.tcl - import constraints files"

set constraint_path $local_dir/$src_path/constraints

import_files \
        -convert_EDN_to_HDL 0 \
        -sdc "${constraint_path}/ALDEC_SDC.sdc"

# Import I/O constraints
import_files \
        -convert_EDN_to_HDL 0 \
        -io_pdc "${constraint_path}/ALDEC_CAN0.pdc" \
        -io_pdc "${constraint_path}/ALDEC_UARTs.pdc" \
        -io_pdc "${constraint_path}/ALDEC_DDR4.pdc" \
        -io_pdc "${constraint_path}/ALDEC_HDMI_RX.pdc" \
        -io_pdc "${constraint_path}/ALDEC_HDMI_TX.pdc"

organize_tool_files -tool {PLACEROUTE} -file "${project_dir}/constraint/io/ALDEC_CAN0.pdc" -file "${project_dir}/constraint/io/ALDEC_UARTs.pdc" -file "${project_dir}/constraint/io/ALDEC_DDR4.pdc" -file "${project_dir}/constraint/io/ALDEC_HDMI_RX.pdc" -file "${project_dir}/constraint/io/ALDEC_HDMI_TX.pdc" -module {TySOM_M_SYSTEM::work} -input_type {constraint}
organize_tool_files -tool {VERIFYTIMING} -file "${project_dir}/constraint/ALDEC_SDC.sdc" -module {TySOM_M_SYSTEM::work} -input_type {constraint}
organize_tool_files -tool {SYNTHESIZE}  -file "${project_dir}/constraint/ALDEC_SDC.sdc" -module {TySOM_M_SYSTEM::work} -input_type {constraint}

derive_constraints_sdc
