`ifndef PARAMETER_H_
`define PARAMETER_H_
//parameters to make design readable and changeable

`define width 32 //32 bit wide design

//our memory is word addressable
`define depthMem 8 //depth of instruction memory and data memory
`define logDepthMem 3  //width of address of memory locations

//we have 32 32bit registers in our register file but have declared the width to match with rest of design
`define depthReg 32  //# of registers
`define logDepthReg 5  //# of registers

`define simulation_time #500
`endif
