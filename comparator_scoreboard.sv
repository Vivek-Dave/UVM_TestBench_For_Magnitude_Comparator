
/***************************************************
  analysis_port from driver
  analysis_port from monitor
***************************************************/

`uvm_analysis_imp_decl( _drv )
`uvm_analysis_imp_decl( _mon )

class comparator_scoreboard extends uvm_scoreboard;
  //----------------------------------------------------------------------------
  `uvm_component_utils(comparator_scoreboard)
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  uvm_analysis_imp_drv #(comparator_sequence_item, comparator_scoreboard) aport_drv;
  uvm_analysis_imp_mon #(comparator_sequence_item, comparator_scoreboard) aport_mon;
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  uvm_tlm_fifo #(comparator_sequence_item) expfifo;
  uvm_tlm_fifo #(comparator_sequence_item) outfifo;
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  int VECT_CNT, PASS_CNT, ERROR_CNT;
  logic [7:0] t_a;
  logic [7:0] t_b;
  logic     t_aeb,temp_aeb;
  logic     t_alb,temp_alb;
  logic     t_agb,temp_agb;
  logic    t_aleb,temp_aleb;
  logic    t_ageb,temp_ageb;
  logic    t_aneb,temp_aneb;

  function new(string name="comparator_scoreboard",uvm_component parent);
    super.new(name,parent);
  endfunction
  //----------------------------------------------------------------------------


  //----------------------------------------------------------------------------  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    aport_drv = new("aport_drv", this);
    aport_mon = new("aport_mon", this);
    expfifo= new("expfifo",this);
    outfifo= new("outfifo",this);
  endfunction
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  function void write_drv(comparator_sequence_item tr);
    `uvm_info("write_drv STIM", tr.input2string(), UVM_MEDIUM)
    t_a = tr.a;
    t_b = tr.b;

    temp_aeb  = t_aeb;
    temp_alb  = t_alb;
    temp_agb  = t_agb;
    temp_aneb = t_aneb;
    temp_ageb = t_ageb;
    temp_aleb = t_aleb;

    t_aeb  = (t_a==t_b);
    t_alb  = (t_a<t_b);
    t_agb  = (t_a>t_b);
    t_aneb = (t_a != t_b);
    t_aleb = (t_a <= t_b);
    t_ageb = (t_a >= t_b);

    tr.aeb = temp_aeb;
    tr.alb = temp_alb;
    tr.agb = temp_agb;
    tr.aneb = temp_aneb;
    tr.aleb = temp_aleb;
    tr.ageb = temp_ageb;

    void'(expfifo.try_put(tr));
  endfunction
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  function void write_mon(comparator_sequence_item tr);
    `uvm_info("write_mon OUT ", tr.convert2string(), UVM_MEDIUM)
    void'(outfifo.try_put(tr));
  endfunction
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  task run_phase(uvm_phase phase);
	comparator_sequence_item exp_tr, out_tr;
  int unsigned count=0;
	forever begin
	    `uvm_info("scoreboard run task","WAITING for expected output", UVM_DEBUG)
	    expfifo.get(exp_tr);
	    `uvm_info("scoreboard run task","WAITING for actual output", UVM_DEBUG)
	    outfifo.get(out_tr);
        
        if (out_tr.aeb===exp_tr.aeb && out_tr.alb===exp_tr.alb && out_tr.agb===exp_tr.agb && 
        out_tr.aneb===exp_tr.aneb && out_tr.aleb===exp_tr.aleb && out_tr.ageb===exp_tr.ageb && count>1) 
        begin
            PASS();
          `uvm_info (" \n PASS ",{out_tr.convert2string() , "\n" }, UVM_MEDIUM)
	      end
      
      	else if(out_tr.aeb!==exp_tr.aeb && out_tr.alb!==exp_tr.alb && out_tr.agb!==exp_tr.agb &&  
        out_tr.aneb!==exp_tr.aneb && out_tr.aleb!==exp_tr.aleb && out_tr.ageb!==exp_tr.ageb && count>1) 
         
        begin
	        ERROR();
          `uvm_info ("ERROR [ACTUAL_OP]",out_tr.convert2string() , UVM_MEDIUM)
          `uvm_info ("ERROR [EXPECTED_OP]",exp_tr.convert2string() , UVM_MEDIUM)
          `uvm_warning("ERROR",exp_tr.convert2string())
	      end

        count++;
    end
  endtask
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  function void report_phase(uvm_phase phase);
        super.report_phase(phase);
        if (VECT_CNT && !ERROR_CNT)
            `uvm_info("PASSED",$sformatf("*** TEST PASSED - %0d vectors ran, %0d vectors passed ***",
            VECT_CNT, PASS_CNT), UVM_LOW)
        else
            `uvm_info("FAILED",$sformatf("*** TEST FAILED - %0d vectors ran, %0d vectors passed, %0d vectors failed ***",
            VECT_CNT, PASS_CNT, ERROR_CNT), UVM_LOW)
  endfunction
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  function void PASS();
	VECT_CNT++;
	PASS_CNT++;
  endfunction

  function void ERROR();
  	VECT_CNT++;
  	ERROR_CNT++;
  endfunction
  //----------------------------------------------------------------------------

endclass

