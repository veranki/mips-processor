`timescale 1ns/1ps
`include "param.sv"

module reg_file_tb(
);

	logic clk;
	logic rst;
	logic regWrite;
	logic [`logDepthReg-1:0] writeRegAdd,readRegAdd1,readRegAdd2;
	logic [`width-1:0] writeRegData,readRegData1,readRegData2;

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

	initial
	begin
		clk = 1;
		rst = 1;
		#30 rst = 0;
		forever #10 clk = !clk;
	end

	initial
	begin
		regWrite = 1;
		@(negedge clk)
		writeRegAdd = 0;
		writeRegData = 555;
		@ (negedge clk)
		readRegAdd1 = 0;
		@(negedge clk)
		writeRegAdd = 1;
		writeRegData = 111;
		@ (negedge clk)
		readRegAdd1 = 0;
		readRegAdd2 = 1;
		writeRegAdd = 3;
		writeRegData = 333;
		@ (negedge clk)
		readRegAdd1 = 3;
		readRegAdd2 = 3;
		@ (negedge clk)
		writeRegAdd = 7;
		writeRegData = 777;
		readRegAdd1 = 7;
		@ (negedge clk)
		writeRegAdd = 9;
		writeRegData = 999;
		readRegAdd2 = 9;
	end
endmodule
