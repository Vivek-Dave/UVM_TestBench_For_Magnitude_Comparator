class comparator_sequence_item extends uvm_sequence_item;

  //------------ i/p || o/p field declaration-----------------

  rand logic [7:0] a;  //i/p
  rand logic [7:0] b;

  logic  aeb;          //o/p
  logic  alb;
  logic  agb;
  logic aleb;
  logic ageb;
  logic aneb;
  
  //---------------- register comparator_sequence_item class with factory --------
  `uvm_object_utils_begin(comparator_sequence_item) 
     `uvm_field_int( a    ,UVM_ALL_ON)
     `uvm_field_int( b    ,UVM_ALL_ON)
     `uvm_field_int( aeb  ,UVM_ALL_ON)
     `uvm_field_int( alb  ,UVM_ALL_ON)
     `uvm_field_int( agb  ,UVM_ALL_ON)
     `uvm_field_int( aleb ,UVM_ALL_ON)
     `uvm_field_int( ageb ,UVM_ALL_ON)
     `uvm_field_int( aneb ,UVM_ALL_ON)
  `uvm_object_utils_end
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  function new(string name="comparator_sequence_item");
    super.new(name);
  endfunction
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // write DUT inputs here for printing
  function string input2string();
    return($sformatf("a=%3d  b=%3d", a,b));
  endfunction
  
  // write DUT outputs here for printing
  function string output2string();
    return($sformatf("(a==b)=%0b (a>b)=%0b (a<b)=%0b (a!=b)=%0b (a>=b)=%0b (a<=b)=%0b", aeb,agb,alb,aneb,ageb,aleb));
  endfunction
    
  function string convert2string();
    return($sformatf({input2string(), " || ", output2string()}));
  endfunction
  //----------------------------------------------------------------------------

endclass:comparator_sequence_item
