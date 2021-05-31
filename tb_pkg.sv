
`ifndef TB_PKG
`define TB_PKG
`include "uvm_macros.svh"
package tb_pkg;
 import uvm_pkg::*;
 `include "comparator_sequence_item.sv"        // transaction class
 `include "comparator_sequence.sv"             // sequence class
 `include "comparator_sequencer.sv"            // sequencer class
 `include "comparator_driver.sv"               // driver class
 `include "comparator_monitor.sv"
 `include "comparator_agent.sv"                // agent class  
 `include "comparator_coverage.sv"             // coverage class
 `include "comparator_scoreboard.sv"
 `include "comparator_env.sv"                  // environment class

 `include "comparator_test.sv"                         // test1
 //`include "test2.sv"
 //`include "test3.sv"

endpackage
`endif 


