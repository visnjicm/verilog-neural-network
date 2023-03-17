`timescale 1ns / 1ps

module layer2(
    input reg signed [15:0] b2 [0:9],
    input reg signed [15:0] w2_1 [0:9],
    input reg signed [15:0] w2_2 [0:9],
    input reg signed [15:0] w2_3 [0:9],
    input reg signed [15:0] w2_4 [0:9],
    input reg signed [15:0] w2_5 [0:9],
    input reg signed [15:0] w2_6 [0:9],
    input reg signed [15:0] w2_7 [0:9],
    input reg signed [15:0] w2_8 [0:9],
    input reg signed [15:0] w2_9 [0:9],
    input reg signed [15:0] w2_10 [0:9],
    input reg signed [31:0] data_in [0:9], 
    input clk,
    input rstn,
    output signed [31:0] data_out [0:9],
    output counter_donestatus
);

    wire [15:0] bus_counter;

    neuron_layer2 neuron1(
        .weights (w2_1),
        .data_in (data_in),
        .b2 (b2[0]),
        .clk (clk),
        .rstn (rstn),
        .data_out (data_out[0])
    );
    
    neuron_layer2 neuron2(
        .weights (w2_2),
        .data_in (data_in),
        .b2 (b2[1]),
        .clk (clk),
        .rstn (rstn),
        .data_out (data_out[1])
    );
    
    neuron_layer2 neuron3(
        .weights (w2_3),
        .data_in (data_in),
        .b2 (b2[2]),
        .clk (clk),
        .rstn (rstn),
        .data_out (data_out[2])
    );
    
    neuron_layer2 neuron4(
        .weights (w2_4),
        .data_in (data_in),
        .b2 (b2[3]),
        .clk (clk),
        .rstn (rstn),
        .data_out (data_out[3])
    );
    
    neuron_layer2 neuron5(
        .weights (w2_5),
        .data_in (data_in),
        .b2 (b2[4]),
        .clk (clk),
        .rstn (rstn),
        .data_out (data_out[4])
    );
    
    neuron_layer2 neuron6(
        .weights (w2_6),
        .data_in (data_in),
        .b2 (b2[5]),
        .clk (clk),
        .rstn (rstn),
        .data_out (data_out[5])
    );
    
    neuron_layer2 neuron7(
        .weights (w2_7),
        .data_in (data_in),
        .b2 (b2[6]),
        .clk (clk),
        .rstn (rstn),
        .data_out (data_out[6])
    );
    
    neuron_layer2 neuron8(
        .weights (w2_8),
        .data_in (data_in),
        .b2 (b2[7]),
        .clk (clk),
        .rstn (rstn),
        .data_out (data_out[7])
    );
    
    neuron_layer2 neuron9(
        .weights (w2_9),
        .data_in (data_in),
        .b2 (b2[8]),
        .clk (clk),
        .rstn (rstn),
        .data_out (data_out[8])
    );
    
    neuron_layer2 neuron10(
        .weights (w2_10),
        .data_in (data_in),
        .b2 (b2[9]),
        .clk (clk),
        .rstn (rstn),
        .data_out (data_out[9])
    );
    
    counter #( .END_COUNTER(16'h334)) counter(
    .clk (clk),
    .rstn (rstn),
    .counter_out (bus_counter),
    .counter_donestatus (counter_donestatus)
  );

endmodule