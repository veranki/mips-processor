`include "param.sv"
`timescale 1ns/1ps
import def::*;
module execute_tb(
);
	//
	logic clk;
	logic rst;

	//
	initial begin
		clk = 1;
		rst = 1;
		#30 rst = 0;
		forever #10 clk = !clk;
	end
endmodule