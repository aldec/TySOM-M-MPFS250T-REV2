///****************************************************************************
//
//    File Name       : FabUART.v

//    Description     : This module implements the logic in the fabric for 
//                      communication between the COREUART and FPGA logic
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
module FabUART(input clk,                       //125 MHzClock from PF_CCC_0
               input reset,                     //PF_CCC_0 lock is given as reset signal
               input uart_txrdy,                //CoreUART TX ready signal
               input uart_rxrdy,                //CoreUART RX ready signal
               input rx_val_i,                  //RX Valid signal from Count Checker
               input rx_lock_i,                 //RX Lock signal from Count Checker indicating data match
               input rx_error_i,                //RX Error signal from Count Checker indicating data mismatch
               input crc_error_i,               //CRC error signal from Count Checker indicating Check sum error
               input payload_err_i,             //Payload error signal from Count Checker indicating data payload error
               input [7:0]uart_data_in,         //Parallel data input from CoreUART
               input [15:0]tx_words_in,         //Received data over Transceiver from Count checker
               input [15:0]rx_words_in,         //Count checker generated data
               input start_test,
               
               output uart_wen,                 //Write enable signal given to CoreUART
               output uart_oen,                 //Output enable signal given to CoreUART
               output start_o,                  //Start signal given to Counter and Count Checker modules
               output clear_o,                  //Clear Signal given to clear any errors
               output payload_err_o,            //Payload error output signal for introduction of data payload error in Counter
               output crc_err_o,                //CRC error output signal that introduces CRC error in LiteFast Transmitter section
               output connect_o,                //Connect signal indicating COMPORT connection status
               output [7:0]uart_data_out        //Parallel data ouput that is given to CoreUART
               );
//*****************************************************************************
//**************************** Signal Declaration *****************************
//*****************************************************************************

reg uart_wen_t;
reg uart_oen_t;
reg start_t;
reg clear_t;
reg [7:0]uart_data_out_t;
reg payload_err_t;
reg crc_err_t;
reg data_flag;
reg connect_t;
reg scan_t;

parameter [4:0] INIT =5'b00000;
parameter [4:0] UART_TX_CMD=5'b00001;
parameter [4:0] UART_WAIT0=5'b00010;
parameter [4:0] UART_TX1=5'b00011;
parameter [4:0] UART_WAIT1=5'b00100;
parameter [4:0] UART_TX2=5'b00101;

parameter [4:0] UART_TX_CNT =5'b 00110;
parameter [4:0] UART_WAIT2=5'b00111;
parameter [4:0] UART_TX_CNT1=5'b01000;
parameter [4:0] UART_WAIT3=5'b01001;
parameter [4:0] UART_TX_CNT2=5'b01010;
parameter [4:0] UART_WAIT4=5'b01011; 

parameter [4:0] UART_TX_SCAN =5'b01100;
parameter [4:0] UART_WAIT5=5'b01101;
parameter [4:0] UART_TX_SCAN1=5'b01110;
parameter [4:0] UART_WAIT6=5'b01111;
parameter [4:0] UART_TX_SCAN2=5'b10000;
parameter [4:0] UART_WAIT7=5'b10001; 

parameter [4:0] UART_WAIT1_EXT1=5'b10010;
parameter [4:0] UART_TX3=5'b10011;
parameter [4:0] UART_WAIT1_EXT2=5'b10100;
parameter [4:0] UART_TX4=5'b10101;
parameter [4:0] UART_WAIT1_EXT3=5'b10110;
parameter [4:0] UART_TX5=5'b10111;

reg [4:0] state /* synthesis syn_noprune=1 */;

