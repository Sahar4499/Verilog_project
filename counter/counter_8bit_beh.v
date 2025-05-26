module counter_8bit_beh 
(
    input  wire        clk,
    input  wire        reset,
    input  wire        enable,
    output reg  [7:0]  count
);

    always @(posedge clk or posedge reset)
    begin
        if (reset)
            count <= 8'd0;
        else if (enable)
            count <= count + 1;
        // else – שמור את הערך הקיים
    end

endmodule