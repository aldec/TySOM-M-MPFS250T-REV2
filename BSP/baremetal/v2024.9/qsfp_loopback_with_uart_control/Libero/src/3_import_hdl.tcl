puts "***** 3_import_hdl.tcl - source hdl files"

#Importing and Linking all the HDL source files used in the design
import_files -library work -hdl_source $local_dir/$src_path/hdl/Count_Checker.v
import_files -library work -hdl_source $local_dir/$src_path/hdl/Counter.v
import_files -library work -hdl_source $local_dir/$src_path/hdl/synchronizer.v
import_files -library work -hdl_source $local_dir/$src_path/hdl/binary_to_ascii.sv
import_files -library work -hdl_source $local_dir/$src_path/hdl/DecodeUART.sv
import_files -library work -hdl_source $local_dir/$src_path/hdl/Reset_Synchronizer.v
build_design_hierarchy
