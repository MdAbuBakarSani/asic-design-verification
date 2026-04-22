
// Code your testbench here 
// or browse Examples 


class NonsequentialDigitPin;
rand bit [3:0] pin [4];

constraint range{
    foreach (pin[i]) pin[i] inside {[0:9]};
}
constraint no_sequential{
    !(pin[1] == pin[0] +1 && pin[2] == pin[1] + 1 && pin[3] == pin[2] + 1);
    !(pin[1] == pin[0] -1 && pin[2] == pin[1] - 1 && pin[3] == pin[2] - 1);
}
function void display();
    if (!this.randomize())
        $display("Randomization failed!");
    else begin
        $write("Random 4-digit pin (non-sequential): ");
        foreach (pin[i])
        $write("%0d", pin[i]);
        $display("");
    end
endfunction
endclass

module tb_nonsequential_digit_pin;
NonsequentialDigitPin value;
    initial begin
      value = new();
      repeat(5) begin
      value.display();
    end
  end
endmodule
     
