module register #(
    integer bits = 8
) (
    data_in,
    data_out,
    clk,
    reset
);
    input[bits-1:0] data_in;
  	output reg[bits-1:0] data_out;
    input clk;
    input reset;
    always @(posedge clk) begin
        if (reset) begin
            data_out <= 0;
        end
        else begin
            data_out <= data_in;
        end
    end
endmodule