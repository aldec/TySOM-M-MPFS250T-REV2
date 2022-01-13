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

module synchronizer(
                          input clk_i,      //UART input Clock                                                               //Input Reset Signal                                                     
                          input req_user_data_tx_i,     //Lock signal from PF_CCC_0           
                                                          
                          output user_data_val_tx_o    //Synchronous Reset output signal                                 
                          );
//*****************************************************************************
//************************** Signal Declaration********************************
//*****************************************************************************

  reg s_sync1;
  reg s_sync2;

//*****************************************************************************
//************** Logic for starting Counter based on User Data Valid***********
//*****************************************************************************
always @ (posedge clk_i)
      begin
        s_sync1 <= req_user_data_tx_i;
        s_sync2 <=s_sync1;
      end
//*****************************************************************************
//************************** Concurrent Assignment ****************************
//*****************************************************************************
assign user_data_val_tx_o = s_sync2;
endmodule

