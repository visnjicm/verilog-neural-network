`timescale 1ns / 1ps

module counter #(parameter END_COUNTER)
( 
  input clk, 
  input rstn,
  output reg[31:0] counter_out,
  output reg counter_donestatus
  );
  
  always @ (posedge clk) begin
  //$display("counter:%d counter_done_Status:%d",counter_out,counter_donestatus);
    if (! rstn) 
    begin
      counter_out <= 0;
      counter_donestatus <= 0;
    end
    else 
    begin
      counter_out <= counter_out + 1;
      counter_donestatus <=0;
    end
    
    if (counter_out >= END_COUNTER)//16'h0334
    begin
        counter_out <= END_COUNTER;
        counter_donestatus <=1;
    end
    else 
    begin
        counter_donestatus <=0;
    end
  end
endmodule