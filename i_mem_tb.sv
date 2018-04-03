`include "param.sv"
`timescale 1ns/1ps
module i_mem_tb(
);
	logic clk;
	logic rst;
	logic [`width-1:0] instr;
	logic [`logDepthMem-1:0] instrAddress;

	i_mem i_mem_instance (
		.rst(rst),
		.clk(clk),
		.instrAddress(instrAddress),
		.instr(instr)
	);

	initial begin
		#10 clk = 1;
		forever #10 clk = !clk;
	end

	initial begin
		rst = 1;
		#20 rst = 0;
		forever @(negedge clk) instrAddress = $random;
	end
endmodule
