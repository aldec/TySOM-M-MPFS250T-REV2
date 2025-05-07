//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Fri Apr 18 10:10:40 2025
// Version: 2024.2 2024.2.0.13
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

//////////////////////////////////////////////////////////////////////
// Component Description (Tcl) 
//////////////////////////////////////////////////////////////////////
/*
# Exporting Component Description of Display_Controller_New to TCL
# Family: PolarFireSoC
# Part Number: MPFS250T_ES-1FCG1152E
# Create and Configure the core component Display_Controller_New
create_and_configure_core -core_vlnv {Microchip:SolutionCore:Display_Controller:4.8.0} -component_name {Display_Controller_New} -params {\
"g_DYNAMIC_FORMAT_CFG:0"  \
"g_ENABLE_EXT_SYNC:1"  \
"g_FORMAT:0"  \
"g_PIXELS_DATA_WIDTH:24"  \
"g_PIXELS_PER_CLK:1"  \
"g_VIDEO_FORMAT:1"   }
# Exporting Component Description of Display_Controller_New to TCL done
*/

// Display_Controller_New
module Display_Controller_New(
    // Inputs
    DATA_I,
    ENABLE_I,
    EXT_SYNC_SIGNAL_I,
    RESETN_I,
    SYS_CLK_I,
    // Outputs
    DATA_O,
    DATA_TRIGGER_O,
    DATA_VALID_O,
    FRAME_END_O,
    H_RES_O,
    H_SYNC_O,
    V_ACTIVE_O,
    V_RES_O,
    V_SYNC_O
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [23:0] DATA_I;
input         ENABLE_I;
input         EXT_SYNC_SIGNAL_I;
input         RESETN_I;
input         SYS_CLK_I;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [23:0] DATA_O;
output        DATA_TRIGGER_O;
output        DATA_VALID_O;
output        FRAME_END_O;
output [15:0] H_RES_O;
output        H_SYNC_O;
output        V_ACTIVE_O;
output [15:0] V_RES_O;
output        V_SYNC_O;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [23:0] DATA_I;
wire   [23:0] DATA_O_net_0;
wire          DATA_TRIGGER_O_net_0;
wire          DATA_VALID_O_net_0;
wire          ENABLE_I;
wire          EXT_SYNC_SIGNAL_I;
wire          FRAME_END_O_net_0;
wire   [15:0] H_RES_O_net_0;
wire          H_SYNC_O_net_0;
wire          RESETN_I;
wire          SYS_CLK_I;
wire          V_ACTIVE_O_net_0;
wire   [15:0] V_RES_O_net_0;
wire          V_SYNC_O_net_0;
wire          FRAME_END_O_net_1;
wire          H_SYNC_O_net_1;
wire          V_SYNC_O_net_1;
wire          V_ACTIVE_O_net_1;
wire          DATA_TRIGGER_O_net_1;
wire          DATA_VALID_O_net_1;
wire   [15:0] H_RES_O_net_1;
wire   [15:0] V_RES_O_net_1;
wire   [23:0] DATA_O_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire   [15:0] H_RESOLUTION_I_const_net_0;
wire   [15:0] V_RESOLUTION_I_const_net_0;
wire   [15:0] H_F_PORCH_I_const_net_0;
wire   [15:0] H_B_PORCH_I_const_net_0;
wire   [15:0] V_F_PORCH_I_const_net_0;
wire   [15:0] V_B_PORCH_I_const_net_0;
wire   [15:0] H_SYNC_WIDTH_I_const_net_0;
wire   [15:0] V_SYNC_WIDTH_I_const_net_0;
wire          GND_net;
wire   [23:0] TDATA_I_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign H_RESOLUTION_I_const_net_0 = 16'h0000;
assign V_RESOLUTION_I_const_net_0 = 16'h0000;
assign H_F_PORCH_I_const_net_0    = 16'h0000;
assign H_B_PORCH_I_const_net_0    = 16'h0000;
assign V_F_PORCH_I_const_net_0    = 16'h0000;
assign V_B_PORCH_I_const_net_0    = 16'h0000;
assign H_SYNC_WIDTH_I_const_net_0 = 16'h0000;
assign V_SYNC_WIDTH_I_const_net_0 = 16'h0000;
assign GND_net                    = 1'b0;
assign TDATA_I_const_net_0        = 24'h000000;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign FRAME_END_O_net_1    = FRAME_END_O_net_0;
assign FRAME_END_O          = FRAME_END_O_net_1;
assign H_SYNC_O_net_1       = H_SYNC_O_net_0;
assign H_SYNC_O             = H_SYNC_O_net_1;
assign V_SYNC_O_net_1       = V_SYNC_O_net_0;
assign V_SYNC_O             = V_SYNC_O_net_1;
assign V_ACTIVE_O_net_1     = V_ACTIVE_O_net_0;
assign V_ACTIVE_O           = V_ACTIVE_O_net_1;
assign DATA_TRIGGER_O_net_1 = DATA_TRIGGER_O_net_0;
assign DATA_TRIGGER_O       = DATA_TRIGGER_O_net_1;
assign DATA_VALID_O_net_1   = DATA_VALID_O_net_0;
assign DATA_VALID_O         = DATA_VALID_O_net_1;
assign H_RES_O_net_1        = H_RES_O_net_0;
assign H_RES_O[15:0]        = H_RES_O_net_1;
assign V_RES_O_net_1        = V_RES_O_net_0;
assign V_RES_O[15:0]        = V_RES_O_net_1;
assign DATA_O_net_1         = DATA_O_net_0;
assign DATA_O[23:0]         = DATA_O_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------Display_Controller   -   Microchip:SolutionCore:Display_Controller:4.8.0
Display_Controller #( 
        .g_DYNAMIC_FORMAT_CFG ( 0 ),
        .g_ENABLE_EXT_SYNC    ( 1 ),
        .g_FORMAT             ( 0 ),
        .g_PIXELS_DATA_WIDTH  ( 24 ),
        .g_PIXELS_PER_CLK     ( 1 ),
        .g_VIDEO_FORMAT       ( 1 ) )
