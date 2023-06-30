#Importing and Linking all the HDL source files used in the design
import_files -library work -hdl_source $local_dir/script_support/hdl/Count_Checker.v
import_files -library work -hdl_source $local_dir/script_support/hdl/Counter.v
import_files -library work -hdl_source $local_dir/script_support/hdl/synchronizer.v
import_files -library work -hdl_source $local_dir/script_support/hdl/Reset_Synchronizer.v
import_files -library work -hdl_source $local_dir/script_support/hdl/FabUART.v