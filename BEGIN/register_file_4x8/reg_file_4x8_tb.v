module reg_file_4x8_tb;

reg clk, write_en;
reg [1:0] write_addr;
reg [7:0] write_data;
reg [1:0] read_addr1;
reg [1:0] read_addr2;
wire [7:0] read_data1;
wire [7:0] read_data2;

reg_file_4x8 uut 
(
    .clk(clk),
    .write_en(write_en),
    .write_addr(write_addr),
    .write_data(write_data),
    .read_addr1(read_addr1),
    .read_addr2(read_addr2),
    .read_data1(read_data1),
    .read_data2(read_data2)
);

// מחולל שעון
always #5 clk = ~clk;

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, reg_file_4x8_tb);

    $display("Time | read_addr1 | read_data1 | read_addr2 | read_data2");
    $monitor("%4t |     %b      |   %b   |     %b      |   %b",
    $time, read_addr1, read_data1, read_addr2, read_data2);


    clk = 0;
    write_en = 1; write_addr = 2'b00; write_data = 8'b10101010; #10;

    write_en = 1; write_addr = 2'b01; write_data = 8'b11001100; #10;

    write_en = 0; read_addr1 = 2'b00; read_addr2 = 2'b01; #10;

    write_en = 0; write_addr = 2'b10; write_data = 8'b11110000; #10;

    read_addr1 = 2'b10; read_addr2 = 2'b10; #10;

    write_en = 1; write_addr = 2'b01; write_data = 8'b00000001; #10;

    write_en = 0; read_addr1 = 2'b01; read_addr2 = 2'b01; #10;

    $finish;
end

endmodule
