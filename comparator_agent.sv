
class comparator_agent extends uvm_agent;

  //----------------------------------------------------------------------------
  `uvm_component_utils(comparator_agent)
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  function new(string name="comparator_agent",uvm_component parent);
    super.new(name,parent);
  endfunction
  //----------------------------------------------------------------------------

  //----------------- class handles --------------------------------------------
  comparator_sequencer sequencer_h;
  comparator_driver    driver_h;
  comparator_monitor   monitor_h;
  //----------------------------------------------------------------------------

  //---------------------- build phase -----------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    driver_h    = comparator_driver::type_id::create("driver_h",this);
    sequencer_h = comparator_sequencer::type_id::create("sequencer_h",this);
    monitor_h   = comparator_monitor::type_id::create("monitor_h",this);
  endfunction
  //----------------------------------------------------------------------------

  //----------------------- connect phase --------------------------------------
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    driver_h.seq_item_port.connect(sequencer_h.seq_item_export);
  endfunction
  //----------------------------------------------------------------------------

endclass:comparator_agent

