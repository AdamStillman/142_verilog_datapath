`include "mux.v"

//Top level stimulus module
module stimulus;

//Declare variables for stimulating input
reg [15:0] in0, in1;
reg sel;
wire [15:0] out;

initial
	$vcdpluson;
initial
$monitor($time,"	sel = %b, out = %b, in0 = %b, in1 = %b", sel, out, in0, in1);
//Instantiate the design block mux
mux a1(sel, in0, in1, out);
initial
//Stimulate the Input Signals
begin
	sel = 0;	
end

initial
begin
//Sel 0, out = 16'h0000
	sel = 0;
	in0 = 16'h0000;
	in1 = 16'hFFFE;
//Sel 1, out = 16'FFFF
	#10
	sel = 1;
	in0 = 16'h0001;
	in1 = 16'hFFFE;
end

initial
begin
#20 $finish;
end

endmodule

