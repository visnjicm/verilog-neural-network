`timescale 1ns / 1ps
module tb_neuralnetwork #(parameter LAYER1_NEURON_WIDTH = 32'd823,
                                    LAYER1_COUNTER_END = 32'h00000334,
                                    LAYER1_BITS = 31,
                                    LAYER2_NEURON_WIDTH = 32'd49,
                                    LAYER2_COUNTER_END = 32'h00000028,
                                    LAYER2_BITS = LAYER1_BITS + 8
                                    )

;
  //weights 1
  reg signed [31:0] w1_1 [0:LAYER1_NEURON_WIDTH];
  reg signed [31:0] w1_2 [0:LAYER1_NEURON_WIDTH];
  reg signed [31:0] w1_3 [0:LAYER1_NEURON_WIDTH];
  reg signed [31:0] w1_4 [0:LAYER1_NEURON_WIDTH];
  reg signed [31:0] w1_5 [0:LAYER1_NEURON_WIDTH];
  reg signed [31:0] w1_6 [0:LAYER1_NEURON_WIDTH];
  reg signed [31:0] w1_7 [0:LAYER1_NEURON_WIDTH];
  reg signed [31:0] w1_8 [0:LAYER1_NEURON_WIDTH];
  reg signed [31:0] w1_9 [0:LAYER1_NEURON_WIDTH];
  reg signed [31:0] w1_10 [0:LAYER1_NEURON_WIDTH];
  
  //image data
  reg signed [31:0] data_in [0:LAYER1_NEURON_WIDTH];
  
  //weights 2
  reg signed [31:0] w2_1 [0:LAYER2_NEURON_WIDTH];
  reg signed [31:0] w2_2 [0:LAYER2_NEURON_WIDTH];
  reg signed [31:0] w2_3 [0:LAYER2_NEURON_WIDTH];
  reg signed [31:0] w2_4 [0:LAYER2_NEURON_WIDTH];
  reg signed [31:0] w2_5 [0:LAYER2_NEURON_WIDTH];
  reg signed [31:0] w2_6 [0:LAYER2_NEURON_WIDTH];
  reg signed [31:0] w2_7 [0:LAYER2_NEURON_WIDTH];
  reg signed [31:0] w2_8 [0:LAYER2_NEURON_WIDTH];
  reg signed [31:0] w2_9 [0:LAYER2_NEURON_WIDTH];
  reg signed [31:0] w2_10 [0:LAYER2_NEURON_WIDTH];
  
  //b-values
  reg signed [31:0] b1 [0:9];
  reg signed [63:0] b2 [0:9];
  
  reg clk;
  reg rstn;
  
  wire signed [LAYER2_BITS+8:0] neuralnet_out [0:9];
  
  neural_network #( .LAYER1_NEURON_WIDTH(LAYER1_NEURON_WIDTH),
                                   .LAYER1_COUNTER_END(LAYER1_COUNTER_END),
                                   .LAYER1_BITS(LAYER1_BITS),
                                   .LAYER2_NEURON_WIDTH(LAYER2_NEURON_WIDTH),
                                   .LAYER2_COUNTER_END(LAYER2_COUNTER_END),
                                   .LAYER2_BITS(LAYER2_BITS)) neural_network 
  (
        .clk (clk),
        .rstn (rstn),
        .b1 (b1),
        .b2 (b2),
        .data_in (data_in),
        .w1_1 (w1_1),
        .w1_2 (w1_2),
        .w1_3 (w1_3),
        .w1_4 (w1_4),
        .w1_5 (w1_5),
        .w1_6 (w1_6),
        .w1_7 (w1_7),
        .w1_8 (w1_8),
        .w1_9 (w1_9),
        .w1_10 (w1_10),
        .w2_1 (w2_1),
        .w2_2 (w2_2),
        .w2_3 (w2_3),
        .w2_4 (w2_4),
        .w2_5 (w2_5),
        .w2_6 (w2_6),
        .w2_7 (w2_7),
        .w2_8 (w2_8),
        .w2_9 (w2_9),
        .w2_10 (w2_10),
        .neuralnet_out (neuralnet_out)
  );
  
  always #5 clk = ~clk;
  
  //always #10 $display("%h", layer_out[0]);
  
  initial begin
  
    $readmemh("w1_1.mem", w1_1);
    $readmemh("w1_2.mem", w1_2);
    $readmemh("w1_3.mem", w1_3);
    $readmemh("w1_4.mem", w1_4);
    $readmemh("w1_5.mem", w1_5);
    $readmemh("w1_6.mem", w1_6);
    $readmemh("w1_7.mem", w1_7);
    $readmemh("w1_8.mem", w1_8);
    $readmemh("w1_9.mem", w1_9);
    $readmemh("w1_10.mem", w1_10);
    
    $readmemh("w2_1.mem", w2_1);
    $readmemh("w2_2.mem", w2_2);
    $readmemh("w2_3.mem", w2_3);
    $readmemh("w2_4.mem", w2_4);
    $readmemh("w2_5.mem", w2_5);
    $readmemh("w2_6.mem", w2_6);
    $readmemh("w2_7.mem", w2_7);
    $readmemh("w2_8.mem", w2_8);
    $readmemh("w2_9.mem", w2_9);
    $readmemh("w2_10.mem", w2_10);
    
    $readmemh("data_in.mem", data_in);
    
    $readmemh("b1.mem", b1);
    $readmemh("b2.mem", b2);
    $dumpfile("wave.vcd");
    $dumpvars();
    
    clk <= 0;
    rstn <= 0;
    //b <= 16'hfe3d;
    
    #20 rstn <= 1;
    //#80 rstn <= 0;
    //#50 rstn <= 1;
    #20000;
    
    #20 $finish;
    
  end
  
endmodule