// Code your testbench here 
// or browse Examples 

module Substring_Example;

  string message = "I am a trainee at ProV Logic";
  string sub;

  initial begin

    sub = message.substr(7, 13);

    $display("Original String: %s", message);
    $display("Substring (8th to 14th position): %s", sub);

  end
endmodule
