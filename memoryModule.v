module memoryModule(MemRead, MemWrite, readData, writeData, readAddress, writeAddress, clk, reset);
//Data memory

//I/O ports
output [15:0] readData;
//Controls for memory read or write
input MemRead, MemWrite;
input clk, reset;
input [15:0] writeData, writeAddress, readAddress;

integer i;
//output defined as register
reg [15:0] readData;
reg [15:0] Memory[0:99]; //100 Memory locations each 16 bits long

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
		Memory[0] <= 16'h1BCD;
		for (i = 1; i < 99; i = i + 1)
		begin
			Memory[i] <= 16'h0000;
		end
	end
	else if (MemWrite)
	begin
		Memory[(writeAddress/2)] <= writeData;
	end
end

endmodule
