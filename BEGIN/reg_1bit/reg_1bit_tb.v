module register_tb;

    // הגדרת אותות קלטים ופלטים לבדיקה
    reg clk, reset, d;
    wire q;

    // יצירת מופע של ה־Unit Under Test (UUT)
    reg_beh uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // הפקת אות שעון: מתהפך כל 5 יחידות זמן → תדר של 100MHz
    always #5 clk = ~clk;

    // בלוק ראשי – מגדיר את סדר פעולות הבדיקה
    initial begin
        // הדפסה של הכותרת למסך
        $display("Time | reset d | q");
        $monitor("%4t  |   %b    %b | %b", $time, reset, d, q);

        // אתחול ראשוני
        clk = 0;         // השעון מתחיל מ-0
        reset = 1; d = 0; #10;  // הפעלת reset

        reset = 0; d = 1; #10;  // דגימת d=1
        d = 0;           #10;  // דגימת d=0
        d = 1;           #10;
        reset = 1;       #10;  // איפוס שוב
        reset = 0; d = 1; #10;
        $finish;                // סיום סימולציה
    end

endmodule