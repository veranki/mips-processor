`include "param.sv"
`timescale 1ns/1ps
import def::*;
module mips32_tb(
);
	//
	logic clk;
	logic rst;
	//
	instrType instr;
	logic zero;
	logic branch;
	logic [`width-1:0] branchTargetAddr;
	logic memToReg;
	logic regDst;
	logic regWrite;
	logic [`width-1:0] aluResult;
	logic[`width-1:0] readMemData;
	logic aluSrc;
	logic [1:0] aluOp;
	logic [`width-1:0] pcNext;
	logic [`width-1:0] signExtend;
	logic [`width-1:0] readRegData1;
	logic [`width-1:0] readRegData2;
	logic memRead;
	logic memWrite;

	//
	initial begin
		clk = 0;
		rst = 1;
		#10 rst = 0;
		forever #50 clk = !clk;
	end

	//
	mips32 mips32_instance (
		.rst(rst),
		.clk(clk),
		.instr(instr),
		.zero(zero),
		.branch(branch),
		.branchTargetAddr(branchTargetAddr),
		.memToReg(memToReg),
		.regDst(regDst),
		.regWrite(regWrite),
		.aluResult(aluResult),
		.readMemData(readMemData),
		.aluSrc(aluSrc),
		.aluOp(aluOp),
		.pcNext(pcNext),
		.signExtend(signExtend),
		.readRegData1(readRegData1),
		.readRegData2(readRegData2),
		.memRead(memRead),
		.memWrite(memWrite)
	);

	//
	initial begin
		`simulation_time
		$stop;
	end
endmodule
