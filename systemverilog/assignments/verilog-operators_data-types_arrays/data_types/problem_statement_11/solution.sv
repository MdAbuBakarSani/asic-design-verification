// Code your testbench here 
// or browse Examples 

module LowerCase_Example;

  string message = "I AM A TRAINEE AT PROV LOGIC";

  initial begin

    $display("Original string: %s", message);

    $display("LowerCase String: %s", message.tolower());

  end
endmodule
