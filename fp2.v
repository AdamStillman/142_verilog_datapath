module fp2(sig, exp, sign, fp_result, under, over);
input wire [21:0] sig;
input wire [4:0] exp;
input wire sign;
output wire [15:0] fp_result;
//output wire [10:0] signew; 
//output wire [4:0] expnew;
output wire under, over;
reg [21:0] tempsig;
reg [4:0] tempexp;
reg [1:0] count = 2'b00;
reg underflow = 1'b0;
reg overflow = 1'b0;
always @(*)
begin
	if(sig[20]==1'b0)
		begin
			
			tempsig = sig >> 1;
			tempexp = exp + 1'b1;
			count = count + 1'b1;
			if(count==2'b10 && sig[20]==0) 
				begin
					underflow = 1'b1;
					count = 2'b00;
				end
				else 
				begin
					underflow = 1'b0; 
					count = count;
				end
		end
	else 
		begin
			tempsig = sig;
			tempexp = exp;
			count = count;
		end
	if (tempexp[4]==1) overflow = 1'b1;
	else overflow =1'b0;

end
assign fp_result = {sign, , tempexp[3:0], tempsig[19:9] };
//assign signew = tempsig[19:9];
//assign expnew = tempexp;
assign under = underflow;
assign over = overflow;

endmodule
