module uart_to_litefast
(
    input        clk,                   // 125 MHzClock from PF_CCC_0
    input        reset_n,               // Active low reset 

    input        uart_rxrdy,           // CoreUART RX ready signal
    input  [7:0] uart_data_i,          // Data input from CoreUART
    output       uart_oen_o,             // Output enable signal given to CoreUART
    
    output [7:0] litefast_data_o,      // Data output that is given to LiteFast Transmitter
    output       litefast_data_valid_o // Valid signal related to data to LiteFast Transmitter
);

	logic uart_rxrdy_prev_q;
	logic uart_oen_q;

    logic [7:0] litefast_data_q;
    logic [3:0] litefast_data_valid_q;
    

    /////////////////////////////
    // uart_oen
    // if uart_oen == 0, uart_data_in is valid
    always @(posedge clk or negedge reset_n) begin
		if (!reset_n) begin
			uart_rxrdy_prev_q <= 1'b0;
			uart_oen_q <= 1'b1;
		end
		else begin
			uart_rxrdy_prev_q <= uart_rxrdy;
			if (uart_rxrdy && !uart_rxrdy_prev_q) begin
				uart_oen_q <= 1'b0;
			end else begin
				uart_oen_q <= 1'b1;
			end
		end
	end
    
    
    always @(posedge clk or negedge reset_n) begin
		if (!reset_n) begin
			litefast_data_q <= 8'b0;
			litefast_data_valid_q <= 1'b0;
		end
		else begin
			if ((!uart_oen_q)) begin
				litefast_data_q <= uart_data_i;
			    litefast_data_valid_q <= 1'b1;
			end
			else begin
				litefast_data_q <= 8'b0;
			    litefast_data_valid_q <= 1'b0;
			end
		end
	end
    
    
    assign uart_oen_o = uart_oen_q;
    assign litefast_data_o = litefast_data_q;
    assign litefast_data_valid_o = litefast_data_valid_q;

 

endmodule

