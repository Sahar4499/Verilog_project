module half_adder_behavioral 
(
    input wire a,
    input wire b,
    output reg sum,
    output reg carry
);
    
    always @(*)begin
        sum=a^b;
        carry=a&b;
    end

    
endmodule