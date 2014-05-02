`include "IFID.v"

//Top level stimulus module
module stimulus;

//Declare variables for stimulating input
reg [15:0] PC_Plus2, inst;
reg IFIDWrite, flush;
reg clk, reset;
wire [15:0] instReg, PC_Plus2Reg;

initial
	$vcdpluson;
initial
$monitor($time,"	PC_Plus2 = %h, PC_Plus2Reg = %h, inst = %h, instReg = %h, IFIDWrite = %b, flush = %b, reset = %b" , PC_Plus2, PC_Plus2Reg, inst, instReg, IFIDWrite, flush, reset);

//Instantiate the design block memoryModule
IFID a1(.clk(clk), .reset(reset), .flush(flush), .inst(inst), .instReg(instReg), .PC_Plus2(PC_Plus2), .PC_Plus2Reg(PC_Plus2Reg), .IFIDWrite(IFIDWrite));
initial
//Stimulate the Input Signals
begin	
	clk = 0;
	reset = 0;
	flush = 1'b0;
	IFIDWrite = 1'b0;
	inst = 16'h0000;
	PC_Plus2 = 16'h0000;
end

always
	#5 clk = !clk;

initial
begin
	flush = 1'b0;
	IFIDWrite = 1'b1;
	inst = 16'h0A0A;
	PC_Plus2 = 16'h2222;
	
	#10
	reset = 1;
	flush = 1'b0;
	IFIDWrite = 1'b1;
	inst = 16'h0A0A;
	PC_Plus2 = 16'h2222;
	
	#10
	flush = 1'b0;
	IFIDWrite = 1'b1;
	inst = 16'h1111;
	PC_Plus2 = 16'hFFFF;

	#10
	IFIDWrite = 1'b1;
	flush = 1'b0;
	inst = 16'h1111;
	PC_Plus2 = 16'hFFFF;

	#10
	IFIDWrite = 1'b1;
	flush = 1'b1;
	inst = 16'h1111;
	PC_Plus2 = 16'hFFFF;
	
end

initial
begin
#100 $finish;
end


endmodule
