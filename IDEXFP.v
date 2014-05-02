`timescale 1ns / 1ns

module IDEXFP(clk, reset, FPC, flush, WB, M, EX, op1, op2, imm_value, readReg1, readReg2, FPCreg, WBreg, Mreg, EXreg, op1reg, op2reg, imm_valuereg, readReg1reg, readReg2reg);

//I/O ports
input clk, reset, FPC, flush;
input [1:0] WB;
input [2:0] M;
input [3:0] EX;
input [15:0] op1, op2, imm_value;
input [3:0] readReg1, readReg2;

output FPCreg;
output [1:0] WBreg;
output [2:0] Mreg;
output [3:0] EXreg;
output [15:0] op1reg, op2reg, imm_valuereg;
output [3:0] readReg1reg, readReg2reg;

//output defined as register
reg FPCreg;
reg [1:0] WBreg;
reg [2:0] Mreg;
reg [3:0] EXreg;
reg [15:0] op1reg, op2reg, imm_valuereg;
reg [3:0] readReg1reg, readReg2reg;

always @(posedge clk or negedge reset) 
begin
	if (!reset | flush)
	begin
		FPCreg <= 0;
		WBreg <= 0;
		Mreg <= 0;
		EXreg <= 0;
		op1reg <= 0;
		op2reg <= 0;
		imm_valuereg <= 0;
		readReg1reg <= 0;
		readReg2reg <= 0;
	end
	else 
	begin
		FPCreg <= FPC;
		WBreg <= WB;
		Mreg <= M;
		EXreg <= EX;
		op1reg <= op1;
		op2reg <= op2;
		imm_valuereg <= imm_value;
		readReg1reg <= readReg1;
		readReg2reg <= readReg2;
	end
end
endmodule
