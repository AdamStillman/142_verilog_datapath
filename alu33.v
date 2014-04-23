`include "Desktop/142part2/fp_multi.v"
module alu33(alu_ctrl, op1, op2, fp_op1, fp_op2, clk,  reset, result, fp_result, overflow, negative, zero);

input [3:0]alu_ctrl;
input reset, clk;
input [3:0] op1, op2;
input wire [15:0] fp_op1, fp_op2;
reg [7:0] temp;
output reg [7:0] result;
output wire overflow, negative, zero;
output wire [15:0] fp_result;  

fp_multi fp(.op1(fp_op1), .op2(fp_op2), .result(fp_result));

always@(*)
begin
	if(reset==1'b1)
	begin
		result=8'h00;
		temp=8'h00;
	end
	else begin
		case(alu_ctrl)
			4'b0000: result = op1[3:0] + op2[3:0];//add
			4'b0001: result = op1[3:0] - op2[3:0];//seb
			4'b0010: result = fp_result;
			4'b0011: result = op1[3:0] * op2[3:0];//multi
			4'b0100: result = op1[3:0] / op2[3:0]; //div
		   	4'b0101: result = op1 << op2;//shiftleft
			4'b0110: result = op1 >> op2;//shift right
			4'b0111: result = ((op1 << op2) | (op1 >> (4-op2)) );
			4'b1000: result = (op1>>op2) | (op1<<(4-op2));//rot right
			4'b1001: begin temp[3:0] = op1[3:0]; //loadword-sw 
				temp[7] = op1[3];//sign extend
				temp[6] = op1[3];
				temp[5] = op1[3];
				temp[4] = op1[3];	
				result = temp + op2;//sign extend + op
				end	
			4'b1010:begin temp[3:0] = op2[3:0]; //branch
				temp[7] = op2[3];// sign extend
				temp[6] = op2[3];
				temp[5] = op2[3];
				temp[4] = op2[3];
			       	result = temp << 1;
				end

		endcase
	end
end

assign zero = (result == 0);
assign overflow = op1[3]^op2[3];
assign negative = result[3];
endmodule


