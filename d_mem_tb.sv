`include "param.sv"
`timescale 1ns/1ps
module d_mem_tb(
);
	logic clk;
	logic rst;
	logic [`width-1:0] writeMemData;
	logic [`width-1:0] readMemData;
	logic [`logDepthMem-1:0] dataAddress;
	logic memRead;
	logic memWrite;

	d_mem d_mem_instance (
		.rst(rst),
		.clk(clk),
		.dataAddress(dataAddress),
		.writeMemData(writeMemData),
		.memRead(memRead),
		.memWrite(memWrite),
		.readMemData(readMemData)
	);

	initial begin
		#10 clk = 1;
		forever #10 clk = !clk;
	end

	initial begin
		rst = 1;
		#20 rst = 0;
		memWrite = 1;
		memRead = 0;
		@(negedge clk)
		dataAddress = $random;
		writeMemData = $random;
		@(negedge clk)
		memWrite = 0;
		memRead = 1;
		dataAddress = $random;
		@(negedge clk)
		dataAddress = $random;
		writeMemData = $random;
	end
endmodule
