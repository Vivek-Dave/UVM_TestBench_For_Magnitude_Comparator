
/***************************************************
** class name  : comparator_sequence
** description : generate input a==b
***************************************************/
class comparator_sequence extends uvm_sequence#(comparator_sequence_item);
  //----------------------------------------------------------------------------
  `uvm_object_utils(comparator_sequence)            
  //----------------------------------------------------------------------------

  comparator_sequence_item txn;
  int unsigned REPEAT=25;

  //----------------------------------------------------------------------------
  function new(string name="comparator_sequence");  
    super.new(name);
  endfunction
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  virtual task body();
    repeat(REPEAT) begin
      txn=comparator_sequence_item::type_id::create("txn");
      start_item(txn);
      txn.randomize()with{txn.a==txn.b;};
      finish_item(txn);
    end
  endtask:body
  //----------------------------------------------------------------------------
endclass:comparator_sequence

/***************************************************
** class name  : comparator_sequence_alb
** description : generate inputs a<b
***************************************************/
class comparator_sequence_alb extends comparator_sequence;
  //----------------------------------------------------------------------------   
  `uvm_object_utils(comparator_sequence_alb)      
  //----------------------------------------------------------------------------
  
  comparator_sequence_item txn;
  int unsigned REPEAT=25;
  
  //----------------------------------------------------------------------------
  function new(string name="comparator_sequence_alb");
      super.new(name);
  endfunction
  //----------------------------------------------------------------------------
  
  //----------------------------------------------------------------------------
  task body();
    repeat(REPEAT) begin
      txn=comparator_sequence_item::type_id::create("txn");
      start_item(txn);
      txn.randomize()with{txn.a<txn.b;};
      #5;
      finish_item(txn);
    end
  endtask:body
  //----------------------------------------------------------------------------
  
endclass

/***************************************************
** class name  : comparator_sequence_agb
** description : generate inpute a>b
***************************************************/
class comparator_sequence_agb extends comparator_sequence;
  //----------------------------------------------------------------------------   
  `uvm_object_utils(comparator_sequence_agb)      
  //----------------------------------------------------------------------------
  
  comparator_sequence_item txn;
  int unsigned REPEAT=25;
  
  //----------------------------------------------------------------------------
  function new(string name="comparator_sequence_agb");
      super.new(name);
  endfunction
  //----------------------------------------------------------------------------
  
  //----------------------------------------------------------------------------
  task body();
    repeat(REPEAT) begin
      txn=comparator_sequence_item::type_id::create("txn");
      start_item(txn);
      txn.randomize()with{txn.a>txn.b;};
      #5;
      finish_item(txn);
    end
  endtask:body
  //----------------------------------------------------------------------------
  
endclass


class comparator_sequence_aneb extends comparator_sequence;
  //----------------------------------------------------------------------------   
  `uvm_object_utils(comparator_sequence_aneb)      
  //----------------------------------------------------------------------------
  
  comparator_sequence_item txn;
  int unsigned REPEAT=25;
  
  //----------------------------------------------------------------------------
  function new(string name="comparator_sequence_aneb");
      super.new(name);
  endfunction
  //----------------------------------------------------------------------------
  
  //----------------------------------------------------------------------------
  task body();
    repeat(REPEAT) begin
      txn=comparator_sequence_item::type_id::create("txn");
      start_item(txn);
      txn.randomize()with{txn.a!=txn.b;};
      finish_item(txn);
    end
  endtask:body
  //----------------------------------------------------------------------------
  
endclass


/***************************************************
** class name  : comparator_sequence_aleb
** description : generate inputs a<=b
***************************************************/
class comparator_sequence_aleb extends comparator_sequence;
  //----------------------------------------------------------------------------   
  `uvm_object_utils(comparator_sequence_aleb)      
  //----------------------------------------------------------------------------
  
  comparator_sequence_item txn;
  int unsigned REPEAT=25;
  
  //----------------------------------------------------------------------------
  function new(string name="comparator_sequence_aleb");
      super.new(name);
  endfunction
  //----------------------------------------------------------------------------
  
  //----------------------------------------------------------------------------
  task body();
    repeat(REPEAT) begin
      txn=comparator_sequence_item::type_id::create("txn");
      start_item(txn);
      txn.randomize()with{txn.a<=txn.b;};
      #5;
      finish_item(txn);
    end
  endtask:body
  //----------------------------------------------------------------------------
  
endclass


/***************************************************
** class name  : comparator_sequence_ageb
** description : generate inputs a>=b
***************************************************/
class comparator_sequence_ageb extends comparator_sequence;
  //----------------------------------------------------------------------------   
  `uvm_object_utils(comparator_sequence_ageb)      
  //----------------------------------------------------------------------------
  
  comparator_sequence_item txn;
  int unsigned REPEAT=25;
  
  //----------------------------------------------------------------------------
  function new(string name="comparator_sequence_ageb");
      super.new(name);
  endfunction
  //----------------------------------------------------------------------------
  
  //----------------------------------------------------------------------------
  task body();
    repeat(REPEAT) begin
      txn=comparator_sequence_item::type_id::create("txn");
      start_item(txn);
      txn.randomize()with{txn.a>=txn.b;};
      #5;
      finish_item(txn);
    end
  endtask:body
  //----------------------------------------------------------------------------
endclass
