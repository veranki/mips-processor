`include "param.sv"
`timescale 1ns/1ps
import def::*;
module control(
	input logic rst,
	input logic clk,
	input instrType instr,
	output logic regDst, // Selects between $Rd and $Rt
	output logic aluSrc, // ALU operand either from register or from instruction
	output logic memToReg, // memToReg for Loads otherwise ALUtoReg.
	output logic regWrite,
	output logic memRead,
	output logic memWrite,
	output logic branch, //
	output logic [1:0] aluOp
);
	always @(*) begin
		case (instr.opCode)
			rType :begin
				regDst = 1'b1;
				regWrite = 1'b1;
				aluOp = 2'b10;
				aluSrc = 1'b0;
				memToReg = 1'b0;
				memRead = 1'b0;
				memWrite = 1'b0;
				branch = 1'b0;
			end
			lType :begin
				regDst = 1'b0;
				regWrite = 1'b1;
				aluOp = 2'b00;
				aluSrc = 1'b1;
				memToReg = 1'b1;
				memRead = 1'b1;
				memWrite = 1'b0;
				branch = 1'b0;
			end
			sType :begin
				regDst = 1'b0;
				regWrite = 1'b0;
				aluOp = 2'b00;
				aluSrc = 1'b1;
				memToReg = 1'b0;
				memRead = 1'b0;
				memWrite = 1'b1;
				branch = 1'b0;
			end
			jType :begin
				regDst = 1'b0;
				regWrite = 1'b0;
				aluOp = 2'b01;
				aluSrc = 1'b0;
				memToReg = 1'b0;
				memRead = 1'b0;
				memWrite = 1'b0;
				branch = 1'b1;
			end
			default :begin
				regDst = 1'b0;
				regWrite = 1'b0;
				aluOp = 2'b00;
				aluSrc = 1'b0;
				memToReg = 1'b0;
				memRead = 1'b0;
				memWrite = 1'b0;
				branch = 1'b0;
			end
		endcase
	end
endmodule