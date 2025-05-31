module counter_8bit_tb;

    reg clk, reset, enable;
    wire [7:0] count;

    counter_8bit_beh uut 
    (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .count(count)
    );

    // הפקת שעון
    always #5 clk = ~clk;

    initial begin
        $display("Time | rst en | count");
        $monitor("%4t  |  %b   %b | %b", $time, reset, enable, count);

        // אתחול
        clk = 0; reset = 1; enable = 0; #10;
        reset = 0; enable = 1; #50;   // ספירה פעילה
        enable = 0; #20;              // עצירת ספירה
        enable = 1; #30;              // המשך ספירה
        reset = 1; #10;               // איפוס
        reset = 0; enable = 1; #20;
        $finish;
    end

endmodule