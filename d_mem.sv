`include "param.sv"
`timescale 1ns/1ps
import def::*;
module d_mem(
		input logic rst,
		input logic clk,
		input logic [`logDepthMem-1:0] dataAddress,
		input logic [`width-1:0] writeMemData,
		input logic memRead,
		input logic memWrite,
		output logic [`width-1:0] readMemData);

	// define data memory
	logic [`width-1:0] dataMem [`depthMem-1:0];
	// initialize data memory
	initial
	begin
		$readmemh("F:\/dev\/mips_05\/mem_files\/test_data.memh", dataMem);
		`simulation_time;
		$writememh("F:\/dev\/mips_05\/mem_files\/test_data.memh", dataMem);
	end

	// write to data memory
	always @(posedge clk) begin
		if(memWrite)
			dataMem[dataAddress] <= writeMemData;
	end

	// read from data memory
	always @(memRead or readMemData or dataAddress) begin
		if (memRead)
			readMemData = dataMem[dataAddress];
		else
			readMemData = 'z;
	end
endmodule
