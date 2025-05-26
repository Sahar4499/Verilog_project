module demux_1to4_tb;
    reg data;
    reg [1:0] sel;
    wire [3:0] out;
    demux_1to4 uut 
    (
        .data(data),
        .sel(sel),
        .out(out)
    );

    initial begin
        $display("sel data | out");
        $monitor("%b   %b   | %b", sel, data, out);

        data = 1;
        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        data = 0; sel = 2'b01; #10;

        $finish;
    end
endmodule