//*****************************************************************************
//
//    File Name       : Counter.v 
//
//    Description     : This module implements the Counter to be used in the 
//                      Tx section
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

//****************************************************************************
//**************************** Module Declaration ****************************
//****************************************************************************
module Counter(input clk_i,                                   //Transceiver TX Clock
               input reset_n_i,                               //RX Valid signal from Transceiver is given as reset
               input start_i,                                 //Start Signal from UART_IF_0
               input payload_error_i,                         //Payload error Signal from UART_IF_0 for introducing error in data payload

               output [31 : 0] data_out_o                     //Data to be given as payload to LiteFast Transmitter block
               );
//****************************************************************************
//************************** Signal Declaration*******************************
//****************************************************************************

  reg[31 : 0] s_count_data;

//****************************************************************************
//************** Logic for starting Counter based on User Data Valid**********
//****************************************************************************
always @ (posedge clk_i, negedge reset_n_i)
    if (reset_n_i == 1'b0)
      begin
        s_count_data <= 32'h00000000;
      end
    else
      begin
       if(start_i==1'b1)begin
           if (s_count_data < 32'hFFFFFFFF)  //32 bit counter roll over limit                                       
              begin
                s_count_data <= s_count_data + 1;    //Counter Data Increment                                  
              end
            else
              begin
                s_count_data <= 32'h00000000;
              end
       end
       else
       begin
        s_count_data <= 32'h00000000;
       end      
      end
//****************************************************************************
//************************** Concurrent Assignment ***************************
//****************************************************************************

 assign data_out_o = (payload_error_i)?(~s_count_data):s_count_data;  //Data output based on payload_error            

endmodule
