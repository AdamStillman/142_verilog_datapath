`include "PC.v"
`include "pc_mux.v"
`include "next_address_adder.v"
`include "instruction_memory.v"
`include "next_address_mux.v"
`include "next_address_adder.v"


module cpu(clk, reset);
input clk, reset;

wire reset;
//pc wires
wire [15:0] pc_out;

//pc_mux wires
wire pc_mux_sel;
wire [15:0] branch_address, pc_mux_out;

//pc instruction memory wire
wire [15:0] instruction_memory_out;

//next address mux wire
wire HazMuxCon;
wire [15:0] next_address_mux_out;

//next adress adder wire
wire [15:0] next_address;

//pc mux -- need to add hazard load from memory
pc_mux pc_mux(.sel(pc_mux_sel), .in0(next_address), .in1(branch_address), .out(pc_mux_out));

//pc
pc pc(.clk(clk), .reset(reset), .newPc(pc_out), .oldPC(pc_mux_out));


//instruction memory
instruction_memory instruction_memory(.readData(instruction_memory_out), .readAddress(pc_out), .clk(clk), .reset(reset));

//next address mux
next_address_mux next_address_mux(.HazMuxCon(HazMuxCon), .out(next_address_mux_out) );

//next adress adder
next_address_adder next_address_adder(.a(pc_out), .b(next_address_mux_out), .result(next_address) );

endmodule
