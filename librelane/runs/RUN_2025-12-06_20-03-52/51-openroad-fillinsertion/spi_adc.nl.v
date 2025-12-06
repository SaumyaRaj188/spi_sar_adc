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
 wire net87;
 wire net86;
 wire net85;
 wire net84;
 wire net83;
 wire net82;
 wire net81;
 wire net80;
 wire net79;
 wire net78;
 wire _012_;
 wire net77;
 wire net76;
 wire net75;
 wire net74;
 wire net73;
 wire net72;
 wire net71;
 wire net70;
 wire net69;
 wire net68;
 wire _023_;
 wire net67;
 wire net66;
 wire _026_;
 wire _027_;
 wire _028_;
 wire _029_;
 wire _030_;
 wire clknet_0_sys_clk;
 wire net88;
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
 wire net1;
 wire net2;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;
 wire net10;
 wire net11;
 wire net12;
 wire net13;
 wire net14;
 wire net15;
 wire net16;
 wire net17;
 wire net18;
 wire net19;
 wire net20;
 wire net21;
 wire net22;
 wire net23;
 wire net24;
 wire net25;
 wire net26;
 wire net27;
 wire net28;
 wire net29;
 wire net30;
 wire net31;
 wire net32;
 wire net33;
 wire net34;
 wire net35;
 wire net36;
 wire net37;
 wire net38;
 wire net39;
 wire net40;
 wire net41;
 wire net42;
 wire net43;
 wire net44;
 wire net45;
 wire net46;
 wire net47;
 wire net48;
 wire net49;
 wire net50;
 wire net51;
 wire net52;
 wire net53;
 wire net54;
 wire net55;
 wire net56;
 wire net57;
 wire net58;
 wire net59;
 wire net60;
 wire net61;
 wire net62;
 wire net63;
 wire net64;
 wire net65;
 wire clknet_3_0__leaf_sys_clk;
 wire clknet_3_1__leaf_sys_clk;
 wire clknet_3_2__leaf_sys_clk;
 wire clknet_3_3__leaf_sys_clk;
 wire clknet_3_4__leaf_sys_clk;
 wire clknet_3_5__leaf_sys_clk;
 wire clknet_3_6__leaf_sys_clk;
 wire clknet_3_7__leaf_sys_clk;
 wire net89;
 wire net90;
 wire net91;
 wire net92;
 wire net93;
 wire net94;
 wire net95;
 wire net96;
 wire net97;
 wire net98;
 wire net99;
 wire net100;
 wire net101;
 wire net102;
 wire net103;
 wire net104;
 wire net105;
 wire net106;
 wire net107;
 wire net108;
 wire net109;
 wire net110;
 wire net111;
 wire net112;
 wire net113;
 wire net114;
 wire net115;
 wire net116;
 wire net117;
 wire net118;
 wire net119;
 wire net120;
 wire net121;
 wire net122;
 wire net123;
 wire net124;
 wire net125;
 wire net126;
 wire net127;
 wire net128;
 wire net129;
 wire net130;
 wire net131;
 wire net132;
 wire net133;
 wire net134;
 wire net135;
 wire net136;
 wire net137;
 wire net138;

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
 sky130_fd_sc_hd__and2_1 _296_ (.A(\u_controller.state[0] ),
    .B(\u_controller.state[1] ),
    .X(adc_ack));
 sky130_fd_sc_hd__nand2b_2 _297_ (.A_N(\u_controller.state[1] ),
    .B(\u_controller.state[0] ),
    .Y(_148_));
 sky130_fd_sc_hd__inv_2 _298_ (.A(net39),
    .Y(net19));
 sky130_fd_sc_hd__and2b_1 _299_ (.A_N(\u_controller.state[0] ),
    .B(\u_controller.state[1] ),
    .X(_149_));
 sky130_fd_sc_hd__nor2_1 _300_ (.A(net19),
    .B(net37),
    .Y(_150_));
 sky130_fd_sc_hd__inv_2 _301_ (.A(net25),
    .Y(net21));
 sky130_fd_sc_hd__o21a_1 _302_ (.A1(\u_controller.state[0] ),
    .A2(\u_controller.state[1] ),
    .B1(net135),
    .X(_033_));
 sky130_fd_sc_hd__and2_1 _303_ (.A(bit_en),
    .B(net55),
    .X(\u_controller.reset_ ));
 sky130_fd_sc_hd__nand2b_1 _304_ (.A_N(\u_spi.eoc_s2 ),
    .B(\u_spi.eoc_s1 ),
    .Y(_151_));
 sky130_fd_sc_hd__or2_1 _305_ (.A(\u_spi.state[0] ),
    .B(\u_spi.state[1] ),
    .X(_152_));
 sky130_fd_sc_hd__mux2_2 _306_ (.A0(start_clear_req),
    .A1(_152_),
    .S(_151_),
    .X(_153_));
 sky130_fd_sc_hd__mux2_1 _307_ (.A0(\adc_data_out[0] ),
    .A1(net124),
    .S(net34),
    .X(_035_));
 sky130_fd_sc_hd__mux2_1 _308_ (.A0(\adc_data_out[1] ),
    .A1(net118),
    .S(net34),
    .X(_038_));
 sky130_fd_sc_hd__mux2_1 _309_ (.A0(\adc_data_out[2] ),
    .A1(net111),
    .S(net34),
    .X(_039_));
 sky130_fd_sc_hd__mux2_1 _310_ (.A0(\adc_data_out[3] ),
    .A1(net123),
    .S(net34),
    .X(_040_));
 sky130_fd_sc_hd__mux2_1 _311_ (.A0(\adc_data_out[4] ),
    .A1(net116),
    .S(net34),
    .X(_041_));
 sky130_fd_sc_hd__mux2_1 _312_ (.A0(\adc_data_out[5] ),
    .A1(net117),
    .S(net34),
    .X(_042_));
 sky130_fd_sc_hd__mux2_1 _313_ (.A0(\adc_data_out[6] ),
    .A1(net110),
    .S(net34),
    .X(_043_));
 sky130_fd_sc_hd__mux2_1 _314_ (.A0(\adc_data_out[7] ),
    .A1(net115),
    .S(net34),
    .X(_044_));
 sky130_fd_sc_hd__mux2_1 _315_ (.A0(\adc_data_out[8] ),
    .A1(net114),
    .S(net34),
    .X(_045_));
 sky130_fd_sc_hd__mux2_1 _316_ (.A0(\adc_data_out[9] ),
    .A1(net125),
    .S(net34),
    .X(_046_));
 sky130_fd_sc_hd__mux2_1 _317_ (.A0(\adc_data_out[10] ),
    .A1(net113),
    .S(_153_),
    .X(_036_));
 sky130_fd_sc_hd__mux2_1 _318_ (.A0(\adc_data_out[11] ),
    .A1(net132),
    .S(_153_),
    .X(_037_));
 sky130_fd_sc_hd__or4b_1 _319_ (.A(\u_spi.state[0] ),
    .B(\u_spi.addr[0] ),
    .C(\u_spi.addr[1] ),
    .D_N(\u_spi.state[1] ),
    .X(_154_));
 sky130_fd_sc_hd__o21bai_4 _320_ (.A1(\u_spi.cmd[0] ),
    .A2(net45),
    .B1_N(_154_),
    .Y(_155_));
 sky130_fd_sc_hd__a21oi_1 _321_ (.A1(\u_spi.cmd[0] ),
    .A2(net45),
    .B1(net33),
    .Y(_156_));
 sky130_fd_sc_hd__a21o_1 _322_ (.A1(_135_),
    .A2(net45),
    .B1(net33),
    .X(_157_));
 sky130_fd_sc_hd__nand2_1 _323_ (.A(start_clear_req),
    .B(net33),
    .Y(_158_));
 sky130_fd_sc_hd__a32o_1 _324_ (.A1(bit_start),
    .A2(_157_),
    .A3(_158_),
    .B1(net28),
    .B2(\u_spi.pay[1] ),
    .X(_034_));
 sky130_fd_sc_hd__o31ai_1 _325_ (.A1(bit_start),
    .A2(bit_auto),
    .A3(net21),
    .B1(net93),
    .Y(_000_));
 sky130_fd_sc_hd__o22a_1 _326_ (.A1(bit_clk_sel),
    .A2(\clk_cnt[5] ),
    .B1(\clk_cnt[7] ),
    .B2(\clk_cnt[4] ),
    .X(_159_));
 sky130_fd_sc_hd__a31o_1 _327_ (.A1(\clk_cnt[1] ),
    .A2(\clk_cnt[3] ),
    .A3(\clk_cnt[2] ),
    .B1(_159_),
    .X(_160_));
 sky130_fd_sc_hd__a21o_1 _328_ (.A1(\clk_cnt[5] ),
    .A2(\clk_cnt[6] ),
    .B1(\clk_cnt[7] ),
    .X(_161_));
 sky130_fd_sc_hd__or2_1 _329_ (.A(\clk_cnt[4] ),
    .B(\clk_cnt[5] ),
    .X(_162_));
 sky130_fd_sc_hd__a32o_1 _330_ (.A1(\clk_cnt[6] ),
    .A2(\clk_cnt[7] ),
    .A3(_162_),
    .B1(_161_),
    .B2(bit_clk_sel),
    .X(_163_));
 sky130_fd_sc_hd__or4_1 _331_ (.A(\clk_cnt[21] ),
    .B(\clk_cnt[20] ),
    .C(\clk_cnt[23] ),
    .D(\clk_cnt[22] ),
    .X(_164_));
 sky130_fd_sc_hd__or4_1 _332_ (.A(\clk_cnt[17] ),
    .B(\clk_cnt[16] ),
    .C(\clk_cnt[19] ),
    .D(\clk_cnt[18] ),
    .X(_165_));
 sky130_fd_sc_hd__or4_1 _333_ (.A(\clk_cnt[25] ),
    .B(\clk_cnt[24] ),
    .C(\clk_cnt[27] ),
    .D(\clk_cnt[26] ),
    .X(_166_));
 sky130_fd_sc_hd__or4_1 _334_ (.A(\clk_cnt[29] ),
    .B(\clk_cnt[28] ),
    .C(\clk_cnt[31] ),
    .D(\clk_cnt[30] ),
    .X(_167_));
 sky130_fd_sc_hd__or4_1 _335_ (.A(_164_),
    .B(_165_),
    .C(_166_),
    .D(_167_),
    .X(_168_));
 sky130_fd_sc_hd__or4_1 _336_ (.A(\clk_cnt[13] ),
    .B(\clk_cnt[12] ),
    .C(\clk_cnt[15] ),
    .D(\clk_cnt[14] ),
    .X(_169_));
 sky130_fd_sc_hd__or4_1 _337_ (.A(\clk_cnt[9] ),
    .B(\clk_cnt[8] ),
    .C(\clk_cnt[11] ),
    .D(\clk_cnt[10] ),
    .X(_170_));
 sky130_fd_sc_hd__a211o_1 _338_ (.A1(_160_),
    .A2(_163_),
    .B1(_168_),
    .C1(_170_),
    .X(_171_));
 sky130_fd_sc_hd__nor2_2 _339_ (.A(_169_),
    .B(_171_),
    .Y(_172_));
 sky130_fd_sc_hd__and2b_1 _340_ (.A_N(\clk_cnt[0] ),
    .B(_172_),
    .X(_001_));
 sky130_fd_sc_hd__or2_1 _341_ (.A(\clk_cnt[1] ),
    .B(\clk_cnt[0] ),
    .X(_173_));
 sky130_fd_sc_hd__nand2_1 _342_ (.A(\clk_cnt[1] ),
    .B(\clk_cnt[0] ),
    .Y(_174_));
 sky130_fd_sc_hd__and3_1 _343_ (.A(_172_),
    .B(_173_),
    .C(_174_),
    .X(_012_));
 sky130_fd_sc_hd__nand3_1 _344_ (.A(\clk_cnt[1] ),
    .B(\clk_cnt[0] ),
    .C(\clk_cnt[2] ),
    .Y(_175_));
 sky130_fd_sc_hd__a21o_1 _345_ (.A1(\clk_cnt[1] ),
    .A2(\clk_cnt[0] ),
    .B1(\clk_cnt[2] ),
    .X(_176_));
 sky130_fd_sc_hd__and3_1 _346_ (.A(_172_),
    .B(_175_),
    .C(_176_),
    .X(_023_));
 sky130_fd_sc_hd__and4_1 _347_ (.A(\clk_cnt[1] ),
    .B(\clk_cnt[0] ),
    .C(\clk_cnt[3] ),
    .D(\clk_cnt[2] ),
    .X(_177_));
 sky130_fd_sc_hd__a31o_1 _348_ (.A1(\clk_cnt[1] ),
    .A2(\clk_cnt[0] ),
    .A3(\clk_cnt[2] ),
    .B1(\clk_cnt[3] ),
    .X(_178_));
 sky130_fd_sc_hd__and3b_1 _349_ (.A_N(_177_),
    .B(_178_),
    .C(_172_),
    .X(_026_));
 sky130_fd_sc_hd__or2_1 _350_ (.A(\clk_cnt[4] ),
    .B(_177_),
    .X(_179_));
 sky130_fd_sc_hd__and2_1 _351_ (.A(\clk_cnt[4] ),
    .B(_177_),
    .X(_180_));
 sky130_fd_sc_hd__and3b_1 _352_ (.A_N(_180_),
    .B(_172_),
    .C(_179_),
    .X(_027_));
 sky130_fd_sc_hd__and3_1 _353_ (.A(\clk_cnt[4] ),
    .B(\clk_cnt[5] ),
    .C(_177_),
    .X(_181_));
 sky130_fd_sc_hd__or2_1 _354_ (.A(\clk_cnt[5] ),
    .B(_180_),
    .X(_182_));
 sky130_fd_sc_hd__and3b_1 _355_ (.A_N(_181_),
    .B(_182_),
    .C(_172_),
    .X(_028_));
 sky130_fd_sc_hd__or2_1 _356_ (.A(\clk_cnt[6] ),
    .B(_181_),
    .X(_183_));
 sky130_fd_sc_hd__nand2_1 _357_ (.A(\clk_cnt[6] ),
    .B(_181_),
    .Y(_184_));
 sky130_fd_sc_hd__and3_1 _358_ (.A(_172_),
    .B(_183_),
    .C(_184_),
    .X(_029_));
 sky130_fd_sc_hd__a21boi_1 _359_ (.A1(_138_),
    .A2(_184_),
    .B1_N(_172_),
    .Y(_030_));
 sky130_fd_sc_hd__a21o_1 _360_ (.A1(\u_controller.counter_reg[0] ),
    .A2(net35),
    .B1(\u_controller.dac_reg[0] ),
    .X(net7));
 sky130_fd_sc_hd__a21o_1 _361_ (.A1(\u_controller.counter_reg[1] ),
    .A2(net35),
    .B1(\u_controller.dac_reg[1] ),
    .X(net10));
 sky130_fd_sc_hd__a21o_1 _362_ (.A1(\u_controller.counter_reg[2] ),
    .A2(net35),
    .B1(\u_controller.dac_reg[2] ),
    .X(net11));
 sky130_fd_sc_hd__a21o_1 _363_ (.A1(\u_controller.counter_reg[3] ),
    .A2(net35),
    .B1(\u_controller.dac_reg[3] ),
    .X(net12));
 sky130_fd_sc_hd__a21o_1 _364_ (.A1(\u_controller.counter_reg[4] ),
    .A2(net36),
    .B1(\u_controller.dac_reg[4] ),
    .X(net13));
 sky130_fd_sc_hd__a21o_1 _365_ (.A1(\u_controller.counter_reg[5] ),
    .A2(net36),
    .B1(\u_controller.dac_reg[5] ),
    .X(net14));
 sky130_fd_sc_hd__a21o_1 _366_ (.A1(\u_controller.counter_reg[6] ),
    .A2(net36),
    .B1(\u_controller.dac_reg[6] ),
    .X(net15));
 sky130_fd_sc_hd__a21o_1 _367_ (.A1(\u_controller.counter_reg[7] ),
    .A2(net38),
    .B1(\u_controller.dac_reg[7] ),
    .X(net16));
 sky130_fd_sc_hd__a21o_1 _368_ (.A1(\u_controller.counter_reg[8] ),
    .A2(net38),
    .B1(\u_controller.dac_reg[8] ),
    .X(net17));
 sky130_fd_sc_hd__a21o_1 _369_ (.A1(\u_controller.counter_reg[9] ),
    .A2(net37),
    .B1(\u_controller.dac_reg[9] ),
    .X(net18));
 sky130_fd_sc_hd__a21o_1 _370_ (.A1(\u_controller.counter_reg[10] ),
    .A2(net37),
    .B1(\u_controller.dac_reg[10] ),
    .X(net8));
 sky130_fd_sc_hd__a21o_1 _371_ (.A1(\u_controller.counter_reg[11] ),
    .A2(net37),
    .B1(\u_controller.dac_reg[11] ),
    .X(net9));
 sky130_fd_sc_hd__and2_1 _372_ (.A(eoc_flag),
    .B(bit_int_en),
    .X(net20));
 sky130_fd_sc_hd__a21o_1 _373_ (.A1(net46),
    .A2(_142_),
    .B1(_155_),
    .X(_185_));
 sky130_fd_sc_hd__a22o_1 _374_ (.A1(\u_spi.pay[6] ),
    .A2(_156_),
    .B1(_185_),
    .B2(bit_clk_sel),
    .X(_047_));
 sky130_fd_sc_hd__a21o_1 _375_ (.A1(net46),
    .A2(_143_),
    .B1(net33),
    .X(_186_));
 sky130_fd_sc_hd__a22o_1 _376_ (.A1(\u_spi.pay[7] ),
    .A2(net28),
    .B1(_186_),
    .B2(net109),
    .X(_048_));
 sky130_fd_sc_hd__a21o_1 _377_ (.A1(net46),
    .A2(_144_),
    .B1(_155_),
    .X(_187_));
 sky130_fd_sc_hd__a22o_1 _378_ (.A1(\u_spi.pay[8] ),
    .A2(net28),
    .B1(_187_),
    .B2(net128),
    .X(_049_));
 sky130_fd_sc_hd__a21o_1 _379_ (.A1(net45),
    .A2(_145_),
    .B1(net33),
    .X(_188_));
 sky130_fd_sc_hd__a22o_1 _380_ (.A1(\u_spi.pay[9] ),
    .A2(net28),
    .B1(_188_),
    .B2(net121),
    .X(_050_));
 sky130_fd_sc_hd__a21o_1 _381_ (.A1(net46),
    .A2(_146_),
    .B1(net33),
    .X(_189_));
 sky130_fd_sc_hd__a22o_1 _382_ (.A1(\u_spi.pay[10] ),
    .A2(_156_),
    .B1(_189_),
    .B2(net112),
    .X(_051_));
 sky130_fd_sc_hd__a21o_1 _383_ (.A1(net46),
    .A2(_147_),
    .B1(_155_),
    .X(_190_));
 sky130_fd_sc_hd__a22o_1 _384_ (.A1(\u_spi.pay[11] ),
    .A2(net28),
    .B1(_190_),
    .B2(net119),
    .X(_052_));
 sky130_fd_sc_hd__nor2_1 _385_ (.A(net2),
    .B(\u_spi.state[1] ),
    .Y(_191_));
 sky130_fd_sc_hd__nand2b_1 _386_ (.A_N(\u_spi.state[1] ),
    .B(\u_spi.state[0] ),
    .Y(_192_));
 sky130_fd_sc_hd__and4b_1 _387_ (.A_N(\u_spi.sck_s1 ),
    .B(\u_spi.sck_s2 ),
    .C(_191_),
    .D(\u_spi.state[0] ),
    .X(_193_));
 sky130_fd_sc_hd__or4b_2 _388_ (.A(net2),
    .B(_192_),
    .C(\u_spi.sck_s1 ),
    .D_N(\u_spi.sck_s2 ),
    .X(_194_));
 sky130_fd_sc_hd__nor2_1 _389_ (.A(\u_spi.pay[0] ),
    .B(\u_spi.pay[1] ),
    .Y(_195_));
 sky130_fd_sc_hd__inv_2 _390_ (.A(net40),
    .Y(_196_));
 sky130_fd_sc_hd__nor2_4 _391_ (.A(\u_spi.pay[0] ),
    .B(_135_),
    .Y(_197_));
 sky130_fd_sc_hd__nand2_1 _392_ (.A(_134_),
    .B(\u_spi.pay[1] ),
    .Y(_198_));
 sky130_fd_sc_hd__a22oi_1 _393_ (.A1(bit_en),
    .A2(net40),
    .B1(_197_),
    .B2(\u_spi.data_reg[0] ),
    .Y(_199_));
 sky130_fd_sc_hd__or2_1 _394_ (.A(\u_spi.bit_cnt[1] ),
    .B(\u_spi.bit_cnt[0] ),
    .X(_200_));
 sky130_fd_sc_hd__or4b_1 _395_ (.A(net2),
    .B(\u_spi.bit_cnt[3] ),
    .C(\u_spi.bit_cnt[4] ),
    .D_N(\u_spi.bit_cnt[2] ),
    .X(_201_));
 sky130_fd_sc_hd__or4b_1 _396_ (.A(\u_spi.sck_s1 ),
    .B(\u_spi.bit_cnt[1] ),
    .C(\u_spi.bit_cnt[0] ),
    .D_N(\u_spi.sck_s2 ),
    .X(_202_));
 sky130_fd_sc_hd__or4_1 _397_ (.A(\u_spi.pay[3] ),
    .B(\u_spi.pay[2] ),
    .C(_201_),
    .D(_202_),
    .X(_203_));
 sky130_fd_sc_hd__inv_2 _398_ (.A(_203_),
    .Y(_204_));
 sky130_fd_sc_hd__or2_2 _399_ (.A(_192_),
    .B(_203_),
    .X(_205_));
 sky130_fd_sc_hd__a2bb2o_1 _400_ (.A1_N(_199_),
    .A2_N(net26),
    .B1(\u_spi.miso_buffer[0] ),
    .B2(net31),
    .X(_206_));
 sky130_fd_sc_hd__nand2_1 _401_ (.A(\u_spi.pay[0] ),
    .B(_135_),
    .Y(_207_));
 sky130_fd_sc_hd__nor2_1 _402_ (.A(net26),
    .B(_207_),
    .Y(_208_));
 sky130_fd_sc_hd__a21o_1 _403_ (.A1(net134),
    .A2(_208_),
    .B1(_206_),
    .X(_053_));
 sky130_fd_sc_hd__o21a_1 _404_ (.A1(\u_spi.miso_buffer[0] ),
    .A2(net31),
    .B1(net26),
    .X(_209_));
 sky130_fd_sc_hd__o22a_1 _405_ (.A1(bit_start),
    .A2(_196_),
    .B1(_198_),
    .B2(\u_spi.data_reg[1] ),
    .X(_210_));
 sky130_fd_sc_hd__o311a_1 _406_ (.A1(\u_controller.state[0] ),
    .A2(\u_controller.state[1] ),
    .A3(_207_),
    .B1(_210_),
    .C1(net27),
    .X(_211_));
 sky130_fd_sc_hd__o22a_1 _407_ (.A1(net96),
    .A2(net32),
    .B1(_209_),
    .B2(_211_),
    .X(_054_));
 sky130_fd_sc_hd__o21a_1 _408_ (.A1(\u_spi.miso_buffer[1] ),
    .A2(net31),
    .B1(net26),
    .X(_212_));
 sky130_fd_sc_hd__a22o_1 _409_ (.A1(bit_auto),
    .A2(net40),
    .B1(_197_),
    .B2(\u_spi.data_reg[2] ),
    .X(_213_));
 sky130_fd_sc_hd__and2_1 _410_ (.A(net27),
    .B(_213_),
    .X(_214_));
 sky130_fd_sc_hd__o22a_1 _411_ (.A1(net95),
    .A2(net32),
    .B1(_212_),
    .B2(_214_),
    .X(_055_));
 sky130_fd_sc_hd__or2_1 _412_ (.A(\u_spi.miso_buffer[2] ),
    .B(net31),
    .X(_215_));
 sky130_fd_sc_hd__o221a_1 _413_ (.A1(\u_spi.pay[1] ),
    .A2(net23),
    .B1(_198_),
    .B2(\u_spi.data_reg[3] ),
    .C1(_207_),
    .X(_216_));
 sky130_fd_sc_hd__a22o_1 _414_ (.A1(net26),
    .A2(_215_),
    .B1(_216_),
    .B2(net27),
    .X(_217_));
 sky130_fd_sc_hd__o21a_1 _415_ (.A1(net97),
    .A2(net32),
    .B1(_217_),
    .X(_056_));
 sky130_fd_sc_hd__o21a_1 _416_ (.A1(\u_spi.miso_buffer[3] ),
    .A2(net31),
    .B1(net26),
    .X(_218_));
 sky130_fd_sc_hd__a22o_1 _417_ (.A1(bit_int_en),
    .A2(net40),
    .B1(_197_),
    .B2(\u_spi.data_reg[4] ),
    .X(_219_));
 sky130_fd_sc_hd__and2_1 _418_ (.A(net27),
    .B(_219_),
    .X(_220_));
 sky130_fd_sc_hd__o22a_1 _419_ (.A1(net98),
    .A2(net32),
    .B1(_218_),
    .B2(_220_),
    .X(_057_));
 sky130_fd_sc_hd__o21a_1 _420_ (.A1(\u_spi.miso_buffer[4] ),
    .A2(net31),
    .B1(net26),
    .X(_221_));
 sky130_fd_sc_hd__a22o_1 _421_ (.A1(\ctrl_reg[5] ),
    .A2(net40),
    .B1(_197_),
    .B2(\u_spi.data_reg[5] ),
    .X(_222_));
 sky130_fd_sc_hd__and2_1 _422_ (.A(net27),
    .B(_222_),
    .X(_223_));
 sky130_fd_sc_hd__o22a_1 _423_ (.A1(net102),
    .A2(net32),
    .B1(_221_),
    .B2(_223_),
    .X(_058_));
 sky130_fd_sc_hd__o21a_1 _424_ (.A1(\u_spi.miso_buffer[5] ),
    .A2(net31),
    .B1(net26),
    .X(_224_));
 sky130_fd_sc_hd__a22o_1 _425_ (.A1(bit_clk_sel),
    .A2(net40),
    .B1(_197_),
    .B2(\u_spi.data_reg[6] ),
    .X(_225_));
 sky130_fd_sc_hd__and2_1 _426_ (.A(net27),
    .B(_225_),
    .X(_226_));
 sky130_fd_sc_hd__o22a_1 _427_ (.A1(net101),
    .A2(net32),
    .B1(_224_),
    .B2(_226_),
    .X(_059_));
 sky130_fd_sc_hd__o21a_1 _428_ (.A1(\u_spi.miso_buffer[6] ),
    .A2(net31),
    .B1(_205_),
    .X(_227_));
 sky130_fd_sc_hd__a22o_1 _429_ (.A1(\ctrl_reg[7] ),
    .A2(net40),
    .B1(_197_),
    .B2(\u_spi.data_reg[7] ),
    .X(_228_));
 sky130_fd_sc_hd__and2_1 _430_ (.A(net27),
    .B(_228_),
    .X(_229_));
 sky130_fd_sc_hd__o22a_1 _431_ (.A1(net100),
    .A2(net32),
    .B1(_227_),
    .B2(_229_),
    .X(_060_));
 sky130_fd_sc_hd__o21a_1 _432_ (.A1(\u_spi.miso_buffer[7] ),
    .A2(net31),
    .B1(_205_),
    .X(_230_));
 sky130_fd_sc_hd__a22o_1 _433_ (.A1(\ctrl_reg[8] ),
    .A2(net40),
    .B1(_197_),
    .B2(\u_spi.data_reg[8] ),
    .X(_231_));
 sky130_fd_sc_hd__and2_1 _434_ (.A(net27),
    .B(_231_),
    .X(_232_));
 sky130_fd_sc_hd__o22a_1 _435_ (.A1(net107),
    .A2(net32),
    .B1(_230_),
    .B2(_232_),
    .X(_061_));
 sky130_fd_sc_hd__o21a_1 _436_ (.A1(\u_spi.miso_buffer[8] ),
    .A2(_194_),
    .B1(net26),
    .X(_233_));
 sky130_fd_sc_hd__a22o_1 _437_ (.A1(\ctrl_reg[9] ),
    .A2(net40),
    .B1(_197_),
    .B2(\u_spi.data_reg[9] ),
    .X(_234_));
 sky130_fd_sc_hd__and2_1 _438_ (.A(net27),
    .B(_234_),
    .X(_235_));
 sky130_fd_sc_hd__o22a_1 _439_ (.A1(net99),
    .A2(net32),
    .B1(_233_),
    .B2(_235_),
    .X(_062_));
 sky130_fd_sc_hd__o21a_1 _440_ (.A1(\u_spi.miso_buffer[9] ),
    .A2(_194_),
    .B1(_205_),
    .X(_236_));
 sky130_fd_sc_hd__a22o_1 _441_ (.A1(\ctrl_reg[10] ),
    .A2(net40),
    .B1(_197_),
    .B2(\u_spi.data_reg[10] ),
    .X(_237_));
 sky130_fd_sc_hd__and2_1 _442_ (.A(_204_),
    .B(_237_),
    .X(_238_));
 sky130_fd_sc_hd__o22a_1 _443_ (.A1(net105),
    .A2(_193_),
    .B1(_236_),
    .B2(_238_),
    .X(_063_));
 sky130_fd_sc_hd__o21a_1 _444_ (.A1(\u_spi.miso_buffer[10] ),
    .A2(net31),
    .B1(net26),
    .X(_239_));
 sky130_fd_sc_hd__a22o_1 _445_ (.A1(\ctrl_reg[11] ),
    .A2(_195_),
    .B1(_197_),
    .B2(\u_spi.data_reg[11] ),
    .X(_240_));
 sky130_fd_sc_hd__and2_1 _446_ (.A(net27),
    .B(_240_),
    .X(_241_));
 sky130_fd_sc_hd__o22a_1 _447_ (.A1(net138),
    .A2(net32),
    .B1(_239_),
    .B2(_241_),
    .X(_064_));
 sky130_fd_sc_hd__or4_1 _448_ (.A(\u_controller.counter_reg[9] ),
    .B(\u_controller.counter_reg[8] ),
    .C(\u_controller.counter_reg[11] ),
    .D(\u_controller.counter_reg[10] ),
    .X(_242_));
 sky130_fd_sc_hd__or4_1 _449_ (.A(\u_controller.counter_reg[5] ),
    .B(\u_controller.counter_reg[4] ),
    .C(\u_controller.counter_reg[7] ),
    .D(\u_controller.counter_reg[6] ),
    .X(_243_));
 sky130_fd_sc_hd__or3b_1 _450_ (.A(\u_controller.counter_reg[2] ),
    .B(_243_),
    .C_N(\u_controller.counter_reg[0] ),
    .X(_244_));
 sky130_fd_sc_hd__or4_1 _451_ (.A(\u_controller.counter_reg[1] ),
    .B(\u_controller.counter_reg[3] ),
    .C(_242_),
    .D(_244_),
    .X(_245_));
 sky130_fd_sc_hd__a211oi_1 _452_ (.A1(net35),
    .A2(_245_),
    .B1(adc_en_n),
    .C1(net19),
    .Y(_065_));
 sky130_fd_sc_hd__a21oi_1 _453_ (.A1(adc_en_n),
    .A2(net39),
    .B1(net25),
    .Y(_066_));
 sky130_fd_sc_hd__mux2_1 _454_ (.A0(net126),
    .A1(eoc_flag),
    .S(_208_),
    .X(_067_));
 sky130_fd_sc_hd__xnor2_1 _455_ (.A(net50),
    .B(_172_),
    .Y(_068_));
 sky130_fd_sc_hd__a21o_1 _456_ (.A1(\u_controller.counter_reg[0] ),
    .A2(net64),
    .B1(\u_controller.dac_reg[0] ),
    .X(_246_));
 sky130_fd_sc_hd__o211a_1 _457_ (.A1(\u_controller.dac_reg[0] ),
    .A2(net35),
    .B1(_246_),
    .C1(net39),
    .X(_069_));
 sky130_fd_sc_hd__a21o_1 _458_ (.A1(\u_controller.counter_reg[1] ),
    .A2(net64),
    .B1(\u_controller.dac_reg[1] ),
    .X(_247_));
 sky130_fd_sc_hd__o211a_1 _459_ (.A1(\u_controller.dac_reg[1] ),
    .A2(net35),
    .B1(_247_),
    .C1(net39),
    .X(_070_));
 sky130_fd_sc_hd__a21o_1 _460_ (.A1(\u_controller.counter_reg[2] ),
    .A2(net64),
    .B1(\u_controller.dac_reg[2] ),
    .X(_248_));
 sky130_fd_sc_hd__o211a_1 _461_ (.A1(\u_controller.dac_reg[2] ),
    .A2(net35),
    .B1(_248_),
    .C1(net39),
    .X(_071_));
 sky130_fd_sc_hd__a21o_1 _462_ (.A1(\u_controller.counter_reg[3] ),
    .A2(net64),
    .B1(\u_controller.dac_reg[3] ),
    .X(_249_));
 sky130_fd_sc_hd__o211a_1 _463_ (.A1(\u_controller.dac_reg[3] ),
    .A2(net36),
    .B1(_249_),
    .C1(net39),
    .X(_072_));
 sky130_fd_sc_hd__a21o_1 _464_ (.A1(\u_controller.counter_reg[4] ),
    .A2(net64),
    .B1(\u_controller.dac_reg[4] ),
    .X(_250_));
 sky130_fd_sc_hd__o211a_1 _465_ (.A1(\u_controller.dac_reg[4] ),
    .A2(net36),
    .B1(_250_),
    .C1(net39),
    .X(_073_));
 sky130_fd_sc_hd__a21o_1 _466_ (.A1(\u_controller.counter_reg[5] ),
    .A2(net64),
    .B1(\u_controller.dac_reg[5] ),
    .X(_251_));
 sky130_fd_sc_hd__o211a_1 _467_ (.A1(\u_controller.dac_reg[5] ),
    .A2(_149_),
    .B1(_251_),
    .C1(net39),
    .X(_074_));
 sky130_fd_sc_hd__a21o_1 _468_ (.A1(\u_controller.counter_reg[6] ),
    .A2(net64),
    .B1(\u_controller.dac_reg[6] ),
    .X(_252_));
 sky130_fd_sc_hd__o211a_1 _469_ (.A1(\u_controller.dac_reg[6] ),
    .A2(net38),
    .B1(_252_),
    .C1(net39),
    .X(_075_));
 sky130_fd_sc_hd__a21o_1 _470_ (.A1(\u_controller.counter_reg[7] ),
    .A2(net64),
    .B1(\u_controller.dac_reg[7] ),
    .X(_253_));
 sky130_fd_sc_hd__o211a_1 _471_ (.A1(\u_controller.dac_reg[7] ),
    .A2(net38),
    .B1(_253_),
    .C1(_148_),
    .X(_076_));
 sky130_fd_sc_hd__a21o_1 _472_ (.A1(\u_controller.counter_reg[8] ),
    .A2(net64),
    .B1(\u_controller.dac_reg[8] ),
    .X(_254_));
 sky130_fd_sc_hd__o211a_1 _473_ (.A1(\u_controller.dac_reg[8] ),
    .A2(net37),
    .B1(_254_),
    .C1(_148_),
    .X(_077_));
 sky130_fd_sc_hd__a21o_1 _474_ (.A1(\u_controller.counter_reg[9] ),
    .A2(net64),
    .B1(\u_controller.dac_reg[9] ),
    .X(_255_));
 sky130_fd_sc_hd__o211a_1 _475_ (.A1(\u_controller.dac_reg[9] ),
    .A2(net37),
    .B1(_255_),
    .C1(net39),
    .X(_078_));
 sky130_fd_sc_hd__a21o_1 _476_ (.A1(\u_controller.counter_reg[10] ),
    .A2(net1),
    .B1(\u_controller.dac_reg[10] ),
    .X(_256_));
 sky130_fd_sc_hd__o211a_1 _477_ (.A1(\u_controller.dac_reg[10] ),
    .A2(net37),
    .B1(_256_),
    .C1(_148_),
    .X(_079_));
 sky130_fd_sc_hd__a21o_1 _478_ (.A1(\u_controller.counter_reg[11] ),
    .A2(net1),
    .B1(\u_controller.dac_reg[11] ),
    .X(_257_));
 sky130_fd_sc_hd__o211a_1 _479_ (.A1(\u_controller.dac_reg[11] ),
    .A2(net38),
    .B1(_257_),
    .C1(_148_),
    .X(_080_));
 sky130_fd_sc_hd__a22o_1 _480_ (.A1(\u_controller.counter_reg[1] ),
    .A2(net35),
    .B1(net25),
    .B2(\u_controller.counter_reg[0] ),
    .X(_081_));
 sky130_fd_sc_hd__a22o_1 _481_ (.A1(\u_controller.counter_reg[2] ),
    .A2(net35),
    .B1(net25),
    .B2(\u_controller.counter_reg[1] ),
    .X(_082_));
 sky130_fd_sc_hd__a22o_1 _482_ (.A1(\u_controller.counter_reg[3] ),
    .A2(net36),
    .B1(net25),
    .B2(\u_controller.counter_reg[2] ),
    .X(_083_));
 sky130_fd_sc_hd__a22o_1 _483_ (.A1(\u_controller.counter_reg[4] ),
    .A2(net36),
    .B1(net25),
    .B2(\u_controller.counter_reg[3] ),
    .X(_084_));
 sky130_fd_sc_hd__a22o_1 _484_ (.A1(\u_controller.counter_reg[5] ),
    .A2(net36),
    .B1(net25),
    .B2(\u_controller.counter_reg[4] ),
    .X(_085_));
 sky130_fd_sc_hd__a22o_1 _485_ (.A1(\u_controller.counter_reg[6] ),
    .A2(net36),
    .B1(net25),
    .B2(\u_controller.counter_reg[5] ),
    .X(_086_));
 sky130_fd_sc_hd__a22o_1 _486_ (.A1(\u_controller.counter_reg[7] ),
    .A2(net38),
    .B1(_150_),
    .B2(\u_controller.counter_reg[6] ),
    .X(_087_));
 sky130_fd_sc_hd__a22o_1 _487_ (.A1(\u_controller.counter_reg[8] ),
    .A2(net38),
    .B1(_150_),
    .B2(\u_controller.counter_reg[7] ),
    .X(_088_));
 sky130_fd_sc_hd__a22o_1 _488_ (.A1(\u_controller.counter_reg[9] ),
    .A2(net37),
    .B1(_150_),
    .B2(\u_controller.counter_reg[8] ),
    .X(_089_));
 sky130_fd_sc_hd__a22o_1 _489_ (.A1(\u_controller.counter_reg[10] ),
    .A2(net37),
    .B1(net25),
    .B2(\u_controller.counter_reg[9] ),
    .X(_090_));
 sky130_fd_sc_hd__a22o_1 _490_ (.A1(\u_controller.counter_reg[11] ),
    .A2(net38),
    .B1(net25),
    .B2(\u_controller.counter_reg[10] ),
    .X(_091_));
 sky130_fd_sc_hd__o21ba_1 _491_ (.A1(\u_controller.counter_reg[11] ),
    .A2(net19),
    .B1_N(net37),
    .X(_092_));
 sky130_fd_sc_hd__nor3b_2 _492_ (.A(_245_),
    .B(\u_controller.state[0] ),
    .C_N(\u_controller.state[1] ),
    .Y(_258_));
 sky130_fd_sc_hd__mux2_1 _493_ (.A0(\adc_data_out[0] ),
    .A1(_246_),
    .S(net24),
    .X(_093_));
 sky130_fd_sc_hd__mux2_1 _494_ (.A0(\adc_data_out[1] ),
    .A1(_247_),
    .S(net24),
    .X(_094_));
 sky130_fd_sc_hd__mux2_1 _495_ (.A0(\adc_data_out[2] ),
    .A1(_248_),
    .S(net24),
    .X(_095_));
 sky130_fd_sc_hd__mux2_1 _496_ (.A0(\adc_data_out[3] ),
    .A1(_249_),
    .S(net24),
    .X(_096_));
 sky130_fd_sc_hd__mux2_1 _497_ (.A0(\adc_data_out[4] ),
    .A1(_250_),
    .S(net24),
    .X(_097_));
 sky130_fd_sc_hd__mux2_1 _498_ (.A0(\adc_data_out[5] ),
    .A1(_251_),
    .S(_258_),
    .X(_098_));
 sky130_fd_sc_hd__mux2_1 _499_ (.A0(\adc_data_out[6] ),
    .A1(_252_),
    .S(net24),
    .X(_099_));
 sky130_fd_sc_hd__mux2_1 _500_ (.A0(\adc_data_out[7] ),
    .A1(_253_),
    .S(net24),
    .X(_100_));
 sky130_fd_sc_hd__mux2_1 _501_ (.A0(\adc_data_out[8] ),
    .A1(_254_),
    .S(net24),
    .X(_101_));
 sky130_fd_sc_hd__mux2_1 _502_ (.A0(\adc_data_out[9] ),
    .A1(_255_),
    .S(net24),
    .X(_102_));
 sky130_fd_sc_hd__mux2_1 _503_ (.A0(\adc_data_out[10] ),
    .A1(_256_),
    .S(_258_),
    .X(_103_));
 sky130_fd_sc_hd__mux2_1 _504_ (.A0(\adc_data_out[11] ),
    .A1(_257_),
    .S(net24),
    .X(_104_));
 sky130_fd_sc_hd__nand2_1 _505_ (.A(\u_spi.state[0] ),
    .B(\u_spi.sck_s1 ),
    .Y(_259_));
 sky130_fd_sc_hd__and4b_2 _506_ (.A_N(\u_spi.sck_s2 ),
    .B(_191_),
    .C(\u_spi.state[0] ),
    .D(\u_spi.sck_s1 ),
    .X(_260_));
 sky130_fd_sc_hd__or3b_1 _507_ (.A(_259_),
    .B(\u_spi.sck_s2 ),
    .C_N(_191_),
    .X(_261_));
 sky130_fd_sc_hd__mux2_1 _508_ (.A0(\u_spi.pay[0] ),
    .A1(net3),
    .S(_260_),
    .X(_105_));
 sky130_fd_sc_hd__mux2_1 _509_ (.A0(\u_spi.pay[0] ),
    .A1(\u_spi.pay[1] ),
    .S(net29),
    .X(_106_));
 sky130_fd_sc_hd__mux2_1 _510_ (.A0(\u_spi.pay[1] ),
    .A1(\u_spi.pay[2] ),
    .S(net29),
    .X(_107_));
 sky130_fd_sc_hd__mux2_1 _511_ (.A0(\u_spi.pay[3] ),
    .A1(\u_spi.pay[2] ),
    .S(_260_),
    .X(_108_));
 sky130_fd_sc_hd__mux2_1 _512_ (.A0(\u_spi.pay[3] ),
    .A1(\u_spi.pay[4] ),
    .S(net30),
    .X(_109_));
 sky130_fd_sc_hd__mux2_1 _513_ (.A0(\u_spi.pay[4] ),
    .A1(\u_spi.pay[5] ),
    .S(net29),
    .X(_110_));
 sky130_fd_sc_hd__mux2_1 _514_ (.A0(\u_spi.pay[5] ),
    .A1(\u_spi.pay[6] ),
    .S(net29),
    .X(_111_));
 sky130_fd_sc_hd__mux2_1 _515_ (.A0(\u_spi.pay[6] ),
    .A1(\u_spi.pay[7] ),
    .S(net30),
    .X(_112_));
 sky130_fd_sc_hd__mux2_1 _516_ (.A0(\u_spi.pay[7] ),
    .A1(\u_spi.pay[8] ),
    .S(net30),
    .X(_113_));
 sky130_fd_sc_hd__mux2_1 _517_ (.A0(\u_spi.pay[8] ),
    .A1(\u_spi.pay[9] ),
    .S(net30),
    .X(_114_));
 sky130_fd_sc_hd__mux2_1 _518_ (.A0(\u_spi.pay[9] ),
    .A1(\u_spi.pay[10] ),
    .S(net30),
    .X(_115_));
 sky130_fd_sc_hd__mux2_1 _519_ (.A0(\u_spi.pay[10] ),
    .A1(\u_spi.pay[11] ),
    .S(net29),
    .X(_116_));
 sky130_fd_sc_hd__mux2_1 _520_ (.A0(\u_spi.addr[0] ),
    .A1(\u_spi.pay[11] ),
    .S(_260_),
    .X(_117_));
 sky130_fd_sc_hd__mux2_1 _521_ (.A0(\u_spi.addr[0] ),
    .A1(\u_spi.addr[1] ),
    .S(net29),
    .X(_118_));
 sky130_fd_sc_hd__mux2_1 _522_ (.A0(\u_spi.cmd[0] ),
    .A1(\u_spi.addr[1] ),
    .S(_260_),
    .X(_119_));
 sky130_fd_sc_hd__mux2_1 _523_ (.A0(\u_spi.cmd[0] ),
    .A1(net45),
    .S(net29),
    .X(_120_));
 sky130_fd_sc_hd__and2_1 _524_ (.A(_152_),
    .B(net29),
    .X(_262_));
 sky130_fd_sc_hd__and2b_1 _525_ (.A_N(\u_spi.bit_cnt[0] ),
    .B(\u_spi.state[0] ),
    .X(_263_));
 sky130_fd_sc_hd__o22a_1 _526_ (.A1(\u_spi.bit_cnt[0] ),
    .A2(_260_),
    .B1(_262_),
    .B2(_263_),
    .X(_121_));
 sky130_fd_sc_hd__nand2_1 _527_ (.A(\u_spi.bit_cnt[1] ),
    .B(\u_spi.bit_cnt[0] ),
    .Y(_264_));
 sky130_fd_sc_hd__a32o_1 _528_ (.A1(_200_),
    .A2(_260_),
    .A3(_264_),
    .B1(_262_),
    .B2(net137),
    .X(_122_));
 sky130_fd_sc_hd__and3_1 _529_ (.A(\u_spi.bit_cnt[1] ),
    .B(\u_spi.bit_cnt[0] ),
    .C(\u_spi.bit_cnt[2] ),
    .X(_265_));
 sky130_fd_sc_hd__a2bb2o_1 _530_ (.A1_N(_192_),
    .A2_N(_265_),
    .B1(net29),
    .B2(_152_),
    .X(_266_));
 sky130_fd_sc_hd__nor2_1 _531_ (.A(_262_),
    .B(_264_),
    .Y(_267_));
 sky130_fd_sc_hd__o21a_1 _532_ (.A1(net108),
    .A2(_267_),
    .B1(_266_),
    .X(_123_));
 sky130_fd_sc_hd__or3b_1 _533_ (.A(\u_spi.bit_cnt[3] ),
    .B(net29),
    .C_N(_265_),
    .X(_268_));
 sky130_fd_sc_hd__a21bo_1 _534_ (.A1(net129),
    .A2(_266_),
    .B1_N(_268_),
    .X(_124_));
 sky130_fd_sc_hd__nand2_1 _535_ (.A(\u_spi.bit_cnt[3] ),
    .B(_265_),
    .Y(_269_));
 sky130_fd_sc_hd__or4_1 _536_ (.A(\u_spi.sck_s2 ),
    .B(\u_spi.bit_cnt[4] ),
    .C(_259_),
    .D(_269_),
    .X(_270_));
 sky130_fd_sc_hd__nor3_1 _537_ (.A(net2),
    .B(net133),
    .C(_270_),
    .Y(_127_));
 sky130_fd_sc_hd__a21o_1 _538_ (.A1(_260_),
    .A2(_269_),
    .B1(_262_),
    .X(_271_));
 sky130_fd_sc_hd__a21o_1 _539_ (.A1(net106),
    .A2(_271_),
    .B1(_127_),
    .X(_125_));
 sky130_fd_sc_hd__and2_1 _540_ (.A(_191_),
    .B(_270_),
    .X(_126_));
 sky130_fd_sc_hd__o21ai_1 _541_ (.A1(\u_spi.addr[1] ),
    .A2(_139_),
    .B1(\u_spi.addr[0] ),
    .Y(_272_));
 sky130_fd_sc_hd__or4b_1 _542_ (.A(\u_spi.state[0] ),
    .B(\u_spi.cmd[0] ),
    .C(net45),
    .D_N(\u_spi.state[1] ),
    .X(_273_));
 sky130_fd_sc_hd__o21ai_1 _543_ (.A1(\u_spi.addr[0] ),
    .A2(\u_spi.addr[1] ),
    .B1(_272_),
    .Y(_274_));
 sky130_fd_sc_hd__o21ai_1 _544_ (.A1(_273_),
    .A2(_274_),
    .B1(eoc_flag),
    .Y(_275_));
 sky130_fd_sc_hd__a21oi_1 _545_ (.A1(_151_),
    .A2(_275_),
    .B1(net90),
    .Y(_128_));
 sky130_fd_sc_hd__a21o_1 _546_ (.A1(_134_),
    .A2(net45),
    .B1(net33),
    .X(_276_));
 sky130_fd_sc_hd__a22o_1 _547_ (.A1(\u_spi.pay[0] ),
    .A2(net28),
    .B1(_276_),
    .B2(net93),
    .X(_129_));
 sky130_fd_sc_hd__a21o_1 _548_ (.A1(_137_),
    .A2(net45),
    .B1(net33),
    .X(_277_));
 sky130_fd_sc_hd__a22o_1 _549_ (.A1(\u_spi.pay[2] ),
    .A2(net28),
    .B1(_277_),
    .B2(net136),
    .X(_130_));
 sky130_fd_sc_hd__a21o_1 _550_ (.A1(_136_),
    .A2(net45),
    .B1(net33),
    .X(_278_));
 sky130_fd_sc_hd__a22o_1 _551_ (.A1(\u_spi.pay[3] ),
    .A2(net28),
    .B1(_278_),
    .B2(net23),
    .X(_131_));
 sky130_fd_sc_hd__a21o_1 _552_ (.A1(net45),
    .A2(_140_),
    .B1(net33),
    .X(_279_));
 sky130_fd_sc_hd__a22o_1 _553_ (.A1(\u_spi.pay[4] ),
    .A2(net28),
    .B1(_279_),
    .B2(net130),
    .X(_132_));
 sky130_fd_sc_hd__a21o_1 _554_ (.A1(net46),
    .A2(_141_),
    .B1(_155_),
    .X(_280_));
 sky130_fd_sc_hd__a22o_1 _555_ (.A1(\u_spi.pay[5] ),
    .A2(net28),
    .B1(_280_),
    .B2(net103),
    .X(_133_));
 sky130_fd_sc_hd__buf_1 _556_ (.A(net2),
    .X(_281_));
 sky130_fd_sc_hd__dfrtp_1 _557_ (.CLK(clknet_3_4__leaf_sys_clk),
    .D(_047_),
    .RESET_B(net57),
    .Q(bit_clk_sel));
 sky130_fd_sc_hd__dfrtp_1 _558_ (.CLK(clknet_3_6__leaf_sys_clk),
    .D(_048_),
    .RESET_B(net57),
    .Q(\ctrl_reg[7] ));
 sky130_fd_sc_hd__dfrtp_1 _559_ (.CLK(clknet_3_4__leaf_sys_clk),
    .D(_049_),
    .RESET_B(net57),
    .Q(\ctrl_reg[8] ));
 sky130_fd_sc_hd__dfrtp_1 _560_ (.CLK(clknet_3_4__leaf_sys_clk),
    .D(net122),
    .RESET_B(net57),
    .Q(\ctrl_reg[9] ));
 sky130_fd_sc_hd__dfrtp_1 _561_ (.CLK(clknet_3_4__leaf_sys_clk),
    .D(_051_),
    .RESET_B(net57),
    .Q(\ctrl_reg[10] ));
 sky130_fd_sc_hd__dfrtp_1 _562_ (.CLK(clknet_3_4__leaf_sys_clk),
    .D(net120),
    .RESET_B(net57),
    .Q(\ctrl_reg[11] ));
 sky130_fd_sc_hd__dfrtp_1 _563_ (.CLK(clknet_3_2__leaf_sys_clk),
    .D(_053_),
    .RESET_B(net55),
    .Q(\u_spi.miso_buffer[0] ));
 sky130_fd_sc_hd__dfrtp_1 _564_ (.CLK(clknet_3_2__leaf_sys_clk),
    .D(_054_),
    .RESET_B(net55),
    .Q(\u_spi.miso_buffer[1] ));
 sky130_fd_sc_hd__dfrtp_1 _565_ (.CLK(clknet_3_2__leaf_sys_clk),
    .D(_055_),
    .RESET_B(net55),
    .Q(\u_spi.miso_buffer[2] ));
 sky130_fd_sc_hd__dfrtp_1 _566_ (.CLK(clknet_3_3__leaf_sys_clk),
    .D(_056_),
    .RESET_B(net56),
    .Q(\u_spi.miso_buffer[3] ));
 sky130_fd_sc_hd__dfrtp_1 _567_ (.CLK(clknet_3_3__leaf_sys_clk),
    .D(_057_),
    .RESET_B(net56),
    .Q(\u_spi.miso_buffer[4] ));
 sky130_fd_sc_hd__dfrtp_1 _568_ (.CLK(clknet_3_3__leaf_sys_clk),
    .D(_058_),
    .RESET_B(net56),
    .Q(\u_spi.miso_buffer[5] ));
 sky130_fd_sc_hd__dfrtp_1 _569_ (.CLK(clknet_3_6__leaf_sys_clk),
    .D(_059_),
    .RESET_B(net62),
    .Q(\u_spi.miso_buffer[6] ));
 sky130_fd_sc_hd__dfrtp_1 _570_ (.CLK(clknet_3_6__leaf_sys_clk),
    .D(_060_),
    .RESET_B(net62),
    .Q(\u_spi.miso_buffer[7] ));
 sky130_fd_sc_hd__dfrtp_1 _571_ (.CLK(clknet_3_6__leaf_sys_clk),
    .D(_061_),
    .RESET_B(net62),
    .Q(\u_spi.miso_buffer[8] ));
 sky130_fd_sc_hd__dfrtp_1 _572_ (.CLK(clknet_3_6__leaf_sys_clk),
    .D(_062_),
    .RESET_B(net62),
    .Q(\u_spi.miso_buffer[9] ));
 sky130_fd_sc_hd__dfrtp_1 _573_ (.CLK(clknet_3_6__leaf_sys_clk),
    .D(_063_),
    .RESET_B(net62),
    .Q(\u_spi.miso_buffer[10] ));
 sky130_fd_sc_hd__dfrtp_1 _574_ (.CLK(clknet_3_6__leaf_sys_clk),
    .D(_064_),
    .RESET_B(net62),
    .Q(\u_spi.miso_buffer[11] ));
 sky130_fd_sc_hd__dfrtp_2 _575_ (.CLK(net47),
    .D(_065_),
    .RESET_B(net41),
    .Q(\u_controller.state[0] ));
 sky130_fd_sc_hd__dfrtp_1 _576_ (.CLK(net47),
    .D(_066_),
    .RESET_B(net41),
    .Q(\u_controller.state[1] ));
 sky130_fd_sc_hd__dfrtp_1 _577_ (.CLK(clknet_3_2__leaf_sys_clk),
    .D(net89),
    .RESET_B(net55),
    .Q(\u_spi.eoc_s2 ));
 sky130_fd_sc_hd__dfstp_1 _578_ (.CLK(clknet_3_2__leaf_sys_clk),
    .D(net94),
    .SET_B(net55),
    .Q(adc_en_n));
 sky130_fd_sc_hd__dfrtp_1 _579_ (.CLK(clknet_3_2__leaf_sys_clk),
    .D(_033_),
    .RESET_B(net52),
    .Q(start_clear_req));
 sky130_fd_sc_hd__dfrtp_1 _580_ (.CLK(clknet_3_7__leaf_sys_clk),
    .D(_001_),
    .RESET_B(net61),
    .Q(\clk_cnt[0] ));
 sky130_fd_sc_hd__dfrtp_2 _581_ (.CLK(clknet_3_7__leaf_sys_clk),
    .D(_012_),
    .RESET_B(net61),
    .Q(\clk_cnt[1] ));
 sky130_fd_sc_hd__dfrtp_1 _582_ (.CLK(clknet_3_7__leaf_sys_clk),
    .D(_023_),
    .RESET_B(net61),
    .Q(\clk_cnt[2] ));
 sky130_fd_sc_hd__dfrtp_1 _583_ (.CLK(clknet_3_7__leaf_sys_clk),
    .D(_026_),
    .RESET_B(net61),
    .Q(\clk_cnt[3] ));
 sky130_fd_sc_hd__dfrtp_1 _584_ (.CLK(clknet_3_7__leaf_sys_clk),
    .D(_027_),
    .RESET_B(net63),
    .Q(\clk_cnt[4] ));
 sky130_fd_sc_hd__dfrtp_1 _585_ (.CLK(clknet_3_7__leaf_sys_clk),
    .D(_028_),
    .RESET_B(net61),
    .Q(\clk_cnt[5] ));
 sky130_fd_sc_hd__dfrtp_1 _586_ (.CLK(clknet_3_7__leaf_sys_clk),
    .D(_029_),
    .RESET_B(net61),
    .Q(\clk_cnt[6] ));
 sky130_fd_sc_hd__dfrtp_1 _587_ (.CLK(clknet_3_7__leaf_sys_clk),
    .D(_030_),
    .RESET_B(net61),
    .Q(\clk_cnt[7] ));
 sky130_fd_sc_hd__dfrtp_1 _588_ (.CLK(clknet_3_5__leaf_sys_clk),
    .D(net88),
    .RESET_B(net60),
    .Q(\clk_cnt[8] ));
 sky130_fd_sc_hd__dfrtp_1 _589_ (.CLK(clknet_3_7__leaf_sys_clk),
    .D(net87),
    .RESET_B(net61),
    .Q(\clk_cnt[9] ));
 sky130_fd_sc_hd__dfrtp_1 _590_ (.CLK(clknet_3_5__leaf_sys_clk),
    .D(net86),
    .RESET_B(net60),
    .Q(\clk_cnt[10] ));
 sky130_fd_sc_hd__dfrtp_1 _591_ (.CLK(clknet_3_5__leaf_sys_clk),
    .D(net85),
    .RESET_B(net60),
    .Q(\clk_cnt[11] ));
 sky130_fd_sc_hd__dfrtp_1 _592_ (.CLK(clknet_3_5__leaf_sys_clk),
    .D(net84),
    .RESET_B(net60),
    .Q(\clk_cnt[12] ));
 sky130_fd_sc_hd__dfrtp_1 _593_ (.CLK(clknet_3_5__leaf_sys_clk),
    .D(net83),
    .RESET_B(net60),
    .Q(\clk_cnt[13] ));
 sky130_fd_sc_hd__dfrtp_1 _594_ (.CLK(clknet_3_5__leaf_sys_clk),
    .D(net82),
    .RESET_B(net60),
    .Q(\clk_cnt[14] ));
 sky130_fd_sc_hd__dfrtp_1 _595_ (.CLK(clknet_3_5__leaf_sys_clk),
    .D(net81),
    .RESET_B(net60),
    .Q(\clk_cnt[15] ));
 sky130_fd_sc_hd__dfrtp_1 _596_ (.CLK(clknet_3_5__leaf_sys_clk),
    .D(net80),
    .RESET_B(net58),
    .Q(\clk_cnt[16] ));
 sky130_fd_sc_hd__dfrtp_1 _597_ (.CLK(clknet_3_5__leaf_sys_clk),
    .D(net79),
    .RESET_B(net58),
    .Q(\clk_cnt[17] ));
 sky130_fd_sc_hd__dfrtp_1 _598_ (.CLK(clknet_3_5__leaf_sys_clk),
    .D(net78),
    .RESET_B(net58),
    .Q(\clk_cnt[18] ));
 sky130_fd_sc_hd__dfrtp_1 _599_ (.CLK(clknet_3_5__leaf_sys_clk),
    .D(net77),
    .RESET_B(net59),
    .Q(\clk_cnt[19] ));
 sky130_fd_sc_hd__dfrtp_1 _600_ (.CLK(clknet_3_5__leaf_sys_clk),
    .D(net76),
    .RESET_B(net58),
    .Q(\clk_cnt[20] ));
 sky130_fd_sc_hd__dfrtp_1 _601_ (.CLK(clknet_3_4__leaf_sys_clk),
    .D(net75),
    .RESET_B(net60),
    .Q(\clk_cnt[21] ));
 sky130_fd_sc_hd__dfrtp_1 _602_ (.CLK(clknet_3_5__leaf_sys_clk),
    .D(net74),
    .RESET_B(net58),
    .Q(\clk_cnt[22] ));
 sky130_fd_sc_hd__dfrtp_1 _603_ (.CLK(clknet_3_4__leaf_sys_clk),
    .D(net73),
    .RESET_B(net58),
    .Q(\clk_cnt[23] ));
 sky130_fd_sc_hd__dfrtp_1 _604_ (.CLK(clknet_3_5__leaf_sys_clk),
    .D(net72),
    .RESET_B(net59),
    .Q(\clk_cnt[24] ));
 sky130_fd_sc_hd__dfrtp_1 _605_ (.CLK(clknet_3_5__leaf_sys_clk),
    .D(net71),
    .RESET_B(net59),
    .Q(\clk_cnt[25] ));
 sky130_fd_sc_hd__dfrtp_1 _606_ (.CLK(clknet_3_5__leaf_sys_clk),
    .D(net70),
    .RESET_B(net59),
    .Q(\clk_cnt[26] ));
 sky130_fd_sc_hd__dfrtp_1 _607_ (.CLK(clknet_3_5__leaf_sys_clk),
    .D(net69),
    .RESET_B(net59),
    .Q(\clk_cnt[27] ));
 sky130_fd_sc_hd__dfrtp_1 _608_ (.CLK(clknet_3_5__leaf_sys_clk),
    .D(net68),
    .RESET_B(net58),
    .Q(\clk_cnt[28] ));
 sky130_fd_sc_hd__dfrtp_1 _609_ (.CLK(clknet_3_4__leaf_sys_clk),
    .D(net67),
    .RESET_B(net58),
    .Q(\clk_cnt[29] ));
 sky130_fd_sc_hd__dfrtp_1 _610_ (.CLK(clknet_3_5__leaf_sys_clk),
    .D(net66),
    .RESET_B(net58),
    .Q(\clk_cnt[30] ));
 sky130_fd_sc_hd__dfrtp_1 _611_ (.CLK(clknet_3_5__leaf_sys_clk),
    .D(net65),
    .RESET_B(net58),
    .Q(\clk_cnt[31] ));
 sky130_fd_sc_hd__dfrtp_1 _612_ (.CLK(clknet_3_0__leaf_sys_clk),
    .D(net127),
    .RESET_B(net52),
    .Q(\u_spi.eoc_sent_high ));
 sky130_fd_sc_hd__dfrtp_1 _613_ (.CLK(clknet_3_7__leaf_sys_clk),
    .D(_068_),
    .RESET_B(net63),
    .Q(net6));
 sky130_fd_sc_hd__dfrtp_1 _614_ (.CLK(net47),
    .D(_069_),
    .RESET_B(net41),
    .Q(\u_controller.dac_reg[0] ));
 sky130_fd_sc_hd__dfrtp_1 _615_ (.CLK(net47),
    .D(_070_),
    .RESET_B(net41),
    .Q(\u_controller.dac_reg[1] ));
 sky130_fd_sc_hd__dfrtp_1 _616_ (.CLK(net47),
    .D(_071_),
    .RESET_B(net41),
    .Q(\u_controller.dac_reg[2] ));
 sky130_fd_sc_hd__dfrtp_1 _617_ (.CLK(net47),
    .D(_072_),
    .RESET_B(net42),
    .Q(\u_controller.dac_reg[3] ));
 sky130_fd_sc_hd__dfrtp_1 _618_ (.CLK(net48),
    .D(_073_),
    .RESET_B(net42),
    .Q(\u_controller.dac_reg[4] ));
 sky130_fd_sc_hd__dfrtp_1 _619_ (.CLK(net48),
    .D(_074_),
    .RESET_B(net42),
    .Q(\u_controller.dac_reg[5] ));
 sky130_fd_sc_hd__dfrtp_1 _620_ (.CLK(net48),
    .D(_075_),
    .RESET_B(net44),
    .Q(\u_controller.dac_reg[6] ));
 sky130_fd_sc_hd__dfrtp_1 _621_ (.CLK(net49),
    .D(_076_),
    .RESET_B(net44),
    .Q(\u_controller.dac_reg[7] ));
 sky130_fd_sc_hd__dfrtp_1 _622_ (.CLK(net49),
    .D(_077_),
    .RESET_B(net44),
    .Q(\u_controller.dac_reg[8] ));
 sky130_fd_sc_hd__dfrtp_1 _623_ (.CLK(net49),
    .D(_078_),
    .RESET_B(net43),
    .Q(\u_controller.dac_reg[9] ));
 sky130_fd_sc_hd__dfrtp_1 _624_ (.CLK(net50),
    .D(_079_),
    .RESET_B(net43),
    .Q(\u_controller.dac_reg[10] ));
 sky130_fd_sc_hd__dfrtp_1 _625_ (.CLK(net50),
    .D(_080_),
    .RESET_B(net43),
    .Q(\u_controller.dac_reg[11] ));
 sky130_fd_sc_hd__dfrtp_1 _626_ (.CLK(net47),
    .D(_081_),
    .RESET_B(net41),
    .Q(\u_controller.counter_reg[0] ));
 sky130_fd_sc_hd__dfrtp_1 _627_ (.CLK(net48),
    .D(_082_),
    .RESET_B(net41),
    .Q(\u_controller.counter_reg[1] ));
 sky130_fd_sc_hd__dfrtp_1 _628_ (.CLK(net48),
    .D(_083_),
    .RESET_B(net42),
    .Q(\u_controller.counter_reg[2] ));
 sky130_fd_sc_hd__dfrtp_1 _629_ (.CLK(net48),
    .D(_084_),
    .RESET_B(net42),
    .Q(\u_controller.counter_reg[3] ));
 sky130_fd_sc_hd__dfrtp_1 _630_ (.CLK(net48),
    .D(_085_),
    .RESET_B(net42),
    .Q(\u_controller.counter_reg[4] ));
 sky130_fd_sc_hd__dfrtp_1 _631_ (.CLK(net48),
    .D(_086_),
    .RESET_B(net42),
    .Q(\u_controller.counter_reg[5] ));
 sky130_fd_sc_hd__dfrtp_1 _632_ (.CLK(net48),
    .D(_087_),
    .RESET_B(net44),
    .Q(\u_controller.counter_reg[6] ));
 sky130_fd_sc_hd__dfrtp_1 _633_ (.CLK(net49),
    .D(_088_),
    .RESET_B(net44),
    .Q(\u_controller.counter_reg[7] ));
 sky130_fd_sc_hd__dfrtp_1 _634_ (.CLK(net49),
    .D(_089_),
    .RESET_B(net43),
    .Q(\u_controller.counter_reg[8] ));
 sky130_fd_sc_hd__dfrtp_1 _635_ (.CLK(net49),
    .D(_090_),
    .RESET_B(net43),
    .Q(\u_controller.counter_reg[9] ));
 sky130_fd_sc_hd__dfrtp_1 _636_ (.CLK(net49),
    .D(_091_),
    .RESET_B(net43),
    .Q(\u_controller.counter_reg[10] ));
 sky130_fd_sc_hd__dfrtp_1 _637_ (.CLK(net50),
    .D(_092_),
    .RESET_B(net44),
    .Q(\u_controller.counter_reg[11] ));
 sky130_fd_sc_hd__dfrtp_1 _638_ (.CLK(net47),
    .D(_093_),
    .RESET_B(net41),
    .Q(\adc_data_out[0] ));
 sky130_fd_sc_hd__dfrtp_1 _639_ (.CLK(net47),
    .D(_094_),
    .RESET_B(net41),
    .Q(\adc_data_out[1] ));
 sky130_fd_sc_hd__dfrtp_1 _640_ (.CLK(net47),
    .D(_095_),
    .RESET_B(net41),
    .Q(\adc_data_out[2] ));
 sky130_fd_sc_hd__dfrtp_1 _641_ (.CLK(net51),
    .D(_096_),
    .RESET_B(net42),
    .Q(\adc_data_out[3] ));
 sky130_fd_sc_hd__dfrtp_1 _642_ (.CLK(net51),
    .D(_097_),
    .RESET_B(net42),
    .Q(\adc_data_out[4] ));
 sky130_fd_sc_hd__dfrtp_1 _643_ (.CLK(net51),
    .D(_098_),
    .RESET_B(net44),
    .Q(\adc_data_out[5] ));
 sky130_fd_sc_hd__dfrtp_1 _644_ (.CLK(net51),
    .D(_099_),
    .RESET_B(net44),
    .Q(\adc_data_out[6] ));
 sky130_fd_sc_hd__dfrtp_1 _645_ (.CLK(net49),
    .D(_100_),
    .RESET_B(net44),
    .Q(\adc_data_out[7] ));
 sky130_fd_sc_hd__dfrtp_1 _646_ (.CLK(net49),
    .D(_101_),
    .RESET_B(net43),
    .Q(\adc_data_out[8] ));
 sky130_fd_sc_hd__dfrtp_1 _647_ (.CLK(net49),
    .D(_102_),
    .RESET_B(net43),
    .Q(\adc_data_out[9] ));
 sky130_fd_sc_hd__dfrtp_1 _648_ (.CLK(net50),
    .D(_103_),
    .RESET_B(net43),
    .Q(\adc_data_out[10] ));
 sky130_fd_sc_hd__dfrtp_1 _649_ (.CLK(net50),
    .D(_104_),
    .RESET_B(net43),
    .Q(\adc_data_out[11] ));
 sky130_fd_sc_hd__dfrtp_1 _650_ (.CLK(clknet_3_3__leaf_sys_clk),
    .D(_034_),
    .RESET_B(net53),
    .Q(bit_start));
 sky130_fd_sc_hd__dfrtp_4 _651_ (.CLK(clknet_3_0__leaf_sys_clk),
    .D(_105_),
    .RESET_B(net52),
    .Q(\u_spi.pay[0] ));
 sky130_fd_sc_hd__dfrtp_2 _652_ (.CLK(clknet_3_1__leaf_sys_clk),
    .D(_106_),
    .RESET_B(net53),
    .Q(\u_spi.pay[1] ));
 sky130_fd_sc_hd__dfrtp_1 _653_ (.CLK(clknet_3_1__leaf_sys_clk),
    .D(_107_),
    .RESET_B(net53),
    .Q(\u_spi.pay[2] ));
 sky130_fd_sc_hd__dfrtp_1 _654_ (.CLK(clknet_3_1__leaf_sys_clk),
    .D(_108_),
    .RESET_B(net53),
    .Q(\u_spi.pay[3] ));
 sky130_fd_sc_hd__dfrtp_1 _655_ (.CLK(clknet_3_1__leaf_sys_clk),
    .D(_109_),
    .RESET_B(net53),
    .Q(\u_spi.pay[4] ));
 sky130_fd_sc_hd__dfrtp_1 _656_ (.CLK(clknet_3_1__leaf_sys_clk),
    .D(_110_),
    .RESET_B(net53),
    .Q(\u_spi.pay[5] ));
 sky130_fd_sc_hd__dfrtp_1 _657_ (.CLK(clknet_3_4__leaf_sys_clk),
    .D(_111_),
    .RESET_B(net63),
    .Q(\u_spi.pay[6] ));
 sky130_fd_sc_hd__dfrtp_1 _658_ (.CLK(clknet_3_4__leaf_sys_clk),
    .D(_112_),
    .RESET_B(net63),
    .Q(\u_spi.pay[7] ));
 sky130_fd_sc_hd__dfrtp_1 _659_ (.CLK(clknet_3_4__leaf_sys_clk),
    .D(_113_),
    .RESET_B(net57),
    .Q(\u_spi.pay[8] ));
 sky130_fd_sc_hd__dfrtp_1 _660_ (.CLK(clknet_3_4__leaf_sys_clk),
    .D(_114_),
    .RESET_B(net57),
    .Q(\u_spi.pay[9] ));
 sky130_fd_sc_hd__dfrtp_1 _661_ (.CLK(clknet_3_4__leaf_sys_clk),
    .D(_115_),
    .RESET_B(net57),
    .Q(\u_spi.pay[10] ));
 sky130_fd_sc_hd__dfrtp_1 _662_ (.CLK(clknet_3_4__leaf_sys_clk),
    .D(_116_),
    .RESET_B(net57),
    .Q(\u_spi.pay[11] ));
 sky130_fd_sc_hd__dfrtp_1 _663_ (.CLK(clknet_3_1__leaf_sys_clk),
    .D(_117_),
    .RESET_B(net53),
    .Q(\u_spi.addr[0] ));
 sky130_fd_sc_hd__dfrtp_1 _664_ (.CLK(clknet_3_1__leaf_sys_clk),
    .D(_118_),
    .RESET_B(net53),
    .Q(\u_spi.addr[1] ));
 sky130_fd_sc_hd__dfrtp_2 _665_ (.CLK(clknet_3_1__leaf_sys_clk),
    .D(_119_),
    .RESET_B(net53),
    .Q(\u_spi.cmd[0] ));
 sky130_fd_sc_hd__dfrtp_1 _666_ (.CLK(clknet_3_1__leaf_sys_clk),
    .D(_120_),
    .RESET_B(net53),
    .Q(\u_spi.cmd[1] ));
 sky130_fd_sc_hd__dfrtp_1 _667_ (.CLK(clknet_3_0__leaf_sys_clk),
    .D(net5),
    .RESET_B(net52),
    .Q(\u_spi.sck_s1 ));
 sky130_fd_sc_hd__dfrtp_1 _668_ (.CLK(clknet_3_0__leaf_sys_clk),
    .D(_121_),
    .RESET_B(net52),
    .Q(\u_spi.bit_cnt[0] ));
 sky130_fd_sc_hd__dfrtp_1 _669_ (.CLK(clknet_3_0__leaf_sys_clk),
    .D(_122_),
    .RESET_B(net52),
    .Q(\u_spi.bit_cnt[1] ));
 sky130_fd_sc_hd__dfrtp_1 _670_ (.CLK(clknet_3_0__leaf_sys_clk),
    .D(_123_),
    .RESET_B(net52),
    .Q(\u_spi.bit_cnt[2] ));
 sky130_fd_sc_hd__dfrtp_1 _671_ (.CLK(clknet_3_0__leaf_sys_clk),
    .D(_124_),
    .RESET_B(net52),
    .Q(\u_spi.bit_cnt[3] ));
 sky130_fd_sc_hd__dfrtp_1 _672_ (.CLK(clknet_3_0__leaf_sys_clk),
    .D(_125_),
    .RESET_B(net52),
    .Q(\u_spi.bit_cnt[4] ));
 sky130_fd_sc_hd__dfrtp_1 _673_ (.CLK(clknet_3_0__leaf_sys_clk),
    .D(net92),
    .RESET_B(net54),
    .Q(\u_spi.sck_s2 ));
 sky130_fd_sc_hd__dfrtp_2 _674_ (.CLK(clknet_3_0__leaf_sys_clk),
    .D(_126_),
    .RESET_B(net54),
    .Q(\u_spi.state[0] ));
 sky130_fd_sc_hd__dfrtp_1 _675_ (.CLK(clknet_3_0__leaf_sys_clk),
    .D(_127_),
    .RESET_B(net52),
    .Q(\u_spi.state[1] ));
 sky130_fd_sc_hd__dfrtp_1 _676_ (.CLK(clknet_3_0__leaf_sys_clk),
    .D(net91),
    .RESET_B(net54),
    .Q(eoc_flag));
 sky130_fd_sc_hd__dfrtp_1 _677_ (.CLK(clknet_3_2__leaf_sys_clk),
    .D(adc_ack),
    .RESET_B(net55),
    .Q(\u_spi.eoc_s1 ));
 sky130_fd_sc_hd__dfrtp_1 _678_ (.CLK(clknet_3_2__leaf_sys_clk),
    .D(_035_),
    .RESET_B(net55),
    .Q(\u_spi.data_reg[0] ));
 sky130_fd_sc_hd__dfrtp_1 _679_ (.CLK(clknet_3_2__leaf_sys_clk),
    .D(_038_),
    .RESET_B(net55),
    .Q(\u_spi.data_reg[1] ));
 sky130_fd_sc_hd__dfrtp_1 _680_ (.CLK(clknet_3_2__leaf_sys_clk),
    .D(_039_),
    .RESET_B(net55),
    .Q(\u_spi.data_reg[2] ));
 sky130_fd_sc_hd__dfrtp_1 _681_ (.CLK(clknet_3_3__leaf_sys_clk),
    .D(_040_),
    .RESET_B(net56),
    .Q(\u_spi.data_reg[3] ));
 sky130_fd_sc_hd__dfrtp_1 _682_ (.CLK(clknet_3_3__leaf_sys_clk),
    .D(_041_),
    .RESET_B(net56),
    .Q(\u_spi.data_reg[4] ));
 sky130_fd_sc_hd__dfrtp_1 _683_ (.CLK(clknet_3_3__leaf_sys_clk),
    .D(_042_),
    .RESET_B(net56),
    .Q(\u_spi.data_reg[5] ));
 sky130_fd_sc_hd__dfrtp_1 _684_ (.CLK(clknet_3_6__leaf_sys_clk),
    .D(_043_),
    .RESET_B(net62),
    .Q(\u_spi.data_reg[6] ));
 sky130_fd_sc_hd__dfrtp_1 _685_ (.CLK(clknet_3_6__leaf_sys_clk),
    .D(_044_),
    .RESET_B(net62),
    .Q(\u_spi.data_reg[7] ));
 sky130_fd_sc_hd__dfrtp_1 _686_ (.CLK(clknet_3_6__leaf_sys_clk),
    .D(_045_),
    .RESET_B(net62),
    .Q(\u_spi.data_reg[8] ));
 sky130_fd_sc_hd__dfrtp_1 _687_ (.CLK(clknet_3_7__leaf_sys_clk),
    .D(_046_),
    .RESET_B(net63),
    .Q(\u_spi.data_reg[9] ));
 sky130_fd_sc_hd__dfrtp_1 _688_ (.CLK(clknet_3_7__leaf_sys_clk),
    .D(_036_),
    .RESET_B(net61),
    .Q(\u_spi.data_reg[10] ));
 sky130_fd_sc_hd__dfrtp_1 _689_ (.CLK(clknet_3_7__leaf_sys_clk),
    .D(_037_),
    .RESET_B(net61),
    .Q(\u_spi.data_reg[11] ));
 sky130_fd_sc_hd__dfrtp_1 _690_ (.CLK(clknet_3_3__leaf_sys_clk),
    .D(_129_),
    .RESET_B(net56),
    .Q(bit_en));
 sky130_fd_sc_hd__dfrtp_1 _691_ (.CLK(clknet_3_1__leaf_sys_clk),
    .D(_130_),
    .RESET_B(net54),
    .Q(bit_auto));
 sky130_fd_sc_hd__dfrtp_2 _692_ (.CLK(clknet_3_1__leaf_sys_clk),
    .D(_131_),
    .RESET_B(net54),
    .Q(net23));
 sky130_fd_sc_hd__dfrtp_1 _693_ (.CLK(clknet_3_3__leaf_sys_clk),
    .D(net131),
    .RESET_B(net56),
    .Q(bit_int_en));
 sky130_fd_sc_hd__dfrtp_1 _694_ (.CLK(clknet_3_3__leaf_sys_clk),
    .D(net104),
    .RESET_B(net56),
    .Q(\ctrl_reg[5] ));
 sky130_fd_sc_hd__conb_1 _610__66 (.LO(net66));
 sky130_fd_sc_hd__conb_1 _609__67 (.LO(net67));
 sky130_fd_sc_hd__conb_1 _608__68 (.LO(net68));
 sky130_fd_sc_hd__conb_1 _607__69 (.LO(net69));
 sky130_fd_sc_hd__conb_1 _606__70 (.LO(net70));
 sky130_fd_sc_hd__conb_1 _605__71 (.LO(net71));
 sky130_fd_sc_hd__conb_1 _604__72 (.LO(net72));
 sky130_fd_sc_hd__conb_1 _603__73 (.LO(net73));
 sky130_fd_sc_hd__conb_1 _602__74 (.LO(net74));
 sky130_fd_sc_hd__conb_1 _601__75 (.LO(net75));
 sky130_fd_sc_hd__conb_1 _600__76 (.LO(net76));
 sky130_fd_sc_hd__conb_1 _599__77 (.LO(net77));
 sky130_fd_sc_hd__conb_1 _598__78 (.LO(net78));
 sky130_fd_sc_hd__conb_1 _597__79 (.LO(net79));
 sky130_fd_sc_hd__conb_1 _596__80 (.LO(net80));
 sky130_fd_sc_hd__conb_1 _595__81 (.LO(net81));
 sky130_fd_sc_hd__conb_1 _594__82 (.LO(net82));
 sky130_fd_sc_hd__conb_1 _593__83 (.LO(net83));
 sky130_fd_sc_hd__conb_1 _592__84 (.LO(net84));
 sky130_fd_sc_hd__conb_1 _591__85 (.LO(net85));
 sky130_fd_sc_hd__conb_1 _590__86 (.LO(net86));
 sky130_fd_sc_hd__conb_1 _589__87 (.LO(net87));
 sky130_fd_sc_hd__conb_1 _588__88 (.LO(net88));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_0_sys_clk (.A(sys_clk),
    .X(clknet_0_sys_clk));
 sky130_fd_sc_hd__clkbuf_1 _719_ (.A(net19),
    .X(net22));
 sky130_fd_sc_hd__ebufn_8 _720_ (.A(\u_spi.miso_buffer[11] ),
    .TE_B(_281_),
    .Z(miso));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_0_Right_0 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_1_Right_1 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_2_Right_2 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_3_Right_3 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_4_Right_4 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_5_Right_5 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_6_Right_6 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_7_Right_7 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_8_Right_8 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_9_Right_9 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_10_Right_10 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_11_Right_11 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_12_Right_12 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_13_Right_13 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_14_Right_14 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_15_Right_15 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_16_Right_16 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_17_Right_17 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_18_Right_18 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_19_Right_19 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_20_Right_20 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_21_Right_21 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_22_Right_22 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_23_Right_23 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_24_Right_24 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_25_Right_25 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_26_Right_26 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_27_Right_27 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_28_Right_28 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_29_Right_29 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_30_Right_30 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_31_Right_31 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_32_Right_32 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_33_Right_33 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_34_Right_34 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_35_Right_35 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_36_Right_36 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_37_Right_37 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_38_Right_38 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_39_Right_39 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_40_Right_40 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_41_Right_41 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_42_Right_42 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_0_Left_43 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_1_Left_44 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_2_Left_45 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_3_Left_46 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_4_Left_47 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_5_Left_48 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_6_Left_49 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_7_Left_50 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_8_Left_51 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_9_Left_52 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_10_Left_53 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_11_Left_54 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_12_Left_55 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_13_Left_56 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_14_Left_57 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_15_Left_58 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_16_Left_59 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_17_Left_60 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_18_Left_61 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_19_Left_62 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_20_Left_63 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_21_Left_64 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_22_Left_65 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_23_Left_66 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_24_Left_67 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_25_Left_68 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_26_Left_69 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_27_Left_70 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_28_Left_71 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_29_Left_72 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_30_Left_73 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_31_Left_74 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_32_Left_75 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_33_Left_76 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_34_Left_77 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_35_Left_78 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_36_Left_79 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_37_Left_80 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_38_Left_81 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_39_Left_82 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_40_Left_83 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_41_Left_84 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_42_Left_85 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_86 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_87 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_88 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_89 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_90 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_91 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_92 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_93 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_94 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_95 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_96 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_97 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_98 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_99 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_100 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_101 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_102 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_103 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_104 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_105 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_106 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_107 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_108 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_109 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_110 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_111 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_112 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_113 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_114 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_115 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_116 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_117 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_118 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_119 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_120 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_121 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_122 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_123 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_124 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_125 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_126 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_127 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_128 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_129 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_130 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_131 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_132 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_133 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_134 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_135 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_136 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_137 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_138 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_139 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_140 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_141 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_142 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_143 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_144 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_145 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_146 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_147 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_148 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_149 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_150 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_151 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_152 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_153 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_154 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_155 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_156 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_157 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_158 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_159 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_160 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_161 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_162 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_163 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_164 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_165 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_166 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_167 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_168 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_169 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_20_170 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_20_171 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_20_172 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_20_173 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_21_174 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_21_175 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_21_176 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_21_177 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_22_178 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_22_179 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_22_180 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_22_181 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_23_182 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_23_183 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_23_184 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_23_185 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_24_186 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_24_187 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_24_188 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_24_189 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_25_190 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_25_191 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_25_192 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_25_193 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_26_194 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_26_195 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_26_196 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_26_197 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_27_198 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_27_199 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_27_200 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_27_201 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_28_202 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_28_203 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_28_204 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_28_205 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_29_206 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_29_207 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_29_208 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_29_209 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_30_210 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_30_211 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_30_212 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_30_213 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_31_214 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_31_215 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_31_216 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_31_217 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_32_218 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_32_219 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_32_220 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_32_221 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_33_222 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_33_223 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_33_224 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_33_225 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_34_226 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_34_227 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_34_228 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_34_229 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_35_230 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_35_231 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_35_232 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_35_233 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_36_234 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_36_235 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_36_236 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_36_237 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_37_238 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_37_239 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_37_240 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_37_241 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_38_242 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_38_243 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_38_244 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_38_245 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_39_246 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_39_247 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_39_248 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_39_249 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_40_250 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_40_251 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_40_252 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_40_253 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_41_254 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_41_255 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_41_256 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_41_257 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_42_258 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_42_259 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_42_260 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_42_261 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_42_262 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_42_263 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_42_264 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_42_265 ();
 sky130_fd_sc_hd__buf_1 input1 (.A(comparator),
    .X(net1));
 sky130_fd_sc_hd__dlymetal6s2s_1 input2 (.A(cs),
    .X(net2));
 sky130_fd_sc_hd__clkbuf_1 input3 (.A(mosi),
    .X(net3));
 sky130_fd_sc_hd__dlymetal6s2s_1 input4 (.A(reset_),
    .X(net4));
 sky130_fd_sc_hd__clkbuf_1 input5 (.A(sck),
    .X(net5));
 sky130_fd_sc_hd__buf_2 output6 (.A(net50),
    .X(adc_clk_out));
 sky130_fd_sc_hd__buf_2 output7 (.A(net7),
    .X(dac[0]));
 sky130_fd_sc_hd__buf_2 output8 (.A(net8),
    .X(dac[10]));
 sky130_fd_sc_hd__buf_2 output9 (.A(net9),
    .X(dac[11]));
 sky130_fd_sc_hd__buf_2 output10 (.A(net10),
    .X(dac[1]));
 sky130_fd_sc_hd__buf_2 output11 (.A(net11),
    .X(dac[2]));
 sky130_fd_sc_hd__buf_2 output12 (.A(net12),
    .X(dac[3]));
 sky130_fd_sc_hd__buf_2 output13 (.A(net13),
    .X(dac[4]));
 sky130_fd_sc_hd__buf_2 output14 (.A(net14),
    .X(dac[5]));
 sky130_fd_sc_hd__buf_2 output15 (.A(net15),
    .X(dac[6]));
 sky130_fd_sc_hd__buf_2 output16 (.A(net16),
    .X(dac[7]));
 sky130_fd_sc_hd__buf_2 output17 (.A(net17),
    .X(dac[8]));
 sky130_fd_sc_hd__buf_2 output18 (.A(net18),
    .X(dac[9]));
 sky130_fd_sc_hd__buf_2 output19 (.A(net19),
    .X(dac_rst));
 sky130_fd_sc_hd__buf_2 output20 (.A(net20),
    .X(irq));
 sky130_fd_sc_hd__buf_2 output21 (.A(net21),
    .X(pwr_gate));
 sky130_fd_sc_hd__buf_2 output22 (.A(net22),
    .X(sample_and_hold));
 sky130_fd_sc_hd__buf_2 output23 (.A(net23),
    .X(vref_sel));
 sky130_fd_sc_hd__clkbuf_4 fanout24 (.A(_258_),
    .X(net24));
 sky130_fd_sc_hd__clkbuf_4 fanout25 (.A(_150_),
    .X(net25));
 sky130_fd_sc_hd__buf_2 fanout26 (.A(_205_),
    .X(net26));
 sky130_fd_sc_hd__clkbuf_2 fanout27 (.A(_204_),
    .X(net27));
 sky130_fd_sc_hd__buf_2 fanout28 (.A(_156_),
    .X(net28));
 sky130_fd_sc_hd__clkbuf_4 fanout29 (.A(_261_),
    .X(net29));
 sky130_fd_sc_hd__clkbuf_2 fanout30 (.A(_261_),
    .X(net30));
 sky130_fd_sc_hd__buf_2 fanout31 (.A(_194_),
    .X(net31));
 sky130_fd_sc_hd__buf_2 fanout32 (.A(_193_),
    .X(net32));
 sky130_fd_sc_hd__clkbuf_4 fanout33 (.A(_155_),
    .X(net33));
 sky130_fd_sc_hd__clkbuf_4 fanout34 (.A(_153_),
    .X(net34));
 sky130_fd_sc_hd__buf_2 fanout35 (.A(net36),
    .X(net35));
 sky130_fd_sc_hd__buf_2 fanout36 (.A(_149_),
    .X(net36));
 sky130_fd_sc_hd__buf_2 fanout37 (.A(net38),
    .X(net37));
 sky130_fd_sc_hd__buf_2 fanout38 (.A(_149_),
    .X(net38));
 sky130_fd_sc_hd__buf_2 fanout39 (.A(_148_),
    .X(net39));
 sky130_fd_sc_hd__buf_2 fanout40 (.A(_195_),
    .X(net40));
 sky130_fd_sc_hd__clkbuf_4 fanout41 (.A(net42),
    .X(net41));
 sky130_fd_sc_hd__clkbuf_4 fanout42 (.A(\u_controller.reset_ ),
    .X(net42));
 sky130_fd_sc_hd__clkbuf_4 fanout43 (.A(net44),
    .X(net43));
 sky130_fd_sc_hd__clkbuf_4 fanout44 (.A(\u_controller.reset_ ),
    .X(net44));
 sky130_fd_sc_hd__clkbuf_4 fanout45 (.A(\u_spi.cmd[1] ),
    .X(net45));
 sky130_fd_sc_hd__clkbuf_2 fanout46 (.A(\u_spi.cmd[1] ),
    .X(net46));
 sky130_fd_sc_hd__clkbuf_2 fanout47 (.A(net48),
    .X(net47));
 sky130_fd_sc_hd__clkbuf_2 fanout48 (.A(net51),
    .X(net48));
 sky130_fd_sc_hd__clkbuf_2 fanout49 (.A(net51),
    .X(net49));
 sky130_fd_sc_hd__clkbuf_2 fanout50 (.A(net51),
    .X(net50));
 sky130_fd_sc_hd__clkbuf_2 fanout51 (.A(net6),
    .X(net51));
 sky130_fd_sc_hd__clkbuf_4 fanout52 (.A(net54),
    .X(net52));
 sky130_fd_sc_hd__clkbuf_4 fanout53 (.A(net54),
    .X(net53));
 sky130_fd_sc_hd__buf_2 fanout54 (.A(net4),
    .X(net54));
 sky130_fd_sc_hd__clkbuf_4 fanout55 (.A(net4),
    .X(net55));
 sky130_fd_sc_hd__clkbuf_4 fanout56 (.A(net4),
    .X(net56));
 sky130_fd_sc_hd__clkbuf_4 fanout57 (.A(net63),
    .X(net57));
 sky130_fd_sc_hd__clkbuf_4 fanout58 (.A(net60),
    .X(net58));
 sky130_fd_sc_hd__clkbuf_2 fanout59 (.A(net60),
    .X(net59));
 sky130_fd_sc_hd__clkbuf_4 fanout60 (.A(net63),
    .X(net60));
 sky130_fd_sc_hd__clkbuf_4 fanout61 (.A(net62),
    .X(net61));
 sky130_fd_sc_hd__clkbuf_4 fanout62 (.A(net63),
    .X(net62));
 sky130_fd_sc_hd__buf_2 fanout63 (.A(net4),
    .X(net63));
 sky130_fd_sc_hd__buf_2 fanout64 (.A(net1),
    .X(net64));
 sky130_fd_sc_hd__conb_1 _611__65 (.LO(net65));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_3_0__f_sys_clk (.A(clknet_0_sys_clk),
    .X(clknet_3_0__leaf_sys_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_3_1__f_sys_clk (.A(clknet_0_sys_clk),
    .X(clknet_3_1__leaf_sys_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_3_2__f_sys_clk (.A(clknet_0_sys_clk),
    .X(clknet_3_2__leaf_sys_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_3_3__f_sys_clk (.A(clknet_0_sys_clk),
    .X(clknet_3_3__leaf_sys_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_3_4__f_sys_clk (.A(clknet_0_sys_clk),
    .X(clknet_3_4__leaf_sys_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_3_5__f_sys_clk (.A(clknet_0_sys_clk),
    .X(clknet_3_5__leaf_sys_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_3_6__f_sys_clk (.A(clknet_0_sys_clk),
    .X(clknet_3_6__leaf_sys_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_3_7__f_sys_clk (.A(clknet_0_sys_clk),
    .X(clknet_3_7__leaf_sys_clk));
 sky130_fd_sc_hd__inv_6 clkload0 (.A(clknet_3_0__leaf_sys_clk));
 sky130_fd_sc_hd__inv_8 clkload1 (.A(clknet_3_1__leaf_sys_clk));
 sky130_fd_sc_hd__inv_8 clkload2 (.A(clknet_3_2__leaf_sys_clk));
 sky130_fd_sc_hd__inv_8 clkload3 (.A(clknet_3_3__leaf_sys_clk));
 sky130_fd_sc_hd__clkinv_4 clkload4 (.A(clknet_3_4__leaf_sys_clk));
 sky130_fd_sc_hd__inv_8 clkload5 (.A(clknet_3_6__leaf_sys_clk));
 sky130_fd_sc_hd__inv_6 clkload6 (.A(clknet_3_7__leaf_sys_clk));
 sky130_fd_sc_hd__dlygate4sd3_1 hold1 (.A(\u_spi.eoc_s1 ),
    .X(net89));
 sky130_fd_sc_hd__dlygate4sd3_1 hold2 (.A(start_clear_req),
    .X(net90));
 sky130_fd_sc_hd__dlygate4sd3_1 hold3 (.A(_128_),
    .X(net91));
 sky130_fd_sc_hd__dlygate4sd3_1 hold4 (.A(\u_spi.sck_s1 ),
    .X(net92));
 sky130_fd_sc_hd__dlygate4sd3_1 hold5 (.A(bit_en),
    .X(net93));
 sky130_fd_sc_hd__dlygate4sd3_1 hold6 (.A(_000_),
    .X(net94));
 sky130_fd_sc_hd__dlygate4sd3_1 hold7 (.A(\u_spi.miso_buffer[2] ),
    .X(net95));
 sky130_fd_sc_hd__dlygate4sd3_1 hold8 (.A(\u_spi.miso_buffer[1] ),
    .X(net96));
 sky130_fd_sc_hd__dlygate4sd3_1 hold9 (.A(\u_spi.miso_buffer[3] ),
    .X(net97));
 sky130_fd_sc_hd__dlygate4sd3_1 hold10 (.A(\u_spi.miso_buffer[4] ),
    .X(net98));
 sky130_fd_sc_hd__dlygate4sd3_1 hold11 (.A(\u_spi.miso_buffer[9] ),
    .X(net99));
 sky130_fd_sc_hd__dlygate4sd3_1 hold12 (.A(\u_spi.miso_buffer[7] ),
    .X(net100));
 sky130_fd_sc_hd__dlygate4sd3_1 hold13 (.A(\u_spi.miso_buffer[6] ),
    .X(net101));
 sky130_fd_sc_hd__dlygate4sd3_1 hold14 (.A(\u_spi.miso_buffer[5] ),
    .X(net102));
 sky130_fd_sc_hd__dlygate4sd3_1 hold15 (.A(\ctrl_reg[5] ),
    .X(net103));
 sky130_fd_sc_hd__dlygate4sd3_1 hold16 (.A(_133_),
    .X(net104));
 sky130_fd_sc_hd__dlygate4sd3_1 hold17 (.A(\u_spi.miso_buffer[10] ),
    .X(net105));
 sky130_fd_sc_hd__dlygate4sd3_1 hold18 (.A(\u_spi.bit_cnt[4] ),
    .X(net106));
 sky130_fd_sc_hd__dlygate4sd3_1 hold19 (.A(\u_spi.miso_buffer[8] ),
    .X(net107));
 sky130_fd_sc_hd__dlygate4sd3_1 hold20 (.A(\u_spi.bit_cnt[2] ),
    .X(net108));
 sky130_fd_sc_hd__dlygate4sd3_1 hold21 (.A(\ctrl_reg[7] ),
    .X(net109));
 sky130_fd_sc_hd__dlygate4sd3_1 hold22 (.A(\u_spi.data_reg[6] ),
    .X(net110));
 sky130_fd_sc_hd__dlygate4sd3_1 hold23 (.A(\u_spi.data_reg[2] ),
    .X(net111));
 sky130_fd_sc_hd__dlygate4sd3_1 hold24 (.A(\ctrl_reg[10] ),
    .X(net112));
 sky130_fd_sc_hd__dlygate4sd3_1 hold25 (.A(\u_spi.data_reg[10] ),
    .X(net113));
 sky130_fd_sc_hd__dlygate4sd3_1 hold26 (.A(\u_spi.data_reg[8] ),
    .X(net114));
 sky130_fd_sc_hd__dlygate4sd3_1 hold27 (.A(\u_spi.data_reg[7] ),
    .X(net115));
 sky130_fd_sc_hd__dlygate4sd3_1 hold28 (.A(\u_spi.data_reg[4] ),
    .X(net116));
 sky130_fd_sc_hd__dlygate4sd3_1 hold29 (.A(\u_spi.data_reg[5] ),
    .X(net117));
 sky130_fd_sc_hd__dlygate4sd3_1 hold30 (.A(\u_spi.data_reg[1] ),
    .X(net118));
 sky130_fd_sc_hd__dlygate4sd3_1 hold31 (.A(\ctrl_reg[11] ),
    .X(net119));
 sky130_fd_sc_hd__dlygate4sd3_1 hold32 (.A(_052_),
    .X(net120));
 sky130_fd_sc_hd__dlygate4sd3_1 hold33 (.A(\ctrl_reg[9] ),
    .X(net121));
 sky130_fd_sc_hd__dlygate4sd3_1 hold34 (.A(_050_),
    .X(net122));
 sky130_fd_sc_hd__dlygate4sd3_1 hold35 (.A(\u_spi.data_reg[3] ),
    .X(net123));
 sky130_fd_sc_hd__dlygate4sd3_1 hold36 (.A(\u_spi.data_reg[0] ),
    .X(net124));
 sky130_fd_sc_hd__dlygate4sd3_1 hold37 (.A(\u_spi.data_reg[9] ),
    .X(net125));
 sky130_fd_sc_hd__dlygate4sd3_1 hold38 (.A(\u_spi.eoc_sent_high ),
    .X(net126));
 sky130_fd_sc_hd__dlygate4sd3_1 hold39 (.A(_067_),
    .X(net127));
 sky130_fd_sc_hd__dlygate4sd3_1 hold40 (.A(\ctrl_reg[8] ),
    .X(net128));
 sky130_fd_sc_hd__dlygate4sd3_1 hold41 (.A(\u_spi.bit_cnt[3] ),
    .X(net129));
 sky130_fd_sc_hd__dlygate4sd3_1 hold42 (.A(bit_int_en),
    .X(net130));
 sky130_fd_sc_hd__dlygate4sd3_1 hold43 (.A(_132_),
    .X(net131));
 sky130_fd_sc_hd__dlygate4sd3_1 hold44 (.A(\u_spi.data_reg[11] ),
    .X(net132));
 sky130_fd_sc_hd__dlygate4sd3_1 hold45 (.A(\u_spi.state[1] ),
    .X(net133));
 sky130_fd_sc_hd__dlygate4sd3_1 hold46 (.A(eoc_flag),
    .X(net134));
 sky130_fd_sc_hd__dlygate4sd3_1 hold47 (.A(bit_start),
    .X(net135));
 sky130_fd_sc_hd__dlygate4sd3_1 hold48 (.A(bit_auto),
    .X(net136));
 sky130_fd_sc_hd__dlygate4sd3_1 hold49 (.A(\u_spi.bit_cnt[1] ),
    .X(net137));
 sky130_fd_sc_hd__dlygate4sd3_1 hold50 (.A(\u_spi.miso_buffer[11] ),
    .X(net138));
 sky130_ef_sc_hd__decap_12 FILLER_0_3 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_41 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_57 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_69 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_76 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_85 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_97 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_109 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_113 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_125 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_139 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_149 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_161 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_167 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_169 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_181 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_193 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_197 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_209 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_221 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_225 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_237 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_242 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_15 ();
 sky130_fd_sc_hd__fill_2 FILLER_1_27 ();
 sky130_fd_sc_hd__decap_6 FILLER_1_49 ();
 sky130_fd_sc_hd__fill_1 FILLER_1_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_98 ();
 sky130_fd_sc_hd__fill_2 FILLER_1_110 ();
 sky130_fd_sc_hd__fill_1 FILLER_1_113 ();
 sky130_fd_sc_hd__decap_6 FILLER_1_117 ();
 sky130_fd_sc_hd__decap_6 FILLER_1_144 ();
 sky130_fd_sc_hd__fill_1 FILLER_1_167 ();
 sky130_fd_sc_hd__decap_4 FILLER_1_198 ();
 sky130_fd_sc_hd__fill_2 FILLER_1_222 ();
 sky130_fd_sc_hd__decap_4 FILLER_1_225 ();
 sky130_fd_sc_hd__decap_8 FILLER_1_243 ();
 sky130_fd_sc_hd__fill_1 FILLER_1_251 ();
 sky130_ef_sc_hd__decap_12 FILLER_2_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_2_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_2_27 ();
 sky130_fd_sc_hd__decap_6 FILLER_2_29 ();
 sky130_fd_sc_hd__fill_1 FILLER_2_85 ();
 sky130_fd_sc_hd__decap_8 FILLER_2_109 ();
 sky130_fd_sc_hd__decap_3 FILLER_2_117 ();
 sky130_fd_sc_hd__decap_6 FILLER_2_161 ();
 sky130_fd_sc_hd__decap_3 FILLER_2_197 ();
 sky130_fd_sc_hd__decap_4 FILLER_2_226 ();
 sky130_fd_sc_hd__fill_2 FILLER_2_250 ();
 sky130_ef_sc_hd__decap_12 FILLER_3_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_3_15 ();
 sky130_fd_sc_hd__decap_8 FILLER_3_27 ();
 sky130_fd_sc_hd__decap_3 FILLER_3_41 ();
 sky130_fd_sc_hd__decap_3 FILLER_3_65 ();
 sky130_ef_sc_hd__decap_12 FILLER_3_88 ();
 sky130_fd_sc_hd__decap_6 FILLER_3_100 ();
 sky130_fd_sc_hd__fill_1 FILLER_3_111 ();
 sky130_fd_sc_hd__fill_1 FILLER_3_133 ();
 sky130_fd_sc_hd__fill_1 FILLER_3_140 ();
 sky130_fd_sc_hd__decap_6 FILLER_3_161 ();
 sky130_fd_sc_hd__fill_1 FILLER_3_167 ();
 sky130_ef_sc_hd__decap_12 FILLER_3_189 ();
 sky130_fd_sc_hd__fill_1 FILLER_3_201 ();
 sky130_fd_sc_hd__fill_2 FILLER_3_225 ();
 sky130_fd_sc_hd__fill_1 FILLER_3_233 ();
 sky130_fd_sc_hd__fill_2 FILLER_3_246 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_4_27 ();
 sky130_fd_sc_hd__decap_8 FILLER_4_29 ();
 sky130_fd_sc_hd__fill_1 FILLER_4_37 ();
 sky130_fd_sc_hd__fill_2 FILLER_4_44 ();
 sky130_fd_sc_hd__fill_2 FILLER_4_55 ();
 sky130_fd_sc_hd__fill_1 FILLER_4_65 ();
 sky130_fd_sc_hd__decap_8 FILLER_4_75 ();
 sky130_fd_sc_hd__fill_1 FILLER_4_83 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_85 ();
 sky130_fd_sc_hd__fill_1 FILLER_4_97 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_126 ();
 sky130_fd_sc_hd__fill_2 FILLER_4_138 ();
 sky130_fd_sc_hd__decap_8 FILLER_4_141 ();
 sky130_fd_sc_hd__fill_2 FILLER_4_149 ();
 sky130_fd_sc_hd__decap_8 FILLER_4_168 ();
 sky130_fd_sc_hd__decap_3 FILLER_4_176 ();
 sky130_fd_sc_hd__decap_8 FILLER_4_188 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_197 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_209 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_221 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_233 ();
 sky130_fd_sc_hd__decap_6 FILLER_4_245 ();
 sky130_fd_sc_hd__fill_1 FILLER_4_251 ();
 sky130_fd_sc_hd__decap_6 FILLER_5_3 ();
 sky130_fd_sc_hd__fill_2 FILLER_5_29 ();
 sky130_fd_sc_hd__fill_1 FILLER_5_36 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_40 ();
 sky130_fd_sc_hd__decap_4 FILLER_5_52 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_64 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_76 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_88 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_100 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_125 ();
 sky130_fd_sc_hd__fill_2 FILLER_5_137 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_147 ();
 sky130_fd_sc_hd__decap_8 FILLER_5_159 ();
 sky130_fd_sc_hd__fill_1 FILLER_5_167 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_169 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_181 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_193 ();
 sky130_fd_sc_hd__decap_8 FILLER_5_205 ();
 sky130_fd_sc_hd__decap_3 FILLER_5_213 ();
 sky130_fd_sc_hd__fill_1 FILLER_5_223 ();
 sky130_fd_sc_hd__decap_6 FILLER_5_225 ();
 sky130_fd_sc_hd__fill_1 FILLER_5_231 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_6_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_6_19 ();
 sky130_fd_sc_hd__decap_6 FILLER_6_44 ();
 sky130_fd_sc_hd__fill_1 FILLER_6_50 ();
 sky130_fd_sc_hd__fill_1 FILLER_6_56 ();
 sky130_fd_sc_hd__decap_3 FILLER_6_65 ();
 sky130_fd_sc_hd__decap_8 FILLER_6_76 ();
 sky130_fd_sc_hd__fill_2 FILLER_6_93 ();
 sky130_fd_sc_hd__decap_4 FILLER_6_104 ();
 sky130_fd_sc_hd__fill_1 FILLER_6_139 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_174 ();
 sky130_fd_sc_hd__decap_6 FILLER_6_186 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_204 ();
 sky130_fd_sc_hd__fill_1 FILLER_6_216 ();
 sky130_fd_sc_hd__decap_4 FILLER_6_244 ();
 sky130_fd_sc_hd__fill_2 FILLER_7_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_7_25 ();
 sky130_fd_sc_hd__fill_2 FILLER_7_34 ();
 sky130_fd_sc_hd__fill_1 FILLER_7_50 ();
 sky130_fd_sc_hd__fill_2 FILLER_7_86 ();
 sky130_fd_sc_hd__fill_1 FILLER_7_111 ();
 sky130_fd_sc_hd__decap_6 FILLER_7_119 ();
 sky130_fd_sc_hd__fill_1 FILLER_7_125 ();
 sky130_fd_sc_hd__decap_3 FILLER_7_153 ();
 sky130_fd_sc_hd__decap_4 FILLER_7_164 ();
 sky130_fd_sc_hd__decap_8 FILLER_7_177 ();
 sky130_ef_sc_hd__decap_12 FILLER_7_211 ();
 sky130_fd_sc_hd__fill_1 FILLER_7_223 ();
 sky130_fd_sc_hd__decap_6 FILLER_7_225 ();
 sky130_fd_sc_hd__fill_1 FILLER_7_231 ();
 sky130_ef_sc_hd__decap_12 FILLER_7_238 ();
 sky130_fd_sc_hd__fill_2 FILLER_7_250 ();
 sky130_ef_sc_hd__decap_12 FILLER_8_3 ();
 sky130_fd_sc_hd__decap_6 FILLER_8_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_8_21 ();
 sky130_fd_sc_hd__decap_8 FILLER_8_45 ();
 sky130_fd_sc_hd__fill_2 FILLER_8_53 ();
 sky130_fd_sc_hd__fill_2 FILLER_8_82 ();
 sky130_fd_sc_hd__decap_4 FILLER_8_105 ();
 sky130_fd_sc_hd__fill_1 FILLER_8_109 ();
 sky130_fd_sc_hd__fill_2 FILLER_8_124 ();
 sky130_fd_sc_hd__decap_4 FILLER_8_135 ();
 sky130_fd_sc_hd__fill_1 FILLER_8_139 ();
 sky130_fd_sc_hd__decap_6 FILLER_8_169 ();
 sky130_fd_sc_hd__fill_2 FILLER_8_207 ();
 sky130_fd_sc_hd__decap_8 FILLER_8_243 ();
 sky130_fd_sc_hd__fill_1 FILLER_8_251 ();
 sky130_ef_sc_hd__decap_12 FILLER_9_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_9_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_9_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_9_36 ();
 sky130_fd_sc_hd__decap_8 FILLER_9_48 ();
 sky130_fd_sc_hd__decap_4 FILLER_9_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_9_61 ();
 sky130_fd_sc_hd__fill_2 FILLER_9_68 ();
 sky130_fd_sc_hd__fill_1 FILLER_9_118 ();
 sky130_fd_sc_hd__fill_1 FILLER_9_142 ();
 sky130_fd_sc_hd__decap_8 FILLER_9_160 ();
 sky130_fd_sc_hd__fill_1 FILLER_9_190 ();
 sky130_fd_sc_hd__decap_8 FILLER_9_207 ();
 sky130_fd_sc_hd__fill_2 FILLER_9_215 ();
 sky130_fd_sc_hd__fill_1 FILLER_9_223 ();
 sky130_ef_sc_hd__decap_12 FILLER_9_225 ();
 sky130_fd_sc_hd__decap_3 FILLER_9_237 ();
 sky130_fd_sc_hd__fill_2 FILLER_9_246 ();
 sky130_fd_sc_hd__fill_2 FILLER_10_3 ();
 sky130_fd_sc_hd__decap_3 FILLER_10_25 ();
 sky130_fd_sc_hd__fill_1 FILLER_10_29 ();
 sky130_fd_sc_hd__fill_2 FILLER_10_59 ();
 sky130_ef_sc_hd__decap_12 FILLER_10_68 ();
 sky130_fd_sc_hd__decap_4 FILLER_10_80 ();
 sky130_ef_sc_hd__decap_12 FILLER_10_85 ();
 sky130_ef_sc_hd__decap_12 FILLER_10_97 ();
 sky130_fd_sc_hd__decap_3 FILLER_10_109 ();
 sky130_fd_sc_hd__fill_2 FILLER_10_127 ();
 sky130_fd_sc_hd__fill_1 FILLER_10_139 ();
 sky130_fd_sc_hd__decap_6 FILLER_10_141 ();
 sky130_fd_sc_hd__decap_8 FILLER_10_157 ();
 sky130_fd_sc_hd__fill_2 FILLER_10_165 ();
 sky130_ef_sc_hd__decap_12 FILLER_10_175 ();
 sky130_fd_sc_hd__decap_8 FILLER_10_187 ();
 sky130_fd_sc_hd__fill_1 FILLER_10_195 ();
 sky130_fd_sc_hd__decap_8 FILLER_10_205 ();
 sky130_fd_sc_hd__decap_3 FILLER_10_213 ();
 sky130_ef_sc_hd__decap_12 FILLER_10_236 ();
 sky130_fd_sc_hd__decap_4 FILLER_10_248 ();
 sky130_fd_sc_hd__decap_4 FILLER_11_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_11_7 ();
 sky130_ef_sc_hd__decap_12 FILLER_11_28 ();
 sky130_fd_sc_hd__decap_6 FILLER_11_40 ();
 sky130_fd_sc_hd__fill_2 FILLER_11_54 ();
 sky130_fd_sc_hd__decap_6 FILLER_11_65 ();
 sky130_fd_sc_hd__fill_1 FILLER_11_71 ();
 sky130_fd_sc_hd__decap_8 FILLER_11_92 ();
 sky130_fd_sc_hd__decap_3 FILLER_11_100 ();
 sky130_fd_sc_hd__decap_6 FILLER_11_106 ();
 sky130_ef_sc_hd__decap_12 FILLER_11_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_11_125 ();
 sky130_ef_sc_hd__decap_12 FILLER_11_137 ();
 sky130_fd_sc_hd__decap_6 FILLER_11_149 ();
 sky130_fd_sc_hd__decap_6 FILLER_11_161 ();
 sky130_fd_sc_hd__fill_1 FILLER_11_167 ();
 sky130_fd_sc_hd__decap_6 FILLER_11_169 ();
 sky130_fd_sc_hd__decap_8 FILLER_11_184 ();
 sky130_fd_sc_hd__fill_2 FILLER_11_192 ();
 sky130_fd_sc_hd__decap_3 FILLER_11_200 ();
 sky130_fd_sc_hd__decap_8 FILLER_11_206 ();
 sky130_fd_sc_hd__fill_2 FILLER_11_222 ();
 sky130_fd_sc_hd__decap_3 FILLER_11_229 ();
 sky130_ef_sc_hd__decap_12 FILLER_12_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_12_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_12_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_12_29 ();
 sky130_fd_sc_hd__decap_3 FILLER_12_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_12_52 ();
 sky130_fd_sc_hd__decap_4 FILLER_12_64 ();
 sky130_fd_sc_hd__fill_1 FILLER_12_68 ();
 sky130_fd_sc_hd__fill_2 FILLER_12_94 ();
 sky130_fd_sc_hd__decap_3 FILLER_12_128 ();
 sky130_fd_sc_hd__decap_6 FILLER_12_134 ();
 sky130_ef_sc_hd__decap_12 FILLER_12_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_12_153 ();
 sky130_fd_sc_hd__decap_3 FILLER_12_165 ();
 sky130_fd_sc_hd__decap_3 FILLER_12_173 ();
 sky130_fd_sc_hd__decap_3 FILLER_12_206 ();
 sky130_ef_sc_hd__decap_12 FILLER_12_217 ();
 sky130_fd_sc_hd__fill_2 FILLER_12_229 ();
 sky130_fd_sc_hd__fill_1 FILLER_12_238 ();
 sky130_fd_sc_hd__decap_3 FILLER_12_245 ();
 sky130_ef_sc_hd__decap_12 FILLER_13_3 ();
 sky130_fd_sc_hd__decap_8 FILLER_13_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_13_23 ();
 sky130_fd_sc_hd__decap_8 FILLER_13_33 ();
 sky130_fd_sc_hd__decap_8 FILLER_13_57 ();
 sky130_fd_sc_hd__decap_3 FILLER_13_65 ();
 sky130_fd_sc_hd__fill_1 FILLER_13_77 ();
 sky130_fd_sc_hd__fill_1 FILLER_13_99 ();
 sky130_fd_sc_hd__fill_1 FILLER_13_108 ();
 sky130_fd_sc_hd__fill_1 FILLER_13_148 ();
 sky130_fd_sc_hd__decap_4 FILLER_13_164 ();
 sky130_fd_sc_hd__fill_1 FILLER_13_203 ();
 sky130_ef_sc_hd__decap_12 FILLER_13_231 ();
 sky130_fd_sc_hd__decap_8 FILLER_13_243 ();
 sky130_fd_sc_hd__fill_1 FILLER_13_251 ();
 sky130_fd_sc_hd__decap_4 FILLER_14_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_14_7 ();
 sky130_fd_sc_hd__decap_4 FILLER_14_29 ();
 sky130_fd_sc_hd__decap_4 FILLER_14_42 ();
 sky130_fd_sc_hd__decap_3 FILLER_14_50 ();
 sky130_fd_sc_hd__fill_2 FILLER_14_82 ();
 sky130_ef_sc_hd__decap_12 FILLER_14_85 ();
 sky130_fd_sc_hd__decap_8 FILLER_14_97 ();
 sky130_fd_sc_hd__fill_2 FILLER_14_105 ();
 sky130_fd_sc_hd__fill_1 FILLER_14_113 ();
 sky130_fd_sc_hd__fill_2 FILLER_14_127 ();
 sky130_fd_sc_hd__fill_2 FILLER_14_138 ();
 sky130_fd_sc_hd__decap_3 FILLER_14_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_14_164 ();
 sky130_ef_sc_hd__decap_12 FILLER_14_176 ();
 sky130_fd_sc_hd__decap_8 FILLER_14_188 ();
 sky130_fd_sc_hd__fill_1 FILLER_14_206 ();
 sky130_ef_sc_hd__decap_12 FILLER_14_210 ();
 sky130_fd_sc_hd__decap_6 FILLER_14_222 ();
 sky130_fd_sc_hd__fill_1 FILLER_14_228 ();
 sky130_ef_sc_hd__decap_12 FILLER_14_236 ();
 sky130_ef_sc_hd__decap_12 FILLER_15_3 ();
 sky130_fd_sc_hd__decap_8 FILLER_15_15 ();
 sky130_fd_sc_hd__fill_2 FILLER_15_23 ();
 sky130_fd_sc_hd__fill_1 FILLER_15_46 ();
 sky130_fd_sc_hd__fill_1 FILLER_15_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_15_78 ();
 sky130_ef_sc_hd__decap_12 FILLER_15_90 ();
 sky130_fd_sc_hd__decap_8 FILLER_15_102 ();
 sky130_fd_sc_hd__fill_2 FILLER_15_110 ();
 sky130_ef_sc_hd__decap_12 FILLER_15_113 ();
 sky130_fd_sc_hd__decap_4 FILLER_15_125 ();
 sky130_fd_sc_hd__decap_4 FILLER_15_155 ();
 sky130_fd_sc_hd__fill_1 FILLER_15_159 ();
 sky130_fd_sc_hd__decap_4 FILLER_15_169 ();
 sky130_fd_sc_hd__fill_1 FILLER_15_173 ();
 sky130_fd_sc_hd__fill_2 FILLER_15_183 ();
 sky130_ef_sc_hd__decap_12 FILLER_15_205 ();
 sky130_fd_sc_hd__decap_6 FILLER_15_217 ();
 sky130_fd_sc_hd__fill_1 FILLER_15_223 ();
 sky130_fd_sc_hd__decap_6 FILLER_15_225 ();
 sky130_fd_sc_hd__fill_1 FILLER_15_251 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_16_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_29 ();
 sky130_fd_sc_hd__decap_4 FILLER_16_41 ();
 sky130_fd_sc_hd__fill_1 FILLER_16_45 ();
 sky130_fd_sc_hd__decap_8 FILLER_16_52 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_69 ();
 sky130_fd_sc_hd__decap_3 FILLER_16_81 ();
 sky130_fd_sc_hd__decap_4 FILLER_16_85 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_96 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_108 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_120 ();
 sky130_fd_sc_hd__fill_1 FILLER_16_132 ();
 sky130_fd_sc_hd__fill_2 FILLER_16_141 ();
 sky130_fd_sc_hd__decap_4 FILLER_16_150 ();
 sky130_fd_sc_hd__fill_1 FILLER_16_154 ();
 sky130_fd_sc_hd__decap_4 FILLER_16_161 ();
 sky130_fd_sc_hd__decap_3 FILLER_16_193 ();
 sky130_fd_sc_hd__decap_4 FILLER_16_197 ();
 sky130_fd_sc_hd__fill_1 FILLER_16_201 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_210 ();
 sky130_fd_sc_hd__fill_1 FILLER_16_222 ();
 sky130_fd_sc_hd__decap_8 FILLER_16_242 ();
 sky130_fd_sc_hd__fill_2 FILLER_16_250 ();
 sky130_fd_sc_hd__decap_8 FILLER_17_3 ();
 sky130_fd_sc_hd__decap_3 FILLER_17_11 ();
 sky130_fd_sc_hd__decap_6 FILLER_17_34 ();
 sky130_fd_sc_hd__decap_6 FILLER_17_49 ();
 sky130_fd_sc_hd__fill_1 FILLER_17_55 ();
 sky130_fd_sc_hd__fill_2 FILLER_17_86 ();
 sky130_fd_sc_hd__fill_1 FILLER_17_117 ();
 sky130_fd_sc_hd__decap_6 FILLER_17_126 ();
 sky130_fd_sc_hd__fill_1 FILLER_17_132 ();
 sky130_fd_sc_hd__fill_2 FILLER_17_166 ();
 sky130_ef_sc_hd__decap_12 FILLER_17_169 ();
 sky130_fd_sc_hd__decap_8 FILLER_17_190 ();
 sky130_fd_sc_hd__decap_6 FILLER_17_245 ();
 sky130_fd_sc_hd__fill_1 FILLER_17_251 ();
 sky130_ef_sc_hd__decap_12 FILLER_18_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_18_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_18_27 ();
 sky130_fd_sc_hd__decap_6 FILLER_18_29 ();
 sky130_fd_sc_hd__decap_8 FILLER_18_55 ();
 sky130_fd_sc_hd__fill_1 FILLER_18_63 ();
 sky130_fd_sc_hd__decap_3 FILLER_18_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_18_94 ();
 sky130_fd_sc_hd__fill_1 FILLER_18_100 ();
 sky130_fd_sc_hd__decap_8 FILLER_18_131 ();
 sky130_fd_sc_hd__fill_1 FILLER_18_139 ();
 sky130_fd_sc_hd__decap_4 FILLER_18_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_18_151 ();
 sky130_fd_sc_hd__decap_6 FILLER_18_163 ();
 sky130_fd_sc_hd__fill_1 FILLER_18_169 ();
 sky130_fd_sc_hd__decap_6 FILLER_18_190 ();
 sky130_ef_sc_hd__decap_12 FILLER_18_197 ();
 sky130_ef_sc_hd__decap_12 FILLER_18_209 ();
 sky130_ef_sc_hd__decap_12 FILLER_18_221 ();
 sky130_fd_sc_hd__decap_4 FILLER_18_233 ();
 sky130_fd_sc_hd__fill_1 FILLER_18_237 ();
 sky130_fd_sc_hd__decap_4 FILLER_18_244 ();
 sky130_ef_sc_hd__decap_12 FILLER_19_3 ();
 sky130_fd_sc_hd__decap_8 FILLER_19_15 ();
 sky130_fd_sc_hd__decap_3 FILLER_19_23 ();
 sky130_fd_sc_hd__decap_8 FILLER_19_35 ();
 sky130_fd_sc_hd__fill_1 FILLER_19_43 ();
 sky130_fd_sc_hd__decap_6 FILLER_19_50 ();
 sky130_ef_sc_hd__decap_12 FILLER_19_57 ();
 sky130_fd_sc_hd__decap_4 FILLER_19_69 ();
 sky130_fd_sc_hd__decap_8 FILLER_19_86 ();
 sky130_fd_sc_hd__decap_6 FILLER_19_100 ();
 sky130_fd_sc_hd__decap_4 FILLER_19_129 ();
 sky130_fd_sc_hd__fill_2 FILLER_19_140 ();
 sky130_ef_sc_hd__decap_12 FILLER_19_154 ();
 sky130_fd_sc_hd__fill_2 FILLER_19_166 ();
 sky130_ef_sc_hd__decap_12 FILLER_19_195 ();
 sky130_fd_sc_hd__decap_4 FILLER_19_219 ();
 sky130_fd_sc_hd__fill_1 FILLER_19_223 ();
 sky130_fd_sc_hd__decap_4 FILLER_19_225 ();
 sky130_fd_sc_hd__fill_1 FILLER_19_229 ();
 sky130_ef_sc_hd__decap_12 FILLER_19_237 ();
 sky130_fd_sc_hd__decap_3 FILLER_19_249 ();
 sky130_ef_sc_hd__decap_12 FILLER_20_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_20_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_20_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_20_29 ();
 sky130_fd_sc_hd__decap_6 FILLER_20_41 ();
 sky130_fd_sc_hd__decap_8 FILLER_20_53 ();
 sky130_fd_sc_hd__decap_3 FILLER_20_61 ();
 sky130_fd_sc_hd__fill_2 FILLER_20_91 ();
 sky130_ef_sc_hd__decap_12 FILLER_20_126 ();
 sky130_fd_sc_hd__fill_2 FILLER_20_138 ();
 sky130_fd_sc_hd__decap_4 FILLER_20_169 ();
 sky130_fd_sc_hd__fill_1 FILLER_20_182 ();
 sky130_fd_sc_hd__decap_4 FILLER_20_191 ();
 sky130_fd_sc_hd__fill_1 FILLER_20_195 ();
 sky130_fd_sc_hd__decap_4 FILLER_20_197 ();
 sky130_fd_sc_hd__decap_4 FILLER_20_225 ();
 sky130_fd_sc_hd__fill_1 FILLER_20_229 ();
 sky130_fd_sc_hd__fill_2 FILLER_20_250 ();
 sky130_ef_sc_hd__decap_12 FILLER_21_3 ();
 sky130_fd_sc_hd__fill_2 FILLER_21_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_21_40 ();
 sky130_ef_sc_hd__decap_12 FILLER_21_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_21_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_21_81 ();
 sky130_fd_sc_hd__decap_3 FILLER_21_93 ();
 sky130_fd_sc_hd__decap_3 FILLER_21_99 ();
 sky130_fd_sc_hd__fill_2 FILLER_21_110 ();
 sky130_ef_sc_hd__decap_12 FILLER_21_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_21_125 ();
 sky130_fd_sc_hd__decap_8 FILLER_21_137 ();
 sky130_fd_sc_hd__fill_1 FILLER_21_145 ();
 sky130_ef_sc_hd__decap_12 FILLER_21_152 ();
 sky130_fd_sc_hd__decap_4 FILLER_21_164 ();
 sky130_ef_sc_hd__decap_12 FILLER_21_169 ();
 sky130_ef_sc_hd__decap_12 FILLER_21_181 ();
 sky130_fd_sc_hd__decap_4 FILLER_21_193 ();
 sky130_fd_sc_hd__decap_8 FILLER_21_206 ();
 sky130_fd_sc_hd__decap_4 FILLER_21_220 ();
 sky130_ef_sc_hd__decap_12 FILLER_21_225 ();
 sky130_fd_sc_hd__decap_3 FILLER_21_237 ();
 sky130_fd_sc_hd__fill_2 FILLER_21_246 ();
 sky130_ef_sc_hd__decap_12 FILLER_22_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_22_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_22_27 ();
 sky130_fd_sc_hd__fill_1 FILLER_22_38 ();
 sky130_fd_sc_hd__decap_4 FILLER_22_67 ();
 sky130_fd_sc_hd__fill_1 FILLER_22_71 ();
 sky130_fd_sc_hd__decap_3 FILLER_22_81 ();
 sky130_fd_sc_hd__decap_3 FILLER_22_85 ();
 sky130_ef_sc_hd__decap_12 FILLER_22_128 ();
 sky130_fd_sc_hd__fill_2 FILLER_22_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_22_155 ();
 sky130_fd_sc_hd__decap_6 FILLER_22_167 ();
 sky130_fd_sc_hd__fill_1 FILLER_22_173 ();
 sky130_ef_sc_hd__decap_12 FILLER_22_183 ();
 sky130_fd_sc_hd__fill_1 FILLER_22_195 ();
 sky130_fd_sc_hd__decap_6 FILLER_22_217 ();
 sky130_ef_sc_hd__decap_12 FILLER_22_231 ();
 sky130_fd_sc_hd__decap_8 FILLER_22_243 ();
 sky130_fd_sc_hd__fill_1 FILLER_22_251 ();
 sky130_ef_sc_hd__decap_12 FILLER_23_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_23_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_23_27 ();
 sky130_fd_sc_hd__decap_6 FILLER_23_39 ();
 sky130_fd_sc_hd__decap_3 FILLER_23_53 ();
 sky130_fd_sc_hd__decap_6 FILLER_23_57 ();
 sky130_fd_sc_hd__decap_8 FILLER_23_83 ();
 sky130_fd_sc_hd__decap_6 FILLER_23_106 ();
 sky130_fd_sc_hd__decap_4 FILLER_23_113 ();
 sky130_fd_sc_hd__decap_3 FILLER_23_165 ();
 sky130_fd_sc_hd__decap_4 FILLER_23_197 ();
 sky130_fd_sc_hd__decap_8 FILLER_23_210 ();
 sky130_fd_sc_hd__decap_3 FILLER_23_245 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_24_27 ();
 sky130_fd_sc_hd__decap_8 FILLER_24_29 ();
 sky130_fd_sc_hd__decap_3 FILLER_24_37 ();
 sky130_fd_sc_hd__decap_4 FILLER_24_60 ();
 sky130_fd_sc_hd__decap_4 FILLER_24_111 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_122 ();
 sky130_fd_sc_hd__decap_6 FILLER_24_134 ();
 sky130_fd_sc_hd__decap_4 FILLER_24_161 ();
 sky130_fd_sc_hd__fill_1 FILLER_24_165 ();
 sky130_fd_sc_hd__decap_8 FILLER_24_186 ();
 sky130_fd_sc_hd__fill_2 FILLER_24_194 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_217 ();
 sky130_fd_sc_hd__decap_3 FILLER_24_229 ();
 sky130_ef_sc_hd__decap_12 FILLER_25_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_25_35 ();
 sky130_fd_sc_hd__decap_8 FILLER_25_47 ();
 sky130_fd_sc_hd__fill_1 FILLER_25_55 ();
 sky130_fd_sc_hd__decap_4 FILLER_25_66 ();
 sky130_fd_sc_hd__fill_1 FILLER_25_70 ();
 sky130_ef_sc_hd__decap_12 FILLER_25_80 ();
 sky130_ef_sc_hd__decap_12 FILLER_25_95 ();
 sky130_fd_sc_hd__decap_4 FILLER_25_107 ();
 sky130_fd_sc_hd__fill_1 FILLER_25_111 ();
 sky130_fd_sc_hd__fill_2 FILLER_25_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_25_121 ();
 sky130_ef_sc_hd__decap_12 FILLER_25_133 ();
 sky130_fd_sc_hd__fill_1 FILLER_25_145 ();
 sky130_fd_sc_hd__decap_8 FILLER_25_158 ();
 sky130_fd_sc_hd__fill_2 FILLER_25_166 ();
 sky130_fd_sc_hd__decap_6 FILLER_25_169 ();
 sky130_ef_sc_hd__decap_12 FILLER_25_192 ();
 sky130_ef_sc_hd__decap_12 FILLER_25_204 ();
 sky130_fd_sc_hd__fill_1 FILLER_25_216 ();
 sky130_fd_sc_hd__fill_1 FILLER_25_223 ();
 sky130_fd_sc_hd__decap_6 FILLER_25_225 ();
 sky130_ef_sc_hd__decap_12 FILLER_25_238 ();
 sky130_fd_sc_hd__fill_2 FILLER_25_250 ();
 sky130_ef_sc_hd__decap_12 FILLER_26_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_26_15 ();
 sky130_fd_sc_hd__fill_2 FILLER_26_29 ();
 sky130_fd_sc_hd__decap_8 FILLER_26_46 ();
 sky130_fd_sc_hd__fill_2 FILLER_26_54 ();
 sky130_ef_sc_hd__decap_12 FILLER_26_62 ();
 sky130_fd_sc_hd__decap_8 FILLER_26_74 ();
 sky130_fd_sc_hd__fill_2 FILLER_26_82 ();
 sky130_ef_sc_hd__decap_12 FILLER_26_85 ();
 sky130_fd_sc_hd__decap_4 FILLER_26_97 ();
 sky130_ef_sc_hd__decap_12 FILLER_26_121 ();
 sky130_fd_sc_hd__fill_1 FILLER_26_133 ();
 sky130_fd_sc_hd__decap_3 FILLER_26_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_26_172 ();
 sky130_ef_sc_hd__decap_12 FILLER_26_184 ();
 sky130_ef_sc_hd__decap_12 FILLER_26_217 ();
 sky130_ef_sc_hd__decap_12 FILLER_26_229 ();
 sky130_fd_sc_hd__decap_8 FILLER_26_241 ();
 sky130_fd_sc_hd__decap_3 FILLER_26_249 ();
 sky130_ef_sc_hd__decap_12 FILLER_27_3 ();
 sky130_fd_sc_hd__fill_2 FILLER_27_15 ();
 sky130_fd_sc_hd__fill_2 FILLER_27_37 ();
 sky130_fd_sc_hd__fill_1 FILLER_27_49 ();
 sky130_fd_sc_hd__decap_6 FILLER_27_78 ();
 sky130_ef_sc_hd__decap_12 FILLER_27_93 ();
 sky130_fd_sc_hd__fill_1 FILLER_27_105 ();
 sky130_fd_sc_hd__decap_4 FILLER_27_113 ();
 sky130_fd_sc_hd__decap_3 FILLER_27_125 ();
 sky130_fd_sc_hd__decap_6 FILLER_27_161 ();
 sky130_fd_sc_hd__fill_1 FILLER_27_167 ();
 sky130_fd_sc_hd__decap_3 FILLER_27_169 ();
 sky130_fd_sc_hd__decap_8 FILLER_27_215 ();
 sky130_fd_sc_hd__fill_1 FILLER_27_223 ();
 sky130_fd_sc_hd__decap_3 FILLER_27_245 ();
 sky130_ef_sc_hd__decap_12 FILLER_28_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_28_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_28_27 ();
 sky130_fd_sc_hd__decap_8 FILLER_28_29 ();
 sky130_fd_sc_hd__fill_2 FILLER_28_37 ();
 sky130_fd_sc_hd__decap_3 FILLER_28_47 ();
 sky130_fd_sc_hd__decap_4 FILLER_28_58 ();
 sky130_fd_sc_hd__fill_2 FILLER_28_82 ();
 sky130_fd_sc_hd__decap_8 FILLER_28_92 ();
 sky130_fd_sc_hd__fill_2 FILLER_28_100 ();
 sky130_fd_sc_hd__decap_3 FILLER_28_137 ();
 sky130_fd_sc_hd__decap_4 FILLER_28_141 ();
 sky130_fd_sc_hd__fill_1 FILLER_28_145 ();
 sky130_fd_sc_hd__decap_4 FILLER_28_161 ();
 sky130_fd_sc_hd__decap_4 FILLER_28_191 ();
 sky130_fd_sc_hd__fill_1 FILLER_28_195 ();
 sky130_fd_sc_hd__decap_8 FILLER_28_197 ();
 sky130_ef_sc_hd__decap_12 FILLER_28_209 ();
 sky130_fd_sc_hd__fill_2 FILLER_28_228 ();
 sky130_fd_sc_hd__decap_8 FILLER_28_242 ();
 sky130_fd_sc_hd__fill_2 FILLER_28_250 ();
 sky130_ef_sc_hd__decap_12 FILLER_29_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_29_15 ();
 sky130_fd_sc_hd__decap_8 FILLER_29_27 ();
 sky130_fd_sc_hd__fill_1 FILLER_29_55 ();
 sky130_fd_sc_hd__fill_2 FILLER_29_110 ();
 sky130_fd_sc_hd__decap_4 FILLER_29_133 ();
 sky130_fd_sc_hd__decap_6 FILLER_29_162 ();
 sky130_fd_sc_hd__decap_4 FILLER_29_169 ();
 sky130_fd_sc_hd__fill_1 FILLER_29_173 ();
 sky130_fd_sc_hd__decap_8 FILLER_29_191 ();
 sky130_fd_sc_hd__fill_2 FILLER_29_199 ();
 sky130_fd_sc_hd__fill_2 FILLER_29_212 ();
 sky130_fd_sc_hd__fill_2 FILLER_29_225 ();
 sky130_fd_sc_hd__decap_4 FILLER_29_247 ();
 sky130_fd_sc_hd__fill_1 FILLER_29_251 ();
 sky130_ef_sc_hd__decap_12 FILLER_30_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_30_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_30_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_30_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_30_41 ();
 sky130_fd_sc_hd__fill_2 FILLER_30_53 ();
 sky130_fd_sc_hd__fill_1 FILLER_30_83 ();
 sky130_ef_sc_hd__decap_12 FILLER_30_85 ();
 sky130_ef_sc_hd__decap_12 FILLER_30_97 ();
 sky130_fd_sc_hd__decap_8 FILLER_30_109 ();
 sky130_fd_sc_hd__fill_2 FILLER_30_117 ();
 sky130_fd_sc_hd__fill_1 FILLER_30_139 ();
 sky130_ef_sc_hd__decap_12 FILLER_30_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_30_153 ();
 sky130_ef_sc_hd__decap_12 FILLER_30_165 ();
 sky130_ef_sc_hd__decap_12 FILLER_30_177 ();
 sky130_fd_sc_hd__decap_6 FILLER_30_189 ();
 sky130_fd_sc_hd__fill_1 FILLER_30_195 ();
 sky130_fd_sc_hd__fill_1 FILLER_30_197 ();
 sky130_fd_sc_hd__decap_8 FILLER_30_238 ();
 sky130_fd_sc_hd__fill_2 FILLER_30_246 ();
 sky130_ef_sc_hd__decap_12 FILLER_31_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_31_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_31_39 ();
 sky130_fd_sc_hd__decap_4 FILLER_31_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_31_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_31_64 ();
 sky130_fd_sc_hd__decap_4 FILLER_31_76 ();
 sky130_ef_sc_hd__decap_12 FILLER_31_100 ();
 sky130_ef_sc_hd__decap_12 FILLER_31_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_31_125 ();
 sky130_ef_sc_hd__decap_12 FILLER_31_137 ();
 sky130_fd_sc_hd__decap_8 FILLER_31_149 ();
 sky130_fd_sc_hd__decap_3 FILLER_31_157 ();
 sky130_fd_sc_hd__fill_1 FILLER_31_169 ();
 sky130_ef_sc_hd__decap_12 FILLER_31_203 ();
 sky130_fd_sc_hd__decap_8 FILLER_31_215 ();
 sky130_fd_sc_hd__fill_1 FILLER_31_223 ();
 sky130_fd_sc_hd__decap_4 FILLER_31_225 ();
 sky130_fd_sc_hd__fill_1 FILLER_31_229 ();
 sky130_fd_sc_hd__fill_2 FILLER_31_250 ();
 sky130_fd_sc_hd__decap_4 FILLER_32_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_32_7 ();
 sky130_ef_sc_hd__decap_12 FILLER_32_32 ();
 sky130_fd_sc_hd__fill_1 FILLER_32_44 ();
 sky130_ef_sc_hd__decap_12 FILLER_32_68 ();
 sky130_fd_sc_hd__decap_4 FILLER_32_80 ();
 sky130_ef_sc_hd__decap_12 FILLER_32_85 ();
 sky130_fd_sc_hd__fill_1 FILLER_32_97 ();
 sky130_ef_sc_hd__decap_12 FILLER_32_118 ();
 sky130_fd_sc_hd__fill_1 FILLER_32_130 ();
 sky130_fd_sc_hd__decap_8 FILLER_32_141 ();
 sky130_fd_sc_hd__fill_2 FILLER_32_149 ();
 sky130_fd_sc_hd__fill_1 FILLER_32_180 ();
 sky130_fd_sc_hd__decap_6 FILLER_32_190 ();
 sky130_fd_sc_hd__fill_1 FILLER_32_197 ();
 sky130_ef_sc_hd__decap_12 FILLER_32_207 ();
 sky130_ef_sc_hd__decap_12 FILLER_32_219 ();
 sky130_fd_sc_hd__decap_4 FILLER_32_231 ();
 sky130_fd_sc_hd__decap_8 FILLER_32_241 ();
 sky130_fd_sc_hd__decap_3 FILLER_32_249 ();
 sky130_fd_sc_hd__decap_4 FILLER_33_3 ();
 sky130_fd_sc_hd__decap_8 FILLER_33_77 ();
 sky130_fd_sc_hd__decap_3 FILLER_33_85 ();
 sky130_fd_sc_hd__decap_4 FILLER_33_108 ();
 sky130_fd_sc_hd__decap_6 FILLER_33_113 ();
 sky130_fd_sc_hd__fill_1 FILLER_33_119 ();
 sky130_fd_sc_hd__decap_8 FILLER_33_160 ();
 sky130_fd_sc_hd__fill_1 FILLER_33_169 ();
 sky130_fd_sc_hd__fill_1 FILLER_33_239 ();
 sky130_fd_sc_hd__decap_3 FILLER_33_246 ();
 sky130_fd_sc_hd__fill_2 FILLER_34_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_34_29 ();
 sky130_fd_sc_hd__decap_8 FILLER_34_41 ();
 sky130_fd_sc_hd__decap_8 FILLER_34_75 ();
 sky130_fd_sc_hd__fill_1 FILLER_34_83 ();
 sky130_fd_sc_hd__fill_1 FILLER_34_88 ();
 sky130_fd_sc_hd__decap_6 FILLER_34_115 ();
 sky130_fd_sc_hd__decap_4 FILLER_34_136 ();
 sky130_fd_sc_hd__decap_8 FILLER_34_141 ();
 sky130_fd_sc_hd__fill_1 FILLER_34_149 ();
 sky130_ef_sc_hd__decap_12 FILLER_34_159 ();
 sky130_ef_sc_hd__decap_12 FILLER_34_171 ();
 sky130_ef_sc_hd__decap_12 FILLER_34_183 ();
 sky130_fd_sc_hd__fill_1 FILLER_34_195 ();
 sky130_fd_sc_hd__decap_6 FILLER_34_197 ();
 sky130_fd_sc_hd__fill_1 FILLER_34_203 ();
 sky130_fd_sc_hd__decap_3 FILLER_34_224 ();
 sky130_fd_sc_hd__decap_4 FILLER_34_247 ();
 sky130_fd_sc_hd__fill_1 FILLER_34_251 ();
 sky130_fd_sc_hd__decap_8 FILLER_35_3 ();
 sky130_fd_sc_hd__decap_3 FILLER_35_11 ();
 sky130_ef_sc_hd__decap_12 FILLER_35_17 ();
 sky130_ef_sc_hd__decap_12 FILLER_35_29 ();
 sky130_fd_sc_hd__decap_8 FILLER_35_41 ();
 sky130_fd_sc_hd__fill_1 FILLER_35_49 ();
 sky130_fd_sc_hd__fill_1 FILLER_35_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_35_78 ();
 sky130_fd_sc_hd__fill_2 FILLER_35_90 ();
 sky130_fd_sc_hd__decap_3 FILLER_35_98 ();
 sky130_fd_sc_hd__decap_8 FILLER_35_104 ();
 sky130_ef_sc_hd__decap_12 FILLER_35_113 ();
 sky130_fd_sc_hd__decap_3 FILLER_35_125 ();
 sky130_ef_sc_hd__decap_12 FILLER_35_156 ();
 sky130_ef_sc_hd__decap_12 FILLER_35_169 ();
 sky130_ef_sc_hd__decap_12 FILLER_35_181 ();
 sky130_ef_sc_hd__decap_12 FILLER_35_193 ();
 sky130_ef_sc_hd__decap_12 FILLER_35_205 ();
 sky130_fd_sc_hd__decap_6 FILLER_35_217 ();
 sky130_fd_sc_hd__fill_1 FILLER_35_223 ();
 sky130_fd_sc_hd__decap_6 FILLER_35_245 ();
 sky130_fd_sc_hd__fill_1 FILLER_35_251 ();
 sky130_ef_sc_hd__decap_12 FILLER_36_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_36_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_36_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_36_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_36_41 ();
 sky130_fd_sc_hd__decap_8 FILLER_36_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_36_64 ();
 sky130_fd_sc_hd__decap_8 FILLER_36_76 ();
 sky130_ef_sc_hd__decap_12 FILLER_36_85 ();
 sky130_ef_sc_hd__decap_12 FILLER_36_97 ();
 sky130_fd_sc_hd__decap_8 FILLER_36_109 ();
 sky130_fd_sc_hd__fill_2 FILLER_36_117 ();
 sky130_fd_sc_hd__fill_1 FILLER_36_139 ();
 sky130_ef_sc_hd__decap_12 FILLER_36_141 ();
 sky130_fd_sc_hd__decap_3 FILLER_36_153 ();
 sky130_ef_sc_hd__decap_12 FILLER_36_176 ();
 sky130_fd_sc_hd__decap_8 FILLER_36_188 ();
 sky130_ef_sc_hd__decap_12 FILLER_36_197 ();
 sky130_ef_sc_hd__decap_12 FILLER_36_209 ();
 sky130_fd_sc_hd__decap_8 FILLER_36_221 ();
 sky130_fd_sc_hd__decap_4 FILLER_36_237 ();
 sky130_fd_sc_hd__fill_1 FILLER_36_241 ();
 sky130_fd_sc_hd__decap_3 FILLER_36_245 ();
 sky130_ef_sc_hd__decap_12 FILLER_37_3 ();
 sky130_fd_sc_hd__fill_2 FILLER_37_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_37_37 ();
 sky130_fd_sc_hd__fill_1 FILLER_37_52 ();
 sky130_fd_sc_hd__decap_6 FILLER_37_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_37_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_37_81 ();
 sky130_ef_sc_hd__decap_12 FILLER_37_93 ();
 sky130_fd_sc_hd__decap_6 FILLER_37_105 ();
 sky130_fd_sc_hd__fill_1 FILLER_37_111 ();
 sky130_fd_sc_hd__decap_4 FILLER_37_120 ();
 sky130_ef_sc_hd__decap_12 FILLER_37_145 ();
 sky130_fd_sc_hd__decap_3 FILLER_37_157 ();
 sky130_fd_sc_hd__fill_1 FILLER_37_167 ();
 sky130_ef_sc_hd__decap_12 FILLER_37_169 ();
 sky130_fd_sc_hd__fill_1 FILLER_37_181 ();
 sky130_ef_sc_hd__decap_12 FILLER_37_206 ();
 sky130_fd_sc_hd__decap_6 FILLER_37_218 ();
 sky130_ef_sc_hd__decap_12 FILLER_37_225 ();
 sky130_ef_sc_hd__decap_12 FILLER_37_237 ();
 sky130_fd_sc_hd__decap_3 FILLER_37_249 ();
 sky130_fd_sc_hd__decap_4 FILLER_38_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_38_27 ();
 sky130_fd_sc_hd__fill_1 FILLER_38_32 ();
 sky130_fd_sc_hd__decap_6 FILLER_38_39 ();
 sky130_fd_sc_hd__fill_1 FILLER_38_45 ();
 sky130_fd_sc_hd__decap_8 FILLER_38_72 ();
 sky130_fd_sc_hd__fill_1 FILLER_38_83 ();
 sky130_fd_sc_hd__decap_3 FILLER_38_105 ();
 sky130_fd_sc_hd__decap_4 FILLER_38_113 ();
 sky130_fd_sc_hd__fill_1 FILLER_38_117 ();
 sky130_fd_sc_hd__decap_3 FILLER_38_124 ();
 sky130_fd_sc_hd__decap_8 FILLER_38_130 ();
 sky130_fd_sc_hd__fill_2 FILLER_38_138 ();
 sky130_fd_sc_hd__decap_8 FILLER_38_146 ();
 sky130_fd_sc_hd__decap_3 FILLER_38_154 ();
 sky130_fd_sc_hd__fill_2 FILLER_38_194 ();
 sky130_ef_sc_hd__decap_12 FILLER_38_218 ();
 sky130_ef_sc_hd__decap_12 FILLER_38_230 ();
 sky130_fd_sc_hd__decap_8 FILLER_38_242 ();
 sky130_fd_sc_hd__fill_2 FILLER_38_250 ();
 sky130_fd_sc_hd__decap_8 FILLER_39_3 ();
 sky130_fd_sc_hd__fill_2 FILLER_39_14 ();
 sky130_fd_sc_hd__decap_3 FILLER_39_100 ();
 sky130_fd_sc_hd__decap_3 FILLER_39_109 ();
 sky130_fd_sc_hd__decap_4 FILLER_39_113 ();
 sky130_fd_sc_hd__fill_1 FILLER_39_117 ();
 sky130_fd_sc_hd__decap_8 FILLER_39_126 ();
 sky130_fd_sc_hd__decap_6 FILLER_39_161 ();
 sky130_fd_sc_hd__fill_1 FILLER_39_167 ();
 sky130_ef_sc_hd__decap_12 FILLER_39_169 ();
 sky130_fd_sc_hd__decap_3 FILLER_39_181 ();
 sky130_ef_sc_hd__decap_12 FILLER_39_192 ();
 sky130_ef_sc_hd__decap_12 FILLER_39_204 ();
 sky130_fd_sc_hd__decap_8 FILLER_39_216 ();
 sky130_ef_sc_hd__decap_12 FILLER_39_225 ();
 sky130_fd_sc_hd__decap_8 FILLER_39_237 ();
 sky130_fd_sc_hd__decap_3 FILLER_39_245 ();
 sky130_ef_sc_hd__decap_12 FILLER_40_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_40_15 ();
 sky130_fd_sc_hd__decap_6 FILLER_40_22 ();
 sky130_ef_sc_hd__decap_12 FILLER_40_29 ();
 sky130_fd_sc_hd__decap_4 FILLER_40_41 ();
 sky130_fd_sc_hd__fill_1 FILLER_40_45 ();
 sky130_ef_sc_hd__decap_12 FILLER_40_70 ();
 sky130_fd_sc_hd__fill_2 FILLER_40_82 ();
 sky130_fd_sc_hd__decap_3 FILLER_40_105 ();
 sky130_fd_sc_hd__decap_4 FILLER_40_141 ();
 sky130_fd_sc_hd__decap_4 FILLER_40_165 ();
 sky130_fd_sc_hd__decap_8 FILLER_40_175 ();
 sky130_fd_sc_hd__decap_6 FILLER_40_190 ();
 sky130_ef_sc_hd__decap_12 FILLER_40_197 ();
 sky130_ef_sc_hd__decap_12 FILLER_40_209 ();
 sky130_ef_sc_hd__decap_12 FILLER_40_221 ();
 sky130_ef_sc_hd__decap_12 FILLER_40_233 ();
 sky130_fd_sc_hd__decap_6 FILLER_40_245 ();
 sky130_fd_sc_hd__fill_1 FILLER_40_251 ();
 sky130_ef_sc_hd__decap_12 FILLER_41_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_41_15 ();
 sky130_fd_sc_hd__decap_8 FILLER_41_36 ();
 sky130_fd_sc_hd__fill_1 FILLER_41_44 ();
 sky130_fd_sc_hd__fill_1 FILLER_41_48 ();
 sky130_fd_sc_hd__decap_4 FILLER_41_52 ();
 sky130_fd_sc_hd__fill_2 FILLER_41_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_41_65 ();
 sky130_fd_sc_hd__decap_4 FILLER_41_77 ();
 sky130_fd_sc_hd__fill_1 FILLER_41_84 ();
 sky130_fd_sc_hd__fill_1 FILLER_41_111 ();
 sky130_fd_sc_hd__fill_2 FILLER_41_113 ();
 sky130_fd_sc_hd__fill_1 FILLER_41_131 ();
 sky130_ef_sc_hd__decap_12 FILLER_41_152 ();
 sky130_fd_sc_hd__decap_4 FILLER_41_164 ();
 sky130_fd_sc_hd__fill_2 FILLER_41_189 ();
 sky130_ef_sc_hd__decap_12 FILLER_41_211 ();
 sky130_fd_sc_hd__fill_1 FILLER_41_223 ();
 sky130_ef_sc_hd__decap_12 FILLER_41_225 ();
 sky130_ef_sc_hd__decap_12 FILLER_41_237 ();
 sky130_fd_sc_hd__decap_3 FILLER_41_249 ();
 sky130_ef_sc_hd__decap_12 FILLER_42_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_42_15 ();
 sky130_fd_sc_hd__decap_6 FILLER_42_22 ();
 sky130_ef_sc_hd__decap_12 FILLER_42_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_42_41 ();
 sky130_fd_sc_hd__decap_3 FILLER_42_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_42_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_42_69 ();
 sky130_fd_sc_hd__decap_3 FILLER_42_81 ();
 sky130_fd_sc_hd__decap_3 FILLER_42_85 ();
 sky130_ef_sc_hd__decap_12 FILLER_42_91 ();
 sky130_fd_sc_hd__decap_8 FILLER_42_103 ();
 sky130_fd_sc_hd__fill_1 FILLER_42_111 ();
 sky130_ef_sc_hd__decap_12 FILLER_42_113 ();
 sky130_fd_sc_hd__decap_3 FILLER_42_125 ();
 sky130_fd_sc_hd__fill_2 FILLER_42_138 ();
 sky130_ef_sc_hd__decap_12 FILLER_42_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_42_153 ();
 sky130_fd_sc_hd__decap_3 FILLER_42_165 ();
 sky130_ef_sc_hd__decap_12 FILLER_42_169 ();
 sky130_ef_sc_hd__decap_12 FILLER_42_181 ();
 sky130_fd_sc_hd__decap_3 FILLER_42_193 ();
 sky130_ef_sc_hd__decap_12 FILLER_42_197 ();
 sky130_fd_sc_hd__decap_8 FILLER_42_209 ();
 sky130_fd_sc_hd__decap_3 FILLER_42_217 ();
 sky130_fd_sc_hd__decap_8 FILLER_42_233 ();
 sky130_fd_sc_hd__decap_3 FILLER_42_241 ();
endmodule
