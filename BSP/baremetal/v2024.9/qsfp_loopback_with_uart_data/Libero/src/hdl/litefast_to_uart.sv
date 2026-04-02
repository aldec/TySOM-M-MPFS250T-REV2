module litefast_to_uart
(
    input        clk,                   // 125 MHzClock from PF_CCC_0
    input        reset_n,               // Active low reset 

    input  [7:0] litefast_data_i,       // Data from LiteFast Receiver
    input        litefast_data_valid_i, // Valid signal related to data from LiteFast Receiver

    input        uart_txrdy,            // CoreUART TX ready signal
    output [7:0] uart_data_o,           // Data output that is given to CoreUART
    output       uart_wen_o            // Write enable signal given to CoreUART
);

	logic uart_oen_q;
	logic uart_wen_q;

    logic [7:0] uart_data_q;

    /////////////////////////////
    // if uart_wen == 0, uart_data_o is valid and it is written to CoreUART FIFO
    always @(posedge clk or negedge reset_n) begin
		if (!reset_n) begin
			uart_wen_q <= 1'b1;
            uart_data_q <= 8'h0;
		end
		else begin
            // tranmission
			if ( uart_txrdy & litefast_data_valid_i ) begin
                uart_wen_q <= 1'b0;
                uart_data_q <= litefast_data_i;  
            end
            else begin
                uart_wen_q <= 1'b1;
                uart_data_q <= 8'h0;
            end
        end
    end
    
    assign uart_wen_o = uart_wen_q;
    assign uart_data_o = uart_data_q;

endmodule

