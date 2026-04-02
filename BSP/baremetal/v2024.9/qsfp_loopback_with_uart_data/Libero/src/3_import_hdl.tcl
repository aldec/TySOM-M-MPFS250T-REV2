puts "***** 3_import_hdl.tcl - source hdl files"

#Importing and Linking all the HDL source files used in the design
import_files -library work -hdl_source $local_dir/$src_path/hdl/pulse_extender.sv
import_files -library work -hdl_source $local_dir/$src_path/hdl/valid_first_only.sv
import_files -library work -hdl_source $local_dir/$src_path/hdl/pass_data_to_litefast.sv
import_files -library work -hdl_source $local_dir/$src_path/hdl/Reset_Synchronizer.v
import_files -library work -hdl_source $local_dir/$src_path/hdl/litefast_to_uart.sv
import_files -library work -hdl_source $local_dir/$src_path/hdl/uart_to_litefast.sv
build_design_hierarchy
