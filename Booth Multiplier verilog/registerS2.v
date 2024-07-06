module registerS2 #(
    parameter bits = 8
) (
    data_in,
    data_out,
    clk,
    reset
);
    input[bits-1:0] data_in;
    output reg[bits - 1:0] data_out;
    input clk;
    input reset;
  reg[ bits - 1:0] count;
     always @(posedge clk) begin
        
       if (reset) begin
            data_out <= 0;
            
         count <= 0;
          // Reset to zero when reset signal is asserted
        end else begin
          if (data_out == 0 && count == 0) begin
               data_out <= data_in;
            count[bits - 1] <= 1;
            end
            else begin
              count <= count >> 2;
            data_out <= data_out >> 2;
            end
        end
    end
endmodule