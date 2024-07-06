`include "multiplier.v"

// TO-DO
// fix registerS2

module Test();

 reg signed [7:0] A;
 reg signed [7:0] B;
 wire signed [15:0] p;
  integer count;
  bit load;

reg clk;
reg reset;

  multiplier #(.bits(8)) DUT(.A(A), .B(B),.clk(clk),.reset(reset), .P(p));


always begin
   #5;
   clk=~clk;
end



initial begin
  clk =0;
  reset = 0;
  count = 0;
  load = 0;
  A <=8'h81;
  B <=8'h84;
  
  @(posedge clk);
  reset = 1;
  @(posedge clk);
  @(posedge clk);
  reset <= 0;
  forever begin
    @(posedge clk);
    if (p == (A * B) && !load) begin
      $display("Found P = A * B after %d clks P=0x%0h A=0x%0h B=0x%0h time=%0d", count, p, A, B, $time);
      count = 0;
      load <= 1;
    end
    else begin
      if (load) begin
        reset <= 1;
        @(posedge clk);
        @(posedge clk);
        reset <= 0;
        
        A <= $urandom_range(0, 8'h88);
    	B <= $urandom_range(0, 8'h88);
        load <= 0;
      end
      else begin
        count++;
      end
    end
  end
  // x = 4;
  // #5;
  // x = 5;
  // #5;

end


  initial begin
    repeat(5000) begin
      @(posedge clk);
    end
    $finish();
  end
  
  initial begin
    $dumpfile("d.vcd");
    $dumpvars();
  end

endmodule