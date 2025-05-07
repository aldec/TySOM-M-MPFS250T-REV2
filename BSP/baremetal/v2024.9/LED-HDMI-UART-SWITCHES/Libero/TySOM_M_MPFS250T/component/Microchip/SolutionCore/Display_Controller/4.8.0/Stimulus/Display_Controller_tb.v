/*-------------------------------------------------------------------------------------------------
--
-- File Name         : Display_Controller_tb.v 
-- Description       : This module generates display controller and sync information for display.
-- Targeted device   : Microchip FPGAs                    
-- Author            : India Solutions Team
--
-- COPYRIGHT 2022 BY MICROSEMI 
-- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS 
-- FROM MICROSEMI CORP.  IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM 
-- MICROSEMI FOR USE OF THIS FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND 
-- NO BACK-UP OF THE FILE SHOULD BE MADE. 
-- 
-------------------------------------------------------------------------------------------------*/
/*=================================================================================================
-- Display_Controller_tb entity declaration
--===============================================================================================*/
`timescale 1ns/100ps

`include "../coreparameters.v"

module Display_Controller_tb();

/*=================================================================================================
-- Parameter declarations
--===============================================================================================
//Video format selection either to choose from input or user defined 
parameter g_DYNAMIC_FORMAT_CFG     = 0 ; //-- 0 -> selected from default parameter 
                                         //-- 1 -> seletced from user specific
									   
//Video format selection
parameter g_VIDEO_FORMAT           = 1 ; //-- 0 -> 1280x720 
                                         //-- 1 -> 1920x1080 
									     //-- 2 -> 3840x2160 
									     //-- 3 -> 640x360

//--- Pixel per clock
parameter g_PIXELS_PER_CLK         = 1 ; //-- 1 -> "1" Pixel per clock 
                                         //-- 4 -> "4" Pixel per clock 

//--- Selecting for Native Format or AXI Based Format
parameter g_FORMAT                 = 0 ; //-- 0 -> Display_Controller_Native 
                                         //-- 1 -> Display_Controller with AXI*/
										 
										 
parameter SYSCLK_PERIOD            = 10 ;
 
/*=================================================================================================
-- Signal declarations
--===============================================================================================*/
wire   s_h_sync_tb;
wire   s_vactive_tb;
wire   s_v_sync_tb;
wire   s_data_trigger_tb;
wire   s_frame_end_tb;
wire   s_data_valid_tb;
wire   [15:0] s_h_res_tb;
wire   [15:0] s_v_res_tb;

reg    reset_tb;
reg    sys_clk_tb;
reg    s_ext_sync_signal_tb ;
reg    s_start;

/*=================================================================================================
-- Asynchronous blocks
--===============================================================================================*/
initial 

begin

reset_tb             = 1'd0;
sys_clk_tb           = 1'd0;
s_ext_sync_signal_tb = 1'd0;
s_start              = 1'd0;

end

always @(sys_clk_tb)
    #(SYSCLK_PERIOD / 2.0) sys_clk_tb <= !sys_clk_tb;

initial
begin
    #(SYSCLK_PERIOD * 10 )
        reset_tb = 1'b1;
end

