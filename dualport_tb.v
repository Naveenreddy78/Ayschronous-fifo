module tb_simple_dual_port_ram;

    reg wr_clk = 0, rd_clk = 0;
    always #5 wr_clk = ~wr_clk;  // 100 MHz
    always #7 rd_clk = ~rd_clk;  // ~71 MHz

    reg wr_en, rd_en;
    reg [3:0] wr_addr, rd_addr;
    reg [7:0] wr_data;
    wire [7:0] rd_data;

    simple_dual_port_ram dut (
        .wr_clk(wr_clk),
        .wr_en(wr_en),
        .wr_addr(wr_addr),
        .wr_data(wr_data),
        .rd_clk(rd_clk),
        .rd_en(rd_en),
        .rd_addr(rd_addr),
        .rd_data(rd_data)
    );

    initial begin
        wr_en = 0; rd_en = 0;
        wr_addr = 0; rd_addr = 0; wr_data = 0;

        // Write some data
        @(posedge wr_clk);
        wr_en = 1;
        wr_addr = 4'd1;
        wr_data = 8'hA5;

        @(posedge wr_clk);
        wr_en = 0;

        // Read it back after a little delay
        #20;
        @(posedge rd_clk);
        rd_en = 1;
        rd_addr = 4'd1;

        @(posedge rd_clk);
        rd_en = 0;

        #20;
        $finish;
    end

endmodule
