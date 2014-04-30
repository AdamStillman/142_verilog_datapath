`timescale 1ns / 1ns

module instruction_memory(readData, readAddress, clk, reset);
//INSTRUCTION MEMORY

//I/O ports
output wire  [15:0] readData;
//Controls for memory read or write

input wire clk, reset;
input wire [15:0]readAddress;

//output defined as register
reg [15:0] Memory[0:29]; //30 Memory locations each 16 bits long


always @(posedge clk or negedge reset) //write, sequential
begin
	if (!reset)
	begin
		//input address / 2
		Memory[0] <= 16'h0120;
		Memory[1] <= 16'h0121;
		Memory[2] <= 16'h09E2;
		Memory[3] <= 16'h0EF2;
		Memory[4] <= 16'h0564;
		Memory[5] <= 16'h0155;
		Memory[6] <= 16'h0001;
		Memory[7] <= 16'h0448;
		Memory[8] <= 16'h0449;
		Memory[9] <= 16'h062B;
		Memory[10] <= 16'h063A;
		Memory[11] <= 16'h6704;
		Memory[12] <= 16'h0B10;
		Memory[13] <= 16'h4705;
		Memory[14] <= 16'h0B20;
		Memory[15] <= 16'h5702;
		Memory[16] <= 16'h0110;
		Memory[17] <= 16'h0110;
		Memory[18] <= 16'h8890;
		Memory[19] <= 16'h0880;
		Memory[20] <= 16'hC892;
		Memory[21] <= 16'h8A92;
		Memory[22] <= 16'h0CC0;
		Memory[23] <= 16'h0DD1;
		Memory[24] <= 16'h0CD0;
		Memory[25] <= 16'hEFFF;
		Memory[26] <= 16'h0000;
		Memory[27] <= 16'h0000;
		Memory[28] <= 16'h0000;
		Memory[29] <= 16'h0000;
	end
	else //Dummy value
	begin
		Memory[29] <= 16'h0000;
	end
end
assign readData = Memory[(readAddress/2)];
endmodule
