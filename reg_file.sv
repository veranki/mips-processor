`include "param.sv"
`timescale 1ns/1ps
import def::*;
module reg_file(
	input logic rst,
	input logic clk,
	input regAddr readRegAdd1,
	input regAddr readRegAdd2,
	input regAddr writeRegAdd,
	input logic [`width-1:0] writeRegData,
	input logic regWrite,
	output logic [`width-1:0] readRegData1,
	output logic [`width-1:0] readRegData2
);
	// our registers have two read and one write port because R-type instructions have three register operands(#2 source and #1 destination)
	// declare only 8  32bit registers in our register file
	logic [`width-1:0] registerArray [`depthReg-1:0];
	integer index;
	always @(posedge clk or posedge rst) begin
		if (rst)
			begin
				// initialize register values to reg# at reset
				for (index=0; index < `depthReg; index=index+1) begin
					registerArray[index] <= 32'd0;
				end
			end
		else
			begin
				// write data into registers except reg#0. It needs to be kept zero always
				if (regWrite)
					if (writeRegAdd != 0)
						registerArray[writeRegAdd] <= writeRegData;
			end
	end

	// return 0 when read from #reg0, content of register otherwise
	always @(*) begin
		readRegData1 = registerArray[readRegAdd1];
		readRegData2 = registerArray[readRegAdd2];
	end
endmodule
