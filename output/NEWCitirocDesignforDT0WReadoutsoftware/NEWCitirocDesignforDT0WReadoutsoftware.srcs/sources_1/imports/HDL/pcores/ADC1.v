
// file: ADC_DESER_selectio_wiz.v
// (c) Copyright 2009 - 2013 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//----------------------------------------------------------------------------
// User entered comments
//----------------------------------------------------------------------------
// None
//----------------------------------------------------------------------------

`timescale 1ps/1ps

module ADC_REC_1
   // width of the data for the system
 #(
   parameter SYS_W = 9,
   // width of the data for the device
   parameter DEV_W = 126)
 (
  // From the system into the device
  input  [SYS_W-1:0] data_in_from_pins_p,
  input  [SYS_W-1:0] data_in_from_pins_n,
  output [DEV_W-1:0] data_in_to_device,
  input              in_delay_reset,                       // Active high synchronous reset for input delay
  input  [SYS_W -1 :0]           in_delay_data_ce,                     // Enable signal for delay
  input  [SYS_W -1 :0]           in_delay_data_inc,                    // Delay increment (high), decrement (low) signal
  input  [5*SYS_W -1:0]       in_delay_tap_in,  // Dynamically loadable delay tap value for input delay
  output [5*SYS_W -1:0]       in_delay_tap_out, // Delay tap value for monitoring input delay
 
  output             delay_locked,   // Locked signal from IDELAYCTRL
  input              ref_clock,      // Reference clock for IDELAYCTRL. Has to come from BUFG.
  input  [SYS_W-1:0]             bitslip,       // Bitslip module is enabled in NETWORKING mode
                                    // User should tie it to '0' if not needed
  input              clk_in_int,      // Differential clock from IOB
  output             clk_div_out,   // Slow clock output
  input              clk_reset,
  input              io_reset);
  localparam         num_serial_bits = DEV_W/SYS_W;
  wire clock_enable = 1'b1;
  // Signal declarations
  ////------------------------------
  // After the buffer
  wire   [SYS_W-1:0] data_in_from_pins_int;
  // Between the delay and serdes
  wire [SYS_W-1:0]  data_in_from_pins_delay;
  wire [SYS_W-1:0] in_delay_ce;
  wire [SYS_W-1:0] in_delay_inc_dec;
  wire [4:0]  in_delay_tap_in_int[0:SYS_W - 1];   // fills in starting with 0
  wire [4:0]  in_delay_tap_out_int[0:SYS_W - 1];   // fills in starting with 0
  wire ref_clock_bufg;
  // Array to use intermediately from the serdes to the internal
  //  devices. bus "0" is the leftmost bus
  wire [SYS_W-1:0]  iserdes_q[0:13];   // fills in starting with 0
   assign in_delay_ce = {
                     in_delay_data_ce[16],
                     in_delay_data_ce[15],
                     in_delay_data_ce[14],
                     in_delay_data_ce[13],
                     in_delay_data_ce[12],
                     in_delay_data_ce[11],  
                     in_delay_data_ce[10],
                     in_delay_data_ce[9], 
                     in_delay_data_ce[8],
                     in_delay_data_ce[7],
                     in_delay_data_ce[6],
                     in_delay_data_ce[5],
                     in_delay_data_ce[4],
                     in_delay_data_ce[3],
                     in_delay_data_ce[2],
                     in_delay_data_ce[1],
                     in_delay_data_ce[0]};
   assign in_delay_inc_dec = {
                     in_delay_data_inc[16],
                     in_delay_data_inc[15],
                     in_delay_data_inc[14],
                     in_delay_data_inc[13],
                     in_delay_data_inc[12],
                     in_delay_data_inc[11],
                     in_delay_data_inc[10],
                     in_delay_data_inc[9], 
                     in_delay_data_inc[8],
                     in_delay_data_inc[7],
                     in_delay_data_inc[6],
                     in_delay_data_inc[5],
                     in_delay_data_inc[4],
                     in_delay_data_inc[3],
                     in_delay_data_inc[2],
                     in_delay_data_inc[1],
                     in_delay_data_inc[0]};
   assign in_delay_tap_in_int[0] = in_delay_tap_in[5*(0 + 1) -1:5*(0)] ;
   assign in_delay_tap_in_int[1] = in_delay_tap_in[5*(1 + 1) -1:5*(1)] ;
   assign in_delay_tap_in_int[2] = in_delay_tap_in[5*(2 + 1) -1:5*(2)] ;
   assign in_delay_tap_in_int[3] = in_delay_tap_in[5*(3 + 1) -1:5*(3)] ;
   assign in_delay_tap_in_int[4] = in_delay_tap_in[5*(4 + 1) -1:5*(4)] ;
   assign in_delay_tap_in_int[5] = in_delay_tap_in[5*(5 + 1) -1:5*(5)] ;
   assign in_delay_tap_in_int[6] = in_delay_tap_in[5*(6 + 1) -1:5*(6)] ;
   assign in_delay_tap_in_int[7] = in_delay_tap_in[5*(7 + 1) -1:5*(7)] ;
   assign in_delay_tap_in_int[8] = in_delay_tap_in[5*(8 + 1) -1:5*(8)] ;
   assign in_delay_tap_in_int[9] = in_delay_tap_in[5*(9 + 1) -1:5*(9)] ;
   assign in_delay_tap_in_int[10] = in_delay_tap_in[5*(10 + 1) -1:5*(10)] ;
   assign in_delay_tap_in_int[11] = in_delay_tap_in[5*(11 + 1) -1:5*(11)] ;
   assign in_delay_tap_in_int[12] = in_delay_tap_in[5*(12 + 1) -1:5*(12)] ;
   assign in_delay_tap_in_int[13] = in_delay_tap_in[5*(13 + 1) -1:5*(13)] ;
   assign in_delay_tap_in_int[14] = in_delay_tap_in[5*(14 + 1) -1:5*(14)] ;
   assign in_delay_tap_in_int[15] = in_delay_tap_in[5*(15 + 1) -1:5*(15)] ;
   assign in_delay_tap_in_int[16] = in_delay_tap_in[5*(16 + 1) -1:5*(16)] ;
   
   assign in_delay_tap_out[5*(0 + 1) -1:5*(0)] = in_delay_tap_out_int[0];
   assign in_delay_tap_out[5*(1 + 1) -1:5*(1)] = in_delay_tap_out_int[1];
   assign in_delay_tap_out[5*(2 + 1) -1:5*(2)] = in_delay_tap_out_int[2];
   assign in_delay_tap_out[5*(3 + 1) -1:5*(3)] = in_delay_tap_out_int[3];
   assign in_delay_tap_out[5*(4 + 1) -1:5*(4)] = in_delay_tap_out_int[4];
   assign in_delay_tap_out[5*(5 + 1) -1:5*(5)] = in_delay_tap_out_int[5];
   assign in_delay_tap_out[5*(6 + 1) -1:5*(6)] = in_delay_tap_out_int[6];
   assign in_delay_tap_out[5*(7 + 1) -1:5*(7)] = in_delay_tap_out_int[7];
   assign in_delay_tap_out[5*(8 + 1) -1:5*(8)] = in_delay_tap_out_int[8];
   assign in_delay_tap_out[5*(9 + 1) -1:5*(9)] = in_delay_tap_out_int[9];
   assign in_delay_tap_out[5*(10 + 1) -1:5*(10)] = in_delay_tap_out_int[10];
   assign in_delay_tap_out[5*(11 + 1) -1:5*(11)] = in_delay_tap_out_int[11];
   assign in_delay_tap_out[5*(12 + 1) -1:5*(12)] = in_delay_tap_out_int[12];
   assign in_delay_tap_out[5*(13 + 1) -1:5*(13)] = in_delay_tap_out_int[13];
   assign in_delay_tap_out[5*(14 + 1) -1:5*(14)] = in_delay_tap_out_int[14];
   assign in_delay_tap_out[5*(15 + 1) -1:5*(15)] = in_delay_tap_out_int[15];
   assign in_delay_tap_out[5*(16 + 1) -1:5*(16)] = in_delay_tap_out_int[16];
   
   
  // Create the clock logic

//  IBUFDS
//    #(.IOSTANDARD ("LVDS_25"))
//   ibufds_clk_inst
//     (.I          (clk_in_p),
//      .IB         (clk_in_n),
//      .O          (clk_in_int));

  // delay the input clock
      (* IODELAY_GROUP = "TIME_GROUP_ADC_1" *)
      IDELAYE2
         # (
            .CINVCTRL_SEL           ("FALSE"),            // TRUE, FALSE
            .DELAY_SRC              ("IDATAIN"),        // IDATAIN, DATAIN
            .HIGH_PERFORMANCE_MODE  ("FALSE"),             // TRUE, FALSE
            .IDELAY_TYPE            ("FIXED"),          // FIXED, VARIABLE, or VAR_LOADABLE
            .IDELAY_VALUE           (0),                // 0 to 31
            .REFCLK_FREQUENCY       (200.0),
            .PIPE_SEL               ("FALSE"),
            .SIGNAL_PATTERN         ("CLOCK"))           // CLOCK, DATA
         idelaye2_clk
           (
            .DATAOUT                (clk_in_int_delay),  // Delayed clock
            .DATAIN                 (1'b0),              // Data from FPGA logic
            .C                      (1'b0),
            .CE                     (1'b0),
            .INC                    (1'b0),
            .IDATAIN                (clk_in_int),
            .LD                     (io_reset),
            .LDPIPEEN               (1'b0),
            .REGRST                 (1'b0),
            .CNTVALUEIN             (5'b00000),
            .CNTVALUEOUT            (),
            .CINVCTRL               (1'b0)
         );
         
//  assign clk_in_int_delay = clk_in_int;

// High Speed BUFIO clock buffer
 BUFIO bufio_inst
   (.O(clk_in_int_buf),
    .I(clk_in_int_delay));

  
   // BUFR generates the slow clock
   BUFR
    #(.SIM_DEVICE("7SERIES"),
    .BUFR_DIVIDE("7"))
    clkout_buf_inst
    (.O (clk_div),
     .CE(1'b1),
     .CLR(clk_reset),
     .I (clk_in_int_delay));

   assign clk_div_out = clk_div; // This is regional clock

  // We have multiple bits- step over every bit, instantiating the required elements
  genvar pin_count;
  genvar slice_count;
  generate for (pin_count = 0; pin_count < SYS_W; pin_count = pin_count + 1) begin: pins
    // Instantiate the buffers
    ////------------------------------
    // Instantiate a buffer for every bit of the data bus
    IBUFDS
      #(.DIFF_TERM  ("TRUE"),             // Differential termination
        .IOSTANDARD ("LVDS_25"))
     ibufds_inst
       (.I          (data_in_from_pins_p  [pin_count]),
        .IB         (data_in_from_pins_n  [pin_count]),
        .O          (data_in_from_pins_int[pin_count]));

    // Instantiate the delay primitive
    ////-------------------------------

     (* IODELAY_GROUP = "TIME_GROUP_ADC_1" *)
     IDELAYE2
       # (
         .CINVCTRL_SEL           ("FALSE"),                            // TRUE, FALSE
         .DELAY_SRC              ("IDATAIN"),                          // IDATAIN, DATAIN
         .HIGH_PERFORMANCE_MODE  ("FALSE"),                            // TRUE, FALSE
         .IDELAY_TYPE            ("VAR_LOAD"),              // FIXED, VARIABLE, or VAR_LOADABLE
         .IDELAY_VALUE           (0),                  // 0 to 31
         .REFCLK_FREQUENCY       (200.0),
         .PIPE_SEL               ("FALSE"),
         .SIGNAL_PATTERN         ("DATA"))                             // CLOCK, DATA
       idelaye2_bus
           (
         .DATAOUT                (data_in_from_pins_delay[pin_count]),
         .DATAIN                 (1'b0),                               // Data from FPGA logic
         .C                      (clk_div),
         .CE                     (in_delay_ce[pin_count]), //(in_delay_data_ce),
         .INC                    (in_delay_inc_dec[pin_count]), //in_delay_data_inc),
         .IDATAIN                (data_in_from_pins_int  [pin_count]), // Driven by IOB
         .LD                     (in_delay_reset),
         .REGRST                 (io_reset),
         .LDPIPEEN               (1'b0),
         .CNTVALUEIN             (in_delay_tap_in_int[pin_count]), //in_delay_tap_in),
         .CNTVALUEOUT            (in_delay_tap_out_int[pin_count]), //in_delay_tap_out),
         .CINVCTRL               (1'b0)
         );
    
//    assign data_in_from_pins_delay[pin_count] = data_in_from_pins_int  [pin_count];

     // Instantiate the serdes primitive
     ////------------------------------

     // local wire only for use in this generate loop
     wire cascade_shift;
     wire [SYS_W-1:0] icascade1;
     wire [SYS_W-1:0] icascade2;
     wire clk_in_int_inv;

     assign clk_in_int_inv = ~ (clk_in_int_buf);    

     // declare the iserdes
     ISERDESE2
       # (
         .DATA_RATE         ("DDR"),
         .DATA_WIDTH        (14),
         .INTERFACE_TYPE    ("NETWORKING"), 
         .DYN_CLKDIV_INV_EN ("FALSE"),
         .DYN_CLK_INV_EN    ("FALSE"),
         .NUM_CE            (2),
         .OFB_USED          ("FALSE"),
         .IOBDELAY          ("IFD"),                                // Use input at DDLY to output the data on Q
         .SERDES_MODE       ("MASTER"))
       iserdese2_master (
         .Q1                (iserdes_q[0][pin_count]),
         .Q2                (iserdes_q[1][pin_count]),
         .Q3                (iserdes_q[2][pin_count]),
         .Q4                (iserdes_q[3][pin_count]),
         .Q5                (iserdes_q[4][pin_count]),
         .Q6                (iserdes_q[5][pin_count]),
         .Q7                (iserdes_q[6][pin_count]),
         .Q8                (iserdes_q[7][pin_count]),
         .SHIFTOUT1         (icascade1[pin_count]),                 // Cascade connections to Slave ISERDES
         .SHIFTOUT2         (icascade2[pin_count]),                 // Cascade connections to Slave ISERDES
         .BITSLIP           (bitslip[pin_count]),                             // 1-bit Invoke Bitslip. This can be used with any DATA_WIDTH, cascaded or not.
                                                                   // The amount of BITSLIP is fixed by the DATA_WIDTH selection.
         .CE1               (clock_enable),                        // 1-bit Clock enable input
         .CE2               (clock_enable),                        // 1-bit Clock enable input
         .CLK               (clk_in_int_buf),                      // Fast source synchronous clock driven by BUFIO
         .CLKB              (clk_in_int_inv),                      // Locally inverted fast 
         .CLKDIV            (clk_div),                             // Slow clock from BUFR.
         .CLKDIVP           (1'b0),
         .D                 (1'b0),                                // 1-bit Input signal from IOB
         .DDLY              (data_in_from_pins_delay[pin_count]),  // 1-bit Input from Input Delay component 
         .RST               (io_reset),                            // 1-bit Asynchronous reset only.
         .SHIFTIN1          (1'b0),
         .SHIFTIN2          (1'b0),
    // unused connections
         .DYNCLKDIVSEL      (1'b0),
         .DYNCLKSEL         (1'b0),
         .OFB               (1'b0),
         .OCLK              (1'b0),
         .OCLKB             (1'b0),
         .O                 ());                                   // unregistered output of ISERDESE1

     ISERDESE2
       # (
         .DATA_RATE         ("DDR"),
         .DATA_WIDTH        (14),
         .INTERFACE_TYPE    ("NETWORKING"),
         .DYN_CLKDIV_INV_EN ("FALSE"),
         .DYN_CLK_INV_EN    ("FALSE"),
         .NUM_CE            (2),
         .OFB_USED          ("FALSE"),
         .IOBDELAY          ("IFD"),                // Use input at DDLY to output the data on Q
         .SERDES_MODE       ("SLAVE"))
       iserdese2_slave (
         .Q1                (),
         .Q2                (),
         .Q3                (iserdes_q[8][pin_count]),
         .Q4                (iserdes_q[9][pin_count]),
         .Q5                (iserdes_q[10][pin_count]),
         .Q6                (iserdes_q[11][pin_count]),
         .Q7                (iserdes_q[12][pin_count]),
         .Q8                (iserdes_q[13][pin_count]),
         .SHIFTOUT1         (),
         .SHIFTOUT2         (),
         .SHIFTIN1          (icascade1[pin_count]),  // Cascade connection with Master ISERDES
         .SHIFTIN2          (icascade2[pin_count]),  // Cascade connection with Master ISERDES
         .BITSLIP           (bitslip[pin_count]),               // 1-bit Invoke Bitslip. This can be used with any DATA_WIDTH, cascaded or not.
                                                     // The amount of BITSLIP is fixed by the DATA_WIDTH selection .
         .CE1               (clock_enable),          // 1-bit Clock enable input
         .CE2               (clock_enable),          // 1-bit Clock enable input 
         .CLK               (clk_in_int_buf),        // Fast source synchronous serdes clock
         .CLKB              (clk_in_int_inv),        // Locally inverted fast clock
         .CLKDIV            (clk_div),               // Slow clock from BUFR.
         .CLKDIVP           (1'b0),
         .D                 (1'b0),                  // Slave ISERDES. No need to connect D, DDLY
         .DDLY              (1'b0),
         .RST               (io_reset),              // 1-bit Asynchronous reset only.
   // unused connections
         .DYNCLKDIVSEL      (1'b0),
         .DYNCLKSEL         (1'b0),
         .OFB               (1'b0),
         .OCLK              (1'b0),
         .OCLKB             (1'b0),
         .O                 ());                     // unregistered output of ISERDESE1
     // Concatenate the serdes outputs together. Keep the timesliced
     //   bits together, and placing the earliest bits on the right
     //   ie, if data comes in 0, 1, 2, 3, 4, 5, 6, 7, ...
     //       the output will be 3210, 7654, ...
     ////---------------------------------------------------------
     for (slice_count = 0; slice_count < num_serial_bits; slice_count = slice_count + 1) begin: in_slices
        // This places the first data in time on the right
        assign data_in_to_device[slice_count*SYS_W+:SYS_W] =
          iserdes_q[num_serial_bits-slice_count-1];
        // To place the first data in time on the left, use the
        //   following code, instead
        // assign data_in_to_device[slice_count*SYS_W+:SYS_W] =
        //   iserdes_q[slice_count];
     end
  end
  endgenerate

// IDELAYCTRL is needed for calibration
(* IODELAY_GROUP = "TIME_GROUP_ADC_1" *)
  IDELAYCTRL
    delayctrl (
     .RDY    (delay_locked),
     .REFCLK (ref_clock),
     .RST    (io_reset));

//  BUFG
//    ref_clk_bufg (
//     .I (ref_clock),
//     .O (ref_clock_bufg));
endmodule
