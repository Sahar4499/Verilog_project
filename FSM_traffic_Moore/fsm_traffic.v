module fsm_traffic (
    input  wire clk,
    input  wire reset,
    output reg [1:0] light  // 00=green, 01=yellow, 10=red
);

    // הגדרת מצבים בשמות
    parameter S0 = 2'b00,  // ירוק
              S1 = 2'b01,  // כתום
              S2 = 2'b10;  // אדום

    reg [1:0] state, next_state;

    // לוגיקת מעבר בין מצבים
    always @(*) begin
        case (state)
            S0: next_state = S1;  // ירוק → כתום
            S1: next_state = S2;  // כתום → אדום
            S2: next_state = S0;  // אדום → ירוק
            default: next_state = S0;
        endcase
    end

    // לוגיקת עדכון מצב לפי שעון
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    // לוגיקת פלט (Moore)
    always @(*) begin
        case (state)
            S0: light = 2'b00; // ירוק
            S1: light = 2'b01; // כתום
            S2: light = 2'b10; // אדום
            default: light = 2'b00;
        endcase
    end

endmodule