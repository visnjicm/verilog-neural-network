# Verilog implementation of a pre-trained 28x28 pixel handwritten single digit recognition neural network   
Hardware implementation of a pre-trained neural network circuit with 3 layers that is able to recognize handwritten single digits based on 28x28 input pixel map.


# __File Descriptions (.sv):__  

tb_neuralnetwork.sv: testbench for neural_network.sv  

neural_network.sv: "main" top-level module  

input_layer.sv: module that implements the behaviour of a layer in the NN  

neuron_inputlayer.sv: module that implements the behaviour of a neuron in the NN  

register.sv: module for neuron (gets the data at the index specified by the counter)  

multiplier.sv: module for neuron (multiplies the weight and input values together)  

adder.sv: module for neuron (adds the results of multiplier.sv)  

ReLu.sv: adds the bias term when to the output of adder.sv when the counter reaches the end of the weight and data files, and then applies ReLu activation if needed    

counter.sv: counter that starts at 0 and increments by 1 up on every positive clock edge, until the output reaches the value of the parameter #COUNTER_END  

# __File Descriptions (.mem):__  

w1_1-w1_10: weight values for the first layer in the neural network (in 32 bit hexadecimal format)  
w2_1-w2_10: weight values for the second layer in the neural network (in 32 bit hexadecimal format)  
data_in: data values (in 32 bit hexadecimal format)  
b1: bias values for the neurons in the first layer (in 32 bit hexadecimal format)  
b2: bias values for the neurons in the second layer (in 32 bit hexadecimal format)  

# __Hierarchy of Files:__  

Simulation Sources:  

tb_neuralnetwork.sv X 1  

Design Sources:  

neural_network.sv X 1  
- input_layer.sv X 2  
  - neuron_inputlayer.sv x 10  
    - register.sv X 2   
    - multiplier.sv X 1  
    - adder.sv X 1  
    - ReLu.sv X 1  
  - counter.sv X 1  


# __Block diagram:__  

See BlockDiagram.png.

# __How to use this:__  

__Step 1:__ Resize the canvas in paint to 28x28 pixels and draw any digit in between 0-9. Then invert the color, and then save as a png file.  

![step1](https://user-images.githubusercontent.com/126916558/226153939-a270a304-ffdd-441f-9ab8-3864d5d8588b.PNG)  

![4_marko](https://user-images.githubusercontent.com/126916558/226153957-6ccf1e24-eeb7-4f53-a865-bc0ab9c67455.png)  

__Step 2:__ Convert the image to a .csv file of pixel values in a 1D array, by using the Convert Image to... .ipynb file in the repo.

![image](https://user-images.githubusercontent.com/126916558/226154252-f089e756-2f3c-4040-ad4d-10e4ba2af39d.png)

__Step 3:__ Use the code in File2.ipynb to convert the (Your Number)_prenormalized.csv to (Your Number).csv.

__Step 4:__ Use the code in File1.ipynb to convert the (Your Number)_prenormalized.csv to (Your Number)_fixed.csv and (Your Number)_hex.csv.

__Step 5:__ Create a new vivado project, add these files as design sources:

neural_network.sv  
input_layer.sv  
neuron_inputlayer.sv  
register.sv  
multiplier.sv  
adder.sv  
ReLu.sv  
counter.sv  

And add this file as a simulation source:  

tb_neuralnetwork.sv  

Then add these as your .mem files:  

w1_1.mem - w1_10.mem  
w2_1.mem - w2_1.mem  
b1.mem - b2.mem  

And you need to add one more .mem file which is not in the repo, but is the data from (Your Number)_hex.csv, so copy the contents of that file like this and paste it in a new .mem file called data_in.mem:  

![image](https://user-images.githubusercontent.com/126916558/226155214-3d7989a4-a81a-48fc-ad31-e44e19e38694.png)  

![image](https://user-images.githubusercontent.com/126916558/226155244-bee87bdf-fec7-458c-9af4-4af6cbe4dacb.png)  

__Step 6:__  

You need to "pad" the data_in.mem file with 20 rows of 00000000 before the beginning of the first line (before padding) and after the last line of the file (also before padding). If you don't do this, the simulation will not output the correct behaviour result.

__Step 7:__  

Set simulation time to 9000 ns.

![image](https://user-images.githubusercontent.com/126916558/226156390-75ed374c-9bd6-4271-a664-5a40d72d7718.png)

__Step 8:__

Run the simulation, and copy the last part of the data from the output, circled in red in the image below (the last 10 lines, and this column):

![image](https://user-images.githubusercontent.com/126916558/226157431-f1052bf8-386a-41d2-96a9-04a9248459fe.png)  

These are the ouput values of the neural networked in fixed point representation, so we need to convert them back to floating point, and then convert those to softmax, to get our final prediction/result. Both of these things can be done File1.ipynb. For the parameters of the to_float function, the first parameter is the number, and the second parameter set to 45. Then when you converted all 10 of the fixed values to float, you can put them in the softmax array in the code, run the module, and see what the predicted output is, like such:  

![image](https://user-images.githubusercontent.com/126916558/226158471-75f12e1d-975e-4ad6-8927-d4dfa899ac3b.png)  

As you can see, unfortunately the neural network did not predict that the digit was 4. This is mainly due to two reasons, first reason, this network was not trained to recognize the way I write but instead was trained using the standard MNIST database for neural network training, and second, this network is also relatively simple and has been tested to have a 84% accuracy, which albeit high, still makes mistakes. However, the reason it failed here is mostly due to the first reason, to prove this I will use the data from the following image, which is one of the MNIST images which the NN was trained to recognize:  

![image](https://user-images.githubusercontent.com/126916558/226158898-6ca20407-b440-4652-8378-d68ec65d912f.png)

We get these results from the simulation:

![image](https://user-images.githubusercontent.com/126916558/226158893-a69ff585-81f2-4028-89a4-f26a0fc5b131.png)

Which when we then convert to float, and apply softmax, we get the predicted result that we expect, 8.

![image](https://user-images.githubusercontent.com/126916558/226159160-9dc7f431-afc9-47d8-8772-61c498697866.png)

# __Acknowledgments:__  

A huge thanks to Samson Zhang (YouTube: @SamsonZhangTheSalmon) for providing his NN training code free of charge, this project would not of been possible without him!  

(Link to Samson's code: https://www.kaggle.com/code/wwsalmon/simple-mnist-nn-from-scratch-numpy-no-tf-keras/notebook)  

# __Future Work:__  

It would be much more beneficial to investigate ways of training a neural network on FPGA, meaning, designing sophisticated enough Verilog code that can be synthesized on an FPGA to both train and simulate neural networks. Much more work should be done on investigating ways of efficiently converting sophisticated neural network algorithms/structures, to synthesizable digital circuit design using Verilog. As we saw, this neural network, although it was able to pretty accurately predict from the result from the images in the training set it was given, it failed pretty miserabely when it came to predicting my own handwritting, despite being a completely valid input. Ways to resolve this issue as effictively and efficiently as possible should really be investigated in future work, and this might involve using more sophisticated neural network algorithms, structures, and/or ideas.
