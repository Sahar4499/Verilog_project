module alu 
(
    input  wire [7:0] a,
    input  wire [7:0] b,
    input  wire [2:0] sel,
    output reg  [7:0] out,
    output wire zero,
    output reg  carry
);

always @(*) 
begin
    carry = 0;  // ברירת מחדל – נוסיף בהמשך

    if (sel == 3'b000)
        out <= a & b;
    else if (sel == 3'b001)
        out <= a | b;
    else if (sel == 3'b010)
        {carry, out} <= a + b;   // שמירת נשא
    else if (sel == 3'b011)
        out <= a - b;
    else if (sel == 3'b100)
        out <= a ^ b;
    else if (sel == 3'b101)
        out <= ~a;
    else if (sel == 3'b110)
        out <= a >> 1;
    else if (sel == 3'b111)
        out <= a << 1;
end
assign zero = (out == 8'b0);

    
endmodule