// Code your testbench here 
// or browse Examples 

module UpperCase_Example;

  string message = "I am a trainee at ProV Logic";

  initial begin
    
    $display("Original string: %s", message);
    
    $display("Uppercase String: %s", message.toupper());
    
  end
endmodule
