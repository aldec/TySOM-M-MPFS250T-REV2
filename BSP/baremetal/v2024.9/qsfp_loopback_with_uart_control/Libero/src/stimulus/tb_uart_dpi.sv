`timescale 1ns/100ps

module tb;

    parameter CLK_PERIOD = 8;// 125MHZ

    reg CLK;
    reg RESETN;
    reg PMA_RESETN;

    initial
    begin
        CLK = 1'b0;
        RESETN = 1'b0;
        PMA_RESETN = 1'b0;
    end

    //////////////////////////////////////////////////////////////////////
    // Reset Pulse
    //////////////////////////////////////////////////////////////////////
    initial
    begin
        #(CLK_PERIOD * 10 )
            RESETN = 1'b1;
    end
    
    initial
    begin
        #(CLK_PERIOD * 3 )
            PMA_RESETN = 1'b1;
    end

    //////////////////////////////////////////////////////////////////////
    // Clock Driver
    //////////////////////////////////////////////////////////////////////
    always @(CLK)
        #(CLK_PERIOD / 2.0) CLK <= !CLK;

    /////////////////////
    
    logic RX;
    logic TX;

    //////////////////////////////////////////////////////////////////////
    // Instantiate Unit Under Test:  LiteFast_XCVR_Top
    //////////////////////////////////////////////////////////////////////
    top top_0(
        // Inputs
        .clk_125             ( CLK ),
        .LANE0_RXD_N         ( Loop0_N ),
        .LANE0_RXD_P         ( Loop0_P ),
        .LANE1_RXD_N         ( Loop1_N ),
        .LANE1_RXD_P         ( Loop1_P ),
        .LANE2_RXD_N         ( Loop2_N ),
        .LANE2_RXD_P         ( Loop2_P ),
        .LANE3_RXD_N         ( Loop3_N ),
        .LANE3_RXD_P         ( Loop3_P ),
        .REF_CLK_PAD_N       ( !CLK ),
        .REF_CLK_PAD_P       ( CLK ),
        .reset_n             ( RESETN ),
        .LANE0_PMA_ARST_N    ( PMA_RESETN ),
        .LANE1_PMA_ARST_N    ( PMA_RESETN ),
        .LANE2_PMA_ARST_N    ( PMA_RESETN ),
        .LANE3_PMA_ARST_N    ( PMA_RESETN ),
        .RX                  ( RX ),
        // Outputs
        .LANE0_TXD_N         ( Loop0_N ),
        .LANE0_TXD_P         ( Loop0_P ),
        .LANE1_TXD_N         ( Loop1_N ),
        .LANE1_TXD_P         ( Loop1_P ),
        .LANE2_TXD_N         ( Loop2_N ),
        .LANE2_TXD_P         ( Loop2_P ),
        .LANE3_TXD_N         ( Loop3_N ),
        .LANE3_TXD_P         ( Loop3_P ),
        .TX                  ( TX )
    );


    localparam BAUD_RATE = 115200;
    localparam FREQUENCY = 125_000_000;
    localparam string PTY_NAME = "UART (terminal)";

    dpi_uart #(
        .BAUD_RATE(BAUD_RATE), 
        .FREQUENCY(FREQUENCY),
        .NAME(PTY_NAME)
    ) dpi_uart_inst (
        .clk(CLK),
        .rstn(RESETN),
        .rx(TX),
        .tx(RX)
	);
    
    always @(posedge CLK) begin
        if (!tb.top_0.UART_IF_0.DecodeUART_0.uart_oen) begin
            $display("[%0t ns] UART received: 0x%02h (%c)", $time, tb.top_0.UART_IF_0.COREUART_C0_0.DATA_OUT,
                     (tb.top_0.UART_IF_0.COREUART_C0_0.DATA_OUT >= 8'h20 && tb.top_0.UART_IF_0.COREUART_C0_0.DATA_OUT <= 8'h7E)
            		 ? tb.top_0.UART_IF_0.COREUART_C0_0.DATA_OUT : ".");
        end
    end

endmodule

