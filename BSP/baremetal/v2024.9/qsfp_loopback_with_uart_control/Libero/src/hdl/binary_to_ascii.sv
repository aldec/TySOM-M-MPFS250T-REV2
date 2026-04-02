module binary_to_ascii
#(
    parameter INPUT_WIDTH = 32,
    parameter DECIMAL_DIGITS = 10
)(
    input                   clk,
    input                   rst_n,
    input [INPUT_WIDTH-1:0] data_i,
    input                   start_i,
    //
    output byte             ascii_o [DECIMAL_DIGITS-1:0],
    output                  valid_o
);
   
    parameter s_RST               = 0;
    parameter s_IDLE              = 1;
    parameter s_SHIFT             = 2;
    parameter s_CHECK_SHIFT_INDEX = 3;
    parameter s_ADD               = 4;
    parameter s_CHECK_DIGIT_INDEX = 5;
    parameter s_BCD_DONE          = 6;
    
    reg [2:0] state_q;
    reg [2:0] next_state_q;
    
    // The vector that contains the output BCD
    reg [DECIMAL_DIGITS*4-1:0] bcd_q = 0;
    
    // The vector that contains the input binary value being shifted.
    reg [INPUT_WIDTH-1:0]      binary_q = 0;
      
    // Keeps track of which Decimal Digit we are indexing
    reg [DECIMAL_DIGITS-1:0]   digit_index_q = 0;
    
    // Keeps track of which loop iteration we are on.
    // Number of loops performed = INPUT_WIDTH
    reg [7:0]                  loop_count_q = 0;
    
    wire [3:0]                 bcd_digit;
    reg                        valid_q = 1'b0;                       

    generate
        for (genvar i=0; i<DECIMAL_DIGITS; i++) begin
            assign ascii_o[i] = "0" + {4'b0, bcd_q[i*4+3 : i*4]};
        end
    endgenerate
    
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state_q <= s_RST;
        end
        else begin
            state_q <= next_state_q;
        end
    end
    
    always @(posedge clk) begin
        case (state_q) 
            // Stay in this state until start_i comes along
            s_RST : begin
                valid_q <= 1'b0;
                binary_q <= 0;
                bcd_q     <= 0;
                next_state_q <= s_IDLE;
            end      
        
            // Stay in this state until start_i comes along
            s_IDLE : begin
                if (start_i == 1'b1) begin
                    binary_q  <= data_i;
                    next_state_q <= s_SHIFT;
                    bcd_q     <= 0;
                    valid_q <= 1'b0;
                end
                else begin
                    next_state_q <= s_IDLE;
                end
            end        
            
            // Always shift the BCD Vector until we have shifted all bits through
            // Shift the most significant bit of binary_q into bcd_q lowest bit.
            s_SHIFT : begin
                bcd_q     <= bcd_q << 1;
                bcd_q[0]  <= binary_q[INPUT_WIDTH-1];
                binary_q  <= binary_q << 1;
                next_state_q <= s_CHECK_SHIFT_INDEX;
            end
            
            // Check if we are done with shifting in binary_q vector
            s_CHECK_SHIFT_INDEX : begin
                if (loop_count_q == INPUT_WIDTH-1) begin
                    loop_count_q <= 0;
                    next_state_q    <= s_BCD_DONE;
                end
                else begin
                    loop_count_q <= loop_count_q + 1;
                    next_state_q    <= s_ADD; 
                end
            end
            
            // Break down each BCD Digit individually. Check them one-by-one to 
            // see if they are greater than 4. If they are, increment by 3. 
            // Put the result back into bcd_q Vector. 
            s_ADD : begin
                if (bcd_digit > 4) begin                                     
                    bcd_q[(digit_index_q*4)+:4] <= bcd_digit + 3;  
                end
                next_state_q <= s_CHECK_DIGIT_INDEX; 
            end
             
            // Check if we are done incrementing all of the BCD Digits
            s_CHECK_DIGIT_INDEX : begin
                if (digit_index_q == DECIMAL_DIGITS-1) begin
                    digit_index_q <= 0;
                    next_state_q     <= s_SHIFT;
                end
                else begin
                    digit_index_q <= digit_index_q + 1;
                    next_state_q     <= s_ADD;
                end
            end
            
            s_BCD_DONE : begin
                valid_q      <= 1'b1;
                next_state_q <= s_IDLE;
            end
             
            default :
              next_state_q <= s_IDLE;
                
        endcase
    end // always @ (posedge clk)  
    
    
    assign bcd_digit = bcd_q[digit_index_q*4 +: 4];
    assign valid_o  = valid_q;
      
endmodule