module fp2();
input wire [21:0] sig;
input wire [4:0] exp;
input wire sign;
output wire [21:0] signew; 
output wire [4:0] expnew;
output wire under;
reg [21:0] tempsig;
reg [4:0] tempexp;
reg [1:0] count = 2'b00;
reg underflow = 1'b0;

always @(*)
begin
	if(sig[20]==1'b0)
		begin
			
			tempsig = sig >> 1;
			tempexp = exp + 1'b1;
			count = count + 1'b1;
			if(count==2'b10 && sig[20]==0) underflow = 1'b1;
			else underflow = 1'b0; 
		end
	else 
		begin
			sig = sig;
			exp = exp;
			count = count;
		end
	if exp	

end
assign under = underflow;
endmodule
