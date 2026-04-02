module valid_first_only #(
    parameter DATA_WIDTH = 8
)(
    input  logic                  clk,
    input  logic                  reset_n,
    input  logic [DATA_WIDTH-1:0] data_i,
    input  bit                    valid_i,
    output logic [DATA_WIDTH-1:0] data_o,
    output bit                    valid_o
);
    bit valid_q;
    bit valid_edge;
    
    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            valid_q <= 1'b0;
        end
        else begin
            valid_q <= valid_i; 
        end
    end
    
    assign valid_edge = valid_i & ~valid_q;
    
    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            data_o <= '0;
            valid_o <= 1'b0;
        end
        else begin
            if (valid_edge) begin
                data_o <= data_i;
                valid_o <= 1'b1;
            end
            else begin
                data_o <= '0;
                valid_o <= 1'b0;
            end
        end
    end

endmodule
