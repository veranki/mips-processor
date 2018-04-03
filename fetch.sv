`include "param.sv"
`timescale 1ns/1ps
import def::*;
module fetch(
	input logic rst,
	input logic clk,
	input logic branch,
	input logic zero,
	input logic [`width-1:0] branchTargetAddr,
	output instrType instr,
	output logic [`width-1:0] pcNext
);
	// instantiate instruction memory and connect to it
	i_mem i_mem_instance (
		.rst(rst),
		.clk(clk),
		.instrAddress(pcNext[2:0]),
		.instr(instr)
	);

	// increment pc by 1 and send it to instruction memory
	always @(posedge clk or posedge rst) begin
		if (rst)
			pcNext <= 0;
		else if ((branch==1) && (zero==1)) begin
			pcNext <= branchTargetAddr;
		end
		else
			pcNext <= pcNext + 1;
	end
endmodule
