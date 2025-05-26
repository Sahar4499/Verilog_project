module and_gate (
    input wire a,
    input wire b,
    output reg y
);
    always @(*) begin
        y = a & b;
    end
endmodule