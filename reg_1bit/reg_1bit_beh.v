module reg_beh 
(
    input wire clk,
    input wire reset,
    input wire d,
    output reg q
);
 always @(posedge clk or posedge reset) 
 begin
    if(reset)
    q<=1'b0;// reset value
    else
    q<=d;    // d value
 end

    
endmodule