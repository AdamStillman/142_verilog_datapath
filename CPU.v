`include "PC.v"
module cpu(clk);
input clk;

wire reset;
//pc wires
wire pc_in, pc_out;

pc pc(.clk(clk), .reset(reset), .newPc(pc_out), .oldPC(pc_in));

endmodule
