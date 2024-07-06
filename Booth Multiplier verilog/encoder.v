module encoder(
    y,
    one,
    two,
    neg
);
  input [2:0] y;
  output reg one;
  output reg two;
  output reg neg;

always @(*)
    begin
    case (y)
        3'b000: begin one = 0; two = 0; neg = 0; end // +0
        3'b001: begin one = 1; two = 0; neg = 0; end // +1A
        3'b010: begin one = 1; two = 0; neg = 0; end // +1A
        3'b011: begin one = 0; two = 1; neg = 0; end // +2A
        3'b100: begin one = 0; two = 1; neg = 1; end // -2A
        3'b101: begin one = 1; two = 0; neg = 1; end // -1A
        3'b110: begin one = 1; two = 0; neg = 1; end // -1A
        3'b111: begin one = 0; two = 0; neg = 0; end // -0A
        default: begin one = 0; two = 0; neg = 0;end // Default to +0X
    endcase
    end
endmodule