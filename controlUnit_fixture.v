`include "controlUnit.v"

//Top level stimulus module
module stimulus;

//Declare variables for stimulating input
reg [3:0]Opcode, FunctCode;
wire RegDst, ALUOp1, ALUOp0, ALUSrc, Branch, MemRead, MemWrite, Jump, RegWrite, MemtoReg, FPC;

initial
	$vcdpluson;
initial
$monitor($time,"	RegDst = %b ALUOp1 = %b, ALUOp0 = %b, ALUSrc = %b, Branch = %b MemRead = %b, MemWrite = %b, Jump = %b, RegWrite = %b MemtoReg = %b, FPC = %b", RegDst, ALUOp1, ALUOp0, ALUSrc, Branch, MemRead, MemWrite, Jump, RegWrite, MemtoReg, FPC);
//Instantiate the design block controlUnit
controlUnit a1(Opcode, FunctCode, RegDst, ALUOp1, ALUOp0, ALUSrc, Branch, MemRead, MemWrite, Jump, RegWrite, MemtoReg, FPC);
initial
//Stimulate the Ctrl Signal
begin
	Opcode = 4'b0000;
	FunctCode = 4'b0000;
end

initial
begin
//Instruction Type A, non FPM
	Opcode = 4'b0000;
	FunctCode = 4'b0001;
	
//Instruction Type A, FPM
	#10
	Opcode = 4'b0000;
	FunctCode = 4'b0010;

//Load 
	#10	
	Opcode = 4'b1000;
	FunctCode = 4'bxxxx;

//Store
	#10
	Opcode = 4'b1100;
	FunctCode = 4'bxxxx;

//Branch
	#10
	Opcode = 4'b0100;
	FunctCode = 4'bxxxx;

//Stall from program
	#10
	Opcode = 4'b0111;
	FunctCode = 4'bxxxx;

//Jump
	#10
	Opcode = 4'b1011;
	FunctCode = 4'bxxxx;

//Halt
	#10
	Opcode = 4'b1111;
	FunctCode = 4'bxxxx;

end

initial
begin
#80 $finish;
end


endmodule

