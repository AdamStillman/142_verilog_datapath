module next_address_mux(HazMuxCon, out);

//I/O ports
output wire [15:0] out;
input wire HazMuxCon;


//temp register
reg [15:0] r_out = 16'b0;;


//if a stall, pass adder 0, if no stall, passs adder 2 for pc +2


always @(*)
begin
	//The two inputs can be from any of the other blocks, these are just example values.
	case (HazMuxCon)
		1'b0: r_out = 16'h002; 
		1'b1: r_out = 16'h000;
	endcase
end
assign out = r_out;
endmodule
