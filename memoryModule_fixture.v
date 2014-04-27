`include "memoryModule.v"

//Top level stimulus module
module stimulus;

//Declare variables for stimulating input
reg [15:0] writeData, writeAddress, readAddress;
reg MemRead, MemWrite;
reg clk, reset;
wire [15:0] readData;

initial
	$vcdpluson;
initial
$monitor($time,"	MemRead = %b, MemWrite = %b, writeAddress = %h, writeData = %h, readAddress = %h, readData = %h, reset = %b" , MemRead, MemWrite, writeAddress, writeData, readAddress, readData, reset);

//Instantiate the design block memoryModule
memoryModule a1(.MemRead(MemRead), .MemWrite(MemWrite), .readData(readData), .writeData(writeData), .writeAddress(writeAddress), .readAddress(readAddress), .clk(clk), .reset(reset));
initial
//Stimulate the Input Signals
begin	
	clk = 0;
	reset = 0;
	MemRead = 1'b0;
	MemWrite = 1'b0;
	writeData = 16'h0000;
	writeAddress = 16'h0000;
	readAddress = 16'h0000;
end

always
	#5 clk = !clk;

initial
begin
//Read 
	MemRead = 1'b1;
	MemWrite = 1'b0;
	readAddress = 16'h0000;
	
//Write
	#10
	reset = 1;
	MemRead = 1'b0;
	MemWrite = 1'b1;
	writeData = 16'hFFFF;
	writeAddress = 16'h000A;
	
	#10
	MemRead = 1'b1;
	MemWrite = 1'b0;
	readAddress = 16'h000A;
	
end

initial
begin
#100 $finish;
end


endmodule

