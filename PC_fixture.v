`include "PC.v"

//Top level stimulus module
module stimulus;

//Declare variables for stimulating input
reg [15:0] oldPC;
reg clk, reset;
wire [15:0] newPC;

initial
	$vcdpluson;
initial
$monitor($time,"	oldPC = %h, newPC = %h, reset = %b", oldPC, newPC, reset);
//Instantiate the design block PC
PC a1(.clk(clk), .reset(reset), .oldPC(oldPC), .newPC(newPC));
initial
//Stimulate the Input Signals
begin
	clk = 0;
	reset = 0;
	oldPC = 16'h0000;	
end
always
	#5 clk = !clk;

initial
begin
//Old PC Value
	oldPC = 16'hA0A0;

//New PC Value
	#10
	reset = 1;
	oldPC = 16'hFFFF;

#10
	oldPC = 16'hA0A0;

#10
	reset = 0;
	oldPC = 16'hA0A0;

#10
	reset = 1;
	oldPC = 16'hBBBB;

end

initial
begin
#100 $finish;
end

endmodule

