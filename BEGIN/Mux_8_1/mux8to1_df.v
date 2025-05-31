module mux8to1_hier
(
    input  wire [2:0] sel,
    input  wire in0, in1, in2, in3,
                 in4, in5, in6, in7,
    output wire out
);
    wire out_low, out_high;

    // חיבור שני MUX 4:1
    mux4to1_df mux_low (
        .sel(sel[1:0]),
        .in0(in0), .in1(in1), .in2(in2), .in3(in3),
        .out(out_low)
    );

    mux4to1_df mux_high (
        .sel(sel[1:0]),
        .in0(in4), .in1(in5), .in2(in6), .in3(in7),
        .out(out_high)
    );

    // Multiplexer אחרון – בין low/high לפי sel[2]
    assign out = (sel[2] == 1'b0) ? out_low : out_high;

endmodule