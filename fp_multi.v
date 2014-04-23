module fp_multi(op1, op2, result);

input [15:0] op1, op2;
output [15:0] result;
reg result_sign;
reg [3:0] result_add;
reg [12:0] result_multi;

always @(*)
begin
	
//determine sign
result_sign = op1[15] ^ op2[15];
//add biased exponents
result_add = op1[14:11] + op2[14:11];
//subtract bias(7) from sum to get new biased exponent
result_add = result_add - 4'b0111;
//multiply significands
result_multi = op1[10:0] * op2[10:0];
//normalize if necessary
if(result_multi[11]==0)
	begin
		multi >> 1'b1;
	end

//tie it all together
result= {result_sign, result_add, result_multi[10:0]};

end
endmodule

