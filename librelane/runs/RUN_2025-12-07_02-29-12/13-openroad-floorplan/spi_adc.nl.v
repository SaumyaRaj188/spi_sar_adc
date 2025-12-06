module spi_adc (adc_clk_out,
    comparator,
    cs,
    dac_rst,
    irq,
    miso,
    mosi,
    pwr_gate,
    reset_,
    sample_and_hold,
    sck,
    sys_clk,
    vref_sel,
    dac);
 output adc_clk_out;
 input comparator;
 input cs;
 output dac_rst;
 output irq;
 output miso;
 input mosi;
 output pwr_gate;
 input reset_;
 output sample_and_hold;
 input sck;
 input sys_clk;
 output vref_sel;
 output [11:0] dac;

 wire _000_;
 wire _001_;
 wire _002_;
 wire _003_;
 wire _004_;
 wire _005_;
 wire _006_;
 wire _007_;
 wire _008_;
 wire _009_;
 wire _010_;
 wire _011_;
 wire _012_;
 wire _013_;
 wire _014_;
 wire _015_;
 wire _016_;
 wire _017_;
 wire _018_;
 wire _019_;
 wire _020_;
 wire _021_;
 wire _022_;
 wire _023_;
 wire _024_;
 wire _025_;
 wire _026_;
 wire _027_;
 wire _028_;
 wire _029_;
 wire _030_;
 wire _031_;
 wire _032_;
 wire _033_;
 wire _034_;
 wire _035_;
 wire _036_;
 wire _037_;
 wire _038_;
 wire _039_;
 wire _040_;
 wire _041_;
 wire _042_;
 wire _043_;
 wire _044_;
 wire _045_;
 wire _046_;
 wire _047_;
 wire _048_;
 wire _049_;
 wire _050_;
 wire _051_;
 wire _052_;
 wire _053_;
 wire _054_;
 wire _055_;
 wire _056_;
 wire _057_;
 wire _058_;
 wire _059_;
 wire _060_;
 wire _061_;
 wire _062_;
 wire _063_;
 wire _064_;
 wire _065_;
 wire _066_;
 wire _067_;
 wire _068_;
 wire _069_;
 wire _070_;
 wire _071_;
 wire _072_;
 wire _073_;
 wire _074_;
 wire _075_;
 wire _076_;
 wire _077_;
 wire _078_;
 wire _079_;
 wire _080_;
 wire _081_;
 wire _082_;
 wire _083_;
 wire _084_;
 wire _085_;
 wire _086_;
 wire _087_;
 wire _088_;
 wire _089_;
 wire _090_;
 wire _091_;
 wire _092_;
 wire _093_;
 wire _094_;
 wire _095_;
 wire _096_;
 wire _097_;
 wire _098_;
 wire _099_;
 wire _100_;
 wire _101_;
 wire _102_;
 wire _103_;
 wire _104_;
 wire _105_;
 wire _106_;
 wire _107_;
 wire _108_;
 wire _109_;
 wire _110_;
 wire _111_;
 wire _112_;
 wire _113_;
 wire _114_;
 wire _115_;
 wire _116_;
 wire _117_;
 wire _118_;
 wire _119_;
 wire _120_;
 wire _121_;
 wire _122_;
 wire _123_;
 wire _124_;
 wire _125_;
 wire _126_;
 wire _127_;
 wire _128_;
 wire _129_;
 wire _130_;
 wire _131_;
 wire _132_;
 wire _133_;
 wire _134_;
 wire _135_;
 wire _136_;
 wire _137_;
 wire _138_;
 wire _139_;
 wire _140_;
 wire _141_;
 wire _142_;
 wire _143_;
 wire _144_;
 wire _145_;
 wire _146_;
 wire _147_;
 wire _148_;
 wire _149_;
 wire _150_;
 wire _151_;
 wire _152_;
 wire _153_;
 wire _154_;
 wire _155_;
 wire _156_;
 wire _157_;
 wire _158_;
 wire _159_;
 wire _160_;
 wire _161_;
 wire _162_;
 wire _163_;
 wire _164_;
 wire _165_;
 wire _166_;
 wire _167_;
 wire _168_;
 wire _169_;
 wire _170_;
 wire _171_;
 wire _172_;
 wire _173_;
 wire _174_;
 wire _175_;
 wire _176_;
 wire _177_;
 wire _178_;
 wire _179_;
 wire _180_;
 wire _181_;
 wire _182_;
 wire _183_;
 wire _184_;
 wire _185_;
 wire _186_;
 wire _187_;
 wire _188_;
 wire _189_;
 wire _190_;
 wire _191_;
 wire _192_;
 wire _193_;
 wire _194_;
 wire _195_;
 wire _196_;
 wire _197_;
 wire _198_;
 wire _199_;
 wire _200_;
 wire _201_;
 wire _202_;
 wire _203_;
 wire _204_;
 wire _205_;
 wire _206_;
 wire _207_;
 wire _208_;
 wire _209_;
 wire _210_;
 wire _211_;
 wire _212_;
 wire _213_;
 wire _214_;
 wire _215_;
 wire _216_;
 wire _217_;
 wire _218_;
 wire _219_;
 wire _220_;
 wire _221_;
 wire _222_;
 wire _223_;
 wire _224_;
 wire _225_;
 wire _226_;
 wire _227_;
 wire _228_;
 wire _229_;
 wire _230_;
 wire _231_;
 wire _232_;
 wire _233_;
 wire _234_;
 wire _235_;
 wire _236_;
 wire _237_;
 wire _238_;
 wire _239_;
 wire _240_;
 wire _241_;
 wire _242_;
 wire _243_;
 wire _244_;
 wire _245_;
 wire _246_;
 wire _247_;
 wire _248_;
 wire _249_;
 wire _250_;
 wire _251_;
 wire _252_;
 wire _253_;
 wire _254_;
 wire _255_;
 wire _256_;
 wire _257_;
 wire _258_;
 wire _259_;
 wire _260_;
 wire _261_;
 wire _262_;
 wire _263_;
 wire _264_;
 wire _265_;
 wire _266_;
 wire _267_;
 wire _268_;
 wire _269_;
 wire _270_;
 wire _271_;
 wire _272_;
 wire _273_;
 wire _274_;
 wire _275_;
 wire _276_;
 wire _277_;
 wire _278_;
 wire _279_;
 wire _280_;
 wire _281_;
 wire adc_ack;
 wire \adc_data_out[0] ;
 wire \adc_data_out[10] ;
 wire \adc_data_out[11] ;
 wire \adc_data_out[1] ;
 wire \adc_data_out[2] ;
 wire \adc_data_out[3] ;
 wire \adc_data_out[4] ;
 wire \adc_data_out[5] ;
 wire \adc_data_out[6] ;
 wire \adc_data_out[7] ;
 wire \adc_data_out[8] ;
 wire \adc_data_out[9] ;
 wire adc_en_n;
 wire bit_auto;
 wire bit_clk_sel;
 wire bit_en;
 wire bit_int_en;
 wire bit_start;
 wire \clk_cnt[0] ;
 wire \clk_cnt[10] ;
 wire \clk_cnt[11] ;
 wire \clk_cnt[12] ;
 wire \clk_cnt[13] ;
 wire \clk_cnt[14] ;
 wire \clk_cnt[15] ;
 wire \clk_cnt[16] ;
 wire \clk_cnt[17] ;
 wire \clk_cnt[18] ;
 wire \clk_cnt[19] ;
 wire \clk_cnt[1] ;
 wire \clk_cnt[20] ;
 wire \clk_cnt[21] ;
 wire \clk_cnt[22] ;
 wire \clk_cnt[23] ;
 wire \clk_cnt[24] ;
 wire \clk_cnt[25] ;
 wire \clk_cnt[26] ;
 wire \clk_cnt[27] ;
 wire \clk_cnt[28] ;
 wire \clk_cnt[29] ;
 wire \clk_cnt[2] ;
 wire \clk_cnt[30] ;
 wire \clk_cnt[31] ;
 wire \clk_cnt[3] ;
 wire \clk_cnt[4] ;
 wire \clk_cnt[5] ;
 wire \clk_cnt[6] ;
 wire \clk_cnt[7] ;
 wire \clk_cnt[8] ;
 wire \clk_cnt[9] ;
 wire \ctrl_reg[10] ;
 wire \ctrl_reg[11] ;
 wire \ctrl_reg[5] ;
 wire \ctrl_reg[7] ;
 wire \ctrl_reg[8] ;
 wire \ctrl_reg[9] ;
 wire eoc_flag;
 wire start_clear_req;
 wire \u_controller.counter_reg[0] ;
 wire \u_controller.counter_reg[10] ;
 wire \u_controller.counter_reg[11] ;
 wire \u_controller.counter_reg[1] ;
 wire \u_controller.counter_reg[2] ;
 wire \u_controller.counter_reg[3] ;
 wire \u_controller.counter_reg[4] ;
 wire \u_controller.counter_reg[5] ;
 wire \u_controller.counter_reg[6] ;
 wire \u_controller.counter_reg[7] ;
 wire \u_controller.counter_reg[8] ;
 wire \u_controller.counter_reg[9] ;
 wire \u_controller.dac_reg[0] ;
 wire \u_controller.dac_reg[10] ;
 wire \u_controller.dac_reg[11] ;
 wire \u_controller.dac_reg[1] ;
 wire \u_controller.dac_reg[2] ;
 wire \u_controller.dac_reg[3] ;
 wire \u_controller.dac_reg[4] ;
 wire \u_controller.dac_reg[5] ;
 wire \u_controller.dac_reg[6] ;
 wire \u_controller.dac_reg[7] ;
 wire \u_controller.dac_reg[8] ;
 wire \u_controller.dac_reg[9] ;
 wire \u_controller.reset_ ;
 wire \u_controller.state[0] ;
 wire \u_controller.state[1] ;
 wire \u_spi.addr[0] ;
 wire \u_spi.addr[1] ;
 wire \u_spi.bit_cnt[0] ;
 wire \u_spi.bit_cnt[1] ;
 wire \u_spi.bit_cnt[2] ;
 wire \u_spi.bit_cnt[3] ;
 wire \u_spi.bit_cnt[4] ;
 wire \u_spi.cmd[0] ;
 wire \u_spi.cmd[1] ;
 wire \u_spi.data_reg[0] ;
 wire \u_spi.data_reg[10] ;
 wire \u_spi.data_reg[11] ;
 wire \u_spi.data_reg[1] ;
 wire \u_spi.data_reg[2] ;
 wire \u_spi.data_reg[3] ;
 wire \u_spi.data_reg[4] ;
 wire \u_spi.data_reg[5] ;
 wire \u_spi.data_reg[6] ;
 wire \u_spi.data_reg[7] ;
 wire \u_spi.data_reg[8] ;
 wire \u_spi.data_reg[9] ;
 wire \u_spi.eoc_s1 ;
 wire \u_spi.eoc_s2 ;
 wire \u_spi.eoc_sent_high ;
 wire \u_spi.miso_buffer[0] ;
 wire \u_spi.miso_buffer[10] ;
 wire \u_spi.miso_buffer[11] ;
 wire \u_spi.miso_buffer[1] ;
 wire \u_spi.miso_buffer[2] ;
 wire \u_spi.miso_buffer[3] ;
 wire \u_spi.miso_buffer[4] ;
 wire \u_spi.miso_buffer[5] ;
 wire \u_spi.miso_buffer[6] ;
 wire \u_spi.miso_buffer[7] ;
 wire \u_spi.miso_buffer[8] ;
 wire \u_spi.miso_buffer[9] ;
 wire \u_spi.pay[0] ;
 wire \u_spi.pay[10] ;
 wire \u_spi.pay[11] ;
 wire \u_spi.pay[1] ;
 wire \u_spi.pay[2] ;
 wire \u_spi.pay[3] ;
 wire \u_spi.pay[4] ;
 wire \u_spi.pay[5] ;
 wire \u_spi.pay[6] ;
 wire \u_spi.pay[7] ;
 wire \u_spi.pay[8] ;
 wire \u_spi.pay[9] ;
 wire \u_spi.sck_s1 ;
 wire \u_spi.sck_s2 ;
 wire \u_spi.state[0] ;
 wire \u_spi.state[1] ;

 sky130_fd_sc_hd__inv_2 _282_ (.A(\u_spi.pay[0] ),
    .Y(_134_));
 sky130_fd_sc_hd__inv_2 _283_ (.A(\u_spi.pay[1] ),
    .Y(_135_));
 sky130_fd_sc_hd__inv_2 _284_ (.A(\u_spi.pay[3] ),
    .Y(_136_));
 sky130_fd_sc_hd__inv_2 _285_ (.A(\u_spi.pay[2] ),
    .Y(_137_));
 sky130_fd_sc_hd__inv_2 _286_ (.A(\clk_cnt[7] ),
    .Y(_138_));
 sky130_fd_sc_hd__inv_2 _287_ (.A(\u_spi.eoc_sent_high ),
    .Y(_139_));
 sky130_fd_sc_hd__inv_2 _288_ (.A(\u_spi.pay[4] ),
    .Y(_140_));
 sky130_fd_sc_hd__inv_2 _289_ (.A(\u_spi.pay[5] ),
    .Y(_141_));
 sky130_fd_sc_hd__inv_2 _290_ (.A(\u_spi.pay[6] ),
    .Y(_142_));
 sky130_fd_sc_hd__inv_2 _291_ (.A(\u_spi.pay[7] ),
    .Y(_143_));
 sky130_fd_sc_hd__inv_2 _292_ (.A(\u_spi.pay[8] ),
    .Y(_144_));
 sky130_fd_sc_hd__inv_2 _293_ (.A(\u_spi.pay[9] ),
    .Y(_145_));
 sky130_fd_sc_hd__inv_2 _294_ (.A(\u_spi.pay[10] ),
    .Y(_146_));
 sky130_fd_sc_hd__inv_2 _295_ (.A(\u_spi.pay[11] ),
    .Y(_147_));
 sky130_fd_sc_hd__and2_2 _296_ (.A(\u_controller.state[0] ),
    .B(\u_controller.state[1] ),
    .X(adc_ack));
 sky130_fd_sc_hd__nand2b_2 _297_ (.A_N(\u_controller.state[1] ),
    .B(\u_controller.state[0] ),
    .Y(_148_));
 sky130_fd_sc_hd__inv_2 _298_ (.A(_148_),
    .Y(dac_rst));
 sky130_fd_sc_hd__and2b_2 _299_ (.A_N(\u_controller.state[0] ),
    .B(\u_controller.state[1] ),
    .X(_149_));
 sky130_fd_sc_hd__nor2_2 _300_ (.A(dac_rst),
    .B(_149_),
    .Y(_150_));
 sky130_fd_sc_hd__inv_2 _301_ (.A(_150_),
    .Y(pwr_gate));
 sky130_fd_sc_hd__o21a_2 _302_ (.A1(\u_controller.state[0] ),
    .A2(\u_controller.state[1] ),
    .B1(bit_start),
    .X(_033_));
 sky130_fd_sc_hd__and2_2 _303_ (.A(bit_en),
    .B(reset_),
    .X(\u_controller.reset_ ));
 sky130_fd_sc_hd__nand2b_2 _304_ (.A_N(\u_spi.eoc_s2 ),
    .B(\u_spi.eoc_s1 ),
    .Y(_151_));
 sky130_fd_sc_hd__or2_2 _305_ (.A(\u_spi.state[0] ),
    .B(\u_spi.state[1] ),
    .X(_152_));
 sky130_fd_sc_hd__mux2_1 _306_ (.A0(start_clear_req),
    .A1(_152_),
    .S(_151_),
    .X(_153_));
 sky130_fd_sc_hd__mux2_1 _307_ (.A0(\adc_data_out[0] ),
    .A1(\u_spi.data_reg[0] ),
    .S(_153_),
    .X(_035_));
 sky130_fd_sc_hd__mux2_1 _308_ (.A0(\adc_data_out[1] ),
    .A1(\u_spi.data_reg[1] ),
    .S(_153_),
    .X(_038_));
 sky130_fd_sc_hd__mux2_1 _309_ (.A0(\adc_data_out[2] ),
    .A1(\u_spi.data_reg[2] ),
    .S(_153_),
    .X(_039_));
 sky130_fd_sc_hd__mux2_1 _310_ (.A0(\adc_data_out[3] ),
    .A1(\u_spi.data_reg[3] ),
    .S(_153_),
    .X(_040_));
 sky130_fd_sc_hd__mux2_1 _311_ (.A0(\adc_data_out[4] ),
    .A1(\u_spi.data_reg[4] ),
    .S(_153_),
    .X(_041_));
 sky130_fd_sc_hd__mux2_1 _312_ (.A0(\adc_data_out[5] ),
    .A1(\u_spi.data_reg[5] ),
    .S(_153_),
    .X(_042_));
 sky130_fd_sc_hd__mux2_1 _313_ (.A0(\adc_data_out[6] ),
    .A1(\u_spi.data_reg[6] ),
    .S(_153_),
    .X(_043_));
 sky130_fd_sc_hd__mux2_1 _314_ (.A0(\adc_data_out[7] ),
    .A1(\u_spi.data_reg[7] ),
    .S(_153_),
    .X(_044_));
 sky130_fd_sc_hd__mux2_1 _315_ (.A0(\adc_data_out[8] ),
    .A1(\u_spi.data_reg[8] ),
    .S(_153_),
    .X(_045_));
 sky130_fd_sc_hd__mux2_1 _316_ (.A0(\adc_data_out[9] ),
    .A1(\u_spi.data_reg[9] ),
    .S(_153_),
    .X(_046_));
 sky130_fd_sc_hd__mux2_1 _317_ (.A0(\adc_data_out[10] ),
    .A1(\u_spi.data_reg[10] ),
    .S(_153_),
    .X(_036_));
 sky130_fd_sc_hd__mux2_1 _318_ (.A0(\adc_data_out[11] ),
    .A1(\u_spi.data_reg[11] ),
    .S(_153_),
    .X(_037_));
 sky130_fd_sc_hd__or4b_2 _319_ (.A(\u_spi.state[0] ),
    .B(\u_spi.addr[0] ),
    .C(\u_spi.addr[1] ),
    .D_N(\u_spi.state[1] ),
    .X(_154_));
 sky130_fd_sc_hd__o21bai_2 _320_ (.A1(\u_spi.cmd[0] ),
    .A2(\u_spi.cmd[1] ),
    .B1_N(_154_),
    .Y(_155_));
 sky130_fd_sc_hd__a21oi_2 _321_ (.A1(\u_spi.cmd[0] ),
    .A2(\u_spi.cmd[1] ),
    .B1(_155_),
    .Y(_156_));
 sky130_fd_sc_hd__a21o_2 _322_ (.A1(_135_),
    .A2(\u_spi.cmd[1] ),
    .B1(_155_),
    .X(_157_));
 sky130_fd_sc_hd__nand2_2 _323_ (.A(start_clear_req),
    .B(_155_),
    .Y(_158_));
 sky130_fd_sc_hd__a32o_2 _324_ (.A1(bit_start),
    .A2(_157_),
    .A3(_158_),
    .B1(_156_),
    .B2(\u_spi.pay[1] ),
    .X(_034_));
 sky130_fd_sc_hd__o31ai_2 _325_ (.A1(bit_start),
    .A2(bit_auto),
    .A3(pwr_gate),
    .B1(bit_en),
    .Y(_000_));
 sky130_fd_sc_hd__o22a_2 _326_ (.A1(bit_clk_sel),
    .A2(\clk_cnt[5] ),
    .B1(\clk_cnt[7] ),
    .B2(\clk_cnt[4] ),
    .X(_159_));
 sky130_fd_sc_hd__a31o_2 _327_ (.A1(\clk_cnt[1] ),
    .A2(\clk_cnt[3] ),
    .A3(\clk_cnt[2] ),
    .B1(_159_),
    .X(_160_));
 sky130_fd_sc_hd__a21o_2 _328_ (.A1(\clk_cnt[5] ),
    .A2(\clk_cnt[6] ),
    .B1(\clk_cnt[7] ),
    .X(_161_));
 sky130_fd_sc_hd__or2_2 _329_ (.A(\clk_cnt[4] ),
    .B(\clk_cnt[5] ),
    .X(_162_));
 sky130_fd_sc_hd__a32o_2 _330_ (.A1(\clk_cnt[6] ),
    .A2(\clk_cnt[7] ),
    .A3(_162_),
    .B1(_161_),
    .B2(bit_clk_sel),
    .X(_163_));
 sky130_fd_sc_hd__or4_2 _331_ (.A(\clk_cnt[21] ),
    .B(\clk_cnt[20] ),
    .C(\clk_cnt[23] ),
    .D(\clk_cnt[22] ),
    .X(_164_));
 sky130_fd_sc_hd__or4_2 _332_ (.A(\clk_cnt[17] ),
    .B(\clk_cnt[16] ),
    .C(\clk_cnt[19] ),
    .D(\clk_cnt[18] ),
    .X(_165_));
 sky130_fd_sc_hd__or4_2 _333_ (.A(\clk_cnt[25] ),
    .B(\clk_cnt[24] ),
    .C(\clk_cnt[27] ),
    .D(\clk_cnt[26] ),
    .X(_166_));
 sky130_fd_sc_hd__or4_2 _334_ (.A(\clk_cnt[29] ),
    .B(\clk_cnt[28] ),
    .C(\clk_cnt[31] ),
    .D(\clk_cnt[30] ),
    .X(_167_));
 sky130_fd_sc_hd__or4_2 _335_ (.A(_164_),
    .B(_165_),
    .C(_166_),
    .D(_167_),
    .X(_168_));
 sky130_fd_sc_hd__or4_2 _336_ (.A(\clk_cnt[13] ),
    .B(\clk_cnt[12] ),
    .C(\clk_cnt[15] ),
    .D(\clk_cnt[14] ),
    .X(_169_));
 sky130_fd_sc_hd__or4_2 _337_ (.A(\clk_cnt[9] ),
    .B(\clk_cnt[8] ),
    .C(\clk_cnt[11] ),
    .D(\clk_cnt[10] ),
    .X(_170_));
 sky130_fd_sc_hd__a211o_2 _338_ (.A1(_160_),
    .A2(_163_),
    .B1(_168_),
    .C1(_170_),
    .X(_171_));
 sky130_fd_sc_hd__nor2_2 _339_ (.A(_169_),
    .B(_171_),
    .Y(_172_));
 sky130_fd_sc_hd__and2b_2 _340_ (.A_N(\clk_cnt[0] ),
    .B(_172_),
    .X(_001_));
 sky130_fd_sc_hd__or2_2 _341_ (.A(\clk_cnt[1] ),
    .B(\clk_cnt[0] ),
    .X(_173_));
 sky130_fd_sc_hd__nand2_2 _342_ (.A(\clk_cnt[1] ),
    .B(\clk_cnt[0] ),
    .Y(_174_));
 sky130_fd_sc_hd__and3_2 _343_ (.A(_172_),
    .B(_173_),
    .C(_174_),
    .X(_012_));
 sky130_fd_sc_hd__nand3_2 _344_ (.A(\clk_cnt[1] ),
    .B(\clk_cnt[0] ),
    .C(\clk_cnt[2] ),
    .Y(_175_));
 sky130_fd_sc_hd__a21o_2 _345_ (.A1(\clk_cnt[1] ),
    .A2(\clk_cnt[0] ),
    .B1(\clk_cnt[2] ),
    .X(_176_));
 sky130_fd_sc_hd__and3_2 _346_ (.A(_172_),
    .B(_175_),
    .C(_176_),
    .X(_023_));
 sky130_fd_sc_hd__and4_2 _347_ (.A(\clk_cnt[1] ),
    .B(\clk_cnt[0] ),
    .C(\clk_cnt[3] ),
    .D(\clk_cnt[2] ),
    .X(_177_));
 sky130_fd_sc_hd__a31o_2 _348_ (.A1(\clk_cnt[1] ),
    .A2(\clk_cnt[0] ),
    .A3(\clk_cnt[2] ),
    .B1(\clk_cnt[3] ),
    .X(_178_));
 sky130_fd_sc_hd__and3b_2 _349_ (.A_N(_177_),
    .B(_178_),
    .C(_172_),
    .X(_026_));
 sky130_fd_sc_hd__or2_2 _350_ (.A(\clk_cnt[4] ),
    .B(_177_),
    .X(_179_));
 sky130_fd_sc_hd__and2_2 _351_ (.A(\clk_cnt[4] ),
    .B(_177_),
    .X(_180_));
 sky130_fd_sc_hd__and3b_2 _352_ (.A_N(_180_),
    .B(_172_),
    .C(_179_),
    .X(_027_));
 sky130_fd_sc_hd__and3_2 _353_ (.A(\clk_cnt[4] ),
    .B(\clk_cnt[5] ),
    .C(_177_),
    .X(_181_));
 sky130_fd_sc_hd__or2_2 _354_ (.A(\clk_cnt[5] ),
    .B(_180_),
    .X(_182_));
 sky130_fd_sc_hd__and3b_2 _355_ (.A_N(_181_),
    .B(_182_),
    .C(_172_),
    .X(_028_));
 sky130_fd_sc_hd__or2_2 _356_ (.A(\clk_cnt[6] ),
    .B(_181_),
    .X(_183_));
 sky130_fd_sc_hd__nand2_2 _357_ (.A(\clk_cnt[6] ),
    .B(_181_),
    .Y(_184_));
 sky130_fd_sc_hd__and3_2 _358_ (.A(_172_),
    .B(_183_),
    .C(_184_),
    .X(_029_));
 sky130_fd_sc_hd__a21boi_2 _359_ (.A1(_138_),
    .A2(_184_),
    .B1_N(_172_),
    .Y(_030_));
 sky130_fd_sc_hd__a21o_2 _360_ (.A1(\u_controller.counter_reg[0] ),
    .A2(_149_),
    .B1(\u_controller.dac_reg[0] ),
    .X(dac[0]));
 sky130_fd_sc_hd__a21o_2 _361_ (.A1(\u_controller.counter_reg[1] ),
    .A2(_149_),
    .B1(\u_controller.dac_reg[1] ),
    .X(dac[1]));
 sky130_fd_sc_hd__a21o_2 _362_ (.A1(\u_controller.counter_reg[2] ),
    .A2(_149_),
    .B1(\u_controller.dac_reg[2] ),
    .X(dac[2]));
 sky130_fd_sc_hd__a21o_2 _363_ (.A1(\u_controller.counter_reg[3] ),
    .A2(_149_),
    .B1(\u_controller.dac_reg[3] ),
    .X(dac[3]));
 sky130_fd_sc_hd__a21o_2 _364_ (.A1(\u_controller.counter_reg[4] ),
    .A2(_149_),
    .B1(\u_controller.dac_reg[4] ),
    .X(dac[4]));
 sky130_fd_sc_hd__a21o_2 _365_ (.A1(\u_controller.counter_reg[5] ),
    .A2(_149_),
    .B1(\u_controller.dac_reg[5] ),
    .X(dac[5]));
 sky130_fd_sc_hd__a21o_2 _366_ (.A1(\u_controller.counter_reg[6] ),
    .A2(_149_),
    .B1(\u_controller.dac_reg[6] ),
    .X(dac[6]));
 sky130_fd_sc_hd__a21o_2 _367_ (.A1(\u_controller.counter_reg[7] ),
    .A2(_149_),
    .B1(\u_controller.dac_reg[7] ),
    .X(dac[7]));
 sky130_fd_sc_hd__a21o_2 _368_ (.A1(\u_controller.counter_reg[8] ),
    .A2(_149_),
    .B1(\u_controller.dac_reg[8] ),
    .X(dac[8]));
 sky130_fd_sc_hd__a21o_2 _369_ (.A1(\u_controller.counter_reg[9] ),
    .A2(_149_),
    .B1(\u_controller.dac_reg[9] ),
    .X(dac[9]));
 sky130_fd_sc_hd__a21o_2 _370_ (.A1(\u_controller.counter_reg[10] ),
    .A2(_149_),
    .B1(\u_controller.dac_reg[10] ),
    .X(dac[10]));
 sky130_fd_sc_hd__a21o_2 _371_ (.A1(\u_controller.counter_reg[11] ),
    .A2(_149_),
    .B1(\u_controller.dac_reg[11] ),
    .X(dac[11]));
 sky130_fd_sc_hd__and2_2 _372_ (.A(eoc_flag),
    .B(bit_int_en),
    .X(irq));
 sky130_fd_sc_hd__a21o_2 _373_ (.A1(\u_spi.cmd[1] ),
    .A2(_142_),
    .B1(_155_),
    .X(_185_));
 sky130_fd_sc_hd__a22o_2 _374_ (.A1(\u_spi.pay[6] ),
    .A2(_156_),
    .B1(_185_),
    .B2(bit_clk_sel),
    .X(_047_));
 sky130_fd_sc_hd__a21o_2 _375_ (.A1(\u_spi.cmd[1] ),
    .A2(_143_),
    .B1(_155_),
    .X(_186_));
 sky130_fd_sc_hd__a22o_2 _376_ (.A1(\u_spi.pay[7] ),
    .A2(_156_),
    .B1(_186_),
    .B2(\ctrl_reg[7] ),
    .X(_048_));
 sky130_fd_sc_hd__a21o_2 _377_ (.A1(\u_spi.cmd[1] ),
    .A2(_144_),
    .B1(_155_),
    .X(_187_));
 sky130_fd_sc_hd__a22o_2 _378_ (.A1(\u_spi.pay[8] ),
    .A2(_156_),
    .B1(_187_),
    .B2(\ctrl_reg[8] ),
    .X(_049_));
 sky130_fd_sc_hd__a21o_2 _379_ (.A1(\u_spi.cmd[1] ),
    .A2(_145_),
    .B1(_155_),
    .X(_188_));
 sky130_fd_sc_hd__a22o_2 _380_ (.A1(\u_spi.pay[9] ),
    .A2(_156_),
    .B1(_188_),
    .B2(\ctrl_reg[9] ),
    .X(_050_));
 sky130_fd_sc_hd__a21o_2 _381_ (.A1(\u_spi.cmd[1] ),
    .A2(_146_),
    .B1(_155_),
    .X(_189_));
 sky130_fd_sc_hd__a22o_2 _382_ (.A1(\u_spi.pay[10] ),
    .A2(_156_),
    .B1(_189_),
    .B2(\ctrl_reg[10] ),
    .X(_051_));
 sky130_fd_sc_hd__a21o_2 _383_ (.A1(\u_spi.cmd[1] ),
    .A2(_147_),
    .B1(_155_),
    .X(_190_));
 sky130_fd_sc_hd__a22o_2 _384_ (.A1(\u_spi.pay[11] ),
    .A2(_156_),
    .B1(_190_),
    .B2(\ctrl_reg[11] ),
    .X(_052_));
 sky130_fd_sc_hd__nor2_2 _385_ (.A(cs),
    .B(\u_spi.state[1] ),
    .Y(_191_));
 sky130_fd_sc_hd__nand2b_2 _386_ (.A_N(\u_spi.state[1] ),
    .B(\u_spi.state[0] ),
    .Y(_192_));
 sky130_fd_sc_hd__and4b_2 _387_ (.A_N(\u_spi.sck_s1 ),
    .B(\u_spi.sck_s2 ),
    .C(_191_),
    .D(\u_spi.state[0] ),
    .X(_193_));
 sky130_fd_sc_hd__or4b_2 _388_ (.A(cs),
    .B(_192_),
    .C(\u_spi.sck_s1 ),
    .D_N(\u_spi.sck_s2 ),
    .X(_194_));
 sky130_fd_sc_hd__nor2_2 _389_ (.A(\u_spi.pay[0] ),
    .B(\u_spi.pay[1] ),
    .Y(_195_));
 sky130_fd_sc_hd__inv_2 _390_ (.A(_195_),
    .Y(_196_));
 sky130_fd_sc_hd__nor2_2 _391_ (.A(\u_spi.pay[0] ),
    .B(_135_),
    .Y(_197_));
 sky130_fd_sc_hd__nand2_2 _392_ (.A(_134_),
    .B(\u_spi.pay[1] ),
    .Y(_198_));
 sky130_fd_sc_hd__a22oi_2 _393_ (.A1(bit_en),
    .A2(_195_),
    .B1(_197_),
    .B2(\u_spi.data_reg[0] ),
    .Y(_199_));
 sky130_fd_sc_hd__or2_2 _394_ (.A(\u_spi.bit_cnt[1] ),
    .B(\u_spi.bit_cnt[0] ),
    .X(_200_));
 sky130_fd_sc_hd__or4b_2 _395_ (.A(cs),
    .B(\u_spi.bit_cnt[3] ),
    .C(\u_spi.bit_cnt[4] ),
    .D_N(\u_spi.bit_cnt[2] ),
    .X(_201_));
 sky130_fd_sc_hd__or4b_2 _396_ (.A(\u_spi.sck_s1 ),
    .B(\u_spi.bit_cnt[1] ),
    .C(\u_spi.bit_cnt[0] ),
    .D_N(\u_spi.sck_s2 ),
    .X(_202_));
 sky130_fd_sc_hd__or4_2 _397_ (.A(\u_spi.pay[3] ),
    .B(\u_spi.pay[2] ),
    .C(_201_),
    .D(_202_),
    .X(_203_));
 sky130_fd_sc_hd__inv_2 _398_ (.A(_203_),
    .Y(_204_));
 sky130_fd_sc_hd__or2_2 _399_ (.A(_192_),
    .B(_203_),
    .X(_205_));
 sky130_fd_sc_hd__a2bb2o_2 _400_ (.A1_N(_199_),
    .A2_N(_205_),
    .B1(\u_spi.miso_buffer[0] ),
    .B2(_194_),
    .X(_206_));
 sky130_fd_sc_hd__nand2_2 _401_ (.A(\u_spi.pay[0] ),
    .B(_135_),
    .Y(_207_));
 sky130_fd_sc_hd__nor2_2 _402_ (.A(_205_),
    .B(_207_),
    .Y(_208_));
 sky130_fd_sc_hd__a21o_2 _403_ (.A1(eoc_flag),
    .A2(_208_),
    .B1(_206_),
    .X(_053_));
 sky130_fd_sc_hd__o21a_2 _404_ (.A1(\u_spi.miso_buffer[0] ),
    .A2(_194_),
    .B1(_205_),
    .X(_209_));
 sky130_fd_sc_hd__o22a_2 _405_ (.A1(bit_start),
    .A2(_196_),
    .B1(_198_),
    .B2(\u_spi.data_reg[1] ),
    .X(_210_));
 sky130_fd_sc_hd__o311a_2 _406_ (.A1(\u_controller.state[0] ),
    .A2(\u_controller.state[1] ),
    .A3(_207_),
    .B1(_210_),
    .C1(_204_),
    .X(_211_));
 sky130_fd_sc_hd__o22a_2 _407_ (.A1(\u_spi.miso_buffer[1] ),
    .A2(_193_),
    .B1(_209_),
    .B2(_211_),
    .X(_054_));
 sky130_fd_sc_hd__o21a_2 _408_ (.A1(\u_spi.miso_buffer[1] ),
    .A2(_194_),
    .B1(_205_),
    .X(_212_));
 sky130_fd_sc_hd__a22o_2 _409_ (.A1(bit_auto),
    .A2(_195_),
    .B1(_197_),
    .B2(\u_spi.data_reg[2] ),
    .X(_213_));
 sky130_fd_sc_hd__and2_2 _410_ (.A(_204_),
    .B(_213_),
    .X(_214_));
 sky130_fd_sc_hd__o22a_2 _411_ (.A1(\u_spi.miso_buffer[2] ),
    .A2(_193_),
    .B1(_212_),
    .B2(_214_),
    .X(_055_));
 sky130_fd_sc_hd__or2_2 _412_ (.A(\u_spi.miso_buffer[2] ),
    .B(_194_),
    .X(_215_));
 sky130_fd_sc_hd__o221a_2 _413_ (.A1(\u_spi.pay[1] ),
    .A2(vref_sel),
    .B1(_198_),
    .B2(\u_spi.data_reg[3] ),
    .C1(_207_),
    .X(_216_));
 sky130_fd_sc_hd__a22o_2 _414_ (.A1(_205_),
    .A2(_215_),
    .B1(_216_),
    .B2(_204_),
    .X(_217_));
 sky130_fd_sc_hd__o21a_2 _415_ (.A1(\u_spi.miso_buffer[3] ),
    .A2(_193_),
    .B1(_217_),
    .X(_056_));
 sky130_fd_sc_hd__o21a_2 _416_ (.A1(\u_spi.miso_buffer[3] ),
    .A2(_194_),
    .B1(_205_),
    .X(_218_));
 sky130_fd_sc_hd__a22o_2 _417_ (.A1(bit_int_en),
    .A2(_195_),
    .B1(_197_),
    .B2(\u_spi.data_reg[4] ),
    .X(_219_));
 sky130_fd_sc_hd__and2_2 _418_ (.A(_204_),
    .B(_219_),
    .X(_220_));
 sky130_fd_sc_hd__o22a_2 _419_ (.A1(\u_spi.miso_buffer[4] ),
    .A2(_193_),
    .B1(_218_),
    .B2(_220_),
    .X(_057_));
 sky130_fd_sc_hd__o21a_2 _420_ (.A1(\u_spi.miso_buffer[4] ),
    .A2(_194_),
    .B1(_205_),
    .X(_221_));
 sky130_fd_sc_hd__a22o_2 _421_ (.A1(\ctrl_reg[5] ),
    .A2(_195_),
    .B1(_197_),
    .B2(\u_spi.data_reg[5] ),
    .X(_222_));
 sky130_fd_sc_hd__and2_2 _422_ (.A(_204_),
    .B(_222_),
    .X(_223_));
 sky130_fd_sc_hd__o22a_2 _423_ (.A1(\u_spi.miso_buffer[5] ),
    .A2(_193_),
    .B1(_221_),
    .B2(_223_),
    .X(_058_));
 sky130_fd_sc_hd__o21a_2 _424_ (.A1(\u_spi.miso_buffer[5] ),
    .A2(_194_),
    .B1(_205_),
    .X(_224_));
 sky130_fd_sc_hd__a22o_2 _425_ (.A1(bit_clk_sel),
    .A2(_195_),
    .B1(_197_),
    .B2(\u_spi.data_reg[6] ),
    .X(_225_));
 sky130_fd_sc_hd__and2_2 _426_ (.A(_204_),
    .B(_225_),
    .X(_226_));
 sky130_fd_sc_hd__o22a_2 _427_ (.A1(\u_spi.miso_buffer[6] ),
    .A2(_193_),
    .B1(_224_),
    .B2(_226_),
    .X(_059_));
 sky130_fd_sc_hd__o21a_2 _428_ (.A1(\u_spi.miso_buffer[6] ),
    .A2(_194_),
    .B1(_205_),
    .X(_227_));
 sky130_fd_sc_hd__a22o_2 _429_ (.A1(\ctrl_reg[7] ),
    .A2(_195_),
    .B1(_197_),
    .B2(\u_spi.data_reg[7] ),
    .X(_228_));
 sky130_fd_sc_hd__and2_2 _430_ (.A(_204_),
    .B(_228_),
    .X(_229_));
 sky130_fd_sc_hd__o22a_2 _431_ (.A1(\u_spi.miso_buffer[7] ),
    .A2(_193_),
    .B1(_227_),
    .B2(_229_),
    .X(_060_));
 sky130_fd_sc_hd__o21a_2 _432_ (.A1(\u_spi.miso_buffer[7] ),
    .A2(_194_),
    .B1(_205_),
    .X(_230_));
 sky130_fd_sc_hd__a22o_2 _433_ (.A1(\ctrl_reg[8] ),
    .A2(_195_),
    .B1(_197_),
    .B2(\u_spi.data_reg[8] ),
    .X(_231_));
 sky130_fd_sc_hd__and2_2 _434_ (.A(_204_),
    .B(_231_),
    .X(_232_));
 sky130_fd_sc_hd__o22a_2 _435_ (.A1(\u_spi.miso_buffer[8] ),
    .A2(_193_),
    .B1(_230_),
    .B2(_232_),
    .X(_061_));
 sky130_fd_sc_hd__o21a_2 _436_ (.A1(\u_spi.miso_buffer[8] ),
    .A2(_194_),
    .B1(_205_),
    .X(_233_));
 sky130_fd_sc_hd__a22o_2 _437_ (.A1(\ctrl_reg[9] ),
    .A2(_195_),
    .B1(_197_),
    .B2(\u_spi.data_reg[9] ),
    .X(_234_));
 sky130_fd_sc_hd__and2_2 _438_ (.A(_204_),
    .B(_234_),
    .X(_235_));
 sky130_fd_sc_hd__o22a_2 _439_ (.A1(\u_spi.miso_buffer[9] ),
    .A2(_193_),
    .B1(_233_),
    .B2(_235_),
    .X(_062_));
 sky130_fd_sc_hd__o21a_2 _440_ (.A1(\u_spi.miso_buffer[9] ),
    .A2(_194_),
    .B1(_205_),
    .X(_236_));
 sky130_fd_sc_hd__a22o_2 _441_ (.A1(\ctrl_reg[10] ),
    .A2(_195_),
    .B1(_197_),
    .B2(\u_spi.data_reg[10] ),
    .X(_237_));
 sky130_fd_sc_hd__and2_2 _442_ (.A(_204_),
    .B(_237_),
    .X(_238_));
 sky130_fd_sc_hd__o22a_2 _443_ (.A1(\u_spi.miso_buffer[10] ),
    .A2(_193_),
    .B1(_236_),
    .B2(_238_),
    .X(_063_));
 sky130_fd_sc_hd__o21a_2 _444_ (.A1(\u_spi.miso_buffer[10] ),
    .A2(_194_),
    .B1(_205_),
    .X(_239_));
 sky130_fd_sc_hd__a22o_2 _445_ (.A1(\ctrl_reg[11] ),
    .A2(_195_),
    .B1(_197_),
    .B2(\u_spi.data_reg[11] ),
    .X(_240_));
 sky130_fd_sc_hd__and2_2 _446_ (.A(_204_),
    .B(_240_),
    .X(_241_));
 sky130_fd_sc_hd__o22a_2 _447_ (.A1(\u_spi.miso_buffer[11] ),
    .A2(_193_),
    .B1(_239_),
    .B2(_241_),
    .X(_064_));
 sky130_fd_sc_hd__or4_2 _448_ (.A(\u_controller.counter_reg[9] ),
    .B(\u_controller.counter_reg[8] ),
    .C(\u_controller.counter_reg[11] ),
    .D(\u_controller.counter_reg[10] ),
    .X(_242_));
 sky130_fd_sc_hd__or4_2 _449_ (.A(\u_controller.counter_reg[5] ),
    .B(\u_controller.counter_reg[4] ),
    .C(\u_controller.counter_reg[7] ),
    .D(\u_controller.counter_reg[6] ),
    .X(_243_));
 sky130_fd_sc_hd__or3b_2 _450_ (.A(\u_controller.counter_reg[2] ),
    .B(_243_),
    .C_N(\u_controller.counter_reg[0] ),
    .X(_244_));
 sky130_fd_sc_hd__or4_2 _451_ (.A(\u_controller.counter_reg[1] ),
    .B(\u_controller.counter_reg[3] ),
    .C(_242_),
    .D(_244_),
    .X(_245_));
 sky130_fd_sc_hd__a211oi_2 _452_ (.A1(_149_),
    .A2(_245_),
    .B1(adc_en_n),
    .C1(dac_rst),
    .Y(_065_));
 sky130_fd_sc_hd__a21oi_2 _453_ (.A1(adc_en_n),
    .A2(_148_),
    .B1(_150_),
    .Y(_066_));
 sky130_fd_sc_hd__mux2_1 _454_ (.A0(\u_spi.eoc_sent_high ),
    .A1(eoc_flag),
    .S(_208_),
    .X(_067_));
 sky130_fd_sc_hd__xnor2_2 _455_ (.A(adc_clk_out),
    .B(_172_),
    .Y(_068_));
 sky130_fd_sc_hd__a21o_2 _456_ (.A1(\u_controller.counter_reg[0] ),
    .A2(comparator),
    .B1(\u_controller.dac_reg[0] ),
    .X(_246_));
 sky130_fd_sc_hd__o211a_2 _457_ (.A1(\u_controller.dac_reg[0] ),
    .A2(_149_),
    .B1(_246_),
    .C1(_148_),
    .X(_069_));
 sky130_fd_sc_hd__a21o_2 _458_ (.A1(\u_controller.counter_reg[1] ),
    .A2(comparator),
    .B1(\u_controller.dac_reg[1] ),
    .X(_247_));
 sky130_fd_sc_hd__o211a_2 _459_ (.A1(\u_controller.dac_reg[1] ),
    .A2(_149_),
    .B1(_247_),
    .C1(_148_),
    .X(_070_));
 sky130_fd_sc_hd__a21o_2 _460_ (.A1(\u_controller.counter_reg[2] ),
    .A2(comparator),
    .B1(\u_controller.dac_reg[2] ),
    .X(_248_));
 sky130_fd_sc_hd__o211a_2 _461_ (.A1(\u_controller.dac_reg[2] ),
    .A2(_149_),
    .B1(_248_),
    .C1(_148_),
    .X(_071_));
 sky130_fd_sc_hd__a21o_2 _462_ (.A1(\u_controller.counter_reg[3] ),
    .A2(comparator),
    .B1(\u_controller.dac_reg[3] ),
    .X(_249_));
 sky130_fd_sc_hd__o211a_2 _463_ (.A1(\u_controller.dac_reg[3] ),
    .A2(_149_),
    .B1(_249_),
    .C1(_148_),
    .X(_072_));
 sky130_fd_sc_hd__a21o_2 _464_ (.A1(\u_controller.counter_reg[4] ),
    .A2(comparator),
    .B1(\u_controller.dac_reg[4] ),
    .X(_250_));
 sky130_fd_sc_hd__o211a_2 _465_ (.A1(\u_controller.dac_reg[4] ),
    .A2(_149_),
    .B1(_250_),
    .C1(_148_),
    .X(_073_));
 sky130_fd_sc_hd__a21o_2 _466_ (.A1(\u_controller.counter_reg[5] ),
    .A2(comparator),
    .B1(\u_controller.dac_reg[5] ),
    .X(_251_));
 sky130_fd_sc_hd__o211a_2 _467_ (.A1(\u_controller.dac_reg[5] ),
    .A2(_149_),
    .B1(_251_),
    .C1(_148_),
    .X(_074_));
 sky130_fd_sc_hd__a21o_2 _468_ (.A1(\u_controller.counter_reg[6] ),
    .A2(comparator),
    .B1(\u_controller.dac_reg[6] ),
    .X(_252_));
 sky130_fd_sc_hd__o211a_2 _469_ (.A1(\u_controller.dac_reg[6] ),
    .A2(_149_),
    .B1(_252_),
    .C1(_148_),
    .X(_075_));
 sky130_fd_sc_hd__a21o_2 _470_ (.A1(\u_controller.counter_reg[7] ),
    .A2(comparator),
    .B1(\u_controller.dac_reg[7] ),
    .X(_253_));
 sky130_fd_sc_hd__o211a_2 _471_ (.A1(\u_controller.dac_reg[7] ),
    .A2(_149_),
    .B1(_253_),
    .C1(_148_),
    .X(_076_));
 sky130_fd_sc_hd__a21o_2 _472_ (.A1(\u_controller.counter_reg[8] ),
    .A2(comparator),
    .B1(\u_controller.dac_reg[8] ),
    .X(_254_));
 sky130_fd_sc_hd__o211a_2 _473_ (.A1(\u_controller.dac_reg[8] ),
    .A2(_149_),
    .B1(_254_),
    .C1(_148_),
    .X(_077_));
 sky130_fd_sc_hd__a21o_2 _474_ (.A1(\u_controller.counter_reg[9] ),
    .A2(comparator),
    .B1(\u_controller.dac_reg[9] ),
    .X(_255_));
 sky130_fd_sc_hd__o211a_2 _475_ (.A1(\u_controller.dac_reg[9] ),
    .A2(_149_),
    .B1(_255_),
    .C1(_148_),
    .X(_078_));
 sky130_fd_sc_hd__a21o_2 _476_ (.A1(\u_controller.counter_reg[10] ),
    .A2(comparator),
    .B1(\u_controller.dac_reg[10] ),
    .X(_256_));
 sky130_fd_sc_hd__o211a_2 _477_ (.A1(\u_controller.dac_reg[10] ),
    .A2(_149_),
    .B1(_256_),
    .C1(_148_),
    .X(_079_));
 sky130_fd_sc_hd__a21o_2 _478_ (.A1(\u_controller.counter_reg[11] ),
    .A2(comparator),
    .B1(\u_controller.dac_reg[11] ),
    .X(_257_));
 sky130_fd_sc_hd__o211a_2 _479_ (.A1(\u_controller.dac_reg[11] ),
    .A2(_149_),
    .B1(_257_),
    .C1(_148_),
    .X(_080_));
 sky130_fd_sc_hd__a22o_2 _480_ (.A1(\u_controller.counter_reg[1] ),
    .A2(_149_),
    .B1(_150_),
    .B2(\u_controller.counter_reg[0] ),
    .X(_081_));
 sky130_fd_sc_hd__a22o_2 _481_ (.A1(\u_controller.counter_reg[2] ),
    .A2(_149_),
    .B1(_150_),
    .B2(\u_controller.counter_reg[1] ),
    .X(_082_));
 sky130_fd_sc_hd__a22o_2 _482_ (.A1(\u_controller.counter_reg[3] ),
    .A2(_149_),
    .B1(_150_),
    .B2(\u_controller.counter_reg[2] ),
    .X(_083_));
 sky130_fd_sc_hd__a22o_2 _483_ (.A1(\u_controller.counter_reg[4] ),
    .A2(_149_),
    .B1(_150_),
    .B2(\u_controller.counter_reg[3] ),
    .X(_084_));
 sky130_fd_sc_hd__a22o_2 _484_ (.A1(\u_controller.counter_reg[5] ),
    .A2(_149_),
    .B1(_150_),
    .B2(\u_controller.counter_reg[4] ),
    .X(_085_));
 sky130_fd_sc_hd__a22o_2 _485_ (.A1(\u_controller.counter_reg[6] ),
    .A2(_149_),
    .B1(_150_),
    .B2(\u_controller.counter_reg[5] ),
    .X(_086_));
 sky130_fd_sc_hd__a22o_2 _486_ (.A1(\u_controller.counter_reg[7] ),
    .A2(_149_),
    .B1(_150_),
    .B2(\u_controller.counter_reg[6] ),
    .X(_087_));
 sky130_fd_sc_hd__a22o_2 _487_ (.A1(\u_controller.counter_reg[8] ),
    .A2(_149_),
    .B1(_150_),
    .B2(\u_controller.counter_reg[7] ),
    .X(_088_));
 sky130_fd_sc_hd__a22o_2 _488_ (.A1(\u_controller.counter_reg[9] ),
    .A2(_149_),
    .B1(_150_),
    .B2(\u_controller.counter_reg[8] ),
    .X(_089_));
 sky130_fd_sc_hd__a22o_2 _489_ (.A1(\u_controller.counter_reg[10] ),
    .A2(_149_),
    .B1(_150_),
    .B2(\u_controller.counter_reg[9] ),
    .X(_090_));
 sky130_fd_sc_hd__a22o_2 _490_ (.A1(\u_controller.counter_reg[11] ),
    .A2(_149_),
    .B1(_150_),
    .B2(\u_controller.counter_reg[10] ),
    .X(_091_));
 sky130_fd_sc_hd__o21ba_2 _491_ (.A1(\u_controller.counter_reg[11] ),
    .A2(dac_rst),
    .B1_N(_149_),
    .X(_092_));
 sky130_fd_sc_hd__nor3b_2 _492_ (.A(_245_),
    .B(\u_controller.state[0] ),
    .C_N(\u_controller.state[1] ),
    .Y(_258_));
 sky130_fd_sc_hd__mux2_1 _493_ (.A0(\adc_data_out[0] ),
    .A1(_246_),
    .S(_258_),
    .X(_093_));
 sky130_fd_sc_hd__mux2_1 _494_ (.A0(\adc_data_out[1] ),
    .A1(_247_),
    .S(_258_),
    .X(_094_));
 sky130_fd_sc_hd__mux2_1 _495_ (.A0(\adc_data_out[2] ),
    .A1(_248_),
    .S(_258_),
    .X(_095_));
 sky130_fd_sc_hd__mux2_1 _496_ (.A0(\adc_data_out[3] ),
    .A1(_249_),
    .S(_258_),
    .X(_096_));
 sky130_fd_sc_hd__mux2_1 _497_ (.A0(\adc_data_out[4] ),
    .A1(_250_),
    .S(_258_),
    .X(_097_));
 sky130_fd_sc_hd__mux2_1 _498_ (.A0(\adc_data_out[5] ),
    .A1(_251_),
    .S(_258_),
    .X(_098_));
 sky130_fd_sc_hd__mux2_1 _499_ (.A0(\adc_data_out[6] ),
    .A1(_252_),
    .S(_258_),
    .X(_099_));
 sky130_fd_sc_hd__mux2_1 _500_ (.A0(\adc_data_out[7] ),
    .A1(_253_),
    .S(_258_),
    .X(_100_));
 sky130_fd_sc_hd__mux2_1 _501_ (.A0(\adc_data_out[8] ),
    .A1(_254_),
    .S(_258_),
    .X(_101_));
 sky130_fd_sc_hd__mux2_1 _502_ (.A0(\adc_data_out[9] ),
    .A1(_255_),
    .S(_258_),
    .X(_102_));
 sky130_fd_sc_hd__mux2_1 _503_ (.A0(\adc_data_out[10] ),
    .A1(_256_),
    .S(_258_),
    .X(_103_));
 sky130_fd_sc_hd__mux2_1 _504_ (.A0(\adc_data_out[11] ),
    .A1(_257_),
    .S(_258_),
    .X(_104_));
 sky130_fd_sc_hd__nand2_2 _505_ (.A(\u_spi.state[0] ),
    .B(\u_spi.sck_s1 ),
    .Y(_259_));
 sky130_fd_sc_hd__and4b_2 _506_ (.A_N(\u_spi.sck_s2 ),
    .B(_191_),
    .C(\u_spi.state[0] ),
    .D(\u_spi.sck_s1 ),
    .X(_260_));
 sky130_fd_sc_hd__or3b_2 _507_ (.A(_259_),
    .B(\u_spi.sck_s2 ),
    .C_N(_191_),
    .X(_261_));
 sky130_fd_sc_hd__mux2_1 _508_ (.A0(\u_spi.pay[0] ),
    .A1(mosi),
    .S(_260_),
    .X(_105_));
 sky130_fd_sc_hd__mux2_1 _509_ (.A0(\u_spi.pay[0] ),
    .A1(\u_spi.pay[1] ),
    .S(_261_),
    .X(_106_));
 sky130_fd_sc_hd__mux2_1 _510_ (.A0(\u_spi.pay[1] ),
    .A1(\u_spi.pay[2] ),
    .S(_261_),
    .X(_107_));
 sky130_fd_sc_hd__mux2_1 _511_ (.A0(\u_spi.pay[3] ),
    .A1(\u_spi.pay[2] ),
    .S(_260_),
    .X(_108_));
 sky130_fd_sc_hd__mux2_1 _512_ (.A0(\u_spi.pay[3] ),
    .A1(\u_spi.pay[4] ),
    .S(_261_),
    .X(_109_));
 sky130_fd_sc_hd__mux2_1 _513_ (.A0(\u_spi.pay[4] ),
    .A1(\u_spi.pay[5] ),
    .S(_261_),
    .X(_110_));
 sky130_fd_sc_hd__mux2_1 _514_ (.A0(\u_spi.pay[5] ),
    .A1(\u_spi.pay[6] ),
    .S(_261_),
    .X(_111_));
 sky130_fd_sc_hd__mux2_1 _515_ (.A0(\u_spi.pay[6] ),
    .A1(\u_spi.pay[7] ),
    .S(_261_),
    .X(_112_));
 sky130_fd_sc_hd__mux2_1 _516_ (.A0(\u_spi.pay[7] ),
    .A1(\u_spi.pay[8] ),
    .S(_261_),
    .X(_113_));
 sky130_fd_sc_hd__mux2_1 _517_ (.A0(\u_spi.pay[8] ),
    .A1(\u_spi.pay[9] ),
    .S(_261_),
    .X(_114_));
 sky130_fd_sc_hd__mux2_1 _518_ (.A0(\u_spi.pay[9] ),
    .A1(\u_spi.pay[10] ),
    .S(_261_),
    .X(_115_));
 sky130_fd_sc_hd__mux2_1 _519_ (.A0(\u_spi.pay[10] ),
    .A1(\u_spi.pay[11] ),
    .S(_261_),
    .X(_116_));
 sky130_fd_sc_hd__mux2_1 _520_ (.A0(\u_spi.addr[0] ),
    .A1(\u_spi.pay[11] ),
    .S(_260_),
    .X(_117_));
 sky130_fd_sc_hd__mux2_1 _521_ (.A0(\u_spi.addr[0] ),
    .A1(\u_spi.addr[1] ),
    .S(_261_),
    .X(_118_));
 sky130_fd_sc_hd__mux2_1 _522_ (.A0(\u_spi.cmd[0] ),
    .A1(\u_spi.addr[1] ),
    .S(_260_),
    .X(_119_));
 sky130_fd_sc_hd__mux2_1 _523_ (.A0(\u_spi.cmd[0] ),
    .A1(\u_spi.cmd[1] ),
    .S(_261_),
    .X(_120_));
 sky130_fd_sc_hd__and2_2 _524_ (.A(_152_),
    .B(_261_),
    .X(_262_));
 sky130_fd_sc_hd__and2b_2 _525_ (.A_N(\u_spi.bit_cnt[0] ),
    .B(\u_spi.state[0] ),
    .X(_263_));
 sky130_fd_sc_hd__o22a_2 _526_ (.A1(\u_spi.bit_cnt[0] ),
    .A2(_260_),
    .B1(_262_),
    .B2(_263_),
    .X(_121_));
 sky130_fd_sc_hd__nand2_2 _527_ (.A(\u_spi.bit_cnt[1] ),
    .B(\u_spi.bit_cnt[0] ),
    .Y(_264_));
 sky130_fd_sc_hd__a32o_2 _528_ (.A1(_200_),
    .A2(_260_),
    .A3(_264_),
    .B1(_262_),
    .B2(\u_spi.bit_cnt[1] ),
    .X(_122_));
 sky130_fd_sc_hd__and3_2 _529_ (.A(\u_spi.bit_cnt[1] ),
    .B(\u_spi.bit_cnt[0] ),
    .C(\u_spi.bit_cnt[2] ),
    .X(_265_));
 sky130_fd_sc_hd__a2bb2o_2 _530_ (.A1_N(_192_),
    .A2_N(_265_),
    .B1(_261_),
    .B2(_152_),
    .X(_266_));
 sky130_fd_sc_hd__nor2_2 _531_ (.A(_262_),
    .B(_264_),
    .Y(_267_));
 sky130_fd_sc_hd__o21a_2 _532_ (.A1(\u_spi.bit_cnt[2] ),
    .A2(_267_),
    .B1(_266_),
    .X(_123_));
 sky130_fd_sc_hd__or3b_2 _533_ (.A(\u_spi.bit_cnt[3] ),
    .B(_261_),
    .C_N(_265_),
    .X(_268_));
 sky130_fd_sc_hd__a21bo_2 _534_ (.A1(\u_spi.bit_cnt[3] ),
    .A2(_266_),
    .B1_N(_268_),
    .X(_124_));
 sky130_fd_sc_hd__nand2_2 _535_ (.A(\u_spi.bit_cnt[3] ),
    .B(_265_),
    .Y(_269_));
 sky130_fd_sc_hd__or4_2 _536_ (.A(\u_spi.sck_s2 ),
    .B(\u_spi.bit_cnt[4] ),
    .C(_259_),
    .D(_269_),
    .X(_270_));
 sky130_fd_sc_hd__nor3_2 _537_ (.A(cs),
    .B(\u_spi.state[1] ),
    .C(_270_),
    .Y(_127_));
 sky130_fd_sc_hd__a21o_2 _538_ (.A1(_260_),
    .A2(_269_),
    .B1(_262_),
    .X(_271_));
 sky130_fd_sc_hd__a21o_2 _539_ (.A1(\u_spi.bit_cnt[4] ),
    .A2(_271_),
    .B1(_127_),
    .X(_125_));
 sky130_fd_sc_hd__and2_2 _540_ (.A(_191_),
    .B(_270_),
    .X(_126_));
 sky130_fd_sc_hd__o21ai_2 _541_ (.A1(\u_spi.addr[1] ),
    .A2(_139_),
    .B1(\u_spi.addr[0] ),
    .Y(_272_));
 sky130_fd_sc_hd__or4b_2 _542_ (.A(\u_spi.state[0] ),
    .B(\u_spi.cmd[0] ),
    .C(\u_spi.cmd[1] ),
    .D_N(\u_spi.state[1] ),
    .X(_273_));
 sky130_fd_sc_hd__o21ai_2 _543_ (.A1(\u_spi.addr[0] ),
    .A2(\u_spi.addr[1] ),
    .B1(_272_),
    .Y(_274_));
 sky130_fd_sc_hd__o21ai_2 _544_ (.A1(_273_),
    .A2(_274_),
    .B1(eoc_flag),
    .Y(_275_));
 sky130_fd_sc_hd__a21oi_2 _545_ (.A1(_151_),
    .A2(_275_),
    .B1(start_clear_req),
    .Y(_128_));
 sky130_fd_sc_hd__a21o_2 _546_ (.A1(_134_),
    .A2(\u_spi.cmd[1] ),
    .B1(_155_),
    .X(_276_));
 sky130_fd_sc_hd__a22o_2 _547_ (.A1(\u_spi.pay[0] ),
    .A2(_156_),
    .B1(_276_),
    .B2(bit_en),
    .X(_129_));
 sky130_fd_sc_hd__a21o_2 _548_ (.A1(_137_),
    .A2(\u_spi.cmd[1] ),
    .B1(_155_),
    .X(_277_));
 sky130_fd_sc_hd__a22o_2 _549_ (.A1(\u_spi.pay[2] ),
    .A2(_156_),
    .B1(_277_),
    .B2(bit_auto),
    .X(_130_));
 sky130_fd_sc_hd__a21o_2 _550_ (.A1(_136_),
    .A2(\u_spi.cmd[1] ),
    .B1(_155_),
    .X(_278_));
 sky130_fd_sc_hd__a22o_2 _551_ (.A1(\u_spi.pay[3] ),
    .A2(_156_),
    .B1(_278_),
    .B2(vref_sel),
    .X(_131_));
 sky130_fd_sc_hd__a21o_2 _552_ (.A1(\u_spi.cmd[1] ),
    .A2(_140_),
    .B1(_155_),
    .X(_279_));
 sky130_fd_sc_hd__a22o_2 _553_ (.A1(\u_spi.pay[4] ),
    .A2(_156_),
    .B1(_279_),
    .B2(bit_int_en),
    .X(_132_));
 sky130_fd_sc_hd__a21o_2 _554_ (.A1(\u_spi.cmd[1] ),
    .A2(_141_),
    .B1(_155_),
    .X(_280_));
 sky130_fd_sc_hd__a22o_2 _555_ (.A1(\u_spi.pay[5] ),
    .A2(_156_),
    .B1(_280_),
    .B2(\ctrl_reg[5] ),
    .X(_133_));
 sky130_fd_sc_hd__buf_1 _556_ (.A(cs),
    .X(_281_));
 sky130_fd_sc_hd__dfrtp_2 _557_ (.CLK(sys_clk),
    .D(_047_),
    .RESET_B(reset_),
    .Q(bit_clk_sel));
 sky130_fd_sc_hd__dfrtp_2 _558_ (.CLK(sys_clk),
    .D(_048_),
    .RESET_B(reset_),
    .Q(\ctrl_reg[7] ));
 sky130_fd_sc_hd__dfrtp_2 _559_ (.CLK(sys_clk),
    .D(_049_),
    .RESET_B(reset_),
    .Q(\ctrl_reg[8] ));
 sky130_fd_sc_hd__dfrtp_2 _560_ (.CLK(sys_clk),
    .D(_050_),
    .RESET_B(reset_),
    .Q(\ctrl_reg[9] ));
 sky130_fd_sc_hd__dfrtp_2 _561_ (.CLK(sys_clk),
    .D(_051_),
    .RESET_B(reset_),
    .Q(\ctrl_reg[10] ));
 sky130_fd_sc_hd__dfrtp_2 _562_ (.CLK(sys_clk),
    .D(_052_),
    .RESET_B(reset_),
    .Q(\ctrl_reg[11] ));
 sky130_fd_sc_hd__dfrtp_2 _563_ (.CLK(sys_clk),
    .D(_053_),
    .RESET_B(reset_),
    .Q(\u_spi.miso_buffer[0] ));
 sky130_fd_sc_hd__dfrtp_2 _564_ (.CLK(sys_clk),
    .D(_054_),
    .RESET_B(reset_),
    .Q(\u_spi.miso_buffer[1] ));
 sky130_fd_sc_hd__dfrtp_2 _565_ (.CLK(sys_clk),
    .D(_055_),
    .RESET_B(reset_),
    .Q(\u_spi.miso_buffer[2] ));
 sky130_fd_sc_hd__dfrtp_2 _566_ (.CLK(sys_clk),
    .D(_056_),
    .RESET_B(reset_),
    .Q(\u_spi.miso_buffer[3] ));
 sky130_fd_sc_hd__dfrtp_2 _567_ (.CLK(sys_clk),
    .D(_057_),
    .RESET_B(reset_),
    .Q(\u_spi.miso_buffer[4] ));
 sky130_fd_sc_hd__dfrtp_2 _568_ (.CLK(sys_clk),
    .D(_058_),
    .RESET_B(reset_),
    .Q(\u_spi.miso_buffer[5] ));
 sky130_fd_sc_hd__dfrtp_2 _569_ (.CLK(sys_clk),
    .D(_059_),
    .RESET_B(reset_),
    .Q(\u_spi.miso_buffer[6] ));
 sky130_fd_sc_hd__dfrtp_2 _570_ (.CLK(sys_clk),
    .D(_060_),
    .RESET_B(reset_),
    .Q(\u_spi.miso_buffer[7] ));
 sky130_fd_sc_hd__dfrtp_2 _571_ (.CLK(sys_clk),
    .D(_061_),
    .RESET_B(reset_),
    .Q(\u_spi.miso_buffer[8] ));
 sky130_fd_sc_hd__dfrtp_2 _572_ (.CLK(sys_clk),
    .D(_062_),
    .RESET_B(reset_),
    .Q(\u_spi.miso_buffer[9] ));
 sky130_fd_sc_hd__dfrtp_2 _573_ (.CLK(sys_clk),
    .D(_063_),
    .RESET_B(reset_),
    .Q(\u_spi.miso_buffer[10] ));
 sky130_fd_sc_hd__dfrtp_2 _574_ (.CLK(sys_clk),
    .D(_064_),
    .RESET_B(reset_),
    .Q(\u_spi.miso_buffer[11] ));
 sky130_fd_sc_hd__dfrtp_2 _575_ (.CLK(adc_clk_out),
    .D(_065_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\u_controller.state[0] ));
 sky130_fd_sc_hd__dfrtp_2 _576_ (.CLK(adc_clk_out),
    .D(_066_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\u_controller.state[1] ));
 sky130_fd_sc_hd__dfrtp_2 _577_ (.CLK(sys_clk),
    .D(\u_spi.eoc_s1 ),
    .RESET_B(reset_),
    .Q(\u_spi.eoc_s2 ));
 sky130_fd_sc_hd__dfstp_2 _578_ (.CLK(sys_clk),
    .D(_000_),
    .SET_B(reset_),
    .Q(adc_en_n));
 sky130_fd_sc_hd__dfrtp_2 _579_ (.CLK(sys_clk),
    .D(_033_),
    .RESET_B(reset_),
    .Q(start_clear_req));
 sky130_fd_sc_hd__dfrtp_2 _580_ (.CLK(sys_clk),
    .D(_001_),
    .RESET_B(reset_),
    .Q(\clk_cnt[0] ));
 sky130_fd_sc_hd__dfrtp_2 _581_ (.CLK(sys_clk),
    .D(_012_),
    .RESET_B(reset_),
    .Q(\clk_cnt[1] ));
 sky130_fd_sc_hd__dfrtp_2 _582_ (.CLK(sys_clk),
    .D(_023_),
    .RESET_B(reset_),
    .Q(\clk_cnt[2] ));
 sky130_fd_sc_hd__dfrtp_2 _583_ (.CLK(sys_clk),
    .D(_026_),
    .RESET_B(reset_),
    .Q(\clk_cnt[3] ));
 sky130_fd_sc_hd__dfrtp_2 _584_ (.CLK(sys_clk),
    .D(_027_),
    .RESET_B(reset_),
    .Q(\clk_cnt[4] ));
 sky130_fd_sc_hd__dfrtp_2 _585_ (.CLK(sys_clk),
    .D(_028_),
    .RESET_B(reset_),
    .Q(\clk_cnt[5] ));
 sky130_fd_sc_hd__dfrtp_2 _586_ (.CLK(sys_clk),
    .D(_029_),
    .RESET_B(reset_),
    .Q(\clk_cnt[6] ));
 sky130_fd_sc_hd__dfrtp_2 _587_ (.CLK(sys_clk),
    .D(_030_),
    .RESET_B(reset_),
    .Q(\clk_cnt[7] ));
 sky130_fd_sc_hd__dfrtp_2 _588_ (.CLK(sys_clk),
    .D(_031_),
    .RESET_B(reset_),
    .Q(\clk_cnt[8] ));
 sky130_fd_sc_hd__dfrtp_2 _589_ (.CLK(sys_clk),
    .D(_032_),
    .RESET_B(reset_),
    .Q(\clk_cnt[9] ));
 sky130_fd_sc_hd__dfrtp_2 _590_ (.CLK(sys_clk),
    .D(_002_),
    .RESET_B(reset_),
    .Q(\clk_cnt[10] ));
 sky130_fd_sc_hd__dfrtp_2 _591_ (.CLK(sys_clk),
    .D(_003_),
    .RESET_B(reset_),
    .Q(\clk_cnt[11] ));
 sky130_fd_sc_hd__dfrtp_2 _592_ (.CLK(sys_clk),
    .D(_004_),
    .RESET_B(reset_),
    .Q(\clk_cnt[12] ));
 sky130_fd_sc_hd__dfrtp_2 _593_ (.CLK(sys_clk),
    .D(_005_),
    .RESET_B(reset_),
    .Q(\clk_cnt[13] ));
 sky130_fd_sc_hd__dfrtp_2 _594_ (.CLK(sys_clk),
    .D(_006_),
    .RESET_B(reset_),
    .Q(\clk_cnt[14] ));
 sky130_fd_sc_hd__dfrtp_2 _595_ (.CLK(sys_clk),
    .D(_007_),
    .RESET_B(reset_),
    .Q(\clk_cnt[15] ));
 sky130_fd_sc_hd__dfrtp_2 _596_ (.CLK(sys_clk),
    .D(_008_),
    .RESET_B(reset_),
    .Q(\clk_cnt[16] ));
 sky130_fd_sc_hd__dfrtp_2 _597_ (.CLK(sys_clk),
    .D(_009_),
    .RESET_B(reset_),
    .Q(\clk_cnt[17] ));
 sky130_fd_sc_hd__dfrtp_2 _598_ (.CLK(sys_clk),
    .D(_010_),
    .RESET_B(reset_),
    .Q(\clk_cnt[18] ));
 sky130_fd_sc_hd__dfrtp_2 _599_ (.CLK(sys_clk),
    .D(_011_),
    .RESET_B(reset_),
    .Q(\clk_cnt[19] ));
 sky130_fd_sc_hd__dfrtp_2 _600_ (.CLK(sys_clk),
    .D(_013_),
    .RESET_B(reset_),
    .Q(\clk_cnt[20] ));
 sky130_fd_sc_hd__dfrtp_2 _601_ (.CLK(sys_clk),
    .D(_014_),
    .RESET_B(reset_),
    .Q(\clk_cnt[21] ));
 sky130_fd_sc_hd__dfrtp_2 _602_ (.CLK(sys_clk),
    .D(_015_),
    .RESET_B(reset_),
    .Q(\clk_cnt[22] ));
 sky130_fd_sc_hd__dfrtp_2 _603_ (.CLK(sys_clk),
    .D(_016_),
    .RESET_B(reset_),
    .Q(\clk_cnt[23] ));
 sky130_fd_sc_hd__dfrtp_2 _604_ (.CLK(sys_clk),
    .D(_017_),
    .RESET_B(reset_),
    .Q(\clk_cnt[24] ));
 sky130_fd_sc_hd__dfrtp_2 _605_ (.CLK(sys_clk),
    .D(_018_),
    .RESET_B(reset_),
    .Q(\clk_cnt[25] ));
 sky130_fd_sc_hd__dfrtp_2 _606_ (.CLK(sys_clk),
    .D(_019_),
    .RESET_B(reset_),
    .Q(\clk_cnt[26] ));
 sky130_fd_sc_hd__dfrtp_2 _607_ (.CLK(sys_clk),
    .D(_020_),
    .RESET_B(reset_),
    .Q(\clk_cnt[27] ));
 sky130_fd_sc_hd__dfrtp_2 _608_ (.CLK(sys_clk),
    .D(_021_),
    .RESET_B(reset_),
    .Q(\clk_cnt[28] ));
 sky130_fd_sc_hd__dfrtp_2 _609_ (.CLK(sys_clk),
    .D(_022_),
    .RESET_B(reset_),
    .Q(\clk_cnt[29] ));
 sky130_fd_sc_hd__dfrtp_2 _610_ (.CLK(sys_clk),
    .D(_024_),
    .RESET_B(reset_),
    .Q(\clk_cnt[30] ));
 sky130_fd_sc_hd__dfrtp_2 _611_ (.CLK(sys_clk),
    .D(_025_),
    .RESET_B(reset_),
    .Q(\clk_cnt[31] ));
 sky130_fd_sc_hd__dfrtp_2 _612_ (.CLK(sys_clk),
    .D(_067_),
    .RESET_B(reset_),
    .Q(\u_spi.eoc_sent_high ));
 sky130_fd_sc_hd__dfrtp_2 _613_ (.CLK(sys_clk),
    .D(_068_),
    .RESET_B(reset_),
    .Q(adc_clk_out));
 sky130_fd_sc_hd__dfrtp_2 _614_ (.CLK(adc_clk_out),
    .D(_069_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\u_controller.dac_reg[0] ));
 sky130_fd_sc_hd__dfrtp_2 _615_ (.CLK(adc_clk_out),
    .D(_070_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\u_controller.dac_reg[1] ));
 sky130_fd_sc_hd__dfrtp_2 _616_ (.CLK(adc_clk_out),
    .D(_071_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\u_controller.dac_reg[2] ));
 sky130_fd_sc_hd__dfrtp_2 _617_ (.CLK(adc_clk_out),
    .D(_072_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\u_controller.dac_reg[3] ));
 sky130_fd_sc_hd__dfrtp_2 _618_ (.CLK(adc_clk_out),
    .D(_073_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\u_controller.dac_reg[4] ));
 sky130_fd_sc_hd__dfrtp_2 _619_ (.CLK(adc_clk_out),
    .D(_074_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\u_controller.dac_reg[5] ));
 sky130_fd_sc_hd__dfrtp_2 _620_ (.CLK(adc_clk_out),
    .D(_075_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\u_controller.dac_reg[6] ));
 sky130_fd_sc_hd__dfrtp_2 _621_ (.CLK(adc_clk_out),
    .D(_076_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\u_controller.dac_reg[7] ));
 sky130_fd_sc_hd__dfrtp_2 _622_ (.CLK(adc_clk_out),
    .D(_077_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\u_controller.dac_reg[8] ));
 sky130_fd_sc_hd__dfrtp_2 _623_ (.CLK(adc_clk_out),
    .D(_078_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\u_controller.dac_reg[9] ));
 sky130_fd_sc_hd__dfrtp_2 _624_ (.CLK(adc_clk_out),
    .D(_079_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\u_controller.dac_reg[10] ));
 sky130_fd_sc_hd__dfrtp_2 _625_ (.CLK(adc_clk_out),
    .D(_080_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\u_controller.dac_reg[11] ));
 sky130_fd_sc_hd__dfrtp_2 _626_ (.CLK(adc_clk_out),
    .D(_081_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\u_controller.counter_reg[0] ));
 sky130_fd_sc_hd__dfrtp_2 _627_ (.CLK(adc_clk_out),
    .D(_082_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\u_controller.counter_reg[1] ));
 sky130_fd_sc_hd__dfrtp_2 _628_ (.CLK(adc_clk_out),
    .D(_083_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\u_controller.counter_reg[2] ));
 sky130_fd_sc_hd__dfrtp_2 _629_ (.CLK(adc_clk_out),
    .D(_084_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\u_controller.counter_reg[3] ));
 sky130_fd_sc_hd__dfrtp_2 _630_ (.CLK(adc_clk_out),
    .D(_085_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\u_controller.counter_reg[4] ));
 sky130_fd_sc_hd__dfrtp_2 _631_ (.CLK(adc_clk_out),
    .D(_086_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\u_controller.counter_reg[5] ));
 sky130_fd_sc_hd__dfrtp_2 _632_ (.CLK(adc_clk_out),
    .D(_087_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\u_controller.counter_reg[6] ));
 sky130_fd_sc_hd__dfrtp_2 _633_ (.CLK(adc_clk_out),
    .D(_088_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\u_controller.counter_reg[7] ));
 sky130_fd_sc_hd__dfrtp_2 _634_ (.CLK(adc_clk_out),
    .D(_089_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\u_controller.counter_reg[8] ));
 sky130_fd_sc_hd__dfrtp_2 _635_ (.CLK(adc_clk_out),
    .D(_090_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\u_controller.counter_reg[9] ));
 sky130_fd_sc_hd__dfrtp_2 _636_ (.CLK(adc_clk_out),
    .D(_091_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\u_controller.counter_reg[10] ));
 sky130_fd_sc_hd__dfrtp_2 _637_ (.CLK(adc_clk_out),
    .D(_092_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\u_controller.counter_reg[11] ));
 sky130_fd_sc_hd__dfrtp_2 _638_ (.CLK(adc_clk_out),
    .D(_093_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\adc_data_out[0] ));
 sky130_fd_sc_hd__dfrtp_2 _639_ (.CLK(adc_clk_out),
    .D(_094_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\adc_data_out[1] ));
 sky130_fd_sc_hd__dfrtp_2 _640_ (.CLK(adc_clk_out),
    .D(_095_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\adc_data_out[2] ));
 sky130_fd_sc_hd__dfrtp_2 _641_ (.CLK(adc_clk_out),
    .D(_096_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\adc_data_out[3] ));
 sky130_fd_sc_hd__dfrtp_2 _642_ (.CLK(adc_clk_out),
    .D(_097_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\adc_data_out[4] ));
 sky130_fd_sc_hd__dfrtp_2 _643_ (.CLK(adc_clk_out),
    .D(_098_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\adc_data_out[5] ));
 sky130_fd_sc_hd__dfrtp_2 _644_ (.CLK(adc_clk_out),
    .D(_099_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\adc_data_out[6] ));
 sky130_fd_sc_hd__dfrtp_2 _645_ (.CLK(adc_clk_out),
    .D(_100_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\adc_data_out[7] ));
 sky130_fd_sc_hd__dfrtp_2 _646_ (.CLK(adc_clk_out),
    .D(_101_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\adc_data_out[8] ));
 sky130_fd_sc_hd__dfrtp_2 _647_ (.CLK(adc_clk_out),
    .D(_102_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\adc_data_out[9] ));
 sky130_fd_sc_hd__dfrtp_2 _648_ (.CLK(adc_clk_out),
    .D(_103_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\adc_data_out[10] ));
 sky130_fd_sc_hd__dfrtp_2 _649_ (.CLK(adc_clk_out),
    .D(_104_),
    .RESET_B(\u_controller.reset_ ),
    .Q(\adc_data_out[11] ));
 sky130_fd_sc_hd__dfrtp_2 _650_ (.CLK(sys_clk),
    .D(_034_),
    .RESET_B(reset_),
    .Q(bit_start));
 sky130_fd_sc_hd__dfrtp_2 _651_ (.CLK(sys_clk),
    .D(_105_),
    .RESET_B(reset_),
    .Q(\u_spi.pay[0] ));
 sky130_fd_sc_hd__dfrtp_2 _652_ (.CLK(sys_clk),
    .D(_106_),
    .RESET_B(reset_),
    .Q(\u_spi.pay[1] ));
 sky130_fd_sc_hd__dfrtp_2 _653_ (.CLK(sys_clk),
    .D(_107_),
    .RESET_B(reset_),
    .Q(\u_spi.pay[2] ));
 sky130_fd_sc_hd__dfrtp_2 _654_ (.CLK(sys_clk),
    .D(_108_),
    .RESET_B(reset_),
    .Q(\u_spi.pay[3] ));
 sky130_fd_sc_hd__dfrtp_2 _655_ (.CLK(sys_clk),
    .D(_109_),
    .RESET_B(reset_),
    .Q(\u_spi.pay[4] ));
 sky130_fd_sc_hd__dfrtp_2 _656_ (.CLK(sys_clk),
    .D(_110_),
    .RESET_B(reset_),
    .Q(\u_spi.pay[5] ));
 sky130_fd_sc_hd__dfrtp_2 _657_ (.CLK(sys_clk),
    .D(_111_),
    .RESET_B(reset_),
    .Q(\u_spi.pay[6] ));
 sky130_fd_sc_hd__dfrtp_2 _658_ (.CLK(sys_clk),
    .D(_112_),
    .RESET_B(reset_),
    .Q(\u_spi.pay[7] ));
 sky130_fd_sc_hd__dfrtp_2 _659_ (.CLK(sys_clk),
    .D(_113_),
    .RESET_B(reset_),
    .Q(\u_spi.pay[8] ));
 sky130_fd_sc_hd__dfrtp_2 _660_ (.CLK(sys_clk),
    .D(_114_),
    .RESET_B(reset_),
    .Q(\u_spi.pay[9] ));
 sky130_fd_sc_hd__dfrtp_2 _661_ (.CLK(sys_clk),
    .D(_115_),
    .RESET_B(reset_),
    .Q(\u_spi.pay[10] ));
 sky130_fd_sc_hd__dfrtp_2 _662_ (.CLK(sys_clk),
    .D(_116_),
    .RESET_B(reset_),
    .Q(\u_spi.pay[11] ));
 sky130_fd_sc_hd__dfrtp_2 _663_ (.CLK(sys_clk),
    .D(_117_),
    .RESET_B(reset_),
    .Q(\u_spi.addr[0] ));
 sky130_fd_sc_hd__dfrtp_2 _664_ (.CLK(sys_clk),
    .D(_118_),
    .RESET_B(reset_),
    .Q(\u_spi.addr[1] ));
 sky130_fd_sc_hd__dfrtp_2 _665_ (.CLK(sys_clk),
    .D(_119_),
    .RESET_B(reset_),
    .Q(\u_spi.cmd[0] ));
 sky130_fd_sc_hd__dfrtp_2 _666_ (.CLK(sys_clk),
    .D(_120_),
    .RESET_B(reset_),
    .Q(\u_spi.cmd[1] ));
 sky130_fd_sc_hd__dfrtp_2 _667_ (.CLK(sys_clk),
    .D(sck),
    .RESET_B(reset_),
    .Q(\u_spi.sck_s1 ));
 sky130_fd_sc_hd__dfrtp_2 _668_ (.CLK(sys_clk),
    .D(_121_),
    .RESET_B(reset_),
    .Q(\u_spi.bit_cnt[0] ));
 sky130_fd_sc_hd__dfrtp_2 _669_ (.CLK(sys_clk),
    .D(_122_),
    .RESET_B(reset_),
    .Q(\u_spi.bit_cnt[1] ));
 sky130_fd_sc_hd__dfrtp_2 _670_ (.CLK(sys_clk),
    .D(_123_),
    .RESET_B(reset_),
    .Q(\u_spi.bit_cnt[2] ));
 sky130_fd_sc_hd__dfrtp_2 _671_ (.CLK(sys_clk),
    .D(_124_),
    .RESET_B(reset_),
    .Q(\u_spi.bit_cnt[3] ));
 sky130_fd_sc_hd__dfrtp_2 _672_ (.CLK(sys_clk),
    .D(_125_),
    .RESET_B(reset_),
    .Q(\u_spi.bit_cnt[4] ));
 sky130_fd_sc_hd__dfrtp_2 _673_ (.CLK(sys_clk),
    .D(\u_spi.sck_s1 ),
    .RESET_B(reset_),
    .Q(\u_spi.sck_s2 ));
 sky130_fd_sc_hd__dfrtp_2 _674_ (.CLK(sys_clk),
    .D(_126_),
    .RESET_B(reset_),
    .Q(\u_spi.state[0] ));
 sky130_fd_sc_hd__dfrtp_2 _675_ (.CLK(sys_clk),
    .D(_127_),
    .RESET_B(reset_),
    .Q(\u_spi.state[1] ));
 sky130_fd_sc_hd__dfrtp_2 _676_ (.CLK(sys_clk),
    .D(_128_),
    .RESET_B(reset_),
    .Q(eoc_flag));
 sky130_fd_sc_hd__dfrtp_2 _677_ (.CLK(sys_clk),
    .D(adc_ack),
    .RESET_B(reset_),
    .Q(\u_spi.eoc_s1 ));
 sky130_fd_sc_hd__dfrtp_2 _678_ (.CLK(sys_clk),
    .D(_035_),
    .RESET_B(reset_),
    .Q(\u_spi.data_reg[0] ));
 sky130_fd_sc_hd__dfrtp_2 _679_ (.CLK(sys_clk),
    .D(_038_),
    .RESET_B(reset_),
    .Q(\u_spi.data_reg[1] ));
 sky130_fd_sc_hd__dfrtp_2 _680_ (.CLK(sys_clk),
    .D(_039_),
    .RESET_B(reset_),
    .Q(\u_spi.data_reg[2] ));
 sky130_fd_sc_hd__dfrtp_2 _681_ (.CLK(sys_clk),
    .D(_040_),
    .RESET_B(reset_),
    .Q(\u_spi.data_reg[3] ));
 sky130_fd_sc_hd__dfrtp_2 _682_ (.CLK(sys_clk),
    .D(_041_),
    .RESET_B(reset_),
    .Q(\u_spi.data_reg[4] ));
 sky130_fd_sc_hd__dfrtp_2 _683_ (.CLK(sys_clk),
    .D(_042_),
    .RESET_B(reset_),
    .Q(\u_spi.data_reg[5] ));
 sky130_fd_sc_hd__dfrtp_2 _684_ (.CLK(sys_clk),
    .D(_043_),
    .RESET_B(reset_),
    .Q(\u_spi.data_reg[6] ));
 sky130_fd_sc_hd__dfrtp_2 _685_ (.CLK(sys_clk),
    .D(_044_),
    .RESET_B(reset_),
    .Q(\u_spi.data_reg[7] ));
 sky130_fd_sc_hd__dfrtp_2 _686_ (.CLK(sys_clk),
    .D(_045_),
    .RESET_B(reset_),
    .Q(\u_spi.data_reg[8] ));
 sky130_fd_sc_hd__dfrtp_2 _687_ (.CLK(sys_clk),
    .D(_046_),
    .RESET_B(reset_),
    .Q(\u_spi.data_reg[9] ));
 sky130_fd_sc_hd__dfrtp_2 _688_ (.CLK(sys_clk),
    .D(_036_),
    .RESET_B(reset_),
    .Q(\u_spi.data_reg[10] ));
 sky130_fd_sc_hd__dfrtp_2 _689_ (.CLK(sys_clk),
    .D(_037_),
    .RESET_B(reset_),
    .Q(\u_spi.data_reg[11] ));
 sky130_fd_sc_hd__dfrtp_2 _690_ (.CLK(sys_clk),
    .D(_129_),
    .RESET_B(reset_),
    .Q(bit_en));
 sky130_fd_sc_hd__dfrtp_2 _691_ (.CLK(sys_clk),
    .D(_130_),
    .RESET_B(reset_),
    .Q(bit_auto));
 sky130_fd_sc_hd__dfrtp_2 _692_ (.CLK(sys_clk),
    .D(_131_),
    .RESET_B(reset_),
    .Q(vref_sel));
 sky130_fd_sc_hd__dfrtp_2 _693_ (.CLK(sys_clk),
    .D(_132_),
    .RESET_B(reset_),
    .Q(bit_int_en));
 sky130_fd_sc_hd__dfrtp_2 _694_ (.CLK(sys_clk),
    .D(_133_),
    .RESET_B(reset_),
    .Q(\ctrl_reg[5] ));
 sky130_fd_sc_hd__conb_1 _695_ (.LO(_025_));
 sky130_fd_sc_hd__conb_1 _696_ (.LO(_024_));
 sky130_fd_sc_hd__conb_1 _697_ (.LO(_022_));
 sky130_fd_sc_hd__conb_1 _698_ (.LO(_021_));
 sky130_fd_sc_hd__conb_1 _699_ (.LO(_020_));
 sky130_fd_sc_hd__conb_1 _700_ (.LO(_019_));
 sky130_fd_sc_hd__conb_1 _701_ (.LO(_018_));
 sky130_fd_sc_hd__conb_1 _702_ (.LO(_017_));
 sky130_fd_sc_hd__conb_1 _703_ (.LO(_016_));
 sky130_fd_sc_hd__conb_1 _704_ (.LO(_015_));
 sky130_fd_sc_hd__conb_1 _705_ (.LO(_014_));
 sky130_fd_sc_hd__conb_1 _706_ (.LO(_013_));
 sky130_fd_sc_hd__conb_1 _707_ (.LO(_011_));
 sky130_fd_sc_hd__conb_1 _708_ (.LO(_010_));
 sky130_fd_sc_hd__conb_1 _709_ (.LO(_009_));
 sky130_fd_sc_hd__conb_1 _710_ (.LO(_008_));
 sky130_fd_sc_hd__conb_1 _711_ (.LO(_007_));
 sky130_fd_sc_hd__conb_1 _712_ (.LO(_006_));
 sky130_fd_sc_hd__conb_1 _713_ (.LO(_005_));
 sky130_fd_sc_hd__conb_1 _714_ (.LO(_004_));
 sky130_fd_sc_hd__conb_1 _715_ (.LO(_003_));
 sky130_fd_sc_hd__conb_1 _716_ (.LO(_002_));
 sky130_fd_sc_hd__conb_1 _717_ (.LO(_032_));
 sky130_fd_sc_hd__conb_1 _718_ (.LO(_031_));
 sky130_fd_sc_hd__buf_2 _719_ (.A(dac_rst),
    .X(sample_and_hold));
 sky130_fd_sc_hd__ebufn_2 _720_ (.A(\u_spi.miso_buffer[11] ),
    .TE_B(_281_),
    .Z(miso));
endmodule
