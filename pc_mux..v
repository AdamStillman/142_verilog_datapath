module pc_mux(sel, in0, in1, out);

//I/O ports
input wire  sel;
input wire [15:0] in0, in1;
//output defined as register
output wire [15:0] out;
reg [15:0] r_out;

always @(*) //Depending on the select signal supplied to the mux, the output is chosen to be supplied to the next block.
begin
	//The two inputs can be from any of the other blocks, these are just example values.
	case (sel)
		1'b0: r_out = in0; 
		1'b1: r_out = in1;
	endcase
end
assign out = r_out;
endmodule
