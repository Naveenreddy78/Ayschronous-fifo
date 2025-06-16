module tb_simple_2ff_sync;

    reg clk = 0;
    always #5 clk = ~clk;

    reg async_signal;
    wire sync_out;

    simple_2ff_sync dut (
        .clk(clk),
        .async_signal(async_signal),
        .sync_out(sync_out)
    );

    initial begin
        async_signal = 0;
        #12 async_signal = 1;
        #9  async_signal = 0;
        #20 async_signal = 1;
        #10 async_signal = 0;
        #20 $finish;
    end

endmodule
