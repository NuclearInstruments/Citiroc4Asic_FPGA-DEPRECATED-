// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Wed Jun 19 13:25:24 2019
// Host        : ABBA-NI running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/OpenHardware/UserProject/DT5550W-Citiroc4Asic/output/DT5550W-Citiroc4Asic/DT5550W-Citiroc4Asic.srcs/sources_1/ip/DTClockGenerator/DTClockGenerator_stub.v
// Design      : DTClockGenerator
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k160tffg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module DTClockGenerator(clk_out1, clk_out2, clk_out3, clk_out4, clk_out5, 
  locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_out1,clk_out2,clk_out3,clk_out4,clk_out5,locked,clk_in1" */;
  output clk_out1;
  output clk_out2;
  output clk_out3;
  output clk_out4;
  output clk_out5;
  output locked;
  input clk_in1;
endmodule
