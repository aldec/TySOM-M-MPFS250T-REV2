module DecodeUART
#(
    parameter LIGHT_UART = 0
)
(
    input clk,                       //125 MHzClock from PF_CCC_0
    input reset_n,                   //PF_CCC_0 lock is given as reset signal
    input uart_txrdy,                //CoreUART TX ready signal
    input uart_rxrdy,                //CoreUART RX ready signal
    
    input [3:0] rx_valid_i,          //RX Valid signal from Count Checker
    input [3:0] rx_lock_i,           //RX Lock signal from Count Checker indicating data match
    input [3:0] rx_error_i,          //RX Error signal from Count Checker indicating data mismatch
    input [3:0] payload_error_i,     //Payload error signal from Count Checker indicating data payload error
    input [3:0] crc_error_i,         //CRC error signal from Count Checker indicating Check sum error
    input [3:0] tx_clk_stable_i,
    input [32*4-1:0] tx_words_in,  //Received data over Transceiver from Count checker
    input [32*4-1:0] rx_words_in,  //Count checker generated data

    input [7:0] uart_data_in,        //Parallel data input from CoreUART
    
    output uart_wen,                 //Write enable signal given to CoreUART
    output uart_oen,                 //Output enable signal given to CoreUART
    output start_o,                  //Start signal given to Counter and Count Checker modules
    output clear_o,                  //Clear Signal given to clear any errors
    output payload_error_o,            //Payload error output signal for introduction of data payload error in Counter
    output crc_error_o,                //CRC error output signal that introduces CRC error in LiteFast Transmitter section
    output [7:0] uart_data_out       //Parallel data ouput that is given to CoreUART
);

    localparam P_START = 8'h31; // ASCII: '1'
    localparam P_CHECK = 8'h32; // ASCII: '2'
    localparam NUM_OF_DIGITS_32_BITS = 10;
    localparam NUM_OF_DIGITS_16_BITS = 5;
    localparam UART_MSG_NORMAL_LANE_LEN = 147; // length of message for one lane in normal mode
    localparam UART_MSG_LIGTH_LANE_LEN = 5; // length of message for one lane in light mode
    localparam UART_MSG_LANE_LEN = (LIGHT_UART) ? UART_MSG_LIGTH_LANE_LEN : UART_MSG_NORMAL_LANE_LEN;
    
    localparam UART_MSG_FULL_LEN = (UART_MSG_LANE_LEN*4) + 2; // length of message printed via UART
    localparam CLEAR_PULSE_CYCLES = 512;
    
	logic uart_rxrdy_prev_q;
	logic uart_oen_q;
	logic uart_wen_q;
	logic clear_q;
    logic [9:0] clear_start_counter_q;
	logic start_q;
	logic start_q_q;
	logic check_outputs_q;
    logic [7:0] uart_data_out_q;

    logic [7:0] data_out_counter_q;
    logic [3:0] transmit_data_out_q;
    
    logic [15:0] rx_error_counter_q [0:3];
    logic [15:0] crc_error_counter_q [0:3];
    
    typedef byte ascii_digits_32b_t [NUM_OF_DIGITS_32_BITS-1:0];
    typedef byte ascii_digits_16b_t [NUM_OF_DIGITS_16_BITS-1:0];

    ascii_digits_32b_t tx_words_ascii [0:3];
    ascii_digits_32b_t rx_words_ascii [0:3];
    ascii_digits_16b_t rx_error_counter_ascii [0:3];
    ascii_digits_16b_t crc_error_counter_ascii [0:3];

    logic [0:3] tx_words_ascii_valid;
    logic [0:3] rx_words_ascii_valid;
    logic [0:3] rx_error_counter_ascii_valid;
    logic [0:3] crc_error_counter_ascii_valid;

    byte uart_message [0:3][0:UART_MSG_LANE_LEN-1];
    byte uart_message_q [0:3][0:UART_MSG_LANE_LEN-1];
    
    logic ascii_valid;
    logic ascii_valid_q;
    logic ascii_valid_pulse;
    
    logic [2:0] lane_counter_q;
    logic [1:0] ending_counter_q;
    
    /////////////////////////////
    // generate ascii signals
    generate
        for (genvar i=0; i<4; i=i+1) begin : gen_bin_to_ascii
            binary_to_ascii #(
                .INPUT_WIDTH(32),
                .DECIMAL_DIGITS(NUM_OF_DIGITS_32_BITS)
            ) tx_words_binary32_to_ascii (
                .clk(clk),
                .rst_n(reset_n),
                .start_i(check_outputs_q),
                .data_i(tx_words_in[32*(i+1)-1 : 32*(i)]),
                .valid_o(tx_words_ascii_valid[i]),
                .ascii_o(tx_words_ascii[i])
            );
            
            binary_to_ascii #(
                .INPUT_WIDTH(32),
                .DECIMAL_DIGITS(NUM_OF_DIGITS_32_BITS)
            ) rx_words_binary32_to_ascii (
                .clk(clk),
                .rst_n(reset_n),
                .start_i(check_outputs_q),
                .data_i(rx_words_in[32*(i+1)-1 : 32*(i)]),
                .valid_o(rx_words_ascii_valid[i]),
                .ascii_o(rx_words_ascii[i])
            );
            
            binary_to_ascii #(
                .INPUT_WIDTH(16),
                .DECIMAL_DIGITS(NUM_OF_DIGITS_16_BITS)
            ) rx_error_counter_binary16_to_ascii (
                .clk(clk),
                .rst_n(reset_n),
                .start_i(check_outputs_q),
                .data_i(rx_error_counter_q[i]),
                .valid_o(rx_error_counter_ascii_valid[i]),
                .ascii_o(rx_error_counter_ascii[i])
            );

            binary_to_ascii #(
                .INPUT_WIDTH(16),
                .DECIMAL_DIGITS(NUM_OF_DIGITS_16_BITS)
            ) crc_error_counter_binary16_to_ascii (
                .clk(clk),
                .rst_n(reset_n),
                .start_i(check_outputs_q),
                .data_i(crc_error_counter_q[i]),
                .valid_o(crc_error_counter_ascii_valid[i]),
                .ascii_o(crc_error_counter_ascii[i])
            );
        end
    endgenerate
    
    assign ascii_valid = &tx_words_ascii_valid & &rx_words_ascii_valid & &rx_error_counter_ascii_valid & &crc_error_counter_ascii_valid;

    
    /////////////////////////////
    // error counters
    generate
        for (genvar i=0; i<4; i=i+1) begin : gen_error_cnt
            always @(posedge clk or negedge reset_n) begin
        		if (!reset_n) begin
        			rx_error_counter_q[i] <= 0;
        			crc_error_counter_q[i] <= 0;
        		end
        		else begin
                    if (rx_error_i[i]) begin
        			    rx_error_counter_q[i] <= rx_error_counter_q[i] + 1;
                    end
                    if (crc_error_i[i]) begin
        			    crc_error_counter_q[i] <= crc_error_counter_q[i] + 1;
                    end
        		end
        	end
        end
    endgenerate
    
	/////////////////////////////
    // check_outputs
	always @(posedge clk or negedge reset_n) begin
		if (!reset_n) begin
			check_outputs_q <= 1'b0;
		end
		else begin
			if ((!uart_oen_q) && (uart_data_in == P_CHECK)) begin
				check_outputs_q <= 1'b1;
			end
			else begin
				check_outputs_q <= 1'b0;
			end
		end
	end
    
    generate
        if (LIGHT_UART) begin
            for (genvar i=0; i<4; i++) begin
                assign uart_message[i] = '{
                    /* 5*/ tx_words_ascii[i][3], tx_words_ascii[i][2], tx_words_ascii[i][1], tx_words_ascii[i][0], " "
                };
            end
        end
        else begin
            for (genvar i=0; i<4; i++) begin
                assign uart_message[i] = '{
                /*14*/ "L", "0"+i, ":", " ", "r", "x", "_", "l", "o", "c", "k", ":", "0"+rx_lock_i[i], " ",
                /*11*/ "r", "x", "_", "v", "a", "l", "i", "d", ":", "0"+rx_valid_i[i], " ",
                /*11*/ "r", "x", "_", "e", "r", "r", "o", "r", ":", "0"+rx_error_i[i], " ",
                /*16*/ "t", "x", "_", "c", "l", "k", "_", "s", "t", "a", "b", "l", "e", ":", "0"+tx_clk_stable_i[i], " ",
                /*12*/ "t", "x", "_", "w", "o", "r", "d", "s", "_", "i", "n", ":",
                /*11*/ tx_words_ascii[i][9], tx_words_ascii[i][8], tx_words_ascii[i][7], tx_words_ascii[i][6], tx_words_ascii[i][5], tx_words_ascii[i][4], tx_words_ascii[i][3], tx_words_ascii[i][2], tx_words_ascii[i][1], tx_words_ascii[i][0], " ",
                /*12*/ "r", "x", "_", "w", "o", "r", "d", "s", "_", "i", "n", ":",
                /*11*/ rx_words_ascii[i][9], rx_words_ascii[i][8], rx_words_ascii[i][7], rx_words_ascii[i][6], rx_words_ascii[i][5], rx_words_ascii[i][4], rx_words_ascii[i][3], rx_words_ascii[i][2], rx_words_ascii[i][1], rx_words_ascii[i][0], " ",
                /*17*/ "r", "x", "_", "e", "r", "r", "o", "r", "_", "c", "o", "u", "n", "t", "e", "r", ":",
                /*6*/  rx_error_counter_ascii[i][4], rx_error_counter_ascii[i][3], rx_error_counter_ascii[i][2], rx_error_counter_ascii[i][1], rx_error_counter_ascii[i][0], " ",
                /*18*/ "c", "r", "c", "_", "e", "r", "r", "o", "r", "_", "c", "o", "u", "n", "t", "e", "r", ":",
                /* 6*/ crc_error_counter_ascii[i][4], crc_error_counter_ascii[i][3], crc_error_counter_ascii[i][2], crc_error_counter_ascii[i][1], crc_error_counter_ascii[i][0], " ",
                /* 2*/ 8'h0D, 8'h0A
                };
            end
        end
    endgenerate
     

    
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            ascii_valid_q <= 1'b0;
        end
        else begin
            ascii_valid_q <= ascii_valid;
        end
    end

    assign ascii_valid_pulse = ascii_valid & (~ascii_valid_q);
      
    /////////////////////////////
    // uart_wen
    // if uart_wen == 0, uart_data_out is valid and it is written to CoreUART FIFO
    always @(posedge clk or negedge reset_n) begin
		if (!reset_n) begin
			uart_wen_q <= 1'b1;
            uart_data_out_q <= 8'h0;
            data_out_counter_q <= 0;
            transmit_data_out_q <= 1'b0;
            lane_counter_q <= 0;
            ending_counter_q <= 0;
		end
		else begin
            // tranmission
			if ( (uart_txrdy && ascii_valid_pulse) || transmit_data_out_q ) begin
                if ((lane_counter_q < 4)) begin
                    if ((data_out_counter_q < UART_MSG_LANE_LEN)) begin
                        // first word is from uart_message array, instead of registered uart_message_q array
                        if (data_out_counter_q == 0 && lane_counter_q == 0) begin 
                            uart_message_q <= uart_message;
                            uart_data_out_q <= uart_message[0][0];
                        end
                        else begin
                            uart_data_out_q <= uart_message_q[lane_counter_q][data_out_counter_q];
                        end
                        // last word of message for one lane, increment lane_counter_q, reset data_out_counter_q
                        if (data_out_counter_q == UART_MSG_LANE_LEN-1) begin
                            lane_counter_q <= lane_counter_q + 1;
                            data_out_counter_q <= 0;
                        end
                        else begin
                            data_out_counter_q <= data_out_counter_q + 1; 
                        end
                    end
                    uart_wen_q <= 1'b0;
                    transmit_data_out_q <= 1'b1;
                    ending_counter_q <= 0;
                    
                    
                end
                else if (ending_counter_q < 2) begin
                    uart_wen_q <= 1'b0;
                    transmit_data_out_q <= 1'b1;
                    
                    if (ending_counter_q == 0) begin
                        uart_data_out_q <= 8'h0D;
                    end
                    else begin //if (ending_counter_q == 1)
                        uart_data_out_q <= 8'h0A;
                    end
                    
                    ending_counter_q <= ending_counter_q + 1;
                end
                else begin
                    uart_wen_q <= 1'b1;
                    uart_data_out_q <= 8'h0;
                    data_out_counter_q <= 0;
                    lane_counter_q <= 0;
                    ending_counter_q <= 0;
                    transmit_data_out_q <= 1'b0;
                end
            end // begin: (uart_txrdy && ascii_valid_pulse) || transmit_data_out_q
            // stop, all characters is sent / no transmission
            else begin
                uart_wen_q <= 1'b1;
                uart_data_out_q <= 8'h0;
                data_out_counter_q <= 0;
                lane_counter_q <= 0;
                ending_counter_q <= 0;
                transmit_data_out_q <= 1'b0;
            end
        end
    end

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

    /////////////////////////////
    // start_o
	always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
			start_q_q <= 1'b0;
		end
        else begin
            if (start_q) begin
                start_q_q <= 1'b1;
            end
        end
    end

	always @(posedge clk or negedge reset_n) begin
		if (!reset_n) begin
			start_q <= 1'b0;
		end
		else begin
			if ((!uart_oen_q) && (uart_data_in == P_START)) begin
				start_q <= 1'b1;
			end
			else begin
				start_q <= 1'b0;
			end
		end
	end

    
    /////////////////////////////
    // clear_start_counter_q
    always @(posedge clk or negedge reset_n) begin
		if (!reset_n) begin
			clear_start_counter_q <= '0;
		end
		else begin
			if ((start_q) || ((clear_start_counter_q) > 0 && (clear_start_counter_q < CLEAR_PULSE_CYCLES))) begin
                clear_start_counter_q <= clear_start_counter_q + 1;
            end
            else begin
                clear_start_counter_q <= '0;
            end
		end
	end
    
    /////////////////////////////
    // clear_q
	always @(posedge clk or negedge reset_n) begin
		if (!reset_n) begin
			clear_q <= 1'b0;
		end
		else begin
			if (clear_start_counter_q > 0) begin
                clear_q <= 1'b1;
            end
            else begin
                clear_q <= 1'b0;
            end
		end
	end

	/////////////////////////////
    // outputs assignments

	assign uart_oen = uart_oen_q;
	assign uart_wen = uart_wen_q;
	assign uart_data_out = uart_data_out_q;

	assign clear_o = clear_q;
	assign payload_error_o = 0;
	assign crc_error_o = 0;

    assign start_o = start_q_q;

endmodule

