///****************************************************************************
//
//    File Name       : Reset_Synchronizer.v

//    Description     : This module synchronizes the Asynchronous Resets
//
//    Targeted device : Microsemi FPGAs
//
//    Author          : Solutions Team
//                               
//
//
//    COPYRIGHT 2017 BY MICROSEMI 
//    THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING 
//    RESTRICTIONS FROM MICROSEMI CORP.  IF YOU ARE NOT IN POSSESSION OF 
//    WRITTEN AUTHORIZATION FROM MICROSEMI FOR USE OF THIS FILE, THEN 
//    THE FILE SHOULD BE IMMEDIATELY DESTROYED AND NO BACK-UP OF THE 
//    FILE SHOULD BE MADE.
//****************************************************************************/

//*****************************************************************************
//**************************** Module Declaration *****************************
//*****************************************************************************

module Reset_Synchronizer(
                          input clk_i,      //UART input Clock                                                             
                          input reset_n_i,  //Input Reset Signal                                                     
                          input lock_i,     //Lock signal from PF_CCC_0           
                                                          
                          output reset_o    //Synchronous Reset output signal                                 
                          );
//*****************************************************************************
//************************** Signal Declaration********************************
//*****************************************************************************

  reg s_sync1;
  reg s_sync2;

//*****************************************************************************
//************** Logic for starting Counter based on User Data Valid***********
//*****************************************************************************
always @ (posedge clk_i, negedge reset_n_i)
    if (reset_n_i == 1'b0)
      begin
        s_sync1 <=1'b0;
        s_sync2 <=1'b0;
      end
    else
      begin
        s_sync1 <=lock_i;
        s_sync2 <=s_sync1;
      end
//*****************************************************************************
//************************** Concurrent Assignment ****************************
//*****************************************************************************
assign reset_o = s_sync2;
endmodule

