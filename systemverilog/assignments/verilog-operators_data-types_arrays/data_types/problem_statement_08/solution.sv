// Code your testbench here 
// or browse Examples 

module String_Length;

  string message = "SystemVerilog";
  int length;

  initial begin

    $display("The message is : %s", message);

    length = message.len();

    $display("Length of the string : %0d", length);

  end
endmodule
