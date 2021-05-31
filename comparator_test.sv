
class comparator_test extends uvm_test;

    //--------------------------------------------------------------------------
    `uvm_component_utils(comparator_test)
    //--------------------------------------------------------------------------

    //--------------------------------------------------------------------------
    function new(string name="comparator_test",uvm_component parent);
	    super.new(name,parent);
    endfunction
    //--------------------------------------------------------------------------

    comparator_env env_h;
    int file_h;

    //--------------------------------------------------------------------------
    function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      env_h = comparator_env::type_id::create("env_h",this);
    endfunction
    //--------------------------------------------------------------------------

    //--------------------------------------------------------------------------
    function void end_of_elobartion_phase(uvm_phase phase);
      //factory.print();
      $display("End of eleboration phase in agent");
    endfunction
    //--------------------------------------------------------------------------

    //--------------------------------------------------------------------------
    function void start_of_simulation_phase(uvm_phase phase);
      $display("start_of_simulation_phase");
      file_h=$fopen("LOG_FILE.log","w");
      set_report_default_file_hier(file_h);
      set_report_severity_action_hier(UVM_INFO,UVM_DISPLAY+UVM_LOG);
      set_report_verbosity_level_hier(UVM_MEDIUM);
    endfunction
    //--------------------------------------------------------------------------

    //--------------------------------------------------------------------------
    task run_phase(uvm_phase phase);
        comparator_sequence seq;
      
        comparator_sequence_alb s_alb;
        comparator_sequence_agb s_agb;
        comparator_sequence_aneb s_aneb;
        comparator_sequence_ageb s_ageb;
        comparator_sequence_aleb s_aleb;
	      phase.raise_objection(this);
            seq= comparator_sequence::type_id::create("seq");
            s_alb= comparator_sequence_alb::type_id::create("s_alb");
            s_agb= comparator_sequence_agb::type_id::create("s_agb");
            s_aneb= comparator_sequence_aneb::type_id::create("s_aneb");
            s_ageb= comparator_sequence_ageb::type_id::create("s_ageb");
            s_aleb= comparator_sequence_aleb::type_id::create("s_aleb");

            seq.start(env_h.agent_h.sequencer_h);
            s_alb.start(env_h.agent_h.sequencer_h);
            s_agb.start(env_h.agent_h.sequencer_h);
            s_aneb.start(env_h.agent_h.sequencer_h);
            s_ageb.start(env_h.agent_h.sequencer_h);
            s_aleb.start(env_h.agent_h.sequencer_h);

            #10;
	      phase.drop_objection(this);
    endtask
    //--------------------------------------------------------------------------

endclass:comparator_test

