`timescale 1ns / 1ps

module register #(parameter WIDTH, BITS)
(
  input reg signed [BITS:0] data [0:WIDTH],
  input reg [31:0] counter,
  output reg signed [BITS:0] value
  );
  
  always @(counter) begin
  //$display("counter_reg:%h and value_reg:%h", counter, value);
    assign value = data[counter];
  //always @(counter) begin
    //$display("%d", data[index]);
  //end
  end
endmodule