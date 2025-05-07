//*****************************************************************************
//
//    File Name    : Count_Checker.v 
//
//    Description  : This module implements the Count_Checker to be used in the 
//                   Rx section.
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

module Count_Checker( input clk_i,                        //Transceiver RX clock
                      input reset_n_i,                    //RX Valid signal from Transceiver is given as reset
                      input [31:0]data_i,                 //Data input from LiteFast IP in Receiver mode
                      input start_i,                      //Start Signal from UART_IF_0
                      input rx_val_in,                    //RX VAlid signal from Transceiver
                      input usr_data_valid_i,             //User data Valid from LiteFast IP in Receiver mode
                      input clear_i,                      //Clear Signal to clear all errors from UART_IF_0
                      input crc_error_result_i,           //CRC Error signal from LiteFast IP in Receiver mode

                      output rx_val_o,                    //RX Valid signal output registered over RX clock
                      output lock_o,                      //Lock signal that indicates data match 
                      output error_o,                     //Error signal that indicates data mismatch
                      output crc_error_o,                 //CRC error signal indicates any CRC error in flow
                      output [31:0]data_tx_o,             //Received data output from the LiteFast IP in Receiver mode
                      output [31:0]data_rx_o);            //Count Checker generated data output

//****************************************************************************
//************************** Signal Declaration*******************************
//****************************************************************************

reg [31:0] s_data ;
reg [31:0] s_data_in ;
reg [31:0] s_data_in_d ;
reg [31:0] data_rx_o_reg;
reg start_count ;
reg [1:0]count ;
reg [1:0]crc_count ;
reg s_rx_val ;
reg s_lock ;
reg s_error ;
reg s_crc_error;

//****************************************************************************
//************** Logic for starting Counter based on User Data Valid**********
//****************************************************************************  
always @ (posedge clk_i, negedge reset_n_i)
 if (reset_n_i==1'b0)
    begin
        s_data<= 32'h00000000;
        start_count<=1'b0;
    end
    else 
    begin
      if(start_i==1'b1)begin
      if(usr_data_valid_i==1'b1)begin
        if(start_count==1'b0)begin
        s_data <=data_i;
        start_count<=1'b1;
        end
        else
        s_data <=s_data+1;
        begin
        end
      end
      else
      begin
        s_data<= s_data; 
        start_count<=1'b0;
      end
      end
      else
      begin
        s_data<= 32'h00000000;
        start_count<=1'b0;
      end
    end       

//****************************************************************************
//************** Logic for Capturing incoming data ***************************
//****************************************************************************  
always @ (posedge clk_i, negedge reset_n_i)
 if (reset_n_i==1'b0)
    begin
        s_data_in<= 32'h00000000;
        s_data_in_d<= 32'h00000000;
    end
    else 
    begin
      if(start_i==1'b1)begin
        s_data_in <=data_i;
        if(usr_data_valid_i==1'b1)
        s_data_in_d <=s_data_in;
        else
        s_data_in_d <=s_data_in_d; 
      end
      else
      begin
        s_data_in<= 32'h00000000;
        s_data_in_d<= 32'h00000000;
      end
   
    end    
//****************************************************************************
//************** Logic for Capturing lock and rx_error ***********************
//****************************************************************************  
always @ (posedge clk_i, negedge reset_n_i)
 if (reset_n_i==1'b0)
    begin
        s_lock<= 1'b0;
        s_error<= 1'b0;
        count<=2'b00;
    end
    else 
    begin
      if(start_i==1'b1)begin
       if(usr_data_valid_i==1'b1)begin
        if(s_data_in_d==data_rx_o_reg)begin
            if(count==2'b11)begin
             s_lock<= 1'b1;
             s_error<= 1'b0;
             count<=2'b00;
            end
            else
            begin
             s_lock<= s_lock;
             s_error<= s_error;
             count<=count+1'b1;
            end
        end
        else
        begin
            if(count==2'b11)begin
             s_lock<= 1'b0;
             s_error<= 1'b1;
             count<=2'b00;
            end
            else
            begin
             s_lock<= s_lock;
             s_error<= s_error;
             count<=count+1'b1;
            end
        end
      end
      else
      begin
        s_lock<= s_lock;
        s_error<= s_error;
        count<=2'b00;
      end
      end
      else
      begin
        s_lock<= 1'b0;
        s_error<= 1'b1;
        count<=2'b00;
      end
    end    


//****************************************************************************
//************** Logic for CRC Error Capturing in UART ***********************
//****************************************************************************  
always @ (posedge clk_i, negedge reset_n_i)
 if (reset_n_i==1'b0)
    begin
        s_crc_error<=1'b0;
        crc_count<=2'b00;
    end
    else 
    begin
     if(start_i==1'b1)begin
       if(usr_data_valid_i==1'b1)begin
         if(crc_error_result_i==1'b1)
            crc_count<=crc_count+1'b1;
         else begin
            if(crc_count==2'b11)
            crc_count<=2'b00;
            else
            crc_count<=crc_count;
         end

         if(crc_count==2'b10)begin
            if(clear_i==1'b1)
            s_crc_error<=1'b0;
            else
            s_crc_error<=1'b1;
         end
         else begin
            if(clear_i==1'b1)
            s_crc_error<=1'b0;
            else
            s_crc_error<=s_crc_error;
         end
       end
       else
       begin
         s_crc_error<=s_crc_error;
       end
     end
     else
     begin
        s_crc_error<=1'b0;
     end  
    end   

//****************************************************************************
//************** Logic for Registering RX data *******************************
//****************************************************************************  
always @ (posedge clk_i, negedge reset_n_i)
 if (reset_n_i==1'b0)
    begin
        data_rx_o_reg <= 32'h00000000;    
    end
    else 
    begin
        case (usr_data_valid_i)
            1'b1: data_rx_o_reg <= s_data;
            default: data_rx_o_reg <= data_rx_o_reg;
        endcase
    end  
            

//****************************************************************************
//************** Logic for Registering RX data *******************************
//****************************************************************************  
always @ (posedge clk_i, negedge reset_n_i)
 if (reset_n_i==1'b0)
    begin
        s_rx_val <= 1'b0;   
    end
    else 
    begin
        case (start_i)
            1'b0: s_rx_val <= 1'b0;
            1'b1: s_rx_val <= rx_val_in;
            default: s_rx_val <= s_rx_val;
        endcase
    end  
            
//****************************************************************************
//************************** Concurrent Assignment ***************************
//**************************************************************************** 
assign lock_o=s_lock;
assign data_tx_o=s_data_in_d;
assign rx_val_o=s_rx_val;
assign error_o=(clear_i)?1'b0:s_error;
assign crc_error_o=(clear_i)?1'b0:s_crc_error;
assign data_rx_o = data_rx_o_reg;
                                
endmodule

