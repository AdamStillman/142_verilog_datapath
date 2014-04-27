module controlUnit(Opcode, FunctCode, RegDst, ALUOp1, ALUOp0, ALUSrc, Branch, MemRead, MemWrite, Jump, RegWrite, MemtoReg, FPC);

//I/O ports
output RegDst, ALUOp1, ALUOp0, ALUSrc, Branch, MemRead, MemWrite, Jump, RegWrite, MemtoReg, FPC;
input [3:0] Opcode, FunctCode;

//output defined as register
reg RegDst, ALUOp1, ALUOp0, ALUSrc, Branch, MemRead, MemWrite, Jump, RegWrite, MemtoReg, FPC;

always @(*) //RegDst signal
begin
	case (Opcode)
		4'b0000: //Type A
		begin
			RegDst = 1'b1;
			ALUOp1 = 1'b1;
 			ALUOp0 = 1'b0;
			ALUSrc = 1'b0;
			Branch = 1'b0;
			MemRead = 1'b0;
			MemWrite = 1'b0;
			Jump = 1'b0;
			RegWrite = 1'b1;
			MemtoReg = 1'b0;
			case (FunctCode)
				4'b0000: FPC = 1'b0; //Signed Addition
				4'b0001: FPC = 1'b0; //Signed Subtraction
				4'b0010: FPC = 1'b1; //FPM
				4'b0100: FPC = 1'b0; //Signed Multiplication
				4'b0101: FPC = 1'b0; //Signed Division
				4'b1000: FPC = 1'b0; //Shift Left
				4'b1001: FPC = 1'b0; //Shift Right
				4'b1010: FPC = 1'b0; //Rotate Left
				4'b1011: FPC = 1'b0; //Rotate Right
				default: FPC = 1'b0;
		endcase	
		end
		4'b1000: //Load
		begin
 			RegDst = 1'b0; 
			ALUOp1 = 1'b0;
			ALUOp0 = 1'b0;
			ALUSrc = 1'b1;
			Branch = 1'b0;
			MemRead = 1'b1;
			MemWrite = 1'b0;
			Jump = 1'b0;
			RegWrite = 1'b0;
			MemtoReg = 1'b1;
			FPC = 1'b0;
		end
		4'b1100: //Store
 		begin
 			RegDst = 1'bx; 
			ALUOp1 = 1'b0;
			ALUOp0 = 1'b0;
			ALUSrc = 1'b1;
			Branch = 1'b0;
			MemRead = 1'b0;
			MemWrite = 1'b1;
			Jump = 1'b0;
			RegWrite = 1'b0;
			MemtoReg = 1'bx;
			FPC = 1'b0;
		end
		4'b0100: //BLT
		begin
 			RegDst = 1'bx; 
			ALUOp1 = 1'b0;
			ALUOp0 = 1'b1;
			ALUSrc = 1'b0;
			Branch = 1'b1;
			MemRead = 1'b0;
			MemWrite = 1'b0;
			Jump = 1'b0;
			RegWrite = 1'b0;
			MemtoReg = 1'bx;
			FPC = 1'b0;
		end
		4'b0101: //BGT 
		begin
 			RegDst = 1'bx; 
			ALUOp1 = 1'b0;
			ALUOp0 = 1'b1;
			ALUSrc = 1'b0;
			Branch = 1'b1;
			MemRead = 1'b0;
			MemWrite = 1'b0;
			Jump = 1'b0;
			RegWrite = 1'b0;
			MemtoReg = 1'bx;
			FPC = 1'b0;
		end
		4'b0110: //BEQ
		begin
 			RegDst = 1'bx; 
			ALUOp1 = 1'b0;
			ALUOp0 = 1'b1;
			ALUSrc = 1'b0;
			Branch = 1'b1;
			MemRead = 1'b0;
			MemWrite = 1'b0;
			Jump = 1'b0;
			RegWrite = 1'b0;
			MemtoReg = 1'bx;
			FPC = 1'b0;
		end
		4'b1011: //JMP
		begin
 			RegDst = 1'bx; 
			ALUOp1 = 1'b0;
			ALUOp0 = 1'b0;
			ALUSrc = 1'b0;
			Branch = 1'b0;
			MemRead = 1'b0;
			MemWrite = 1'b0;
			Jump = 1'b1;
			RegWrite = 1'b0;
			MemtoReg = 1'bx;
			FPC = 1'b0;
		end
		4'b1111: //Halt
		begin
 			RegDst = 1'b0; 
			ALUOp1 = 1'b0;
			ALUOp0 = 1'b0;
			ALUSrc = 1'b0;
			Branch = 1'b0;
			MemRead = 1'b0;
			MemWrite = 1'b0;
			Jump = 1'b0;
			RegWrite = 1'b0;
			MemtoReg = 1'b0;
			FPC = 1'b0;
		end
		4'b0111: //Stall from program
		begin
 			RegDst = 1'b0; 
			ALUOp1 = 1'b0;
			ALUOp0 = 1'b0;
			ALUSrc = 1'b0;
			Branch = 1'b0;
			MemRead = 1'b0;
			MemWrite = 1'b0;
			Jump = 1'b0;
			RegWrite = 1'b0;
			MemtoReg = 1'b0;
			FPC = 1'b0;
		end
		default: 
		begin
 			RegDst = 1'b0; 
			ALUOp1 = 1'b0;
			ALUOp0 = 1'b0;
			ALUSrc = 1'b0;
			Branch = 1'b0;
			MemRead = 1'b0;
			MemWrite = 1'b0;
			Jump = 1'b0;
			RegWrite = 1'b0;
			MemtoReg = 1'b0;
			FPC = 1'b0;
		end
	endcase
end
endmodule
