module shift_register_tb;

reg clk, reset, load, shift_en, dir;
reg [7:0] in;
wire [7:0] out;

shift_register uut 
(
    .clk(clk),
    .reset(reset),
    .load(load),
    .shift_en(shift_en),
    .dir(dir),
    .in(in),
    .out(out)
);


always #5 clk = ~clk;

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, shift_register_tb);
    
    
    clk = 0;
    reset = 1;
    load = 0;
    shift_en = 0;
    dir = 0;
    in = 8'b00000000;
    
    #10;
    reset = 0;

   
    load = 1;
    in = 8'b10101010;
    #10;
    load = 0;

    
    shift_en = 1;
    dir = 0;
    #30;

   
    dir = 1;
    #30;

    
    shift_en = 0;
    reset = 1;
    #10;

    $finish;
end

endmodule
