`include "param.sv"
`timescale 1ns/1ps
import def::*;
module decode(
	input logic rst,
	input logic clk,
	input logic memToReg,
	input logic regDst,
	input logic regWrite,
	input instrType instr,
	input logic [`width-1:0] aluResult,
	input logic [`width-1:0] readMemData,
	output logic [`width-1:0] readRegData1,
	output logic [`width-1:0] readRegData2,
	output logic [`width-1:0] signExtend
);
	regAddr readRegAdd1;
	regAddr readRegAdd2;
	regAddr writeRegAdd;
	logic [`width-1:0] writeRegData;

	reg_file reg_filenstance (
		.rst(rst),
		.clk(clk),
		.readRegAdd1(readRegAdd1),
		.readRegAdd2(readRegAdd2),
		.writeRegAdd(writeRegAdd),
		.writeRegData(writeRegData),
		.regWrite(regWrite),
		.readRegData1(readRegData1),
		.readRegData2(readRegData2)
	);

	//
	always @(*) begin
		readRegAdd1 = regAddr'(instr.rs);
		readRegAdd2 = regAddr'(instr.rt);
		// MUX for register write address
		writeRegAdd =  regAddr'((regDst)?instr.rd:instr.rt);
		// MUX to bypass data memory for R-type instructions
		writeRegData = (memToReg)?readMemData:aluResult;
		// sign extend 16bits to 32bits from instruction immediate value
		signExtend = (instr[15]==1'b0)?({16'h0000,instr[15:0]}):({16'hffff,instr[15:0]});
	end
endmodule