module buffer(clk, reset, ctrl1, ctrl2, data1, data2, nctrl1, nctrl2, ndata1, ndata2);
input clk, reset; 
input wire ctrl1;
input wire [1:0] ctrl2;
input wire [3:0] data1, data2;

output reg nctrl1;
output reg [1:0] nctrl2;
output reg [3:0] ndata1, ndata2;

always @(posedge clk or negedge reset)
if(!reset)
begin
	nctrl <= 1'b0;
	nctrl2 <= 1'b0;
	ndata1 <= 1'b0;
	ndata2 <= 1'b0;
end

begin
	nctrl1 <= ctrl1;
	nctrl2 <= ctrl2;
	ndata1 <= data1;
	ndata2 <= data2;  
end
endmodule

