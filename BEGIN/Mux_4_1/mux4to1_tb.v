module mux4to1_tb;

    reg [1:0] sel;
    reg in0, in1, in2, in3;
    wire out;

    // שנה לפי איזה מודול אתה בודק
    mux4to1_df uut (
        .sel(sel),
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .out(out)
    );

    initial begin
        $dumpfile("wave.vcd");        // קובץ הפלט ל־GTKWave
        $dumpvars(0, mux4to1_tb);     // שומרים את כל הסיגנלים מתוך המודול הזה


        $display("sel | in0 in1 in2 in3 | out");
        $monitor("%b   |  %b   %b   %b   %b  |  %b", sel, in0, in1, in2, in3, out);

        in0 = 1; in1 = 0; in2 = 1; in3 = 0;

        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        $finish;
    end
endmodule