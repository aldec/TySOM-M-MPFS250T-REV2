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

Simulation in this project is slow due to the use of PolarFire primitives. Additionally, a large amount of data is displayed in the terminal via UART.
To speed up the simulation, it is recommended to enable the LIGHT_UART parameter in the DecodeUART module. When this parameter is enabled, less data is transmitted via UART.

1. Check if Riviera-PRO is detected as simulation tool. Select Project > Tool Profiles > Simulation. If there is no Riviera, add new profile. Set <riviera_path>/bin/vsim
2. Check if your Riviera-PRO has Libero library. In <riviera_path>/vlib there should be polarfire directory. If this directory does not exist, copy there src/simulation/polarfire directory.
   Add the following line to <riviera_path>/vlib/library.cfg: polarfire = "./polarfire/polarfire.lib". Now you can run simulation correctly.
3. Run simulation. Select "Verify Pre-Synthesized Design" > Simulate
4. Now Riviera-PRO is executing. After preparing, simulation is started and now some data can be sent.
5. If you run Libero in console, in this console there should be printed message: "/dev/pts/<n>: /dev/pts/N for UART (terminal)". The value of N may vary, linux system set it.
   Now open new console and run "picocom -b 115200 /dev/pts/N", where N has value the same as in comsole with Libero.
   This is Pseudoterminal (PTY), which emulates UART device.
6. Type some characters on keyboard and wait. Now in simulation changes will appear on RX and after on TX signal
7. In picocom you can observe the received data.

--------------------------------------

Running on hardware

1. Click "Generate Bitstream". All processes before this process will be executed.
2. Click "Run PROGRAM Action" and program your FPGA.
3. Open new console and run: "sudo picocom -b 115200 /dev/ttyUSB3"
4. You can now press 1 or 2.

'1' - start transmission
'2' - display data

Press '2' to display data:

L0: rx_lock:0 rx_valid:0 rx_error:0 tx_clk_stable:1 tx_words_in:0000000000 rx_words_in:0000000000 rx_error_counter:00000 crc_error_counter:00000
L1: rx_lock:0 rx_valid:0 rx_error:0 tx_clk_stable:1 tx_words_in:0000000000 rx_words_in:0000000000 rx_error_counter:00000 crc_error_counter:00000
L2: rx_lock:0 rx_valid:0 rx_error:0 tx_clk_stable:1 tx_words_in:0000000000 rx_words_in:0000000000 rx_error_counter:00000 crc_error_counter:00000
L3: rx_lock:0 rx_valid:0 rx_error:0 tx_clk_stable:1 tx_words_in:0000000000 rx_words_in:0000000000 rx_error_counter:00000 crc_error_counter:00000

At this stage, transmission has not started yet. All signals and counters are set to 0. Only the tx_clk_stable signal is asserted (1).

Press '1' to start the transmission.

Then press '2' again to display data:

L0: rx_lock:1 rx_valid:1 rx_error:0 tx_clk_stable:1 tx_words_in:2915786496 rx_words_in:2915786496 rx_error_counter:00000 crc_error_counter:00000
L1: rx_lock:1 rx_valid:1 rx_error:0 tx_clk_stable:1 tx_words_in:2915786496 rx_words_in:2915786496 rx_error_counter:00000 crc_error_counter:00000
L2: rx_lock:1 rx_valid:1 rx_error:0 tx_clk_stable:1 tx_words_in:2915786497 rx_words_in:2915786497 rx_error_counter:00000 crc_error_counter:00000
L3: rx_lock:1 rx_valid:1 rx_error:0 tx_clk_stable:1 tx_words_in:2915786497 rx_words_in:2915786497 rx_error_counter:00000 crc_error_counter:00000

Now the rx_lock and rx_valid signals are asserted (1).
The tx_words_in and rx_words_in counters are incrementing.
If there are no transmission errors, both rx_error_counter and crc_error_counter remain equal to 0.



