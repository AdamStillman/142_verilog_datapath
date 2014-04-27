`include "forwardingUnit.v"

//Top level stimulus module
module stimulus;

//Declare variables for stimulating input
reg [3:0] EMreadReg1, EMreadReg2, IEreadReg1, IEreadReg2, MWreadReg1, MWreadReg2;
reg EMRegWrite, MWRegWrite;
wire [1:0] ForwardA, ForwardB;

initial
	$vcdpluson;
initial
$monitor($time,"	EMRegWrite = %b, MWRegWrite = %b, EMreadReg1 = %b, EMreadReg2 = %b, IEreadReg1 = %b, IEreadReg2 = %b, MWreadReg1 = %b, MWreadReg2 = %b, ForwardA = %b, ForwardB = %b", EMRegWrite, MWRegWrite, EMreadReg1, EMreadReg2, IEreadReg1, IEreadReg2, MWreadReg1, MWreadReg2, ForwardA, ForwardB);
//Instantiate the design block forwardingUnit
forwardingUnit a1(EMRegWrite, MWRegWrite, EMreadReg1, EMreadReg2, IEreadReg1, IEreadReg2, MWreadReg1, MWreadReg2, ForwardA, ForwardB);
initial
//Stimulate the Input Signals
begin	
	EMRegWrite = 1'b0;
	MWRegWrite = 1'b0;
	EMreadReg1 = 4'b0000;
	EMreadReg2 = 4'b0000;
	IEreadReg1 = 4'b0000;
	IEreadReg2 = 4'b0000;
	MWreadReg1 = 4'b0000;
	MWreadReg2 = 4'b0000;
end

initial
begin
//ForwardA = 2'b10
	EMRegWrite = 1'b1;
	MWRegWrite = 1'bx;
	EMreadReg1 = 4'b0001;
	EMreadReg2 = 4'bxxxx;
	IEreadReg1 = 4'b0001;
	IEreadReg2 = 4'bxxxx;
	MWreadReg1 = 4'bxxxx;
	MWreadReg2 = 4'bxxxx;
	
//ForwardA = 2'b01
	#10
	EMRegWrite = 1'bx;
	MWRegWrite = 1'b1;
	EMreadReg1 = 4'bxxxx;
	EMreadReg2 = 4'bxxxx;
	IEreadReg1 = 4'b0010;
	IEreadReg2 = 4'bxxxx;
	MWreadReg1 = 4'b0010;
	MWreadReg2 = 4'bxxxx;

//ForwardA = 2'b00
	#10
	EMRegWrite = 1'b0;
	MWRegWrite = 1'b0;
	EMreadReg1 = 4'b0000;
	EMreadReg2 = 4'b0000;
	IEreadReg1 = 4'b0000;
	IEreadReg2 = 4'b0000;
	MWreadReg1 = 4'b0000;
	MWreadReg2 = 4'b0000;

//ForwardB = 2'b10
	#10
	EMRegWrite = 1'b1;
	MWRegWrite = 1'bx;
	EMreadReg1 = 4'b0100;
	EMreadReg2 = 4'bxxxx;
	IEreadReg1 = 4'bxxxx;
	IEreadReg2 = 4'b0100;
	MWreadReg1 = 4'bxxxx;
	MWreadReg2 = 4'bxxxx;

//ForwardB = 2'b01
	#10
	EMRegWrite = 1'bx;
	MWRegWrite = 1'b1;
	EMreadReg1 = 4'bxxxx;
	EMreadReg2 = 4'bxxxx;
	IEreadReg1 = 4'bxxxx;
	IEreadReg2 = 4'b1000;
	MWreadReg1 = 4'b1000;
	MWreadReg2 = 4'bxxxx;

//ForwardB = 2'b00
	#10
	EMRegWrite = 1'b0;
	MWRegWrite = 1'b0;
	EMreadReg1 = 4'b0000;
	EMreadReg2 = 4'b0000;
	IEreadReg1 = 4'b0000;
	IEreadReg2 = 4'b0000;
	MWreadReg1 = 4'b0000;
	MWreadReg2 = 4'b0000;
end

initial
begin
#60 $finish;
end


endmodule

