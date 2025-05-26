module full_adder_beh 
(
    input wire a,
    input wire b,
    input wire cin,
    output reg sum,
    output reg carry
);
always @(*)begin
    sum=a^B^cin;
    carry=(a&b)|(a&cin)|(b&cin);
end
endmodule