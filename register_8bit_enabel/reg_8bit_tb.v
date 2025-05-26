module reg_8bit_tb;

    reg clk, reset, enable;
    reg [7:0] d;
    wire [7:0] q;

    reg_8bit_beh uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .d(d),
        .q(q)
    );

    // אות שעון מתהפך כל 5 יחידות זמן
    always #5 clk = ~clk;

    initial begin
        $display("Time | rst en d      | q");
        $monitor("%4t  |  %b   %b %b | %b", $time, reset, enable, d, q);

        // אתחול
        clk = 0; reset = 1; enable = 0; d = 8'b00000000; #10;
        reset = 0; enable = 1; d = 8'b10101010; #10;
        enable = 0; d = 8'b11111111; #10;  // לא ייכנס
        enable = 1; d = 8'b00001111; #10;
        reset = 1; #10;                    // אפס שוב
        reset = 0; enable = 1; d = 8'b11001100; #10;
        $finish;
    end

endmodule