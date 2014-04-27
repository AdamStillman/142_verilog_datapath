`timescale 10ns/1ps
`include "Desktop/142part3/fp2.v"
module fp2_test;

	// Inputs
	reg[21:0] sig;
	reg [4:0] exp;
	reg sign;

	// Outputs
	wire [15:0] fp_result;
	wire under;
	wire over;

	initial
        $vcdpluson;

initial
       $monitor($time, "fp_result=%b |", fp_result);

	// Instantiate the Unit Under Test (UUT)
	fp2 test(.sig(sig), .exp(exp), .sign(sign), .fp_result(fp_result), .under(under), .over(over)
	);

//initial begin
  //     clk = 1'b0;
    //   forever #10 clk = ~clk;
//end
	initial begin
		// Initialize Inputs
		sig =0;
		exp =0;
		sign=0;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		sig =22'b1011100000111111100000;
		exp = 5'b10011;
		sign= 1'b1;

		
	end
  
initial  begin
       #300 $finish;
end   
endmodule
