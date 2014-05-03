`include "PC.v"
`include "pc_mux.v"
`include "next_address_adder.v"
`include "instruction_memory.v"
`include "next_address_mux.v"
`include "next_address_adder.v"
`include "reg_file.v"
`include "sign_extend.v"
`include "IFID.v.v"

module cpu(clk, reset);
input clk, reset;

wire reset;
//pc wires
wire [15:0] pc_out;

//pc_mux wires
wire pc_mux_sel;
wire [15:0] pc_mux_out;

//pc instruction memory wire
wire [15:0] instruction_memory_out;

//next address mux wire
wire HazMuxCon;
wire [15:0] next_address_mux_out;

//next adress adder wire
wire [15:0] next_address;

//IF/ID buffer wire
wire [15:0] IF_ID_instruct_out, IF_ID_next_adress;

// reg file
wire regfile_op1_out, regfile_op2_out;

//sign extend mux
wire [3:0] out_sign_extend_mux;

//sign extend
wire [15:0] sign_extend_out;

//shift left one
wire [15:0] shift_left_out;

//branch address
wire [15:0] branch_address;

//control
wire jump, reg_write;

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


//if/id buffer
	//need to add flush from hazard and ifidwrite from hazard
if_id IFID(.clk(clk), .reset(reset), .flush(), .inst(instruction_memory_out), .instReg(IF_ID_instruct_out), .PC_Plus2(next_adress), .PC_Plus2Reg(IF_ID_next_adress), .IFIDWrite() );


//reg file
//needs write data from wb
reg_file reg_file(.clk(clk), .reset(reset), .op1((regfile_op1_out), .op2((regfile_op2_out), .wrData(), .RegWrite(reg_write), .readReg1(IF_ID_instruct_out[11:8]), .readReg2(IF_ID_instruct_out[7:4]) );

//sign extend mux
//in0 is op1, in1 op2
sign_extend_mux sign_extend_mux(.sel(jump), .in0(IF_ID_instruct_out[11:8]), .in1(IF_ID_instruct_out[7:4]), .out(out_sign_extend_mux) );

//sign extend
sign_extend sign_extend(.in(out_sign_extend_mux), .out(sign_extend_out));

//shift left one
shift_left_one shift_left_one(.in(sign_extend_out), .out(shift_left_out) );

//branch address adder
branch_address_adder branch_address_adder(.in(IF_ID_next_adress), .in2(shift_left_out), .out(branch_address) );
endmodule
