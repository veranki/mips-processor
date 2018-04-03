`include "param.sv"
`timescale 1ns/1ps
import def::*;
module mips32(
		input logic rst,
		input logic clk,
		// interconnection nets
		output instrType instr,
		output logic zero,
		output logic branch,
		output logic [`width-1:0] branchTargetAddr,
		output logic memToReg,
		output logic regDst,
		output logic regWrite,
		output logic [`width-1:0] aluResult,
		output logic[`width-1:0] readMemData,
		output logic aluSrc,
		output logic [1:0] aluOp,
		output logic [`width-1:0] pcNext,
		output logic [`width-1:0] signExtend,
		output logic [`width-1:0] readRegData1,
		output logic [`width-1:0] readRegData2,
		output logic memRead,
		output logic memWrite);

	// fetch
	fetch fetch_instance (
		.rst(rst),
		.clk(clk),
		.branch(branch),
		.zero(zero),
		.branchTargetAddr(branchTargetAddr),
		.instr(instr),
		.pcNext(pcNext)
	);

	// control
	control control_instance (
		.rst(rst),
		.clk(clk),
		.instr(instr),
		.regDst(regDst),
		.aluSrc(aluSrc),
		.memToReg(memToReg),
		.regWrite(regWrite),
		.memRead(memRead),
		.memWrite(memWrite),
		.branch(branch),
		.aluOp(aluOp)
	);

	// decode
	decode decode_instance (
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

	// execute
	execute execute_instance (
		.rst(rst),
		.clk(clk),
		.aluSrc(aluSrc),
		.aluOp(aluOp),
		.instr(instr),
		.pcNext(pcNext),
		.signExtend(signExtend),
		.readRegData1(readRegData1),
		.readRegData2(readRegData2),
		.aluResult(aluResult),
		.branchTargetAddr(branchTargetAddr),
		.zero(zero)
	);

	// write_back
	write_back write_back_instance (
		.rst(rst),
		.clk(clk),
		.dataAddress(aluResult[2:0]),
		.writeMemData(readRegData2),
		.memRead(memRead),
		.memWrite(memWrite),
		.readMemData(readMemData)
	);
endmodule
