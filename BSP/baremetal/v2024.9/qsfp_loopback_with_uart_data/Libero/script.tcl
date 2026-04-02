# TySOM-M-MPFS250T Libero design

set src_path "./src"
set local_dir [pwd]
set project_name "Send_Data_UART_QSFP_Loopback"
set project_dir "$local_dir/$project_name"
puts "***** project_dir:  $project_dir"

set riviera_dir "/home/piojar/TOOLS/riviera/Riviera-PRO-2025.04-x64"
puts "***** riviera_dir:  $riviera_dir"

source ${src_path}/1_check_libero_version.tcl

new_project -location $project_dir -name $project_name -project_description {} -block_mode 0 -standalone_peripheral_initialization 0 -instantiate_in_smartdesign 1 -ondemand_build_dh 1 -use_relative_path 0 -linked_files_root_dir_env {} -hdl {VERILOG} -family {PolarFireSoC} -die {MPFS250T_ES} -package {FCG1152} -speed {-1} -die_voltage {1.0} -part_range {EXT} -adv_options {IO_DEFT_STD:LVCMOS 1.8V} -adv_options {RESTRICTPROBEPINS:1} -adv_options {RESTRICTSPIPINS:0} -adv_options {SYSTEM_CONTROLLER_SUSPEND_MODE:0} -adv_options {TEMPR:EXT} -adv_options {VCCI_1.2_VOLTR:EXT} -adv_options {VCCI_1.5_VOLTR:EXT} -adv_options {VCCI_1.8_VOLTR:EXT} -adv_options {VCCI_2.5_VOLTR:EXT} -adv_options {VCCI_3.3_VOLTR:EXT} -adv_options {VOLTR:EXT}
set_device -family {PolarFireSoC} -die {MPFS250T_ES} -package {FCG1152} -speed {-1} -die_voltage {1.0} -part_range {EXT} -adv_options {IO_DEFT_STD:LVCMOS 1.8V} -adv_options {RESTRICTPROBEPINS:1} -adv_options {RESTRICTSPIPINS:0} -adv_options {SYSTEM_CONTROLLER_SUSPEND_MODE:0} -adv_options {TEMPR:EXT} -adv_options {VCCI_1.2_VOLTR:EXT} -adv_options {VCCI_1.5_VOLTR:EXT} -adv_options {VCCI_1.8_VOLTR:EXT} -adv_options {VCCI_2.5_VOLTR:EXT} -adv_options {VCCI_3.3_VOLTR:EXT} -adv_options {VOLTR:EXT}

puts "Project created successfully"

source $local_dir/$src_path/2_download_cores.tcl

source $local_dir/$src_path/3_import_hdl.tcl

source $local_dir/$src_path/4_source_components.tcl

# set root module
set_root -module {TySOM_M_SYSTEM::work}

source $local_dir/$src_path/5_constraints.tcl

source $local_dir/$src_path/6_simulation.tcl

save_project