//*****************************************************************************
//**************************** Fabric Uart Logic  *****************************
//*****************************************************************************
always @(posedge clk, negedge reset)begin
  if(reset==1'b0)
    begin
	uart_wen_t <= 1'b1;
	uart_oen_t <= 1'b1;
	uart_data_out_t <= 8'h00;
	state <= INIT;
	start_t <=1'b0;
	clear_t<=1'b0;
	connect_t <=1'b0;
	scan_t<=1'b0;
	payload_err_t <=1'b0;
    crc_err_t <=1'b0;
	data_flag <=1'b0;
    end
  else
    begin
    //start_t <= start_test;
    //if(start_t == 1'b0
    
      case (state)
       INIT: 
          begin
	        uart_wen_t <= 1'b1;
           if (uart_rxrdy ==1'b1) 
           begin
			case (uart_data_in)                             
                           8'h61: begin //8'h01:  begin                             //Start Command is received from GUI                 
                                     start_t <=1'b1;
                                     clear_t <=1'b1;
                      		         uart_oen_t <= 1'b0;               
                                     end                                
                             8'h02:  begin                             // GUI Switching state when 2 Lane is used             
                      		         uart_oen_t <= 1'b0;               
                                     end                              
                             8'h03:  begin                             // GUI Switching state when 2 Lane is used                
                      		         uart_oen_t <= 1'b0;               
                                     end                             
                             8'h62: begin //8'h04:  begin                             //Scan command is received for acknowledgement   
                                     scan_t <=1'b1;
                      		         uart_oen_t <= 1'b0;  
		                             state <= UART_TX_SCAN;
                                     end                              
                            8'h63: begin //8'h05:  begin                             //Stop command is received from GUI            
                                     start_t <=1'b0;
                      		         uart_oen_t <= 1'b0;  
                                     end                             
                           8'h64: begin //8'h06:  begin                             //GUI is continuously requesting for data                 
                                     data_flag <=1'b1;
                                     clear_t <=1'b0;
                      		         uart_oen_t <= 1'b0;  
		                             state <= UART_TX_CMD;
                                     end                                                                                       
                           8'h65: begin //8'h07:  begin                             //GUI introducuing payoad error          
                                     payload_err_t <=1'b1;
                      		         uart_oen_t <= 1'b0;  
                                     end                             
                           8'h66: begin //8'h08:  begin                             //GUI disabling payoad error           
                                     payload_err_t <=1'b0;
                                     clear_t <=1'b1;
                      		         uart_oen_t <= 1'b0;  
                                     end                                                 
                          8'h67: begin //8'h09:  begin                             //Connect command for connection establishment                    
                                     connect_t <=1'b1;
                      		         uart_oen_t <= 1'b0;  
		                             state <= UART_TX_CNT;
                                     end                              
                          8'h68: begin //8'h0A:  begin                             //GUI introducuing crc error                 
                                     crc_err_t <=1'b1;
                      		         uart_oen_t <= 1'b0;  
                                     end                                
                          8'h69: begin //8'h0B:  begin                             //GUI disabling crc error            
                                     crc_err_t <=1'b0;
                                     clear_t <=1'b1;
                      		         uart_oen_t <= 1'b0;  
                                     end                             
                             default : begin                           //Default State                 
                                     clear_t <=1'b0; 
                                     payload_err_t <=1'b0; 
                                     crc_err_t <=1'b0; 
                                     end                             
                         endcase                      
            end
           else 
		   begin
		   state <= INIT;
		   uart_oen_t <= 1'b1;
	       end 
          end
      UART_TX_CMD :
               begin
		        uart_oen_t <= 1'b1;              
	            if (uart_txrdy == 1'b1) begin
				 if(data_flag==1'b1) begin
                   uart_data_out_t <= 8'h06;                                  // Send command 0x06 to GUI for acknowledgement           
				   uart_wen_t <= 1'b0;
                 end
                 else;
                end		  
                else
                begin
				uart_wen_t <= 1'b1;
                state <= UART_WAIT0;
		        end 
               end
      UART_WAIT0:        
               begin
                if (uart_txrdy == 1'b0) 
                 uart_wen_t <= 1'b1;
                else
                 state <= UART_TX1;
               end
      UART_TX1:
               begin
                if (uart_txrdy == 1'b1) begin
				 if(data_flag==1'b1) begin
                   uart_data_out_t <= {3'b000,rx_val_i,rx_error_i,         
                                      rx_lock_i,crc_error_i,payload_err_i};   // Send error and lock status to GUI for display        
				   //uart_data_out_t <= 8'b11111111;
                   uart_wen_t <= 1'b0;
                 end
                 else;
                end		  
                else
                begin
				  uart_wen_t <= 1'b1;
				  state <= UART_WAIT1;
		        end 
           end
      UART_WAIT1:
               begin
                if (uart_txrdy == 1'b0) 
                 uart_wen_t <= 1'b1;
                else
                 state <= UART_TX2;
               end
      UART_TX2:
              begin
               if (uart_txrdy == 1'b1) begin
				if(data_flag==1'b1) begin
                //uart_data_out_t <= {3'b000,rx_val_i,rx_error_i,         
                   //                   rx_lock_i,crc_error_i,payload_err_i};
                   uart_data_out_t <= {{rx_words_in[3:0],tx_words_in[3:0]}};  // Send [3:0] slices of TX words and RX Words to GUI 
				   uart_wen_t <= 1'b0;
                end
                else;
               end		  
               else
               begin
				 uart_wen_t <= 1'b1;
				 state <= UART_WAIT1_EXT1;
		       end 
              end
      UART_WAIT1_EXT1:
               begin
                if (uart_txrdy == 1'b0) 
                    uart_wen_t <= 1'b1;
                else
                   state <= UART_TX3;
               end
      UART_TX3:
             begin
              if (uart_txrdy == 1'b1) begin
			   if(data_flag==1'b1) begin
                   uart_data_out_t <=  {rx_words_in[7:4],tx_words_in[7:4]};   // Send [7:4] slices of TX words and RX Words to GUI  
				   uart_wen_t <= 1'b0;
               end
               else;
              end		  
              else
              begin
				 uart_wen_t <= 1'b1;
				 state <= UART_WAIT1_EXT2;
		      end 
             end
      UART_WAIT1_EXT2:
               begin
                if (uart_txrdy == 1'b0) 
                    uart_wen_t <= 1'b1;
                else
                   state <= UART_TX4;
               end
      UART_TX4:
                begin
                 if (uart_txrdy == 1'b1) begin
				  if(data_flag==1'b1) begin
                   uart_data_out_t <={rx_words_in[11:8],tx_words_in[11:8]};   // Send [11:8] slices of TX words and RX Words to GUI 
				   uart_wen_t <= 1'b0;
                  end
                  else;
                 end		  
                 else
                 begin
				 uart_wen_t <= 1'b1;
				 state <= UART_WAIT1_EXT3;
		         end 
                end
      UART_WAIT1_EXT3:
               begin
                if (uart_txrdy == 1'b0) 
                    uart_wen_t <= 1'b1;
                else
                   state <= UART_TX5;
               end
      UART_TX5:
              begin
               if (uart_txrdy == 1'b1) begin
				if(data_flag==1'b1) begin
                  uart_data_out_t <= {rx_words_in[15:12],tx_words_in[15:12]}; // Send [15:12] slices of TX words and RX Words to GUI 
				  uart_wen_t <= 1'b0;
                end
                else;
               end		  
               else
               begin
				 uart_wen_t <= 1'b1;
				 state <= INIT;
		       end 
              end

//******************************************************************************
//********************* Start of Connect Command  ******************************
//******************************************************************************
      UART_TX_CNT :
               begin
		        uart_oen_t <= 1'b1;              
	            if (uart_txrdy == 1'b1) begin
				 if(connect_t==1'b1) begin
                   uart_data_out_t <= 8'h09;    // Send command 0x09 to GUI for acknowledgement	               
				   uart_wen_t <= 1'b0;
                 end
                 else;
                 end		  
                else
                begin
				 uart_wen_t <= 1'b1;
                 state <= UART_WAIT2;
		        end 
               end
      UART_WAIT2:
               begin
                if (uart_txrdy == 1'b0) 
                    uart_wen_t <= 1'b1;
                else
                   state <= UART_TX_CNT1;
               end
      UART_TX_CNT1:
                  begin
                   if (uart_txrdy == 1'b1) begin
				    if(connect_t==1'b1) begin                     
		             uart_data_out_t <= 8'h00;  // Send command 0x00 to GUI for acknowledgement		                 
				     uart_wen_t <= 1'b0;
                    end
                    else;
                   end		  
                   else
                   begin
				    uart_wen_t <= 1'b1;
				    state <= UART_WAIT3;
		           end 
                  end
      UART_WAIT3:
               begin
                if (uart_txrdy == 1'b0) 
                    uart_wen_t <= 1'b1;
                else
                   state <= UART_TX_CNT2;
               end
      UART_TX_CNT2:
                begin
                 if (uart_txrdy == 1'b1) begin
				  if(connect_t==1'b1) begin                    
		            uart_data_out_t <= 8'h0F;   // Send command 0x0F to GUI for acknowledgement		                
				    uart_wen_t <= 1'b0; 
                  end
                  else;
                 end		  
                 else
                 begin
				  uart_wen_t <= 1'b1;
				  state <= UART_WAIT4;
		         end 
                end
      UART_WAIT4:
               begin
                if (uart_txrdy == 1'b0) 
                    uart_wen_t <= 1'b1;
                else
                   state <= INIT;
               end
//*****************************************************************************
//********************* End of Connect Command  *******************************
//*****************************************************************************

//*****************************************************************************
//********************* Start of Scan Command  ********************************
//*****************************************************************************

      UART_TX_SCAN :
                begin
		         uart_oen_t <= 1'b1;              
	             if (uart_txrdy == 1'b1) begin
				  if(scan_t==1'b1) begin                   
                   uart_data_out_t <= 8'h04;   // Send command 0x04 to GUI for acknowledgement			         
				   uart_wen_t <= 1'b0;
                  end
                  else;
                 end		  
                 else
                 begin
				 uart_wen_t <= 1'b1;
                 state <= UART_WAIT5;
		         end 
               end
      UART_WAIT5:
               begin
                if (uart_txrdy == 1'b0) 
                    uart_wen_t <= 1'b1;
                else
                   state <= UART_TX_SCAN1;
               end
      UART_TX_SCAN1:
               begin
                if (uart_txrdy == 1'b1) begin
				 if(scan_t==1'b1) begin                   
		           uart_data_out_t <= 8'h00;   // Send command 0x00 to GUI for acknowledgement		              
				   uart_wen_t <= 1'b0;
                 end
                 else;
                end		  
                else
                begin
				 uart_wen_t <= 1'b1;
				 state <= UART_WAIT6;
		        end 
              end
      UART_WAIT6:
              begin
                if (uart_txrdy == 1'b0) 
                    uart_wen_t <= 1'b1;
                else
                   state <= UART_TX_SCAN2;
              end
      UART_TX_SCAN2:
              begin
               if (uart_txrdy == 1'b1) begin
				if(scan_t==1'b1) begin                   
		           uart_data_out_t <= 8'h0E;   // Send command 0x0E to GUI for acknowledgement			         
				   uart_wen_t <= 1'b0;
                end
                else;
               end		  
               else
               begin
				 uart_wen_t <= 1'b1;
				 state <= UART_WAIT7;
		       end 
             end
      UART_WAIT7:
               begin
                if (uart_txrdy == 1'b0) 
                    uart_wen_t <= 1'b1;
                else
                   state <= INIT;
               end
//*****************************************************************************
//********************* End of Scan Command  **********************************
//*****************************************************************************  
    
      default :	state <= INIT;
  endcase
 end
end

//*****************************************************************************
//*************************** Concurrent Assignment ***************************
//*****************************************************************************
assign uart_data_out=uart_data_out_t;
assign start_o=start_t || start_test;
assign uart_wen=uart_wen_t;
assign uart_oen=uart_oen_t;
assign clear_o= clear_t;
assign payload_err_o= payload_err_t;
assign crc_err_o= crc_err_t;
assign connect_o=connect_t;
endmodule
//*****************************************************************************
//******************************* End of Module *******************************
//*****************************************************************************
