`include "param.sv"
`timescale 1ns/1ps
import def::*;
module i_mem(
		input logic rst,
		input logic clk,
		input logic [`logDepthMem-1:0] instrAddress,
		output instrType instr);

	// define instruction memory
	logic [`width-1:0] instrMem [`depthMem-1:0];
	// load program into instruction memory
	initial
	begin
		$readmemh("F:\/dev\/mips_05\/mem_files\/test_prog.memh",instrMem);
	end
	always @(instrAddress) begin
		instr <= instrMem[instrAddress];
	end
endmodule
