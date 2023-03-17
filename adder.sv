`timescale 1ns / 1ps

module adder #(parameter BITS)
(
  input clk,
  input rstn,
  input reg [31:0] counter,
  input reg signed [BITS+16:0] value_in,
  output reg signed [BITS+24:0] value_out);
  
  always @ (value_in) begin
  $display("counter_add:%d sum_out:%d", counter, value_out);
    if (! rstn)
      value_out <= 0;
    else
      value_out <= value_out+value_in;
  end
  
endmodule