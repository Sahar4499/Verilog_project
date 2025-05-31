module fsm_controller_tb;

    logic clk;
    logic reset;
    logic [7:0] pc;
    logic fetch_en, decode_en, exec_en, wb_en;
    logic [2:0] state;

    fsm_controller uut 
    (
        .clk(clk),
        .reset(reset),
        .pc(pc),
        .fetch_en(fetch_en),
        .decode_en(decode_en),
        .exec_en(exec_en),
        .wb_en(wb_en),
        .state(state)
    );

    initial 
    begin
        $dumpfile("fsm_tb.vcd");
        $dumpvars(0, fsm_controller_tb);

        reset = 1; #12;
        reset = 0; #8;

        repeat (15) @(posedge clk);

        reset = 1; #10;
        reset = 0; #8;

        repeat (6) @(posedge clk);

        $finish;
    end

    initial 
    begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    always @(posedge clk) 
    begin
        $display("T=%0t | reset=%b | pc=%0d | state=%0d | fetch=%b decode=%b exec=%b wb=%b",
                  $time, reset, pc, state, fetch_en, decode_en, exec_en, wb_en);
    end

endmodule
