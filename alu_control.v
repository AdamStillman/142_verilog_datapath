module alu_control(clk, alu_op1, alu_op0, function_code, alu_control);

input clk, alu_op1, alu_op0;
input [3:0] function_code;
output reg[3:0] alu_control; 
reg [1:0] alu_op= 2'b00;

always @(posedge clk)
begin
 alu_op[1:0] <= {alu_op1, alu_op0};
end

always @(*)
begin
	case(alu_op)
		2'b00: alu_control[3:0] = 4'b1001;//lw,sw
		2'b01: alu_control[3:0] = 4'b1010;//branch
		2'b10://atype
		begin
			case(function_code)
				4'b0000: alu_control[3:0] = 4'b0000;//ad
				4'b0001: alu_control[3:0] = 4'b0001;//sub
				4'b0010: alu_control[3:0] = 4'b0010;//floating point
				4'b0100: alu_control[3:0] = 4'b0011;//multi
				4'b0101: alu_control[3:0] = 4'b0100;// div
		 		4'b1000: alu_control[3:0] = 4'b0101;//shift left
				4'b1001: alu_control[3:0] = 4'b0110;//shift right	
				4'b1010: alu_control[3:0] = 4'b0111;//rotate left
				4'b1011: alu_control[3:0] = 4'b1000;//rotate right
			endcase
		end	
	endcase
end
endmodule

