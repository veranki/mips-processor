`include "param.sv"
`timescale 1ns/1ps
import def::*;
module decode_tb(
);
	//
	logic clk;
	logic rst;

	//
	logic memToReg;
	logic regDst;
	logic regWrite;
	instrType instr;
	logic [`width-1:0] aluResult;
	logic [`width-1:0] readMemData;
	logic [`width-1:0] readRegData1;
	logic [`width-1:0] readRegData2;
	logic [`width-1:0] signExtend;

	//
	decode decodenstance (
		.rst(rst),
		.clk(clk),
		.memToReg(memToReg),
		.regDst(regDst),
		.regWrite(regWrite),
		.instr(instr),
		.aluResult(aluResult),
		.readMemData(readMemData),
		.readRegData1(readRegData1),
		.readRegData2(readRegData2),
		.signExtend(signExtend)
	);

	//
	initial begin
		clk = 1;
		rst = 1;
		#30 rst = 0;
		forever #10 clk = !clk;
	end

	//
	initial begin
//		// R Type
//		regWrite = 1'b1;
//		regDst = 1'b1;
//		aluResult = 32'h99;
//		readMemData = 32'h55;
//		memToReg = 0;
//		instr.opCode = rType;
//		instr.rs = 32'd1;
//		instr.rt = 32'd2;
//		instr.rd = 32'd3;
//		instr.func = ADD;
//		#80 memToReg = 1;
//		regDst = 1'b0;
//		// L Type
//		regWrite = 1'b1;
//		regDst = 1'b0;
//		aluResult = 32'h6;
//		readMemData = 32'h66;
//		memToReg = 1'b1;
//		instr.opCode = lType;
//		instr.rs = 32'd1;
//		instr.rt = 32'd2;
//		instr[15:0] = 16'h5;
		// S Type
		regWrite = 1'b0;
		regDst = 1'b0;
		aluResult = 32'h6;
		memToReg = 1'b0;
		instr.opCode = sType;
		instr.rs = 32'd1;
		instr.rt = 32'd2;
		instr[15:0] = 16'h5;
	end
endmodule