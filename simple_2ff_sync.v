module simple_2ff_sync (
    input  wire clk,
    input  wire async_signal,
    output reg  sync_out
);
    reg temp;

    always @(posedge clk) begin
        temp     <= async_signal;
        sync_out <= temp;
    end
endmodule
