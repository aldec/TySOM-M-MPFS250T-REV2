puts "***** 1_check_libero_version.tcl - check libero version, it should be 2024.2"

if {[string compare [string range [get_libero_version] 0 end-3] "2024.2.0"]==0} {
    puts "Libero v2024.2 detected."
} else {
    error "Incorrect Libero version. Please use Libero v2024.2 to run these scripts."
}

if { [lindex $tcl_platform(os) 0]  == "Windows" } {
    if {[string length [pwd]] < 90} {
        puts "Project path length ok."
    } else {
        error "Path to project is too long, please reduce the path and try again."
    }
}

if { $::argc > 0 } {
    set i 1
    foreach arg $::argv {
        set temp [split $arg ":"]
        puts "Setting parameter [lindex $temp 0] to [lindex $temp 1]"
        set [lindex $temp 0] "[lindex $temp 0]:[lindex $temp 1]"
        incr i
    }
} else {
    puts "no command line argument passed"
}
