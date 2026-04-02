TCL Script Directory Structure

The TCL Script directory is organized as shown below:

 TCL_Script 
     |
     |----src
     |     |---components
     |     |---constraints
     |     |---hdl
     |     |---simulation
     |     |---stimulus
     |     |---1_check_libero_version.tcl
     |     |---2_download_cores.tcl
     |     |---3_import_hdl.tcl
     |     |---4_source_components.tcl
     |     |---5_constraints.tcl
     |     |---6_simulation.tcl
     |
     |----script.tcl
     |----readme.txt

TCL Script Folders
 
TCL_Script\src folder contains the following folders:
* components: contains core configuration TCLs, which are required to create the design.
* constraints: contains IO, user timing, and floor planning constraints.
* hdl: contains HDL files.
* simulation: contains files needed for simulation, for example .do scripts and C source with DPI function
* stimulus: contains testbench and SystemVerilog file with DPI function calls

TCL Files

TCL_Script\src includes the following TCL files:
* 1_check_libero_version.tcl: checks whether the Libero version is 2024.2.
* 2_download_cores.tcl: download needed IP cores from repositories.
* 3_import_hdl.tcl: import HDL files.
* 4_source_components.tcl: source core configuration TCL scripts for all components.
* 5_constraints.tcl: imports all constraints required for the design.
* 6_simulation.tcl: imports all simulation scripts and sets simulation options
* script.tcl: this is the top-level script, which creates the Libero project directory, sets device, project name, and other tool profiles. It invokes all the above TCLs which are required to complete the Libero Design flow.

Running the TCL

To run the TCL script, follow these steps:
1. Launch the Libero software
2. Select Project > Execute Script.... 
3. Click Browse and select script.tcl file.
4. Click Run.
After successful execution of TCL script, Libero project is created within current directory.

--------------------------------------

Running simulation

1. Set the Riviera-PRO path in script.tcl using the riviera_dir variable.
2. Check if Riviera-PRO is detected as simulation tool. Select Project > Tool Profiles > Simulation. If there is no Riviera, add new profile. Set <riviera_path>/bin/vsim
3. Check if your Riviera-PRO has the polarfire library. In <riviera_path>/vlib there should be a polarfire directory. If this directory does not exist, you should download the library from Aldec website.
   Please log in, go to the Download section and select "Archived Product Builds and Libraries". Select your Riviera version and select the correct Microchip libraries.
   After preparing the library, check if the file <riviera_path>/vlib/library.cfg contains the following line: 'polarfire = "./polarfire/polarfire.lib"'. You can now run the simulation correctly.
4. Run simulation. Select "Verify Pre-Synthesized Design" > Simulate.
5. Now Riviera-PRO is executing. After preparing, simulation is started and now some data can be sent.
6. If you run Libero in console, in this console there should be printed message: "/dev/pts/<n>: /dev/pts/N for UART (terminal)". The value of N may vary, linux system set it.
   Now open new console and run "picocom -b 115200 /dev/pts/N", where N has value the same as in comsole with Libero.
   This is Pseudoterminal (PTY), which emulates UART device.
7. Type some characters on keyboard and wait. Now in simulation changes will appear on RX and after on TX signal.
8. In picocom you can observe the received data.

Running on hardware

1. Click "Generate Bitstream". All processes before this process will be executed.
2. Click "Run PROGRAM Action" and program your FPGA.
3. Open new console and run: "sudo picocom -b 115200 /dev/ttyUSB3"
4. Type some characters on keyboard and observe the received data.


