module counter_down_8bit_tb;

    reg clk, reset, enable;
    wire [7:0] count;

    counter_down_8bit_tb uut 
    (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .count(count)
    );

    // יצירת אות שעון – כל 5 יחידות זמן
    always #5 clk = ~clk;

    initial begin
        $display("Time | rst en | count");
        $monitor("%4t  |  %b   %b | %b", $time, reset, enable, count);

        clk = 0; reset = 1; enable = 0; #10;
        reset = 0; enable = 1; #50;     // המונה יורד
        enable = 0; #20;                // עוצר ירידה
        enable = 1; #30;                // ממשיך לרדת
        reset = 1; #10;                 // איפוס – חזרה ל־255
        reset = 0; enable = 1; #20;
        $finish;
    end

endmodule