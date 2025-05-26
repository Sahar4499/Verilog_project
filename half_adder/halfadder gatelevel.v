module half_adder_gate 
(
    input wire a,
    input wire b,
    output wire sum,
    output wire carry
);
xor(sum,a,b);
and(carry,a,b);
    
endmodule