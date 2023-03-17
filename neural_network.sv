`timescale 1ns / 1ps


module neural_network #(parameter LAYER1_NEURON_WIDTH = 32'd823,
                                  LAYER1_COUNTER_END = 32'h00000334,
                                  LAYER1_BITS = 31,
                                  LAYER2_NEURON_WIDTH = 32'd49,
                                  LAYER2_COUNTER_END = 32'h00000028,
                                  LAYER2_BITS = LAYER1_BITS + 8
                                  )
(
    //clock and reset for counter
    input clk,
    input rstn,
    
    //b-values
    input reg signed [31:0] b1 [0:9],
     input reg signed [63:0] b2 [0:9],
    
    //784 pixel input bitmap
    input reg signed [31:0] data_in [0:LAYER1_NEURON_WIDTH],
    
    //weight values for lines connecting to first layer of neurons
    input reg signed [31:0] w1_1 [0:LAYER1_NEURON_WIDTH],
    input reg signed [31:0] w1_2 [0:LAYER1_NEURON_WIDTH],
    input reg signed [31:0] w1_3 [0:LAYER1_NEURON_WIDTH],
    input reg signed [31:0] w1_4 [0:LAYER1_NEURON_WIDTH],
    input reg signed [31:0] w1_5 [0:LAYER1_NEURON_WIDTH],
    input reg signed [31:0] w1_6 [0:LAYER1_NEURON_WIDTH],
    input reg signed [31:0] w1_7 [0:LAYER1_NEURON_WIDTH],
    input reg signed [31:0] w1_8 [0:LAYER1_NEURON_WIDTH],
    input reg signed [31:0] w1_9 [0:LAYER1_NEURON_WIDTH],
    input reg signed [31:0] w1_10 [0:LAYER1_NEURON_WIDTH],
    
    //weight values for lines connecting to second layer of neurons
    input reg signed [31:0] w2_1 [0:LAYER2_NEURON_WIDTH],
    input reg signed [31:0] w2_2 [0:LAYER2_NEURON_WIDTH],
    input reg signed [31:0] w2_3 [0:LAYER2_NEURON_WIDTH],
    input reg signed [31:0] w2_4 [0:LAYER2_NEURON_WIDTH],
    input reg signed [31:0] w2_5 [0:LAYER2_NEURON_WIDTH],
    input reg signed [31:0] w2_6 [0:LAYER2_NEURON_WIDTH],
    input reg signed [31:0] w2_7 [0:LAYER2_NEURON_WIDTH],
    input reg signed [31:0] w2_8 [0:LAYER2_NEURON_WIDTH],
    input reg signed [31:0] w2_9 [0:LAYER2_NEURON_WIDTH],
    input reg signed [31:0] w2_10 [0:LAYER2_NEURON_WIDTH],
    
    //neural network output
    output signed [LAYER2_BITS + 8:0] neuralnet_out [0:9]

    );
    
    wire signed [LAYER1_BITS + 8:0] bus_layer1_out [0:LAYER2_NEURON_WIDTH];
    wire bus_counter_layer1_donestatus;
    
    assign bus_layer1_out[0] = 40'h00000000;
    assign bus_layer1_out[1] = 40'h00000000;
    assign bus_layer1_out[2] = 40'h00000000;
    assign bus_layer1_out[3] = 40'h00000000;
    assign bus_layer1_out[4] = 40'h00000000;
    assign bus_layer1_out[5] = 40'h00000000;
    assign bus_layer1_out[6] = 40'h00000000;
    assign bus_layer1_out[7] = 40'h00000000;
    assign bus_layer1_out[8] = 40'h00000000;
    assign bus_layer1_out[9] = 40'h00000000;
    assign bus_layer1_out[10] = 40'h00000000;
    assign bus_layer1_out[11] = 40'h00000000;
    assign bus_layer1_out[12] = 40'h00000000;
    assign bus_layer1_out[13] = 40'h00000000;
    assign bus_layer1_out[14] = 40'h00000000;
    assign bus_layer1_out[15] = 40'h00000000;
    assign bus_layer1_out[16] = 40'h00000000;
    assign bus_layer1_out[17] = 40'h00000000;
    assign bus_layer1_out[18]= 40'h00000000;
    assign bus_layer1_out[19] = 40'h00000000;
    assign bus_layer1_out[30] = 40'h00000000;
    assign bus_layer1_out[31] = 40'h00000000;
    assign bus_layer1_out[32] = 40'h00000000;
    assign bus_layer1_out[33] = 40'h00000000;
    assign bus_layer1_out[34] = 40'h00000000;
    assign bus_layer1_out[35] = 40'h00000000;
    assign bus_layer1_out[36] = 40'h00000000;
    assign bus_layer1_out[37] = 40'h00000000;
    assign bus_layer1_out[38] = 40'h00000000;
    assign bus_layer1_out[39] = 40'h00000000;
    assign bus_layer1_out[40] = 40'h00000000;
    assign bus_layer1_out[41] = 40'h00000000;
    assign bus_layer1_out[42] = 40'h00000000;
    assign bus_layer1_out[43] = 40'h00000000;
    assign bus_layer1_out[44] = 40'h00000000;
    assign bus_layer1_out[45] = 40'h00000000;
    assign bus_layer1_out[46] = 40'h00000000;
    assign bus_layer1_out[47] = 40'h00000000;
    assign bus_layer1_out[48] = 40'h00000000;
    assign bus_layer1_out[49] = 40'h00000000;
    
    
    /*
    always @(clk) begin
        $display("%h", bus_layer1_out[29]);
        end
    */
    
    layer #( .LAYER_NEURON_WIDTH(LAYER1_NEURON_WIDTH), 
             .LAYER_COUNTER_END(LAYER1_COUNTER_END),
             .LAYER_BITS(LAYER1_BITS),
             .B_BITS(31)) layer1(
        .b (b1),
        .w1 (w1_1),
        .w2 (w1_2),
        .w3 (w1_3),
        .w4 (w1_4),
        .w5 (w1_5),
        .w6 (w1_6),
        .w7 (w1_7),
        .w8 (w1_8),
        .w9 (w1_9),
        .w10 (w1_10),
        .data_in (data_in),
        .data_out (bus_layer1_out[20:29]), //bus_layer1_out[20:29]
        .clk (clk),
        .rstn (rstn),
        .counter_donestatus (bus_counter_layer1_donestatus),
        .activation_function(1'b1)
    );
    
    layer #( .LAYER_NEURON_WIDTH(LAYER2_NEURON_WIDTH), 
             .LAYER_COUNTER_END(LAYER2_COUNTER_END),
             .LAYER_BITS(LAYER2_BITS),
             .B_BITS(63)
             )//change counter width
        layer2(
        .b (b2),
        .w1 (w2_1),
        .w2 (w2_2),
        .w3 (w2_3),
        .w4 (w2_4),
        .w5 (w2_5),
        .w6 (w2_6),
        .w7 (w2_7),
        .w8 (w2_8),
        .w9 (w2_9),
        .w10 (w2_10),
        .data_in (bus_layer1_out),
        .data_out (neuralnet_out),
        .clk (clk),
        .rstn (bus_counter_layer1_donestatus), //done status of counter 1 triggers counter 2 to start
        .counter_donestatus (),
        .activation_function(1'b0)
    );
    
    
     
endmodule
