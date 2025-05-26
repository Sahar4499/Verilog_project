module demux_1to4 (
    input  wire data,
    input  wire [1:0] sel,
    output reg  [3:0] out
);

    always @(*) begin
        out = 4'b0000;  // נאתחל את כולם ל־0
        case (sel)
            2'b00: out[0] = data;
            2'b01: out[1] = data;
            2'b10: out[2] = data;
            2'b11: out[3] = data;
        endcase
    end

endmodule