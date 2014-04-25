module buffer(clk, ctrl1, ctrl2, data1, data2, nctrl1, nctrl2, ndata1, ndata2);
input clk, ctrl1;
input [1:0] ctrl2;
input [3:0] data1, data2;

output reg nctrl1;
output reg [1:0] nctrl2;
output reg [3:0] ndata1, ndata2;

always @(posedge clk)
begin
	nctrl1 <= ctrl1;
	nctrl2 <= ctrl2;
	ndata1 <= data1;
	ndata2 <= data2;  
end
endmodule

