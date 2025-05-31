module alu_tb;

    logic [7:0] op_a, op_b;
    logic [1:0] alu_op;
    logic [7:0] result;
    logic       zero;

    alu uut (.*);

    initial
    begin
        op_a = 8'd10; op_b = 8'd5; alu_op = 2'b00; #1;
        $display("ADD: %0d + %0d = %0d, zero = %0b", op_a, op_b, result, zero);

        op_a = 8'd15; op_b = 8'd15; alu_op = 2'b01; #1;
        $display("SUB: %0d - %0d = %0d, zero = %0b", op_a, op_b, result, zero);

        op_a = 8'b10101010; op_b = 8'b11001100; alu_op = 2'b10; #1;
        $display("AND: %b & %b = %b, zero = %0b", op_a, op_b, result, zero);

        op_a = 8'b10101010; op_b = 8'b01010101; alu_op = 2'b11; #1;
        $display("OR: %b | %b = %b, zero = %0b", op_a, op_b, result, zero);

        op_a = 8'd0; op_b = 8'd0; alu_op = 2'b00; #1;
        $display("ADD zero: %0d + %0d = %0d, zero = %0b", op_a, op_b, result, zero);

        $finish;
    end

endmodule
