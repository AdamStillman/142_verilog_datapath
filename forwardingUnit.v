`timescale 1ns / 1ns

module forwardingUnit(EMRegWrite, MWRegWrite, EMreadReg1, EMreadReg2, IEreadReg1, IEreadReg2, MWreadReg1, MWreadReg2, ForwardA, ForwardB);

//I/O ports
output [1:0] ForwardA, ForwardB;
//These 2 outputs control the muxes involved in forwarding.
input EMRegWrite, MWRegWrite;
input [3:0] EMreadReg1, EMreadReg2, IEreadReg1, IEreadReg2, MWreadReg1, MWreadReg2;

//output defined as register
reg [1:0] ForwardA, ForwardB;

always @(*) //ForwardA
begin
	if ((EMRegWrite) && (EMreadReg1 != 0) && (EMreadReg1 == IEreadReg1))
	begin
		ForwardA = 2'b10;
	end
	else if ((MWRegWrite) && (MWreadReg1 != 0) && (MWreadReg1 == IEreadReg1))
	begin
		ForwardA = 2'b01;
	end	
	else	
	begin
		ForwardA =2'b00;
	end
end

always  @(*) //ForwardB
begin
	if ((EMRegWrite) && (EMreadReg1 != 0) && (EMreadReg1 == IEreadReg2))
	begin
		ForwardB = 2'b10;
	end

	else if ((MWRegWrite) && (MWreadReg1 != 0) && (MWreadReg1 == IEreadReg2))
	begin
		ForwardB = 2'b01;
	end
	else
	begin
		ForwardB = 2'b00;	
	end

	
end
endmodule
