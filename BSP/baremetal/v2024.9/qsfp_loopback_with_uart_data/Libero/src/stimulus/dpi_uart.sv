module dpi_uart
#(
    parameter BAUD_RATE = 'x,
    parameter FREQUENCY = 'x,
    parameter string NAME = "name"
)
(
    input clk,
    input rstn,
    input rx,
    output logic tx
);
    localparam DATA_BUS_WIDTH  = 1; // Data bus width in bytes
    localparam ID_WIDTH        = 8; // TID  width
    localparam DEST_WIDTH      = 4; // TDEST width
    localparam USER_WIDTH      = 4; // TUSER width
    localparam MAX_PACKET_SIZE = 256;// Maximum size of packet
    localparam CLKS_PER_BIT = FREQUENCY/BAUD_RATE; // for example 100_000_000 / 115200 = 868

    // import DPI functions
    import "DPI-C" function
    chandle dpi_create_handler(input string name);

    import "DPI-C" function
    void dpi_write_byte(input chandle obj, int data);

    chandle obj = dpi_create_handler(NAME);

    logic rx_active;
    logic data_ready;
    int  bit_index;
    int  clk_count;
    logic [9:0] frame;
    logic [7:0] data_byte;

    //////////////////////////////////////////////////////////////////////////////////////////////////
    // uart_rx_to_dpi_tx
    always_ff @(posedge clk) begin
        clk_count <= clk_count + 1;
        data_ready <= 1'b0;
        if (!rstn) begin
            rx_active <= 0;
            bit_index <= 0;
            clk_count <= 0;
            data_byte <= 0;
        end
        else begin
            if (!rx_active) begin
                if (!rx) begin
                    rx_active <= 1;
                    bit_index <= 0;
                    clk_count <= 0;
                    data_byte <= 0;
                end
            end
            else begin
                if (bit_index == 0) begin
                    if (clk_count == CLKS_PER_BIT/2) begin
                        if (rx) begin
                            rx_active <= 0;
                        end else begin
                            bit_index <= bit_index + 1;
                            clk_count <= 0;
                        end
                    end
                end
                else if (bit_index <= 8) begin
                    if (clk_count == CLKS_PER_BIT) begin
                        data_byte[bit_index-1] <= rx;
                        bit_index <= bit_index + 1;
                        clk_count <= 0;
                    end
                end
                else begin
                    if (clk_count == CLKS_PER_BIT) begin
                        rx_active <= 0;
                        if (rx) begin
                            data_ready <= 1'b1;
                            dpi_write_byte(obj, data_byte);
                        end
                    end
                end
            end
        end // else: !if(!ARESETn)
    end

    //////////////////////////////////////////////////////////////////////////////////////////////////
    // dpi_rx_to_uart_tx


    import "DPI-C" function
    byte dpi_read_byte(input chandle obj);

    import "DPI-C" function
    int dpi_byte_valid(input chandle obj);


    logic tx_active;
    int   tx_bit_index;
    int   tx_clk_count;
    logic [9:0] tx_frame;

    always_ff @(posedge clk) begin
        tx <= 1;
        if (!rstn) begin
            tx_active <= 0;
            tx_bit_index <= 0;
            tx_clk_count <= 0;
        end else begin
            if (!tx_active) begin
                if (dpi_byte_valid(obj)) begin
                    tx_frame <= {1'b1, dpi_read_byte(obj), 1'b0}; // {start bit, data, stop bit}
                    tx_active <= 1;
                    tx_bit_index <= 0;
                    tx_clk_count <= 0;
                end
            end else begin
                tx_clk_count <= tx_clk_count + 1;
                tx <= tx_frame[tx_bit_index];
                if (tx_clk_count == CLKS_PER_BIT) begin
                    tx_clk_count <= 0;
                    if (tx_bit_index == 9) begin
                        tx_active <= 0;
                    end
                    else begin
                        tx_bit_index <= tx_bit_index + 1;
                    end
                end
            end
        end
    end


endmodule

