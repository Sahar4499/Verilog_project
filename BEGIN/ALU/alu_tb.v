module alu_tb;

reg [7:0] a, b;
reg [2:0] sel;
wire [7:0] out;
wire carry, zero;

alu uut (
    .a(a),
    .b(b),
    .sel(sel),
    .out(out),
    .carry(carry),
    .zero(zero)
);

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, alu_tb);

    $display(" sel |     a      |     b      |  out   | carry | zero ");
    $monitor("%b   | %b | %b | %b |   %b   |  %b", sel, a, b, out, carry, zero);

    // AND
    sel = 3'b000; a = 8'b11001100; b = 8'b10101010; #10;

    // ADD (carry expected)
    sel = 3'b010; a = 8'b11111111; b = 8'b00000001; #10;

    // NOT
    sel = 3'b101; a = 8'b10101010; b = 8'b00000000; #10;

    // SHIFT LEFT
    sel = 3'b111; a = 8'b00000001; b = 8'b00000000; #10;

    $finish;
end

endmodule
