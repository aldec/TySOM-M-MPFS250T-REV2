module pass_data_to_litefast #(
    parameter DATA_WIDTH = 8
)(
    input  logic                  clk,
    input  logic                  reset_n,
    input  logic                  litefast_req_usr_data_tx_i,
    input  logic [DATA_WIDTH-1:0] data_i,
    input  logic                  valid_i,
    output logic [DATA_WIDTH-1:0] data_o,
    output logic                  valid_o
);
    
    logic [DATA_WIDTH-1:0] data;
    logic litefast_req_usr_data_tx_q;
    logic litefast_req_usr_data_tx_edge;
    logic litefast_req_usr_data_tx_edge_q;
    
    // litefast_req_usr_data_tx_q : registered litefast_req_usr_data_tx_i
    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            litefast_req_usr_data_tx_q <= '0;
        end
        else begin  
            litefast_req_usr_data_tx_q <= litefast_req_usr_data_tx_i;
        end
    end
    
    // edge of litefast_req_usr_data_tx_i
    assign litefast_req_usr_data_tx_edge = litefast_req_usr_data_tx_i & ~litefast_req_usr_data_tx_q;
    
    // litefast_req_usr_data_tx_edge_q : registered litefast_req_usr_data_tx_edge
    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            litefast_req_usr_data_tx_edge_q <= '0;
        end
        else begin
            litefast_req_usr_data_tx_edge_q <= litefast_req_usr_data_tx_edge;
        end
    end
    
    // data : registered data_i, when valid_i
    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            data <= '0;
        end
        else begin
            if (valid_i) begin
                data <= data_i;
            end
        end
    end
    
    // data_o, valid_o
    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            data_o <= '0;
            valid_o <= 1'b0;
        end
        else begin
            if (litefast_req_usr_data_tx_edge_q) begin
                data_o <= data;
                valid_o <= 1'b1;
            end
            else begin
                data_o <= '0;
                valid_o <= 1'b0;
            end
        end
    end

endmodule
