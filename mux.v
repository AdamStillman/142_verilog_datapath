module mux(sel, in0, in1, out);

//I/O ports
output [15:0] out;
input sel;
input [15:0] in0, in1;

//output defined as register
reg [15:0] out;

always @(*) //Depending on the select signal supplied to the mux, the output is chosen to be supplied to the next block.
begin
	//The two inputs can be from any of the other blocks, these are just example values.
	case (sel)
		1'b0: out = in0; 
		1'b1: out = in1;
	endcase
end
endmodule
