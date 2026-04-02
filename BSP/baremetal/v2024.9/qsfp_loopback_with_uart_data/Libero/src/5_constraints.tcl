puts "***** 5_constraints.tcl - import constraints files"

set constraint_path $local_dir/$src_path/constraints

import_files \
        -convert_EDN_to_HDL 0 \
        -sdc "${constraint_path}/ALDEC_SDC.sdc"

# Import I/O constraints
import_files \
        -convert_EDN_to_HDL 0 \
        -io_pdc "${constraint_path}/ALDEC_QSFP.pdc" \
        -io_pdc "${constraint_path}/ALDEC_UARTs.pdc"

organize_tool_files -tool {PLACEROUTE} -file "${project_dir}/constraint/io/ALDEC_QSFP.pdc" -file "${project_dir}/constraint/io/ALDEC_UARTs.pdc" -module {TySOM_M_SYSTEM::work} -input_type {constraint}
organize_tool_files -tool {VERIFYTIMING} -file "${project_dir}/constraint/ALDEC_SDC.sdc" -module {TySOM_M_SYSTEM::work} -input_type {constraint}
organize_tool_files -tool {SYNTHESIZE}  -file "${project_dir}/constraint/ALDEC_SDC.sdc" -module {TySOM_M_SYSTEM::work} -input_type {constraint}

derive_constraints_sdc
