module shift_register (
    input wire clk,
    input wire reset,
    input wire load,
    input wire shift_en,
    input wire dir,
    input wire [7:0] in,
    output reg [7:0] out
);

always @(posedge clk or posedge reset) begin
    if (reset)
        out <= 8'b0;
    else if (load)
        out <= in;
    else if (shift_en) begin
        if (dir)
            out <= {out[6:0], 1'b0};  // shift left
        else
            out <= {1'b0, out[7:1]};  // shift right
    end
end

endmodule
