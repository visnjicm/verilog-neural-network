`timescale 1ns / 1ps

module layer #(parameter LAYER_NEURON_WIDTH, LAYER_COUNTER_END, LAYER_BITS, B_BITS)
(
  input reg signed [B_BITS:0] b [0:9],
  input reg signed [LAYER_BITS:0] data_in [0:LAYER_NEURON_WIDTH],
  input reg signed [31:0] w1 [0:LAYER_NEURON_WIDTH],
  input reg signed [31:0] w2 [0:LAYER_NEURON_WIDTH],
  input reg signed [31:0] w3 [0:LAYER_NEURON_WIDTH],
  input reg signed [31:0] w4 [0:LAYER_NEURON_WIDTH],
  input reg signed [31:0] w5 [0:LAYER_NEURON_WIDTH],
  input reg signed [31:0] w6 [0:LAYER_NEURON_WIDTH],
  input reg signed [31:0] w7 [0:LAYER_NEURON_WIDTH],
  input reg signed [31:0] w8 [0:LAYER_NEURON_WIDTH],
  input reg signed [31:0] w9 [0:LAYER_NEURON_WIDTH],
  input reg signed [31:0] w10 [0:LAYER_NEURON_WIDTH],
  input clk,
  input rstn,
  input activation_function,
  output signed [LAYER_BITS + 8:0] data_out [0:9],
  output counter_donestatus
);

/*
always @(data_out[0]) begin
    $display("data_out0:%h", data_out[0]);
end
*/
    wire [31:0] bus_counter;
  
  neuron #( .NEURON_WIDTH(LAYER_NEURON_WIDTH), .NEURON_BITS(LAYER_BITS),
  .COUNTER_END(LAYER_COUNTER_END), .B_BITS(B_BITS)) neuron1(
    .weights (w1),
    .data_in (data_in),
    .b (b[0]),
    .clk (clk),
    .rstn (rstn),
    .data_out (data_out[0]),
    .counter (bus_counter),
    .activation_function (activation_function)
  );
  
    neuron #( .NEURON_WIDTH(LAYER_NEURON_WIDTH), .NEURON_BITS(LAYER_BITS),
    .COUNTER_END(LAYER_COUNTER_END), .B_BITS(B_BITS)) neuron2(
      .weights (w2),
      .data_in (data_in),
      .b (b[1]),
      .clk (clk),
      .rstn (rstn),
      .data_out (data_out[1]),
      .counter (bus_counter),
      .activation_function (activation_function)
  );
  
    neuron #( .NEURON_WIDTH(LAYER_NEURON_WIDTH), .NEURON_BITS(LAYER_BITS),
    .COUNTER_END(LAYER_COUNTER_END), .B_BITS(B_BITS)) neuron3(
      .weights (w3),
      .data_in (data_in),
      .b (b[2]),
      .clk (clk),
      .rstn (rstn),
      .data_out (data_out[2]),
      .counter (bus_counter),
      .activation_function (activation_function)
  );
  
    neuron #( .NEURON_WIDTH(LAYER_NEURON_WIDTH), .NEURON_BITS(LAYER_BITS),
    .COUNTER_END(LAYER_COUNTER_END), .B_BITS(B_BITS)) neuron4(
      .weights (w4),
    .data_in (data_in),
      .b (b[3]),
    .clk (clk),
    .rstn (rstn),
      .data_out (data_out[3]),
      .counter (bus_counter),
      .activation_function (activation_function)
  );
  
    neuron #( .NEURON_WIDTH(LAYER_NEURON_WIDTH), .NEURON_BITS(LAYER_BITS),
    .COUNTER_END(LAYER_COUNTER_END), .B_BITS(B_BITS)) neuron5(
      .weights (w5),
    .data_in (data_in),
      .b (b[4]),
    .clk (clk),
    .rstn (rstn),
      .data_out (data_out[4]),
      .counter (bus_counter),
      .activation_function (activation_function)
  );
  
    neuron #( .NEURON_WIDTH(LAYER_NEURON_WIDTH), .NEURON_BITS(LAYER_BITS),
    .COUNTER_END(LAYER_COUNTER_END), .B_BITS(B_BITS)) neuron6(
      .weights (w6),
    .data_in (data_in),
      .b (b[5]),
    .clk (clk),
    .rstn (rstn),
      .data_out (data_out[5]),
      .counter (bus_counter),
      .activation_function (activation_function)
  );
  
    neuron #( .NEURON_WIDTH(LAYER_NEURON_WIDTH), .NEURON_BITS(LAYER_BITS),
    .COUNTER_END(LAYER_COUNTER_END), .B_BITS(B_BITS)) neuron7(
      .weights (w7),
    .data_in (data_in),
      .b (b[6]),
    .clk (clk),
    .rstn (rstn),
      .data_out (data_out[6]),
      .counter (bus_counter),
      .activation_function (activation_function)
  );
  
    neuron #( .NEURON_WIDTH(LAYER_NEURON_WIDTH), .NEURON_BITS(LAYER_BITS),
    .COUNTER_END(LAYER_COUNTER_END), .B_BITS(B_BITS)) neuron8(
      .weights (w8),
    .data_in (data_in),
      .b (b[7]),
    .clk (clk),
    .rstn (rstn),
      .data_out (data_out[7]),
      .counter (bus_counter),
      .activation_function (activation_function)
  );
  
    neuron #( .NEURON_WIDTH(LAYER_NEURON_WIDTH), .NEURON_BITS(LAYER_BITS),
    .COUNTER_END(LAYER_COUNTER_END), .B_BITS(B_BITS)) neuron9(
      .weights (w9),
    .data_in (data_in),
      .b (b[8]),
    .clk (clk),
    .rstn (rstn),
      .data_out (data_out[8]),
      .counter (bus_counter),
      .activation_function (activation_function)
  );
  
    neuron #( .NEURON_WIDTH(LAYER_NEURON_WIDTH), .NEURON_BITS(LAYER_BITS),
    .COUNTER_END(LAYER_COUNTER_END), .B_BITS(B_BITS)) neuron10(
      .weights (w10),
    .data_in (data_in),
      .b (b[9]),
    .clk (clk),
    .rstn (rstn),
      .data_out (data_out[9]),
      .counter (bus_counter),
      .activation_function (activation_function)
  );
  
  counter #( .END_COUNTER(LAYER_COUNTER_END)) counter(
    .clk (clk),
    .rstn (rstn),
    .counter_out (bus_counter),
    .counter_donestatus (counter_donestatus)
  );
  
  
endmodule