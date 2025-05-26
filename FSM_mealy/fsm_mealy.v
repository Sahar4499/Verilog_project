module fsm_mealy_110 (
    input  wire clk,
    input  wire reset,
    input  wire in,
    output reg  detect
);

    // הגדרת שמות למצבים
    parameter S0 = 2'b00,  // מצב התחלתי
              S1 = 2'b01,  // ראינו 1
              S2 = 2'b10;  // ראינו 11

    reg [1:0] state, next_state;

    // 🔁 לוגיקה של המעברים
    always @(*) begin
        case (state)
            S0: next_state = (in == 1) ? S1 : S0;
            S1: next_state = (in == 1) ? S2 : S0;
            S2: next_state = (in == 0) ? S0 : S2;
            default: next_state = S0;
        endcase
    end

    // ⏰ עדכון המצב – סינכרוני
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    // 💡 לוגיקת פלט Mealy – מצב **וגם** קלט
    always @(*) begin
        case (state)
            S2: detect = (in == 0) ? 1'b1 : 1'b0;
            default: detect = 1'b0;
        endcase
    end

endmodule