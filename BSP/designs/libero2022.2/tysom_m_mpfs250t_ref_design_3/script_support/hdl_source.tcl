#Importing and Linking all the HDL source files used in the design
import_files -library work -hdl_source $local_dir/script_support/hdl/AXI4_address_shim.v
import_files -library work -hdl_source $local_dir/script_support/hdl/apb_arbiter.v
import_files -library work -hdl_source $local_dir/script_support/hdl/APB_PASS_THROUGH.v
import_files -library work -hdl_source $local_dir/script_support/hdl/fabric_sd_emmc_demux_select.v
