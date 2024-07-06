module mux # (parameter bits = 9)(
    in1,
    in2,
    s,
    out
);
    input [bits-1:0] in1;
    input [bits-1:0] in2;
    input s;
    output[bits-1:0] out;
    assign out = s? in2: in1;
endmodule