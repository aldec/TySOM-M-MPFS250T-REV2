puts "***** 6_simulation.tcl - import constraints files"

set simulation_path $local_dir/$src_path/simulation
set stimulus_path $local_dir/$src_path/stimulus
set simulation_project_path $project_dir/simulation
set stimulus_project_path $project_dir/stimulus

file copy -force $simulation_path/wave_riviera.do $simulation_project_path/wave_riviera.do
file copy -force $simulation_path/run_uart_dpi.do $simulation_project_path/run_uart_dpi.do
file copy -force $simulation_path/dpi_terminal.c  $simulation_project_path/dpi_terminal.c


### add line with PROJECT_DIR to run_uart_dpi.do
set filename $simulation_project_path/run_uart_dpi.do

set fd [open $filename r]
set file_content [read $fd]
close $fd

set new_line1 "set PROJECT_DIR $project_dir"
set new_line2 ""
set new_line3 "############# PolarFire"
set new_line4 "alib PolarFire"
set new_line5 "amap PolarFire \"${riviera_dir}/vlib/polarfire\""

# ############# PolarFire
# alib PolarFire
# amap PolarFire "/home/piojar/TOOLS/riviera/Riviera-PRO-2024.10-x64/vlib/polarfire"


set fd [open $filename w]
puts $fd $new_line1
puts $fd $new_line2
puts $fd $new_line3
puts $fd $new_line4
puts $fd $new_line5
puts $fd $file_content
close $fd
###

import_files -stimulus $stimulus_path/dpi_uart.sv
import_files -stimulus $stimulus_path/tb_uart_dpi.sv


organize_tool_files -tool {SIM_PRESYNTH} -file $stimulus_project_path/tb_uart_dpi.sv -module {TySOM_M_SYSTEM::work} -input_type {stimulus}
set_modelsim_options -use_automatic_do_file 0 -user_do_file "$simulation_project_path/run_uart_dpi.do"



build_design_hierarchy
