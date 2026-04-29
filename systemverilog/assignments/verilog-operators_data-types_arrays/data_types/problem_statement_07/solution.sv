// Code your testbench here 
// or browse Examples 

module String_Display;

  string message = "I am learning SV data type";

  initial begin
    $display("%s", message);
  end

endmodule
