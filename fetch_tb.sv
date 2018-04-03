`include "param.sv"
`timescale 1ns/1ps
module fetch_tb(
);
	//
	logic clk;
	logic rst;
	logic branch;
	logic zero;
	logic [`width-1:0] instr;
	logic [`width-1:0] pc;
	logic [`width-1:0] branchTargetAddr;

	//
	fetch fetch_instance (
		.rst(rst),
		.clk(clk),
		.branch(branch),
		.zero(zero),
		.branchTargetAddr(branchTargetAddr),
		.instr(instr),
		.pc(pc)
	);

	//
	initial begin
		clk = 1;
		rst = 1;
		#30 rst = 0;
		zero = 0;
		branch = 0;
		forever #10 clk = !clk;
	end
endmodule
