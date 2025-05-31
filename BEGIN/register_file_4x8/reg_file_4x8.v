module reg_file_4x8 
(
    input  wire clk,
    input  wire write_en,
    input  wire [1:0] write_addr,
    input  wire [7:0] write_data,
    input  wire [1:0] read_addr1,
    input  wire [1:0] read_addr2,
    output wire [7:0] read_data1,
    output wire [7:0] read_data2
);

    reg [7:0] regs [0:3];

    assign read_data1 = regs[read_addr1];
    assign read_data2 = regs[read_addr2];

    always @(posedge clk) 
    begin
        if (write_en)
            regs[write_addr] <= write_data;
    end

endmodule
