module fp1(sig1, sig2, exp1, exp2, sign1, sign2, signew, expnew, signnew);
input wire [10:0] sig1, sig2; 
input wire [3:0] exp1, exp2;
input wire sign1, sign2;
output wire [21:0] signew;
output wire [4:0] expnew;
output wire signnew;


assign expnew = exp1 + exp2 - 3'b111;
assign signew = sig1 * sig2;
assign signnew = sign1 ^ sign2;

endmodule
