// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Tue Feb 18 21:13:39 2020
// Host        : ABBA-NI running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               E:/GIT/DT5550W-CITIROC/DT5550W-Citiroc4Asic/output/NEWCitirocDesignforDT0WReadoutsoftware/NEWCitirocDesignforDT0WReadoutsoftware.srcs/sources_1/ip/FTDI_FIFO_AW/FTDI_FIFO_AW_stub.v
// Design      : FTDI_FIFO_AW
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k160tffg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_1,Vivado 2017.4" *)
module FTDI_FIFO_AW(rst, wr_clk, rd_clk, din, wr_en, rd_en, dout, full, 
  empty, valid, prog_full, prog_empty)
/* synthesis syn_black_box black_box_pad_pin="rst,wr_clk,rd_clk,din[65:0],wr_en,rd_en,dout[65:0],full,empty,valid,prog_full,prog_empty" */;
  input rst;
  input wr_clk;
  input rd_clk;
  input [65:0]din;
  input wr_en;
  input rd_en;
  output [65:0]dout;
  output full;
  output empty;
  output valid;
  output prog_full;
  output prog_empty;
endmodule
