module hazard(IDRegRs,IDRegRt,EXRegRt,EXMemRead,PCWrite,IFIDWrite,HazMuxCon); 
 input wire [3:0] IDRegRs,IDRegRt,EXRegRt; 
 input wire EXMemRead; 
 reg r_PCWrite, r_IFIDWrite, r_HazMuxCon; 
 output wire  PCWrite, IFIDWrite, HazMuxCon;

 always@(IDRegRs,IDRegRt,EXRegRt,EXMemRead) 
 begin
//changed this to &=>&& and | =>||
 if(EXMemRead==1'b1&&((EXRegRt == IDRegRs)||(EXRegRt == IDRegRt))) 
 begin//stall 
 r_PCWrite = 0; 
 r_IFIDWrite = 0; 
 r_HazMuxCon = 1; 
 end 
 else 
 begin//no stall 
 r_PCWrite = 1; 
 r_IFIDWrite = 1; 
 r_HazMuxCon = 0;  
 end 

 end

 assign  PCWrite = r_PCWrite;
 assign IFIDWrite = r_IFIDWrite;
 assign HazMuxCon = r_HazMuxCon;
endmodule 



