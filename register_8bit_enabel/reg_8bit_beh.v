module reg_8bit_beh 
(
    input  wire        clk,
    input  wire        reset,
    input  wire        enable,
    input  wire [7:0]  d,
    output reg  [7:0]  q
);
    always @(posedge clk or posedge reset)
    begin
        if (reset)
            q <= 8'b0;// reset value
        else if (enable)
            q <= d;// d value
       
    end
endmodule