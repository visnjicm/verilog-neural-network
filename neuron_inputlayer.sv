`timescale 1ns / 1ps


module neuron #(parameter NEURON_WIDTH, NEURON_BITS, COUNTER_END, B_BITS)
(
  input clk,
  input rstn,
  input activation_function,
  input reg signed [31:0] weights [0:NEURON_WIDTH],
  input reg signed [NEURON_BITS:0] data_in [0:NEURON_WIDTH],
  input reg signed [B_BITS:0] b,
  input reg [31:0] counter,
  output reg signed [NEURON_BITS + 8:0] data_out
  );
  
  wire signed [31:0] bus_w;
  wire signed [NEURON_BITS:0] bus_data;
  wire signed [NEURON_BITS+16:0] bus_mult_result;
  wire signed [NEURON_BITS+24:0] bus_adder;
  wire enable_second_layer;
  
  register #( .WIDTH(NEURON_WIDTH), .BITS(31)) RG_W(
    .data (weights),
    .counter (counter),
    .value (bus_w)
  );
  
  register #( .WIDTH(NEURON_WIDTH), .BITS(NEURON_BITS)) RG_X(
    .data (data_in),
    .counter (counter),
    .value (bus_data)
  );
  
  multiplier #(.BITS(NEURON_BITS)) MP1
  (
    .clk (clk),
    .rstn (rstn),
    .counter (counter),
    .w (bus_w),
    .x (bus_data),
    .mult_result (bus_mult_result)
  );
  
  adder #(.BITS(NEURON_BITS)) AD1(
    .clk (clk),
    .rstn (rstn),
    .counter (counter),
    .value_in (bus_mult_result),
    .value_out (bus_adder));
  
  ReLu #(.BITS(NEURON_BITS), .COUNTER_END(COUNTER_END), .B_BITS(B_BITS)) activation_and_add_b(
    .clk (clk),
    .mult_sum_in (bus_adder),
    .counter (counter),
    .activation_function(activation_function),
    .b (b),
    .neuron_out (data_out)
  );
    
    
  
endmodule