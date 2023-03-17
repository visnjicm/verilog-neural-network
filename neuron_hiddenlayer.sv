`timescale 1ns / 1ps


module neuron_layer2(
  input reg signed [15:0] weights [0:9],
  input reg signed [15:0] data_in [0:823],
  input reg signed [15:0] b2,
  input clk,
  input rstn,
  output reg signed [31:0] data_out);
  
  wire [15:0] bus_counter;
  wire signed [15:0] bus_w;
  wire signed [15:0] bus_x;
  wire signed [31:0] bus_mult_result;
  wire signed [31:0] bus_adder;
  
  register RG_W(
    .data (data_w),
    .index (bus_counter),
    .value (bus_w)
  );
  
  register RG_X(
    .data (data_x),
    .index (bus_counter),
    .value (bus_x)
  );
  
  multiplier MP1(
    .clk (clk),
    .rstn (rstn),
    .w (bus_w),
    .x (bus_x),
    .mult_result (bus_mult_result)
  );
  
  adder AD1(
    .clk (clk),
    .rstn (rstn),
    .value_in (bus_mult_result),
    .value_out (bus_adder));
  
  ReLu activation_and_add_b(
    .clk (clk),
    .mult_sum_in (bus_adder),
    .b (b),
    .neuron_out (neuron_out)
  );
    
    
  
endmodule
