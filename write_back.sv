`include "param.sv"
`timescale 1ns/1ps
import def::*;
module write_back(
		input logic rst,
		input logic clk,
		input logic [`logDepthMem-1:0] dataAddress,
		input logic [`width-1:0] writeMemData,
		input logic memRead,
		input logic memWrite,
		output logic [`width-1:0] readMemData);

	// instatiate data memory
	d_mem d_mem_instance (
		.rst(rst),
		.clk(clk),
		.dataAddress(dataAddress),
		.writeMemData(writeMemData),
		.memRead(memRead),
		.memWrite(memWrite),
		.readMemData(readMemData)
	);
endmodule
