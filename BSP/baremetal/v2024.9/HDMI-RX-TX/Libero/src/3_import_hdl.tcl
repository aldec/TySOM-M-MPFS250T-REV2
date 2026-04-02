puts "***** 3_import_hdl.tcl - source hdl files"

#Importing and Linking all the HDL source files used in the design
import_files -library work -hdl_source $local_dir/$src_path/hdl/ADV7611_RX.vhd

build_design_hierarchy
