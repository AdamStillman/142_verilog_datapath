`timescale 1ns / 1ns

module regFile(clk,reset, op1, op2, wrData, RegWrite, readReg1, readReg2);

//I/O ports
output [15:0] op1, op2;
input [15:0] wrData; 
input RegWrite;
input clk, reset;
input [3:0] readReg1, readReg2;
//readReg1 = writeReg
//op1 and op2 are the values output from the register file that are the contents of readReg1 and readReg2
//RegWrite is the control signal that is sent to the register file
//readReg1 and writeReg are the same value based on the project outline
//readReg1 and readReg 2 = addresses
//op1 and op2 = contents at address locations


//output defined as register
reg [15:0] op1, op2;
reg [15:0] regfile[0:15];

always @(*) //Combinational read
begin
	op1 = regfile[readReg1];
	op2 = regfile[readReg2];
end

always @(posedge clk or negedge reset) //Sequential write
begin
	if (!reset)
	begin
	//initialize
		regfile[0] <= 16'h0000; 
		regfile[1] <= 16'h1F00;	
		regfile[2] <= 16'h0054;
		regfile[3] <= 16'hF70F;
		regfile[4] <= 16'hF07F;
		regfile[5] <= 16'h0048;
		regfile[6] <= 16'h0028;
		regfile[7] <= 16'h00FF;
		regfile[8] <= 16'hAAAA;
		regfile[9] <= 16'h0000;
		regfile[10] <= 16'h0000;
		regfile[11] <= 16'h0000;
		regfile[12] <= 16'hFFFF;
		regfile[13] <= 16'h0002;
		regfile[14] <= 16'hBE00;
		regfile[15] <= 16'hC400;	
						
	end
	else if (RegWrite)
	begin
		regfile[readReg1] <= wrData;
	end
end
endmodule
