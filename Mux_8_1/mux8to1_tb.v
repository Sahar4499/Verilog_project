module mux8to1_tb;

    reg [2:0] sel;
    reg in0, in1, in2, in3, in4, in5, in6, in7;
    wire out;

    mux8to1_hier uut (
        .sel(sel),
        .in0(in0), .in1(in1), .in2(in2), .in3(in3),
        .in4(in4), .in5(in5), .in6(in6), .in7(in7),
        .out(out)
    );

    initial begin
        $display("sel | in0..7     | out");
        $monitor("%b | %b%b%b%b%b%b%b%b |  %b", sel, in7,in6,in5,in4,in3,in2,in1,in0, out);

        // נגדיר קלטים עם ערכים ברורים
        in0=0; in1=1; in2=0; in3=1;
        in4=1; in5=0; in6=1; in7=0;

        sel = 3'b000; #10;
        sel = 3'b001; #10;
        sel = 3'b010; #10;
        sel = 3'b011; #10;
        sel = 3'b100; #10;
        sel = 3'b101; #10;
        sel = 3'b110; #10;
        sel = 3'b111; #10;

        $finish;
    end
endmodule