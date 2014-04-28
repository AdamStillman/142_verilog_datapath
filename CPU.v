`include "PC.v"
`include "pc_mux.v"
module cpu(clk, reset);
input clk, reset;

wire reset;
//pc wires
wire [15:0] pc_out;
//pc_mux wires
wire pc_mux_sel;
wire [15:0] pc_mux_in0, pc_mux_in1, pc_mux_out;
//pc instruction memory
wire [15:0] instruction_memory_out;

//pc mux
pc_mux pc_mux(.sel(pc_mux_sel), .in0(pc_mux_in0), .in1(pc_mux_in1), .out(pc_mux_out));

//pc
pc pc(.clk(clk), .reset(reset), .newPc(pc_out), .oldPC(pc_mux_out));


//instruction memory
instruction_memory instruction_memory(.readData(instruction_memory_out), .readAddress(pc_out), .clk(clk), .reset(reset));

endmodule