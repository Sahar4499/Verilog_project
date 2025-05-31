module alu
(
    input  logic [7:0] op_a,
    input  logic [7:0] op_b,
    input  logic [1:0] alu_op,
    output logic [7:0] result,
    output logic       zero
);

    always_comb
    begin
        case (alu_op)
            2'b00: result = op_a + op_b;
            2'b01: result = op_a - op_b;
            2'b10: result = op_a & op_b;
            2'b11: result = op_a | op_b;
            default: result = 8'b0;
        endcase
    end

    assign zero = (result == 8'b0);

endmodule
