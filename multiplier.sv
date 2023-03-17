`timescale 1ns / 1ps

module multiplier #(parameter BITS)
( 
  input clk,
  input rstn,
  input reg [31:0] counter,
  input reg signed [31:0] w,
  input reg signed [BITS:0] x,
  output reg signed [BITS+16:0] mult_result);
  
  always @ (counter) begin
    //$display("counter_mult:%d and weight_mult:%d and x_mult:%d and mult_result:%d", counter, w, x, mult_result);
    if (! rstn)
      mult_result <= 0;
    else
      mult_result <= w*x;
  end
endmodule