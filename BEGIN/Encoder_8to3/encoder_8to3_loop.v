module encoder_8to3_loop 
(
    input  wire [7:0] in,
    output reg  [2:0] out
);

integer i;

always @(*) 
begin
    out = 3'b000;  //default
    for (i = 0; i < 8; i = i + 1) 
    begin
        if (in[i])  // ברגע שמצאנו ביט דלוק
            out = i[2:0];  // נשמור את האינדקס שלו
    end
end

endmodule
