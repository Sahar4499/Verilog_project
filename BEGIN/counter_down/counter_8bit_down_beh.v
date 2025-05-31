module 8bit_down_beh 
(
    input wire clk,
    input wire reset,
    input wire enable,
    output reg[7:0] count
);

always @(clk posedge or reset posedge) 
begin
    if(reset)
    count<=8'b00000000;
    else if(enable)
    count<=count-1;
end
    
endmodule