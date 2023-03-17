# VerilogNeuralNetwork
Hardware implementation of a pre-trained neural network circuit with 3 layers that is able to recognize handwritten single digits based on 28x28 input pixel map.


# __File Descriptions (.sv):__  

tb_neuralnetwork.sv: testbench for neural_network.sv  

neural_network.sv: "main" top-level module  

layer.sv: module that implements the behaviour of a layer in the NN  

neuron.sv: module that implements the behaviour of a neuron in the NN  

register.sv: module for neuron (gets the data at the index specified by the counter)  

multiplier.sv: module for neuron (multiplies the weight and input values together)  

adder.sv: module for neuron (adds the results of multiplier.sv)  

ReLu.sv: adds the bias term when to the output of adder.sv when the counter reaches the end of the weight and data files, and then applies ReLu activation if needed    

counter.sv: counter that starts at 0 and increments by 1 up on every positive clock edge, until the output reaches the value of the parameter #COUNTER_END  

# __File Descriptions (.mem):__  

w1_1-w1_10: weight values for the first layer in the neural network (in 32 bit hexadecimal format)  
w2_1-w2_10: weight values for the second layer in the neural network (in 32 bit hexadecimal format)  
data_in:  

# __File Descriptions (.py):__  

# __Hierarchy of Files:__  


# __Block diagram:__  

# __How to use this:__  


