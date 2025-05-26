module xor_gate_tb;
    reg a, b;         // אותות קלט לבדיקה (reg = כי נכתוב לתוכם)
    wire y;           // אות פלט שמחובר למודול הנבדק

    xor_df uut (    // חיבור למודול שנבדק (Unit Under Test)
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        $display("a b | y");            // הדפסת כותרת למסך
        $display("--------");
        
        a = 0; b = 0; #10; $display("%b %b | %b", a, b, y); // מקרה ראשון
        a = 0; b = 1; #10; $display("%b %b | %b", a, b, y); // מקרה שני
        a = 1; b = 0; #10; $display("%b %b | %b", a, b, y); // מקרה שלישי
        a = 1; b = 1; #10; $display("%b %b | %b", a, b, y); // מקרה רביעי
        
        $finish;       // סיום סימולציה
    end
endmodule