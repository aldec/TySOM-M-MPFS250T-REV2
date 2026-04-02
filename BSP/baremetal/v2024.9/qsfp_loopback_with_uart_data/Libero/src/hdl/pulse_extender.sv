module pulse_extender #(
    parameter N = 2  // number of cycles
)(
    input  logic clk,
    input  logic reset_n,
    input  logic pulse_i,
    output logic pulse_o
);

    logic [N:0] pulse_shift;

    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            pulse_shift <= '0;
        end
        else begin
            pulse_shift <= {pulse_shift[N-1:0], pulse_i};
        end
    end

    assign pulse_o = |pulse_shift | pulse_i;

endmodule
