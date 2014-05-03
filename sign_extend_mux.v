module sign_extend_mux(sel, in0, in1, out);

//I/O ports
output [3:0] out;
input sel;
input [3:0] in0, in1;//0 is op1, 1 is op 2. 

//output defined as register
reg [3:0] out;

always @(*) 
begin
//jump not asserted, op 2 selected, jump asserted, op 1 selected
	case (sel)
		1'b0: out = in1;//if jump not asserted, op1 
		1'b1: out = in0;//if jump asserted op0
	endcase
end
endmodule
