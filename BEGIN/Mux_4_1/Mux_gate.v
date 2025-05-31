module mux4to1_gate
(
    input wire [1:0] sel,
    input wire in0,in1,in2,in3,
    output wire out
);

wire n0,n1;
wire y0,y1,y2,y3;

not (n0,sel[0]);
not (n1,sel[1]);

and(y0,in0,n1,n0);
and(y1,in1,n1,sel[0]);
and(y2,in2,sel[1],no);
and(y3,in3,sel[1],sel[0]);

or(out,y0,y1,y2,y3);

endmodule