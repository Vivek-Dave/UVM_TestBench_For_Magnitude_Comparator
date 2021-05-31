
class comparator_monitor extends uvm_monitor;
  //----------------------------------------------------------------------------
  `uvm_component_utils(comparator_monitor)
  //----------------------------------------------------------------------------

  //------------------- constructor --------------------------------------------
  function new(string name="comparator_monitor",uvm_component parent);
    super.new(name,parent);
  endfunction
  //----------------------------------------------------------------------------
  
  //---------------- sequence_item class ---------------------------------------
  comparator_sequence_item  txn;
  //----------------------------------------------------------------------------
  
  //------------------------ virtual interface handle---------------------------  
  virtual interface intf vif;
  //----------------------------------------------------------------------------

  //------------------------ analysis port -------------------------------------
  uvm_analysis_port#(comparator_sequence_item) ap_mon;
  //----------------------------------------------------------------------------
  
  //------------------- build phase --------------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!(uvm_config_db#(virtual intf)::get(this,"","vif",vif)))
    begin
      `uvm_fatal("monitor","unable to get interface")
    end
    
    ap_mon=new("ap_mon",this);
  endfunction
  //----------------------------------------------------------------------------

  //-------------------- run phase ---------------------------------------------
  task run_phase(uvm_phase phase);
    txn=comparator_sequence_item::type_id::create("txn");
    forever
    begin
      // write monitor code here 
      sample_dut(txn);
      ap_mon.write(txn);
    end
  endtask
  //----------------------------------------------------------------------------
  task sample_dut(output comparator_sequence_item txn);
    comparator_sequence_item t=comparator_sequence_item::type_id::create("t");
    @(vif.a or vif.b);
    t.a    = vif.a;
    t.b    = vif.b;
    t.aeb  = vif.aeb;
    t.alb  = vif.alb;
    t.agb  = vif.agb;
    t.aneb = vif.aneb;
    t.aleb = vif.aleb;
    t.ageb = vif.ageb;

    txn = t;
  endtask

endclass:comparator_monitor

