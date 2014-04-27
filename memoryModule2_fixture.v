`include "memoryModule2.v"

//Top level stimulus module
module stimulus;

//Declare variables for stimulating input
reg [15:0]readAddress;
reg clk, reset;
wire [15:0] readData;

initial
	$vcdpluson;
initial
$monitor($time,"	readAddress = %h, readData = %h, reset = %b" , readAddress, readData, reset);

//Instantiate the design block memoryModule
memoryModule2 a1(.readData(readData), .readAddress(readAddress), .clk(clk), .reset(reset));
initial
//Stimulate the Input Signals
begin	
	clk = 0;
	reset = 0;
	readAddress = 16'h0000;
end

always
	#5 clk = !clk;

initial
begin
//Read 
	readAddress = 16'h0000;

	#10
	reset = 1;
	readAddress = 16'h0028;

	#10
	readAddress = 16'h0000;
	
	#10
	readAddress = 16'h0032;
	
end

initial
begin
#100 $finish;
end


endmodule

