`timescale 1ns / 1ns

module memoryModule(MemRead, MemWrite, readData, writeData, readAddress, writeAddress, clk, reset);
//Data memory

//I/O ports
output [15:0] readData;
//Controls for memory read or write
input MemRead, MemWrite;
input clk, reset;
input [15:0] writeData, writeAddress, readAddress;

//output defined as register
reg [15:0] readData;
reg [15:0] Memory[0:29]; //30 Memory locations each 16 bits long

always @(*) //read, combinational
begin
	if (MemRead)
	begin
		readData = Memory[(readAddress/2)];
	end
	else
	begin
		readData = 16'hxxxx;
	end
end
always @(posedge clk or negedge reset) //write, sequential
begin
	if (!reset)
	begin
		//input address / 2
		Memory[0] <= 16'hABCD;
		Memory[1] <= 16'h0000;
		Memory[2] <= 16'h0000;
		Memory[3] <= 16'h0000;
		Memory[4] <= 16'h0000;
		Memory[5] <= 16'h0000;
		Memory[6] <= 16'h0000;
		Memory[7] <= 16'h0000;
		Memory[8] <= 16'h0000;
		Memory[9] <= 16'h0000;
		Memory[10] <= 16'h0000;
		Memory[11] <= 16'h0000;
		Memory[12] <= 16'h0000;
		Memory[13] <= 16'h0000;
		Memory[14] <= 16'h0000;
		Memory[15] <= 16'h0000;
		Memory[16] <= 16'h0000;
		Memory[17] <= 16'h0000;
		Memory[18] <= 16'h0000;
		Memory[19] <= 16'h0000;
		Memory[20] <= 16'h0000;
		Memory[21] <= 16'h0000;
		Memory[22] <= 16'h0000;
		Memory[23] <= 16'h0000;
		Memory[24] <= 16'h0000;
		Memory[25] <= 16'h0000;
		Memory[26] <= 16'h0000;
		Memory[27] <= 16'h0000;
		Memory[28] <= 16'h0000;
		Memory[29] <= 16'h0000;
	end
	else if (MemWrite)
	begin
		Memory[(writeAddress/2)] <= writeData;
	end
end

endmodule
