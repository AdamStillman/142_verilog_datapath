`timescale 1ns / 1ns

module IFID(clk, reset, flush, inst, instReg, PC_Plus2, PC_Plus2Reg, IFIDWrite);

//I/O ports
output [15:0] instReg, PC_Plus2Reg;
input clk, reset, IFIDWrite, flush;
input [15:0] PC_Plus2, inst;

//output defined as register
reg [15:0] instReg, PC_Plus2Reg;

always @(posedge clk or negedge reset) 
begin
	if (!reset | flush)
	begin
		instReg <= 0;
		PC_Plus2Reg <= 0;
	end
	else if (IFIDWrite)
	begin
		instReg <= inst;
		PC_Plus2Reg <= PC_Plus2;
	end
end
endmodule
