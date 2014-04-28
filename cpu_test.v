`timescale 10ns/1ps
`include "Desktop/142part3/fp2.v"
module cpu_test;

	// Inputs
	reg clk;
	reg reset;

	

	initial
        $vcdpluson;

initial
       $monitor($time, "", );

	// Instantiate the Unit Under Test (UUT)
	cpu test(.clk(clk)
	);

initial begin
      clk = 1'b0;
     forever #10 clk = ~clk;
end

  
initial  begin
       #300 $finish;
end   
endmodule
