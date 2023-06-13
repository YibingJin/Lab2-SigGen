module sinegen # (
    parameter A_WIDTH = 8,
              D_WIDTH = 8
)(
    input logic       clk,
    input logic       rst,
    input logic       en,
    input logic [D_WIDTH-1:0] incr,
    output logic [D_WIDTH-1:0] dout 
);

logic [A_WIDTH-1:0] addr;

counter  counter1(
    // interface signals
    .clk(clk),// clock
    .rst(rst),// rst
    .en(en),// load counter from data
    .v(incr), // value to preload
    .count(addr)
);

rom rom1(
    .clk(clk),
    .addr(addr),
    .dout(dout)
);


endmodule