always
begin
  if (s_start == 1'd1) 
    begin
	  s_ext_sync_signal_tb <= 1'd1;
	  #(1920 * SYSCLK_PERIOD);
	  s_ext_sync_signal_tb <= 1'd0;
	  #(280 * SYSCLK_PERIOD);	   
	end
  else
    begin
	  s_ext_sync_signal_tb <= 1'd0;
      #(66000 * SYSCLK_PERIOD)
	  s_start <= 1'd1;
    end 	
end

/*=================================================================================================
-- Component Instantiations
--===============================================================================================*/ 
  generate 
    if (g_DYNAMIC_FORMAT_CFG == 0)
	begin
	    Display_Controller # (
          .g_DYNAMIC_FORMAT_CFG                (g_DYNAMIC_FORMAT_CFG      ), 
          .g_VIDEO_FORMAT                      (g_VIDEO_FORMAT            ),
          .g_FORMAT                            (g_FORMAT                  ),		  
	      .g_PIXELS_DATA_WIDTH                 (g_PIXELS_DATA_WIDTH       ),
          .g_ENABLE_EXT_SYNC                   (g_ENABLE_EXT_SYNC         ),
          .g_PIXELS_PER_CLK                    (g_PIXELS_PER_CLK          )
        )  DISPLAY_CONTROLLER (                                   
          .SYS_CLK_I                           (sys_clk_tb                ), 
          .RESETN_I                            (reset_tb                  ), 
          .ENABLE_I 	                       (1'd1                      ),
          .H_RESOLUTION_I                      (16'd0                     ), 
          .V_RESOLUTION_I                      (16'd0                     ), 
          .H_F_PORCH_I                         (16'd0                     ), 
          .H_B_PORCH_I                         (16'd0                     ), 
          .V_F_PORCH_I                         (16'd0                     ), 
          .V_B_PORCH_I                         (16'd0                     ), 
          .H_SYNC_WIDTH_I                      (16'd0                     ), 
          .V_SYNC_WIDTH_I                      (16'd0                     ),
          .EXT_SYNC_SIGNAL_I                   (s_ext_sync_signal_tb      ), 
          .TVALID_I	                           (1'd0                      ),	  
          .TDATA_I	                           (24'd0                     ),	  
          .DATA_I	                           (24'd0                     ),	  
          .H_SYNC_O                            (s_h_sync_tb               ), 
          .V_SYNC_O                            (s_v_sync_tb               ), 
          .V_ACTIVE_O	                       (s_vactive_tb              ), 
          .DATA_TRIGGER_O                      (s_data_trigger_tb         ), 
          .FRAME_END_O                         (s_frame_end_tb            ), 
          .DATA_VALID_O                        (s_data_valid_tb           ), 
          .V_RES_O                             (s_v_res_tb                ), 
          .H_RES_O                             (s_h_res_tb                ),
          .TREADY_O	                           (                          ),	  
          .DATA_O	                           (                          ),	  
          .TLAST_O	                           (                          ),	  
          .TVALID_O	                           (                          ),	  
          .TDATA_O	                           (                          ),	  
          .TSTRB_O	                           (                          ),	  
          .TKEEP_O	                           (                          ),	  
          .TUSER_O	                           (                          )	  
        );  
	  end
	else
      begin
        Display_Controller # (
          .g_DYNAMIC_FORMAT_CFG                (g_DYNAMIC_FORMAT_CFG      ), 
          .g_FORMAT                            (g_FORMAT                  ),		  
          .g_VIDEO_FORMAT                      (g_VIDEO_FORMAT            ), 
	      .g_PIXELS_DATA_WIDTH                 (g_PIXELS_DATA_WIDTH       ),
          .g_ENABLE_EXT_SYNC                   (g_ENABLE_EXT_SYNC         ),
          .g_PIXELS_PER_CLK                    (g_PIXELS_PER_CLK          )
        )  DISPLAY_CONTROLLER (                                   
          .SYS_CLK_I                           (sys_clk_tb                ), 
          .RESETN_I                            (reset_tb                  ), 
          .ENABLE_I 	                       (1'd1                      ),
          .H_RESOLUTION_I                      (16'h0780                  ), 
          .V_RESOLUTION_I                      (16'h0438                  ), 
          .H_F_PORCH_I                         (16'h0058                  ), 
          .H_B_PORCH_I                         (16'h0094                  ), 
          .V_F_PORCH_I                         (16'h0004                  ), 
          .V_B_PORCH_I                         (16'h0024                  ), 
          .H_SYNC_WIDTH_I                      (16'h002C                  ), 
          .V_SYNC_WIDTH_I                      (16'h0005                  ), 
          .EXT_SYNC_SIGNAL_I                   (s_ext_sync_signal_tb      ), 
          .TVALID_I	                           (1'd0                      ),	  
          .TDATA_I	                           (24'd0                     ),	  
          .DATA_I	                           (24'd0                     ),
          .H_SYNC_O                            (s_h_sync_tb               ), 
          .V_SYNC_O                            (s_v_sync_tb               ), 
          .V_ACTIVE_O	                       (s_vactive_tb              ), 
          .DATA_TRIGGER_O                      (s_data_trigger_tb         ), 
          .FRAME_END_O                         (s_frame_end_tb            ), 
          .DATA_VALID_O                        (s_data_valid_tb           ), 
          .DATA_O	                           (                          ),	  
          .V_RES_O                             (s_v_res_tb                ), 
          .H_RES_O                             (s_h_res_tb                ),
          .TREADY_O	                           (                          ),	  
          .TLAST_O	                           (                          ),	  
          .TVALID_O	                           (                          ),	  
          .TDATA_O	                           (                          ),	  
          .TSTRB_O	                           (                          ),	  
          .TKEEP_O	                           (                          ),	  
          .TUSER_O	                           (                          )	 
        );
      end
 endgenerate
 
endmodule  
  