`include "param.sv"
`timescale 1ns/1ps
import def::*;
module execute(
	input logic rst,
	input logic clk,
	input logic aluSrc,
	input logic [1:0] aluOp,
	input instrType instr,
	input logic [`width-1:0] pcNext,
	input logic [`width-1:0] signExtend,
	input logic [`width-1:0] readRegData1,
	input logic [`width-1:0] readRegData2,
	output logic [`width-1:0] aluResult,
	output logic [`width-1:0] branchTargetAddr,
	output logic zero	
);
	logic [`width-1:0] aIn;
	logic [`width-1:0] bIn;
	logic [`width-1:0] aluOut;
	logic [`width-1:0] branchAdd;

	always @(*) begin
		//
		aIn = readRegData1;
		bIn = (aluSrc)?signExtend:readRegData2;

		// set zero flag
		zero = (aluOut == 32'd0)?1'b1:1'b0;

		// compute branch address
		branchAdd = pcNext[31:2] + signExtend;
		branchTargetAddr = branchAdd[7:0];

		// select ALU output for SLT
		// send either normal result or just sign bit
		aluResult = (instr.func == SLT)?({31'b0,aluOut[31]}):aluOut;
	end

	//
	always @(*) begin
		case (aluOp)
			2'b10 : begin
				case (instr.func)
					ADD : aluOut = (aIn + bIn);
					SUB : aluOut = (aIn - bIn);
					AND : aluOut = (aIn & bIn);
					OR : aluOut = (aIn | bIn);
					SLT : aluOut = (aIn - bIn);
					default : aluOut = 32'd0;
				endcase
			end
			2'b01 : begin
				aluOut = (aIn - bIn);
			end
			2'b00 : begin
				aluOut = (aIn + bIn);
			end
			default : aluOut = 32'd0;
		endcase
	end
endmodule
