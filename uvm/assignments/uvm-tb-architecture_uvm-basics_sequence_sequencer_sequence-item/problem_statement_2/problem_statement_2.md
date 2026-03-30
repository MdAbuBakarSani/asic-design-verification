
# Problem 2: UVM Environment for 4-bit ALU with Scoreboard

## Problem Breakdown:
Build a **UVM environment** that:
1. Instantiates the **agent** from **Problem 1**.
2. Instantiates a **scoreboard** to verify the DUT's output.
3. Connects the **monitor’s analysis port** to the **scoreboard** using **`uvm_analysis_port`**.

---

## Requirements:
- **Agent Instantiation**: The **UVM agent** from **Problem 1** should be instantiated inside the **UVM environment**.
- **Scoreboard**: Create a **scoreboard** to compare the **expected** and **actual** data from the **monitor**.
- **Analysis Port**: Connect the **monitor’s analysis port** to the **scoreboard** using **`uvm_analysis_port`**.
- **Monitor**: Capture the **inputs** and **outputs** of the DUT (Device Under Test) using the **monitor**.
- **Active/Passive Control**: The agent’s **active/passive** behavior should be controlled using the **`is_active` flag**.
- **UVM Methodology**: Use the **UVM** methodology for constructing the environment and connecting components.
- **Verification**: The **scoreboard** must check the **validity** of the DUT's output by comparing the **expected data** to the **actual data**.

---

# Solution:

The solution is implemented as follows:

```SystemVerilog
// Code your testbench here 
// or browse Examples

  // --- UVM Scoreboard for ALU Verification ---
class alu_scoreboard extends uvm_scoreboard; 
  `uvm_component_utils(alu_scoreboard) 

  // Declare the analysis port to connect the monitor to the scoreboard
  uvm_analysis_imp#(alu_transaction, alu_scoreboard )mon_imp; 

  function new (string name, uvm_component parent); 
    super.new (name, parent); 
  endfunction 

  // Build phase to instantiate the monitor interface
  function void build_phase (uvm_phase phase); 
    super.build_phase(phase); 
    mon_imp = new("mon_imp", this); 
  endfunction 

  // Method to process transactions from the monitor
  function void write (alu_transaction tr);
    
  // Compare expected and actual data
    if (tr.expected_data !== tr.actual_data) 
      `uvm_error("Scoreboard", "Mismatched!"); 

    else 
      `uvm_info("Scoreboard", "Matched!", UVM_MEDIUM); 
  endfunction 
endclass 

  // UVM Environment that instantiates the agent and scoreboard
class alu_env extends uvm_env; 
  `uvm_component_utils(alu_env)
  
  alu_agent agt; 
  alu_scoreboard scb; 

  function new (string name, uvm_component parent); 
    super.new(name, parent); 
  endfunction 

  // Build phase to instantiate the agent and scoreboard
  function void build_phase (uvm_phase phase); 
    super.build_phase (phase); 
    agt = alu_agent::type_id::create("agt", this); 
    scb = alu_scoreboard::type_id::create("scb", this); 
  endfunction 

  // Connect phase to link the monitor and scoreboard
  function void connect_phase (uvm_phase phase); 
    super.connect_phase(phase); 
    
  // Connect the analysis port of the monitor to the scoreboard's interface
    agt.mon.analysis_port.connect(scb.mon_imp); 
  endfunction 
endclass










