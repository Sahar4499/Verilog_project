module full_adder_beh 
(
    input wire a,
    input wire b,
    input wire cin,
    output reg sum,
    output reg cout
);
always @(*)begin
    sum=a^b^cin;
    cout=(a&b)|(a&cin)|(b&cin);
end
endmodule