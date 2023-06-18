module sinegen # (
    parameter A_WIDTH = 8,
              D_WIDTH = 8
)(
    input logic       clk,
    input logic       rst,
    input logic       en,

    input logic [D_WIDTH-1:0] incr,
    output logic [D_WIDTH-1:0] dout1,
    output logic [D_WIDTH-1:0] dout2,
);

logic [A_WIDTH-1:0] addr1;
logic [A_WIDTH-1:0] addr2;

counter  counter1(
    // interface signals
    .clk(clk),// clock
    .rst(rst),// rst
    .en(en),// load counter from data
    .v(incr), // value to preload
    .count1(addr1),
    .count2(addr2)
);

rom2ports rom1(
    .clk(clk),
    .addr1(addr1),
    .addr2(addr2),
    .dout1(dout1),
    .dout2(dout2)
);


endmodule
