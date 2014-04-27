module PC(clk,reset, newPC, oldPC);

//I/O ports
output [15:0] newPC;
input clk, reset;
input [15:0] oldPC;

//output defined as register
reg [15:0] newPC;

always @(posedge clk or negedge reset) 
begin
	if (!reset)
	begin
		newPC <= newPC;
	end
	else
	begin
		//oldPC becomes new PC on posedge of the clock
		newPC <= oldPC;
	end
end
endmodule
