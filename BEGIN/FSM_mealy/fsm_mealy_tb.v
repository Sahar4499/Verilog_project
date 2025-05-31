module fsm_mealy_110_tb;

    reg clk, reset, in;
    wire detect;

    fsm_mealy_110 uut (
        .clk(clk),
        .reset(reset),
        .in(in),
        .detect(detect)
    );

    always #5 clk = ~clk;

    initial begin
        $display("Time | rst in | detect");
        $monitor("%4t  |  %b   %b  |   %b", $time, reset, in, detect);

        clk = 0;
        reset = 1; in = 0; #10;
        reset = 0;

        in = 1; #10;
        in = 1; #10;
        in = 0; #10;

        in = 1; #10;
        in = 0; #10;

        in = 1; #10;
        in = 1; #10;
        in = 0; #10;

        $finish;
    end

endmodule