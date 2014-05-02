`include "IDEXFP.v"

//Top level stimulus module
module stimulus;

//Declare variables for stimulating input
reg clk, reset, FPC, flush;
reg [1:0] WB;
reg [2:0] M;
reg [3:0] EX;
reg [15:0] op1, op2, imm_value;
reg [3:0] readReg1, readReg2;

wire FPCreg;
wire [1:0] WBreg;
wire [2:0] Mreg;
wire [3:0] EXreg;
wire [15:0] op1reg, op2reg, imm_valuereg;
wire [3:0] readReg1reg, readReg2reg;

initial
	$vcdpluson;
initial
$monitor($time,"	FPC = %b, FPCreg = %b, WB = %b, WBreg = %b, M = %b, Mreg = %b, EX = %b, EXreg = %b, op1 = %h, op1reg = %h, op2 = %h, op2reg = %h, imm_value = %h, imm_valuereg = %h, readReg1 = %b, readReg1reg = %b, readReg2 = %b, readReg2reg = %b, flush = %b, reset = %b" , FPC, FPCreg, WB, WBreg, M, Mreg, EX, EXreg, op1, op1reg, op2, op2reg, imm_value, imm_valuereg, readReg1, readReg1reg, readReg2, readReg2reg,  flush, reset);

//Instantiate the design block memoryModule
IDEXFP a1(.clk(clk), .reset(reset), .FPC(FPC), .flush(flush), .WB(WB), .M(M), .EX(EX), .op1(op1), .op2(op2), .imm_value(imm_value), .readReg1(readReg1), .readReg2(readReg2), .FPCreg(FPCreg), .WBreg(WBreg), .Mreg(Mreg), .EXreg(EXreg), .op1reg(op1reg), .op2reg(op2reg), .imm_valuereg(imm_valuereg), .readReg1reg(readReg1reg), .readReg2reg(readReg2reg));
initial
//Stimulate the Input Signals
begin	
	clk = 0;
	reset = 0;
	flush = 1'b0;
	FPC = 1'b0;
	WB = 2'b00;
	M = 3'b000;
	EX = 4'b0000;
	op1 = 16'h0000;
	op2 = 16'h0000;
	imm_value = 16'h0000;
	readReg1 = 4'b0000;
	readReg2 = 4'b0000;
end

always
	#5 clk = !clk;

initial
begin
	flush = 1'b0;
	FPC = 1'b1;
	WB = 2'b01;
	M = 3'b010;
	EX = 4'b0111;
	op1 = 16'h1111;
	op2 = 16'h1111;
	imm_value = 16'h1111;
	readReg1 = 4'b1111;
	readReg2 = 4'b1111;

	#10
	reset = 1;
	flush = 1'b0;
	FPC = 1'b1;
	WB = 2'b01;
	M = 3'b010;
	EX = 4'b0111;
	op1 = 16'h1111;
	op2 = 16'h1111;
	imm_value = 16'h1111;
	readReg1 = 4'b1111;
	readReg2 = 4'b1111;
	
	#10
	flush = 1'b0;
	FPC = 1'b0;
	WB = 2'b10;
	M = 3'b101;
	EX = 4'b1110;
	op1 = 16'hBBBB;
	op2 = 16'hBBBB;
	imm_value = 16'hBBBB;
	readReg1 = 4'b0101;
	readReg2 = 4'b0101;

	#10
	flush = 1'b1;
	FPC = 1'b0;
	WB = 2'b10;
	M = 3'b101;
	EX = 4'b1110;
	op1 = 16'hBBBB;
	op2 = 16'hBBBB;
	imm_value = 16'hBBBB;
	readReg1 = 4'b0101;
	readReg2 = 4'b0101;

end

initial
begin
#100 $finish;
end


endmodule
