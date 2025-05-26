module fsm_traffic_tb;

    reg clk, reset;
    wire [1:0] light;

    // יצירת מופע של FSM – יחידת הבדיקה
    fsm_traffic uut (
        .clk(clk),
        .reset(reset),
        .light(light)
    );

    // ייצור אות שעון – מחזור 10 יחידות זמן
    always #5 clk = ~clk;

    initial begin
        $display("Time | Reset | Light");
        $monitor("%4t   |   %b    |  %b", $time, reset, light);

        clk = 0;         // התחלת השעון
        reset = 1; #10;  // איפוס ראשוני
        reset = 0;

        #100;            // הרצת זמן לראות מחזורי מצב
        $finish;
    end

endmodule