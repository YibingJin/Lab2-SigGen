module sigdelay # (
    parameter A_WIDTH = 8,
              D_WIDTH = 8
)(
    input logic       clk,
    input logic       rst,
    input logic       en,
    input logic       wr,
    input logic       rd,
    input logic [D_WIDTH-1:0] offset,
    input logic [D_WIDTH-1:0] mic_signal,
    output logic [D_WIDTH-1:0] delayed_signal
);

logic [A_WIDTH-1:0] addr1;
logic [A_WIDTH-1:0] addr2;

counter  counter1(
    // interface signals
    .clk(clk),// clock
    .rst(rst),// rst
    .en(en),// load counter from data
    .v(offset), // offset
    .count1(addr1),
    .count2(addr2)
);

ram2ports ram1(
    .clk(clk),
    .wr_en(wr),
    .rd_en(rd),
    .wr_addr(addr1),
    .rd_addr(addr2),
    .din(mic_signal),
    .dout(delayed_signal)
);


endmodule
