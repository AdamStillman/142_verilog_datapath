`include "regFile.v"

//Top level stimulus module
module stimulus;

//Declare variables for stimulating input
reg [3:0] readReg1, readReg2;
reg [15:0] wrData; 
reg RegWrite;
reg clk, reset;
wire [15:0] op1, op2;

initial
	$vcdpluson;
initial
$monitor($time,"	RegWrite = %b readReg1 = %b, readReg2 = %b, op1 = %h, op2 = %h, wrData = %h reset = %b", RegWrite, readReg1, readReg2, op1, op2, wrData, reset);
//Instantiate the design block regFile
regFile a1(.clk(clk),.reset(reset), .op1(op1), .op2(op2), .wrData(wrData), .RegWrite(RegWrite), .readReg1(readReg1), .readReg2(readReg2));
initial
//Stimulate the Input Signals
begin
	clk = 0;
	reset = 0;	
	RegWrite = 1'b0;
	readReg1 = 0;
	readReg2 = 0;
end

always
	#5 clk = !clk;

initial
begin
//Reg write is not asserted.	
	RegWrite = 1'b0;
	readReg1 = 4'b0001;
	readReg2 = 4'b0010;
	
//Reg write is asserted
	#10
	reset = 1;
	RegWrite = 1'b1;
	readReg1 = 4'b0011;
	readReg2 = 4'b0100;
	wrData = 16'h1010;
	
	#10
	RegWrite = 1'b0;
	readReg1 = 4'b0011;
	readReg2 = 4'b0100;

end

initial
begin
#50 $finish;
end


endmodule

