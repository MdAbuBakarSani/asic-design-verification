// Code your testbench here 
// or browse Examples 

module mailbox_methods_demo;
  
  mailbox mb;

  int data1 = 10;
  int data2 = 20;
  int data3 = 30;   
 
  initial begin
    
    // Create mailbox with capacity 2
    mb = new (2);
    $display("Mailbox created. Initial count: %0d", mb.num());
    
    // Blocking put
    mb.put(data1);
    $display("Put data: %0d | count = %0d", data1, mb.num());
    
    mb.put(data2);
    $display("Put data: %0d | count = %0d", data2, mb.num());
    
    // Non-blocking put (should fail when full)
    if (!mb.try_put(data3)) 
      $display("Try put %0d failed - mailbox full. | count = %0d", data3, mb.num());
    else
      $display("Try put %0d success.", data3);
    
    // Peek without removing
    mb.peek(data1);
    $display("Peeked value: %0d | count = %0d", data1, mb.num());
        
    // Blocking get
    mb.get(data1);
    $display("Retrieved data: %0d | count = %0d", data1, mb.num());
        
    // Non-blocking get (success)
    if (mb.try_get(data2))
      $display("try_get(): %0d successfull. | count = %0d", data2, mb.num());
    else
      $display("try_get() failed - mailbox empty.");
    
    // Non-blocking get (should fail)
    if (mb.try_get(data3))
      $display("try_get(): %0d successfull. | count = %0d", data3, mb.num());
    else
      $display("try_get() failed - mailbox empty.");
  end
endmodule
