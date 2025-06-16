wmodule simple_dual_port_ram (
    input  wire        wr_clk,
    input  wire        wr_en,
    input  wire [3:0]  wr_addr,
    input  wire [7:0]  wr_data,

    input  wire        rd_clk,
    input  wire        rd_en,
    input  wire [3:0]  rd_addr,
    output reg  [7:0]  rd_data
);

    reg [7:0] mem [0:15];  // 16 x 8-bit memory

    always @(posedge wr_clk) begin
        if (wr_en)
            mem[wr_addr] <= wr_data;
    end

    always @(posedge rd_clk) begin
        if (rd_en)
            rd_data <= mem[rd_addr];
    end

endmodule
