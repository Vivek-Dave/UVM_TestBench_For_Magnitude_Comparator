

class comparator_sequencer extends uvm_sequencer#(comparator_sequence_item);
  //----------------------------------------------------------------------------
  `uvm_component_utils(comparator_sequencer)  
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  function new(string name="comparator_sequencer",uvm_component parent);  
    super.new(name,parent);
  endfunction
  //----------------------------------------------------------------------------
  
endclass:comparator_sequencer