Display_Controller_New_0(
        // Inputs
        .RESETN_I          ( RESETN_I ),
        .SYS_CLK_I         ( SYS_CLK_I ),
        .ENABLE_I          ( ENABLE_I ),
        .EXT_SYNC_SIGNAL_I ( EXT_SYNC_SIGNAL_I ),
        .DATA_I            ( DATA_I ),
        .H_RESOLUTION_I    ( H_RESOLUTION_I_const_net_0 ), // tied to 16'h0000 from definition
        .V_RESOLUTION_I    ( V_RESOLUTION_I_const_net_0 ), // tied to 16'h0000 from definition
        .H_F_PORCH_I       ( H_F_PORCH_I_const_net_0 ), // tied to 16'h0000 from definition
        .H_B_PORCH_I       ( H_B_PORCH_I_const_net_0 ), // tied to 16'h0000 from definition
        .V_F_PORCH_I       ( V_F_PORCH_I_const_net_0 ), // tied to 16'h0000 from definition
        .V_B_PORCH_I       ( V_B_PORCH_I_const_net_0 ), // tied to 16'h0000 from definition
        .H_SYNC_WIDTH_I    ( H_SYNC_WIDTH_I_const_net_0 ), // tied to 16'h0000 from definition
        .V_SYNC_WIDTH_I    ( V_SYNC_WIDTH_I_const_net_0 ), // tied to 16'h0000 from definition
        .TVALID_I          ( GND_net ), // tied to 1'b0 from definition
        .TDATA_I           ( TDATA_I_const_net_0 ), // tied to 24'h000000 from definition
        // Outputs
        .TREADY_O          (  ),
        .FRAME_END_O       ( FRAME_END_O_net_0 ),
        .H_SYNC_O          ( H_SYNC_O_net_0 ),
        .V_SYNC_O          ( V_SYNC_O_net_0 ),
        .V_ACTIVE_O        ( V_ACTIVE_O_net_0 ),
        .DATA_TRIGGER_O    ( DATA_TRIGGER_O_net_0 ),
        .DATA_VALID_O      ( DATA_VALID_O_net_0 ),
        .H_RES_O           ( H_RES_O_net_0 ),
        .V_RES_O           ( V_RES_O_net_0 ),
        .DATA_O            ( DATA_O_net_0 ),
        .TDATA_O           (  ),
        .TUSER_O           (  ),
        .TSTRB_O           (  ),
        .TKEEP_O           (  ),
        .TLAST_O           (  ),
        .TVALID_O          (  ) 
        );


endmodule
