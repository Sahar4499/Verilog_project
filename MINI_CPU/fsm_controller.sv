module fsm_controller 
(
    input  logic       clk,
    input  logic       reset,
    output logic [7:0] pc,
    output logic       fetch_en,
    output logic       decode_en,
    output logic       exec_en,
    output logic       wb_en
);

    typedef enum logic [2:0] 
    {
        FETCH,
        DECODE,
        EXECUTE,
        WRITEBACK,
        NEXT
    } state_t;

    state_t state, next_state;

    always_ff @(posedge clk or posedge reset) 
    begin
        if (reset)
            state <= FETCH;
        else
            state <= next_state;
    end

    always_comb begin
        fetch_en  = 0;
        decode_en = 0;
        exec_en   = 0;
        wb_en     = 0;
        next_state = state;

        case (state)
            FETCH: begin
                fetch_en  = 1;
                next_state = DECODE;
            end
            DECODE: begin
                decode_en = 1;
                next_state = EXECUTE;
            end
            EXECUTE: begin
                exec_en = 1;
                next_state = WRITEBACK;
            end
            WRITEBACK: begin
                wb_en = 1;
                next_state = NEXT;
            end
            NEXT: begin
                next_state = FETCH;
            end
        endcase
    end

    always_ff @(posedge clk or posedge reset) 
    begin
        if (reset)
            pc <= 0;
        else if (state == NEXT)
            pc <= pc + 1;
    end

endmodule
