// Code your testbench here 
// or browse Examples

class UniqueRandom5;
rand bit [4:0] arr[5];

constraint range {
    unique {arr};
    foreach (arr[i]) arr[i] inside {[1:20]};
}
function void display();
    if (!this.randomize())
        $display ("Randomization failed!");
    else begin
        $display ("5 unique random numbers between 1 to 20");
        foreach (arr[i])
        $write ("%0d, ", arr[i]);
        $display("");
    end
endfunction
endclass

module tb_unique_random_5;
UniqueRandom5 values;
    initial begin
        values = new();
        repeat(5) begin
        values.display();
    end
end
endmodule

