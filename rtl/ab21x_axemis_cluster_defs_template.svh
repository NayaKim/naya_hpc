/**********************************************************************
#-- COPYRIGHT (C) 2021,
#-- ETRI, (Electronics and Telecommunication Research Institute)
#-- ALL RIGHT RESERVED
#----------------------------------------------------------------------
#
#-- AXEMIS_CLUSTER Top module
#   (include 8xAXEMIS_PG)
#
#--  Created by Yong Cheol Peter CHo (cho@etri.re.kr)
#    Revised by HyumMi Kim (chaos0218@etri.re.kr)
#
#----------------------------------------------------------------------
#--Revision History Here
#----------------------------------------------------------------------
#--Rev              Date              Comments
#
#
#*********************************************************************/

`define AXEMIS_PG_TEMPLATE(num) \
AB21X_AXEMIS_PG                                                                             \
u20_axemis_pg``num (                                                                        \
    .AXEMIS_ID                          (16'h``num                              ),          \
    .AXEMIS_RST                         (axemis``num``_rst                      ),          \
    .AXEMIS_CLK                         (axemis``num``_clk                      ),          \
    .AXEMIS_PRST                        (axmscl_apb_prst                        ),          \
    .AXEMIS_PCLK                        (axmscl_apb_pclk                        ),          \
\
    .AXEMIS_PWR_PREQ                    (axemis``num``_pwr_preq                 ),          \
    .AXEMIS_PWR_PSTATE                  (axemis``num``_pwr_pstate               ),          \
    .AXEMIS_PWR_PACCEPT                 (axemis``num``_pwr_paccept              ),          \
    .AXEMIS_PWR_PDENY                   (axemis``num``_pwr_pdeny                ),          \
    .AXEMIS_PWR_PACTIVE                 (axemis``num``_pwr_pactive              ),          \
\
    .AXEMIS_CLK_QREQn                   (axemis``num``_clk_qreqn                ),          \
    .AXEMIS_CLK_QACCEPTn                (axemis``num``_clk_qacceptn             ),          \
    .AXEMIS_CLK_QDENY                   (axemis``num``_clk_qdeny                ),          \
    .AXEMIS_CLK_QACTIVE                 (axemis``num``_clk_qactive              ),          \
\
    .AXEMIS_ACE5LADB_PWR_QREQn          (axemis``num``_ace5ladb_pwr_qreqn       ),          \
    .AXEMIS_ACE5LADB_PWR_QACCEPTn       (axemis``num``_ace5ladb_pwr_qacceptn    ),          \
    .AXEMIS_ACE5LADB_PWR_QDENY          (axemis``num``_ace5ladb_pwr_qdeny       ),          \
    .AXEMIS_ACE5LADB_PWR_QACTIVE        (axemis``num``_ace5ladb_pwr_qactive     ),          \
\
    .AXEMIS_ACE5LADB_CLK_QREQn          (axemis``num``_ace5ladb_clk_qreqn       ),          \
    .AXEMIS_ACE5LADB_CLK_QACCEPTn       (axemis``num``_ace5ladb_clk_qacceptn    ),          \
    .AXEMIS_ACE5LADB_CLK_QDENY          (axemis``num``_ace5ladb_clk_qdeny       ),          \
    .AXEMIS_ACE5LADB_CLK_QACTIVE        (axemis``num``_ace5ladb_clk_qactive     ),          \
\
    .AXEMIS_IRQ                         (AXEMIS``num``_IRQ                      ),          \
\
    .AXEMIS_PADDR                       (axemis``num``_ap_paddr                 ),          \
    .AXEMIS_PSELX                       (axemis``num``_ap_pselx                 ),          \
    .AXEMIS_PENABLE                     (axemis``num``_ap_penable               ),          \
    .AXEMIS_PWRITE                      (axemis``num``_ap_pwrite                ),          \
    .AXEMIS_PWDATA                      (axemis``num``_ap_pwdata                ),          \
    .AXEMIS_PREADY                      (axemis``num``_ap_pready                ),          \
    .AXEMIS_PSLVERR                     (axemis``num``_ap_pslverr               ),          \
    .AXEMIS_PRDATA                      (axemis``num``_ap_prdata                ),          \
    .AXEMIS_PSTRB                       (axemis``num``_ap_pstrb                 ),          \
    .AXEMIS_PPROT                       (axemis``num``_ap_pprot                 ),          \
\
    .AXEMIS_SLVMUSTACCEPTREQN_ASYNC     (axemis``num``_slvmustacceptreqn_async  ),          \
    .AXEMIS_SLVCANDENYREQN_ASYNC        (axemis``num``_slvcandenyreqn_async     ),          \
    .AXEMIS_SLVACCEPTN_ASYNC            (axemis``num``_slvacceptn_async         ),          \
    .AXEMIS_SLVDENY_ASYNC               (axemis``num``_slvdeny_async            ),          \
    .AXEMIS_SI_TO_MI_WAKEUP_ASYNC       (axemis``num``_si_to_mi_wakeup_async    ),          \
    .AXEMIS_MI_TO_SI_WAKEUP_ASYNC       (axemis``num``_mi_to_si_wakeup_async    ),          \
\
    .AXEMIS_AW_WR_PTR_ASYNC             (axemis``num``_aw_wr_ptr_async          ),          \
    .AXEMIS_AW_RD_PTR_ASYNC             (axemis``num``_aw_rd_ptr_async          ),          \
    .AXEMIS_AW_PAYLD_ASYNC              (axemis``num``_aw_payld_async           ),          \
    .AXEMIS_W_WR_PTR_ASYNC              (axemis``num``_w_wr_ptr_async           ),          \
    .AXEMIS_W_RD_PTR_ASYNC              (axemis``num``_w_rd_ptr_async           ),          \
    .AXEMIS_W_PAYLD_ASYNC               (axemis``num``_w_payld_async            ),          \
    .AXEMIS_B_WR_PTR_ASYNC              (axemis``num``_b_wr_ptr_async           ),          \
    .AXEMIS_B_RD_PTR_ASYNC              (axemis``num``_b_rd_ptr_async           ),          \
    .AXEMIS_B_PAYLD_ASYNC               (axemis``num``_b_payld_async            ),          \
    .AXEMIS_AR_WR_PTR_ASYNC             (axemis``num``_ar_wr_ptr_async          ),          \
    .AXEMIS_AR_RD_PTR_ASYNC             (axemis``num``_ar_rd_ptr_async          ),          \
    .AXEMIS_AR_PAYLD_ASYNC              (axemis``num``_ar_payld_async           ),          \
    .AXEMIS_R_WR_PTR_ASYNC              (axemis``num``_r_wr_ptr_async           ),          \
    .AXEMIS_R_RD_PTR_ASYNC              (axemis``num``_r_rd_ptr_async           ),          \
    .AXEMIS_R_PAYLD_ASYNC               (axemis``num``_r_payld_async            )           \
)

`define MMUTBU_ACE5LADB_TEMPLATE(num,prefix) \
adb400_r3_ace_lite_mst #(                                                           \
    .ADDR_WIDTH             (`ADB400_ADDR_WIDTH              ),                     \
    .DATA_WIDTH             (`ADB400_DATA_WIDTH              ),                     \
    .AWID_WIDTH             (`ADB400_AWID_WIDTH              ),                     \
    .ARID_WIDTH             (`ADB400_ARID_WIDTH              ),                     \
    .AWUSER_WIDTH           (`ADB400_AWUSER_WIDTH            ),                     \
    .WUSER_WIDTH            (`ADB400_WUSER_WIDTH             ),                     \
    .BUSER_WIDTH            (`ADB400_BUSER_WIDTH             ),                     \
    .ARUSER_WIDTH           (`ADB400_ARUSER_WIDTH            ),                     \
    .RUSER_WIDTH            (`ADB400_RUSER_WIDTH             ),                     \
    .NSAID_WIDTH            (`ADB400_NSAID_WIDTH             ),                     \
    .AW_FIFO_DEPTH          (`ADB400_AW_FIFO_DEPTH           ),                     \
    .W_FIFO_DEPTH           (`ADB400_W_FIFO_DEPTH            ),                     \
    .B_FIFO_DEPTH           (`ADB400_B_FIFO_DEPTH            ),                     \
    .AR_FIFO_DEPTH          (`ADB400_AR_FIFO_DEPTH           ),                     \
    .R_FIFO_DEPTH           (`ADB400_R_FIFO_DEPTH            ),                     \
    .AW_OPREG               (`ADB400_AW_OPREG                ),                     \
    .W_OPREG                (`ADB400_W_OPREG                 ),                     \
    .AR_OPREG               (`ADB400_AR_OPREG                ),                     \
    .MI_SYNC_LEVELS         (`ADB400_MI_SYNC_LEVELS          )                      \
) u_adb_ace5l_mst_tbu``num (                                                        \
    .aclkm                          (TBU``num``_CLK                 ),              \
    .aresetnm                       (TBU``num``_RSTn                ),              \
\
    .clkqreqnm_i                    (1'b1                           ),              \
    .clkqacceptnm_o                 (),                                             \
    .clkqdenym_o                    (),                                             \
    .clkqactivem_o                  (),                                             \
\
    .wakeupm_o                      (),                                             \
    .dftrstdisablem                 (1'b0),                                         \
\
    .slvmustacceptreqn_async        (AXEMIS``num``_SLVMUSTACCEPTREQN_ASYNC  ),        \
    .slvcandenyreqn_async           (AXEMIS``num``_SLVCANDENYREQN_ASYNC     ),        \
    .slvacceptn_async               (AXEMIS``num``_SLVACCEPTN_ASYNC         ),        \
    .slvdeny_async                  (AXEMIS``num``_SLVDENY_ASYNC            ),        \
    .si_to_mi_wakeup_async          (AXEMIS``num``_SI_TO_MI_WAKEUP_ASYNC    ),        \
    .mi_to_si_wakeup_async          (AXEMIS``num``_MI_TO_SI_WAKEUP_ASYNC    ),        \
\
    .aw_wr_ptr_async                (AXEMIS``num``_AW_WR_PTR_ASYNC          ),        \
    .aw_rd_ptr_async                (AXEMIS``num``_AW_RD_PTR_ASYNC          ),        \
    .aw_payld_async                 (AXEMIS``num``_AW_PAYLD_ASYNC           ),        \
    .w_wr_ptr_async                 (AXEMIS``num``_W_WR_PTR_ASYNC           ),        \
    .w_rd_ptr_async                 (AXEMIS``num``_W_RD_PTR_ASYNC           ),        \
    .w_payld_async                  (AXEMIS``num``_W_PAYLD_ASYNC            ),        \
    .b_wr_ptr_async                 (AXEMIS``num``_B_WR_PTR_ASYNC           ),        \
    .b_rd_ptr_async                 (AXEMIS``num``_B_RD_PTR_ASYNC           ),        \
    .b_payld_async                  (AXEMIS``num``_B_PAYLD_ASYNC            ),        \
    .ar_wr_ptr_async                (AXEMIS``num``_AR_WR_PTR_ASYNC          ),        \
    .ar_rd_ptr_async                (AXEMIS``num``_AR_RD_PTR_ASYNC          ),        \
    .ar_payld_async                 (AXEMIS``num``_AR_PAYLD_ASYNC           ),        \
    .r_wr_ptr_async                 (AXEMIS``num``_R_WR_PTR_ASYNC           ),        \
    .r_rd_ptr_async                 (AXEMIS``num``_R_RD_PTR_ASYNC           ),        \
    .r_payld_async                  (AXEMIS``num``_R_PAYLD_ASYNC            ),        \
\
    .awvalidm                       (``prefix``_adb_awvalid             ),              \
    .awreadym                       (``prefix``_adb_awready             ),              \
    .awidm                          (``prefix``_adb_awid                ),              \
    .awaddrm                        (``prefix``_adb_awaddr              ),              \
    .awregionm                      (``prefix``_adb_awregion            ),              \
    .awlenm                         (``prefix``_adb_awlen               ),              \
    .awsizem                        (``prefix``_adb_awsize              ),              \
    .awburstm                       (``prefix``_adb_awburst             ),              \
    .awdomainm                      (``prefix``_adb_awdomain            ),              \
    .awsnoopm                       (``prefix``_adb_awsnoop             ),              \
    .awbarm                         (),                                                 \
    .awlockm                        (``prefix``_adb_awlock              ),              \
    .awcachem                       (``prefix``_adb_awcache             ),              \
    .awprotm                        (``prefix``_adb_awprot              ),              \
    .awqosm                         (``prefix``_adb_awqos               ),              \
    .nsaidwm                        (),                                                 \
    .awuserm                        (tbu``num``_adb400_awuser           ),              \
    .wvalidm                        (``prefix``_adb_wvalid              ),              \
    .wreadym                        (``prefix``_adb_wready              ),              \
    .wdatam                         (``prefix``_adb_wdata               ),              \
    .wstrbm                         (``prefix``_adb_wstrb               ),              \
    .wlastm                         (``prefix``_adb_wlast               ),              \
    .wuserm                         (``prefix``_adb_wuser               ),              \
    .bvalidm                        (``prefix``_adb_bvalid              ),              \
    .breadym                        (``prefix``_adb_bready              ),              \
    .bidm                           (``prefix``_adb_bid                 ),              \
    .brespm                         (``prefix``_adb_bresp               ),              \
    .buserm                         (``prefix``_adb_buser               ),              \
    .arvalidm                       (``prefix``_adb_arvalid             ),              \
    .arreadym                       (``prefix``_adb_arready             ),              \
    .aridm                          (``prefix``_adb_arid                ),              \
    .araddrm                        (``prefix``_adb_araddr              ),              \
    .arregionm                      (``prefix``_adb_arregion            ),              \
    .arlenm                         (``prefix``_adb_arlen               ),              \
    .arsizem                        (``prefix``_adb_arsize              ),              \
    .arburstm                       (``prefix``_adb_arburst             ),              \
    .ardomainm                      (``prefix``_adb_ardomain            ),              \
    .arsnoopm                       (``prefix``_adb_arsnoop             ),              \
    .arbarm                         (),                                                 \
    .arlockm                        (``prefix``_adb_arlock              ),              \
    .arcachem                       (``prefix``_adb_arcache             ),              \
    .arprotm                        (``prefix``_adb_arprot              ),              \
    .arqosm                         (``prefix``_adb_arqos               ),              \
    .nsaidrm                        (),                                                 \
    .aruserm                        (tbu``num``_adb400_aruser              ),              \
    .rvalidm                        (``prefix``_adb_rvalid              ),              \
    .rreadym                        (``prefix``_adb_rready              ),              \
    .ridm                           (``prefix``_adb_rid                 ),              \
    .rdatam                         (``prefix``_adb_rdata               ),              \
    .rrespm                         (``prefix``_adb_rresp               ),              \
    .rlastm                         (``prefix``_adb_rlast               ),              \
    .ruserm                         (``prefix``_adb_ruser               )               \
);                                                                                      \
\
mmu600_r2_tbu_ace_lite                                                         \
#(                                                                             \
    .TBUCFG_ID_WIDTH          (`TBUCFG_ID_WIDTH          ) ,                   \
    .TBUCFG_DATA_WIDTH        (`TBUCFG_DATA_WIDTH        ) ,                   \
    .TBUCFG_ARUSER_WIDTH      (`TBUCFG_ARUSER_WIDTH      ) ,                   \
    .TBUCFG_AWUSER_WIDTH      (`TBUCFG_AWUSER_WIDTH      ) ,                   \
    .TBUCFG_RUSER_WIDTH       (`TBUCFG_RUSER_WIDTH       ) ,                   \
    .TBUCFG_WUSER_WIDTH       (`TBUCFG_WUSER_WIDTH       ) ,                   \
    .TBUCFG_BUSER_WIDTH       (`TBUCFG_BUSER_WIDTH       ) ,                   \
    .TBUCFG_STASH             (`TBUCFG_STASH             ) ,                   \
    .TBUCFG_SID_WIDTH         (`TBUCFG_SID_WIDTH         ) ,                   \
    .TBUCFG_SSID_WIDTH        (`TBUCFG_SSID_WIDTH        ) ,                   \
    .TBUCFG_WBUF_DEPTH        (`TBUCFG_WBUF_DEPTH        ) ,                   \
    .TBUCFG_LFIFO_DEPTH       (`TBUCFG_LFIFO_DEPTH       ) ,                   \
    .TBUCFG_XLATE_SLOTS       (`TBUCFG_XLATE_SLOTS       ) ,                   \
    .TBUCFG_ROT_DEPTH         (`TBUCFG_ROT_DEPTH         ) ,                   \
    .TBUCFG_WOT_DEPTH         (`TBUCFG_WOT_DEPTH         ) ,                   \
    .TBUCFG_UTLB_DEPTH        (`TBUCFG_UTLB_DEPTH        ) ,                   \
    .TBUCFG_MTLB_DEPTH        (`TBUCFG_MTLB_DEPTH        ) ,                   \
    .TBUCFG_DIRECT_IDX        (`TBUCFG_DIRECT_IDX        ) ,                   \
    .TBUCFG_MTLB_PARTS        (`TBUCFG_MTLB_PARTS        ) ,                   \
    .TBUCFG_SI_AR_HNDSHK_MODE (`TBUCFG_SI_AR_HNDSHK_MODE ) ,                   \
    .TBUCFG_SI_R_HNDSHK_MODE  (`TBUCFG_SI_R_HNDSHK_MODE  ) ,                   \
    .TBUCFG_SI_AW_HNDSHK_MODE (`TBUCFG_SI_AW_HNDSHK_MODE ) ,                   \
    .TBUCFG_SI_W_HNDSHK_MODE  (`TBUCFG_SI_W_HNDSHK_MODE  ) ,                   \
    .TBUCFG_SI_B_HNDSHK_MODE  (`TBUCFG_SI_B_HNDSHK_MODE  ) ,                   \
    .TBUCFG_MI_AR_HNDSHK_MODE (`TBUCFG_MI_AR_HNDSHK_MODE ) ,                   \
    .TBUCFG_MI_R_HNDSHK_MODE  (`TBUCFG_MI_R_HNDSHK_MODE  ) ,                   \
    .TBUCFG_MI_AW_HNDSHK_MODE (`TBUCFG_MI_AW_HNDSHK_MODE ) ,                   \
    .TBUCFG_MI_W_HNDSHK_MODE  (`TBUCFG_MI_W_HNDSHK_MODE  ) ,                   \
    .TBUCFG_MI_B_HNDSHK_MODE  (`TBUCFG_MI_B_HNDSHK_MODE  ) ,                   \
    .TBUCFG_DTI_HNDSHK_MODE   (`TBUCFG_DTI_HNDSHK_MODE   ) ,                   \
    .TBUCFG_MTLB_LKPRSP_MODE  (`TBUCFG_MTLB_LKPRSP_MODE  )                     \
) u_mmu600_r2_tbu_ace_lite_xemis``num  (                                      \
    .aclk            (TBU``num``_CLK               ),                         \
    .aresetn         (TBU``num``_RSTn              ),                         \
    .awvalid_s       (``prefix``_adb_awvalid       ),                         \
    .awready_s       (``prefix``_adb_awready       ),                         \
    .awid_s          (``prefix``_adb_awid          ),                         \
    .awaddr_s        (``prefix``_adb_awaddr        ),                         \
    .awlen_s         (``prefix``_adb_awlen         ),                         \
    .awsize_s        (``prefix``_adb_awsize        ),                         \
    .awburst_s       (``prefix``_adb_awburst       ),                         \
    .awlock_s        (``prefix``_adb_awlock        ),                         \
    .awcache_s       (``prefix``_adb_awcache       ),                         \
    .awprot_s        (``prefix``_adb_awprot        ),                         \
    .awqos_s         (``prefix``_adb_awqos         ),                         \
    .awregion_s      (``prefix``_adb_awregion      ),                         \
    .awstashnid_s    (``prefix``_adb_awstashnid    ),                         \
    .awstashniden_s  (``prefix``_adb_awstashniden  ),                         \
    .awstashlpid_s   (``prefix``_adb_awstashlpid   ),                         \
    .awstashlpiden_s (``prefix``_adb_awstashlpiden ),                         \
    .awsnoop_s       ({1'b0,``prefix``_adb_awsnoop}),                         \
    .awuser_s        (``prefix``_adb_awuser        ),                         \
    .awdomain_s      (``prefix``_adb_awdomain      ),                         \
    .awmmussid_s     (``prefix``_adb_awmmussid     ),                         \
    .awmmusid_s      (``prefix``_adb_awmmusid      ),                         \
    .awmmussidv_s    (``prefix``_adb_awmmussidv    ),                         \
    .awmmusecsid_s   (``prefix``_adb_awmmusecsid   ),                         \
    .awmmuatst_s     (``prefix``_adb_awmmuatst     ),                         \
    .awatop_s        (``prefix``_adb_awatop        ),                         \
    .arvalid_s       (``prefix``_adb_arvalid       ),                         \
    .arready_s       (``prefix``_adb_arready       ),                         \
    .arid_s          (``prefix``_adb_arid          ),                         \
    .araddr_s        (``prefix``_adb_araddr        ),                         \
    .arlen_s         (``prefix``_adb_arlen         ),                         \
    .arsize_s        (``prefix``_adb_arsize        ),                         \
    .arburst_s       (``prefix``_adb_arburst       ),                         \
    .arlock_s        (``prefix``_adb_arlock        ),                         \
    .arcache_s       (``prefix``_adb_arcache       ),                         \
    .arprot_s        (``prefix``_adb_arprot        ),                         \
    .arqos_s         (``prefix``_adb_arqos         ),                         \
    .arregion_s      (``prefix``_adb_arregion      ),                         \
    .arsnoop_s       (``prefix``_adb_arsnoop       ),                         \
    .aruser_s        (``prefix``_adb_aruser        ),                         \
    .ardomain_s      (``prefix``_adb_ardomain      ),                         \
    .armmussid_s     (``prefix``_adb_armmussid     ),                         \
    .armmusid_s      (``prefix``_adb_armmusid      ),                         \
    .armmussidv_s    (``prefix``_adb_armmussidv    ),                         \
    .armmusecsid_s   (``prefix``_adb_armmusecsid   ),                         \
    .armmuatst_s     (``prefix``_adb_armmuatst     ),                         \
    .wvalid_s        (``prefix``_adb_wvalid        ),                         \
    .wready_s        (``prefix``_adb_wready        ),                         \
    .wdata_s         (``prefix``_adb_wdata         ),                         \
    .wstrb_s         (``prefix``_adb_wstrb         ),                         \
    .wlast_s         (``prefix``_adb_wlast         ),                         \
    .wuser_s         (``prefix``_adb_wuser         ),                         \
    .rvalid_s        (``prefix``_adb_rvalid        ),                         \
    .rready_s        (``prefix``_adb_rready        ),                         \
    .rid_s           (``prefix``_adb_rid           ),                         \
    .rdata_s         (``prefix``_adb_rdata         ),                         \
    .rresp_s         (``prefix``_adb_rresp         ),                         \
    .rlast_s         (``prefix``_adb_rlast         ),                         \
    .ruser_s         (``prefix``_adb_ruser         ),                         \
    .bvalid_s        (``prefix``_adb_bvalid        ),                         \
    .bready_s        (``prefix``_adb_bready        ),                         \
    .bid_s           (``prefix``_adb_bid           ),                         \
    .bresp_s         (``prefix``_adb_bresp         ),                         \
    .buser_s         (``prefix``_adb_buser         ),                         \
    .awakeup_s       (``prefix``_adb_awakeup       ),                         \
\
    .awvalid_m       (TBU``num``_AWVALID         ),                           \
    .awready_m       (TBU``num``_AWREADY         ),                           \
    .awid_m          (tbu``num``_awid            ),                           \
    .awaddr_m        (TBU``num``_AWADDR          ),                           \
    .awlen_m         (TBU``num``_AWLEN           ),                           \
    .awsize_m        (TBU``num``_AWSIZE          ),                           \
    .awburst_m       (TBU``num``_AWBURST         ),                           \
    .awlock_m        (TBU``num``_AWLOCK          ),                           \
    .awcache_m       (TBU``num``_AWCACHE         ),                           \
    .awprot_m        (TBU``num``_AWPROT          ),                           \
    .awqos_m         (TBU``num``_AWQOS           ),                           \
    .awregion_m      (                           ),                           \
    .awstashnid_m    (TBU``num``_AWSTASHNID      ),                           \
    .awstashniden_m  (TBU``num``_AWSTASHNIDEN    ),                           \
    .awstashlpid_m   (TBU``num``_AWSTASHLPID     ),                           \
    .awstashlpiden_m (TBU``num``_AWSTASHLPIDEN   ),                           \
    .awsnoop_m       (TBU``num``_AWSNOOP         ),                           \
    .awuser_m        (tbu``num``_awuser          ),                           \
    .awdomain_m      (TBU``num``_AWDOMAIN        ),                           \
    .awmmusid_m      (                           ),                           \
    .awmmusecsid_m   (                           ),                           \
    .awatop_m        (TBU``num``_AWATOP          ),                           \
    .arvalid_m       (TBU``num``_ARVALID         ),                           \
    .arready_m       (TBU``num``_ARREADY         ),                           \
    .arid_m          (tbu``num``_arid            ),                           \
    .araddr_m        (TBU``num``_ARADDR          ),                           \
    .arlen_m         (TBU``num``_ARLEN           ),                           \
    .arsize_m        (TBU``num``_ARSIZE          ),                           \
    .arburst_m       (TBU``num``_ARBURST         ),                           \
    .arlock_m        (TBU``num``_ARLOCK          ),                           \
    .arcache_m       (TBU``num``_ARCACHE         ),                           \
    .arprot_m        (TBU``num``_ARPROT          ),                           \
    .arqos_m         (TBU``num``_ARQOS           ),                           \
    .arregion_m      (                           ),                           \
    .arsnoop_m       (TBU``num``_ARSNOOP         ),                           \
    .aruser_m        (tbu``num``_aruser          ),                           \
    .ardomain_m      (TBU``num``_ARDOMAIN        ),                           \
    .armmusid_m      (                           ),                           \
    .armmusecsid_m   (                           ),                           \
    .wvalid_m        (TBU``num``_WVALID          ),                           \
    .wready_m        (TBU``num``_WREADY          ),                           \
    .wdata_m         (TBU``num``_WDATA           ),                           \
    .wstrb_m         (TBU``num``_WSTRB           ),                           \
    .wlast_m         (TBU``num``_WLAST           ),                           \
    .wuser_m         (TBU``num``_WUSER           ),                           \
    .rvalid_m        (TBU``num``_RVALID          ),                           \
    .rready_m        (TBU``num``_RREADY          ),                           \
    .rid_m           (tbu``num``_rid             ),                           \
    .ruser_m         (TBU``num``_RUSER           ),                           \
    .rdata_m         (TBU``num``_RDATA           ),                           \
    .rresp_m         (TBU``num``_RRESP[1:0]      ),                           \
    .rlast_m         (TBU``num``_RLAST           ),                           \
    .bvalid_m        (TBU``num``_BVALID          ),                           \
    .bready_m        (TBU``num``_BREADY          ),                           \
    .bid_m           (tbu``num``_bid             ),                           \
    .buser_m         (TBU``num``_BUSER           ),                           \
    .bresp_m         (TBU``num``_BRESP           ),                           \
    .awakeup_m       (TBU``num``_AWAKEUP         ),                           \
\
    .tvalid_dti_dn   (tbu``num``_tvalid_dti_dn   ),                           \
    .tready_dti_dn   (tbu``num``_tready_dti_dn   ),                           \
    .tdata_dti_dn    (tbu``num``_tdata_dti_dn    ),                           \
    .tkeep_dti_dn    (tbu``num``_tkeep_dti_dn    ),                           \
    .tlast_dti_dn    (tbu``num``_tlast_dti_dn    ),                           \
    .twakeup_dti_dn  (tbu``num``_twakeup_dti_dn  ),                           \
\
    .tvalid_dti_up   (tbu``num``_tvalid_dti_up   ),                           \
    .tready_dti_up   (tbu``num``_tready_dti_up   ),                           \
    .tdata_dti_up    (tbu``num``_tdata_dti_up    ),                           \
    .tkeep_dti_up    (tbu``num``_tkeep_dti_up    ),                           \
    .tlast_dti_up    (tbu``num``_tlast_dti_up    ),                           \
    .twakeup_dti_up  (tbu``num``_twakeup_dti_up  ),                           \
\
    .qreqn_pd        (1'b1                       ) ,                          \
    .qacceptn_pd     (                           ) ,                          \
    .qdeny_pd        (                           ) ,                          \
    .qactive_pd      (                           ) ,                          \
    .qreqn_cg        (1'b1                       ) ,                          \
    .qacceptn_cg     (                           ) ,                          \
    .qdeny_cg        (                           ) ,                          \
    .qactive_cg      (                           ) ,                          \
    .pmusnapshot_req (1'b0                       ) ,                          \
    .pmusnapshot_ack (                           ) ,                          \
\
    .ras_irpt        (tbu``num``_ras_irpt        ) ,                          \
    .pmu_irpt        (tbu``num``_pmu_irpt        ) ,                          \
    .pcie_mode       (`STATICCFG_PCIE_MODE       ) ,/* You must tie-off this signal to HIGH when the TBU is connected to a PCIe IF*/\
    .ns_sid_high     (`STATICCFG_NS_SID_HIGH     ) ,/* You should check it                                                        */\
    .s_sid_high      (`STATICCFG_S_SID_HIGH      ) ,/* You should check it                                                        */\
    .cmo_disable     (`STATICCFG_CMO_DISABLE     ) ,/* You should check it                                                        */\
    .max_tok_trans   (`STATICCFG_MAX_TOK_TRANS   ) ,/* You should check it                                                        */\
    .utlb_roundrobin (`STATICCFG_UTLB_ROUNDROBIN ) ,/* You should check it                                                        */\
    .ecorevnum       (`STATICCFG_ECOREVNUM       ) ,/* You should check it                                                        */\
    .sec_override    (`STATICCFG_SEC_OVERRIDE    ) ,/* You should check it                                                        */\
    .dftcgen         (1'b0                       ) ,/* You should check it                                                        */\
    .dftrstdisable   (1'b0                       ) ,                               \
    .dftramhold      (1'b0                       ) ,                               \
    .mbistresetn     (1'b1                       ) ,                               \
    .mbistreq        (1'b0                       )                                 \
)


`define MMU_TEST_MST_TEMPLATE(numtbu) \
wire  [47:0]                                  axi_port0``numtbu``_araddr               ; \
wire  [2:0]                                   axi_port0``numtbu``_arsize               ; \
wire  [1:0]                                   axi_port0``numtbu``_arburst              ; \
wire                                          axi_port0``numtbu``_arvalid              ; \
wire                                          axi_port0``numtbu``_arready              ; \
wire  [15:0]                                  axi_port0``numtbu``_arid                 ; \
wire  [15:0]                                  axi_port0``numtbu``_rid                  ; \
wire  [255:0]                                 axi_port0``numtbu``_rdata                ; \
wire  [1:0]                                   axi_port0``numtbu``_rresp                ; \
wire                                          axi_port0``numtbu``_rlast                ; \
wire                                          axi_port0``numtbu``_rvalid               ; \
wire                                          axi_port0``numtbu``_rready               ; \
wire  [15:0]                                  axi_port0``numtbu``_awid                 ; \
wire  [7:0]                                   axi_port0``numtbu``_awlen                ; \
wire  [7:0]                                   axi_port0``numtbu``_arlen                ; \
wire  [47:0]                                  axi_port0``numtbu``_awaddr               ; \
wire  [2:0]                                   axi_port0``numtbu``_awsize               ; \
wire  [1:0]                                   axi_port0``numtbu``_awburst              ; \
wire                                          axi_port0``numtbu``_awvalid              ; \
wire                                          axi_port0``numtbu``_awready              ; \
wire  [15:0]                                  axi_port0``numtbu``_wid                  ; \
wire  [255:0]                                 axi_port0``numtbu``_wdata                ; \
wire  [31:0]                                  axi_port0``numtbu``_wstrb                ; \
wire                                          axi_port0``numtbu``_wlast                ; \
wire                                          axi_port0``numtbu``_wvalid               ; \
wire                                          axi_port0``numtbu``_wready               ; \
wire  [15:0]                                  axi_port0``numtbu``_bid                  ; \
wire  [1:0]                                   axi_port0``numtbu``_bresp                ; \
wire                                          axi_port0``numtbu``_bvalid               ; \
wire                                          axi_port0``numtbu``_bready               ; \
\
axi_master_example #(                           \
    .DATASIZE       (256), /* Transfer 4-Byte data */\
    .DATAWIDTH      (256),                          \
    .ADDRWIDTH      (48)                            \
) axi_master_0``numtbu`` (   \
   .AxADDR        (48'b0                        ),\
   .AxLEN         (8'hf                         ),\
   .AxDATA        (256'habcd1234                ),\
   .RWTEST        (1'b1                         ),\
\
   .mst_aresetn   (1'b0),\
   .mst_aclk      (TBU``numtbu``_CLK            ),\
   .mst_awid      (axi_port0``numtbu``_awid     ),\
   .mst_awaddr    (axi_port0``numtbu``_awaddr   ),\
   .mst_awlen     (axi_port0``numtbu``_awlen    ),\
   .mst_awsize    (axi_port0``numtbu``_awsize   ),\
   .mst_awburst   (axi_port0``numtbu``_awburst  ),\
   .mst_awvalid   (axi_port0``numtbu``_awvalid  ),\
   .mst_awready   (axi_port0``numtbu``_awready  ),\
   .mst_wid       (axi_port0``numtbu``_wid      ),\
   .mst_wdata     (axi_port0``numtbu``_wdata    ),\
   .mst_wstrb     (axi_port0``numtbu``_wstrb    ),\
   .mst_wlast     (axi_port0``numtbu``_wlast    ),\
   .mst_wvalid    (axi_port0``numtbu``_wvalid   ),\
   .mst_wready    (axi_port0``numtbu``_wready   ),\
   .mst_bid       (axi_port0``numtbu``_bid      ),\
   .mst_bresp     (axi_port0``numtbu``_bresp    ),\
   .mst_bvalid    (axi_port0``numtbu``_bvalid   ),\
   .mst_bready    (axi_port0``numtbu``_bready   ),\
   .mst_arid      (axi_port0``numtbu``_arid     ),\
   .mst_araddr    (axi_port0``numtbu``_araddr   ),\
   .mst_arlen     (axi_port0``numtbu``_arlen    ),\
   .mst_arsize    (axi_port0``numtbu``_arsize   ),\
   .mst_arburst   (axi_port0``numtbu``_arburst  ),\
   .mst_arvalid   (axi_port0``numtbu``_arvalid  ),\
   .mst_arready   (axi_port0``numtbu``_arready  ),\
   .mst_rid       (axi_port0``numtbu``_rid      ),\
   .mst_rdata     (axi_port0``numtbu``_rdata    ),\
   .mst_rresp     (axi_port0``numtbu``_rresp    ),\
   .mst_rlast     (axi_port0``numtbu``_rlast    ),\
   .mst_rvalid    (axi_port0``numtbu``_rvalid   ),\
   .mst_rready    (axi_port0``numtbu``_rready   )\
);\
\
mmu600_r2_tbu_ace_lite\
#(\
  .TBUCFG_ID_WIDTH          (`TBUCFG_ID_WIDTH          ) ,  \
  .TBUCFG_DATA_WIDTH        (`TBUCFG_DATA_WIDTH        ) ,  \
  .TBUCFG_ARUSER_WIDTH      (`TBUCFG_ARUSER_WIDTH      ) ,  \
  .TBUCFG_AWUSER_WIDTH      (`TBUCFG_AWUSER_WIDTH      ) ,  \
  .TBUCFG_RUSER_WIDTH       (`TBUCFG_RUSER_WIDTH       ) ,  \
  .TBUCFG_WUSER_WIDTH       (`TBUCFG_WUSER_WIDTH       ) ,  \
  .TBUCFG_BUSER_WIDTH       (`TBUCFG_BUSER_WIDTH       ) ,  \
  .TBUCFG_STASH             (`TBUCFG_STASH             ) ,  \
  .TBUCFG_SID_WIDTH         (`TBUCFG_SID_WIDTH         ) ,  \
  .TBUCFG_SSID_WIDTH        (`TBUCFG_SSID_WIDTH        ) ,  \
  .TBUCFG_WBUF_DEPTH        (`TBUCFG_WBUF_DEPTH        ) ,  \
  .TBUCFG_LFIFO_DEPTH       (`TBUCFG_LFIFO_DEPTH       ) ,  \
  .TBUCFG_XLATE_SLOTS       (`TBUCFG_XLATE_SLOTS       ) ,  \
  .TBUCFG_ROT_DEPTH         (`TBUCFG_ROT_DEPTH         ) ,  \
  .TBUCFG_WOT_DEPTH         (`TBUCFG_WOT_DEPTH         ) ,  \
  .TBUCFG_UTLB_DEPTH        (`TBUCFG_UTLB_DEPTH        ) ,  \
  .TBUCFG_MTLB_DEPTH        (`TBUCFG_MTLB_DEPTH        ) ,  \
  .TBUCFG_DIRECT_IDX        (`TBUCFG_DIRECT_IDX        ) ,  \
  .TBUCFG_MTLB_PARTS        (`TBUCFG_MTLB_PARTS        ) ,  \
  .TBUCFG_SI_AR_HNDSHK_MODE (`TBUCFG_SI_AR_HNDSHK_MODE ) ,  \
  .TBUCFG_SI_R_HNDSHK_MODE  (`TBUCFG_SI_R_HNDSHK_MODE  ) ,  \
  .TBUCFG_SI_AW_HNDSHK_MODE (`TBUCFG_SI_AW_HNDSHK_MODE ) ,  \
  .TBUCFG_SI_W_HNDSHK_MODE  (`TBUCFG_SI_W_HNDSHK_MODE  ) ,  \
  .TBUCFG_SI_B_HNDSHK_MODE  (`TBUCFG_SI_B_HNDSHK_MODE  ) ,  \
  .TBUCFG_MI_AR_HNDSHK_MODE (`TBUCFG_MI_AR_HNDSHK_MODE ) ,  \
  .TBUCFG_MI_R_HNDSHK_MODE  (`TBUCFG_MI_R_HNDSHK_MODE  ) ,  \
  .TBUCFG_MI_AW_HNDSHK_MODE (`TBUCFG_MI_AW_HNDSHK_MODE ) ,  \
  .TBUCFG_MI_W_HNDSHK_MODE  (`TBUCFG_MI_W_HNDSHK_MODE  ) ,  \
  .TBUCFG_MI_B_HNDSHK_MODE  (`TBUCFG_MI_B_HNDSHK_MODE  ) ,  \
  .TBUCFG_DTI_HNDSHK_MODE   (`TBUCFG_DTI_HNDSHK_MODE   ) ,  \
  .TBUCFG_MTLB_LKPRSP_MODE  (`TBUCFG_MTLB_LKPRSP_MODE  )    \
)\
u_mmu600_r2_tbu_ace_lite_xemis``numtbu`` (\
  .aclk            ( TBU``numtbu``_CLK                  ),  \
  .aresetn         ( TBU``numtbu``_RSTn                 ),  \
  .awvalid_s       ( axi_port0``numtbu``_awvalid        ),  \
  .awready_s       ( axi_port0``numtbu``_awready        ),  \
  .awid_s          ( axi_port0``numtbu``_awid           ),  \
  .awaddr_s        ( {16'b0,axi_port0``numtbu``_awaddr} ),  \
  .awlen_s         ( axi_port0``numtbu``_awlen          ),  \
  .awsize_s        ( axi_port0``numtbu``_awsize         ),  \
  .awburst_s       ( axi_port0``numtbu``_awburst        ),  \
  .awlock_s        ( 1'b0),                                 \
  .awcache_s       ( 4'b0),                                 \
  .awprot_s        ( 3'b0),                                 \
  .awqos_s         ( 4'b0),                                 \
  .awregion_s      ( 4'b0),                                 \
  .awstashnid_s    ( 11'b0),                                \
  .awstashniden_s  ( 1'b0),                                 \
  .awstashlpid_s   ( 5'b0),                                 \
  .awstashlpiden_s ( 1'b0),                                 \
  .awsnoop_s       ( 4'b0),                                 \
  .awuser_s        ( 32'b0),                                \
  .awdomain_s      ( 2'b0),                                 \
  .awmmussid_s     ( 20'b0),                                \
  .awmmusid_s      ( 16'h``numtbu``),                       \
  .awmmussidv_s    ( 1'b0),                                 \
  .awmmusecsid_s   ( 1'b0),                                 \
  .awmmuatst_s     ( 1'b0),                                 \
  .awatop_s        ( 6'b0),                                 \
  .arvalid_s       ( axi_port0``numtbu``_arvalid       ),   \
  .arready_s       ( axi_port0``numtbu``_arready       ),   \
  .arid_s          ( axi_port0``numtbu``_arid          ),   \
  .araddr_s        ( {16'b0,axi_port0``numtbu``_araddr}),   \
  .arlen_s         ( axi_port0``numtbu``_arlen         ),   \
  .arsize_s        ( axi_port0``numtbu``_arsize        ),   \
  .arburst_s       ( axi_port0``numtbu``_arburst       ),   \
  .arlock_s        ( 1'b0),                                 \
  .arcache_s       ( 4'b0),                                 \
  .arprot_s        ( 3'b0),                                 \
  .arqos_s         ( 4'b0),                                 \
  .arregion_s      ( 4'b0),                                 \
  .arsnoop_s       ( 4'b0),                                 \
  .aruser_s        ( 32'b0),                                \
  .ardomain_s      ( 2'b0),                                 \
  .armmussid_s     ( 20'b0),                                \
  .armmusid_s      ( 16'h``numtbu``),                       \
  .armmussidv_s    ( 1'b0),                                 \
  .armmusecsid_s   ( 1'b0),                                 \
  .armmuatst_s     ( 1'b0),                                 \
  .wvalid_s        ( axi_port0``numtbu``_wvalid        ),\
  .wready_s        ( axi_port0``numtbu``_wready        ),\
  .wdata_s         ( axi_port0``numtbu``_wdata         ),\
  .wstrb_s         ( axi_port0``numtbu``_wstrb         ),\
  .wlast_s         ( axi_port0``numtbu``_wlast         ),\
  .wuser_s         ( 1'b0 ),                             \
  .rvalid_s        ( axi_port0``numtbu``_rvalid        ),\
  .rready_s        ( axi_port0``numtbu``_rready        ),\
  .rid_s           ( axi_port0``numtbu``_rid           ),\
  .rdata_s         ( axi_port0``numtbu``_rdata         ),\
  .rresp_s         ( axi_port0``numtbu``_rresp         ),\
  .rlast_s         ( axi_port0``numtbu``_rlast         ),\
  .ruser_s         ( ),                                  \
  .bvalid_s        ( axi_port0``numtbu``_bvalid        ),\
  .bready_s        ( axi_port0``numtbu``_bready        ),\
  .bid_s           ( axi_port0``numtbu``_bid           ),\
  .bresp_s         ( axi_port0``numtbu``_bresp         ),\
  .buser_s         ( ),                                 \
  .awakeup_s       ( 1'b1),                             \
  .awvalid_m       ( TBU``numtbu``_AWVALID         ),   \
  .awready_m       ( TBU``numtbu``_AWREADY         ),   \
  .awid_m          ( tbu``numtbu``_awid            ),   \
  .awaddr_m        ( TBU``numtbu``_AWADDR          ),   \
  .awlen_m         ( TBU``numtbu``_AWLEN           ),   \
  .awsize_m        ( TBU``numtbu``_AWSIZE          ),   \
  .awburst_m       ( TBU``numtbu``_AWBURST         ),   \
  .awlock_m        ( TBU``numtbu``_AWLOCK          ),   \
  .awcache_m       ( TBU``numtbu``_AWCACHE         ),   \
  .awprot_m        ( TBU``numtbu``_AWPROT          ),   \
  .awqos_m         ( TBU``numtbu``_AWQOS           ),   \
  .awregion_m      (                      ),            \
  .awstashnid_m    ( TBU``numtbu``_AWSTASHNID      ),   \
  .awstashniden_m  ( TBU``numtbu``_AWSTASHNIDEN    ),   \
  .awstashlpid_m   ( TBU``numtbu``_AWSTASHLPID     ),   \
  .awstashlpiden_m ( TBU``numtbu``_AWSTASHLPIDEN   ),   \
  .awsnoop_m       ( TBU``numtbu``_AWSNOOP         ),   \
  .awuser_m        ( tbu``numtbu``_awuser          ),   \
  .awdomain_m      ( TBU``numtbu``_AWDOMAIN        ),   \
  .awmmusid_m      (                      ),            \
  .awmmusecsid_m   (                      ),            \
  .awatop_m        ( TBU``numtbu``_AWATOP          ),   \
  .arvalid_m       ( TBU``numtbu``_ARVALID         ),   \
  .arready_m       ( TBU``numtbu``_ARREADY         ),   \
  .arid_m          ( tbu``numtbu``_arid            ),   \
  .araddr_m        ( TBU``numtbu``_ARADDR          ),   \
  .arlen_m         ( TBU``numtbu``_ARLEN           ),   \
  .arsize_m        ( TBU``numtbu``_ARSIZE          ),   \
  .arburst_m       ( TBU``numtbu``_ARBURST         ),   \
  .arlock_m        ( TBU``numtbu``_ARLOCK          ),   \
  .arcache_m       ( TBU``numtbu``_ARCACHE         ),   \
  .arprot_m        ( TBU``numtbu``_ARPROT          ),   \
  .arqos_m         ( TBU``numtbu``_ARQOS           ),   \
  .arregion_m      (                      ),            \
  .arsnoop_m       ( TBU``numtbu``_ARSNOOP         ),   \
  .aruser_m        ( tbu``numtbu``_aruser          ),   \
  .ardomain_m      ( TBU``numtbu``_ARDOMAIN        ),   \
  .armmusid_m      (                      ),            \
  .armmusecsid_m   (                      ),            \
  .wvalid_m        ( TBU``numtbu``_WVALID          ),   \
  .wready_m        ( TBU``numtbu``_WREADY          ),   \
  .wdata_m         ( TBU``numtbu``_WDATA           ),   \
  .wstrb_m         ( TBU``numtbu``_WSTRB           ),   \
  .wlast_m         ( TBU``numtbu``_WLAST           ),   \
  .wuser_m         ( TBU``numtbu``_WUSER           ),   \
  .rvalid_m        ( TBU``numtbu``_RVALID          ),   \
  .rready_m        ( TBU``numtbu``_RREADY          ),   \
  .rid_m           ( tbu``numtbu``_rid             ),   \
  .ruser_m         ( TBU``numtbu``_RUSER           ),   \
  .rdata_m         ( TBU``numtbu``_RDATA           ),   \
  .rresp_m         ( TBU``numtbu``_RRESP[1:0]      ),   \
  .rlast_m         ( TBU``numtbu``_RLAST           ),   \
  .bvalid_m        ( TBU``numtbu``_BVALID          ),   \
  .bready_m        ( TBU``numtbu``_BREADY          ),   \
  .bid_m           ( tbu``numtbu``_bid             ),   \
  .buser_m         ( TBU``numtbu``_BUSER           ),   \
  .bresp_m         ( TBU``numtbu``_BRESP           ),   \
  .awakeup_m       ( TBU``numtbu``_AWAKEUP         ),   \
  .tvalid_dti_dn   ( tbu``numtbu``_tvalid_dti_dn   ),   \
  .tready_dti_dn   ( tbu``numtbu``_tready_dti_dn   ),   \
  .tdata_dti_dn    ( tbu``numtbu``_tdata_dti_dn    ),   \
  .tkeep_dti_dn    ( tbu``numtbu``_tkeep_dti_dn    ),   \
  .tlast_dti_dn    ( tbu``numtbu``_tlast_dti_dn    ),   \
  .twakeup_dti_dn  ( tbu``numtbu``_twakeup_dti_dn  ),   \
  .tvalid_dti_up   ( tbu``numtbu``_tvalid_dti_up   ),   \
  .tready_dti_up   ( tbu``numtbu``_tready_dti_up   ),   \
  .tdata_dti_up    ( tbu``numtbu``_tdata_dti_up    ),   \
  .tkeep_dti_up    ( tbu``numtbu``_tkeep_dti_up    ),   \
  .tlast_dti_up    ( tbu``numtbu``_tlast_dti_up    ),   \
  .twakeup_dti_up  ( tbu``numtbu``_twakeup_dti_up  ),   \
  .qreqn_pd        ( 1'b1                          ),   \
  .qacceptn_pd     (                               ),   \
  .qdeny_pd        (                               ),   \
  .qactive_pd      (                               ),   \
  .qreqn_cg        ( 1'b1                          ),   \
  .qacceptn_cg     (                               ),   \
  .qdeny_cg        (                               ),   \
  .qactive_cg      (                               ),   \
  .pmusnapshot_req ( 1'b0                          ),   \
  .pmusnapshot_ack (                               ),   \
  .ras_irpt        ( tbu``numtbu``_ras_irpt        ),   \
  .pmu_irpt        ( tbu``numtbu``_pmu_irpt        ),   \
  .pcie_mode       ( `STATICCFG_PCIE_MODE          ),   \
  .ns_sid_high     ( `STATICCFG_NS_SID_HIGH        ),   \
  .s_sid_high      ( `STATICCFG_S_SID_HIGH         ),   \
  .cmo_disable     ( `STATICCFG_CMO_DISABLE        ),   \
  .max_tok_trans   ( `STATICCFG_MAX_TOK_TRANS      ),   \
  .utlb_roundrobin ( `STATICCFG_UTLB_ROUNDROBIN    ),   \
  .ecorevnum       ( `STATICCFG_ECOREVNUM          ),   \
  .sec_override    ( `STATICCFG_SEC_OVERRIDE       ),   \
  .dftcgen         ( 1'b0                          ),   \
  .dftrstdisable   ( 1'b0                          ),   \
  .dftramhold      ( 1'b0                          ),   \
  .mbistresetn     ( 1'b1                          ),   \
  .mbistreq        ( 1'b0                          )    \
  )

`define MMUTBU_A4SADB_TEMPLATE(num)     \
mmu600_r2_tbu_ace_lite                                                       \
#(                                                                           \
    .TBUCFG_ID_WIDTH          (`TBUCFG_ID_WIDTH          ) ,                   \
    .TBUCFG_DATA_WIDTH        (`TBUCFG_DATA_WIDTH        ) ,                   \
    .TBUCFG_ARUSER_WIDTH      (`TBUCFG_ARUSER_WIDTH      ) ,                   \
    .TBUCFG_AWUSER_WIDTH      (`TBUCFG_AWUSER_WIDTH      ) ,                   \
    .TBUCFG_RUSER_WIDTH       (`TBUCFG_RUSER_WIDTH       ) ,                   \
    .TBUCFG_WUSER_WIDTH       (`TBUCFG_WUSER_WIDTH       ) ,                   \
    .TBUCFG_BUSER_WIDTH       (`TBUCFG_BUSER_WIDTH       ) ,                   \
    .TBUCFG_STASH             (`TBUCFG_STASH             ) ,                   \
    .TBUCFG_SID_WIDTH         (`TBUCFG_SID_WIDTH         ) ,                   \
    .TBUCFG_SSID_WIDTH        (`TBUCFG_SSID_WIDTH        ) ,                   \
    .TBUCFG_WBUF_DEPTH        (`TBUCFG_WBUF_DEPTH        ) ,                   \
    .TBUCFG_LFIFO_DEPTH       (`TBUCFG_LFIFO_DEPTH       ) ,                   \
    .TBUCFG_XLATE_SLOTS       (`TBUCFG_XLATE_SLOTS       ) ,                   \
    .TBUCFG_ROT_DEPTH         (`TBUCFG_ROT_DEPTH         ) ,                   \
    .TBUCFG_WOT_DEPTH         (`TBUCFG_WOT_DEPTH         ) ,                   \
    .TBUCFG_UTLB_DEPTH        (`TBUCFG_UTLB_DEPTH        ) ,                   \
    .TBUCFG_MTLB_DEPTH        (`TBUCFG_MTLB_DEPTH        ) ,                   \
    .TBUCFG_DIRECT_IDX        (`TBUCFG_DIRECT_IDX        ) ,                   \
    .TBUCFG_MTLB_PARTS        (`TBUCFG_MTLB_PARTS        ) ,                   \
    .TBUCFG_SI_AR_HNDSHK_MODE (`TBUCFG_SI_AR_HNDSHK_MODE ) ,                   \
    .TBUCFG_SI_R_HNDSHK_MODE  (`TBUCFG_SI_R_HNDSHK_MODE  ) ,                   \
    .TBUCFG_SI_AW_HNDSHK_MODE (`TBUCFG_SI_AW_HNDSHK_MODE ) ,                   \
    .TBUCFG_SI_W_HNDSHK_MODE  (`TBUCFG_SI_W_HNDSHK_MODE  ) ,                   \
    .TBUCFG_SI_B_HNDSHK_MODE  (`TBUCFG_SI_B_HNDSHK_MODE  ) ,                   \
    .TBUCFG_MI_AR_HNDSHK_MODE (`TBUCFG_MI_AR_HNDSHK_MODE ) ,                   \
    .TBUCFG_MI_R_HNDSHK_MODE  (`TBUCFG_MI_R_HNDSHK_MODE  ) ,                   \
    .TBUCFG_MI_AW_HNDSHK_MODE (`TBUCFG_MI_AW_HNDSHK_MODE ) ,                   \
    .TBUCFG_MI_W_HNDSHK_MODE  (`TBUCFG_MI_W_HNDSHK_MODE  ) ,                   \
    .TBUCFG_MI_B_HNDSHK_MODE  (`TBUCFG_MI_B_HNDSHK_MODE  ) ,                   \
    .TBUCFG_DTI_HNDSHK_MODE   (`TBUCFG_DTI_HNDSHK_MODE   ) ,                   \
    .TBUCFG_MTLB_LKPRSP_MODE  (`TBUCFG_MTLB_LKPRSP_MODE  )                     \
) u_mmu600_r2_tbu_ace_lite_xemis``num`` (                                      \
    .aclk            ( AXEMIS``num``_CLK           ),                          \
    .aresetn         ( AXEMIS``num``_RSTn          ),                          \
    .awvalid_s       ( AXEMIS``num``_AWVALID       ),                          \
    .awready_s       ( AXEMIS``num``_AWREADY       ),                          \
    .awid_s          ( AXEMIS``num``_AWID          ),                          \
    .awaddr_s        ( AXEMIS``num``_AWADDR        ),                          \
    .awlen_s         ( AXEMIS``num``_AWLEN         ),                          \
    .awsize_s        ( AXEMIS``num``_AWSIZE        ),                          \
    .awburst_s       ( AXEMIS``num``_AWBURST       ),                          \
    .awlock_s        ( AXEMIS``num``_AWLOCK        ),                          \
    .awcache_s       ( AXEMIS``num``_AWCACHE       ),                          \
    .awprot_s        ( AXEMIS``num``_AWPROT        ),                          \
    .awqos_s         ( AXEMIS``num``_AWQOS         ),                          \
    .awregion_s      ( AXEMIS``num``_AWREGION      ),                          \
    .awstashnid_s    ( AXEMIS``num``_AWSTASHNID    ),                          \
    .awstashniden_s  ( AXEMIS``num``_AWSTASHNIDEN  ),                          \
    .awstashlpid_s   ( AXEMIS``num``_AWSTASHLPID   ),                          \
    .awstashlpiden_s ( AXEMIS``num``_AWSTASHLPIDEN ),                          \
    .awsnoop_s       ( AXEMIS``num``_AWSNOOP       ),                          \
    .awuser_s        ( AXEMIS``num``_AWUSER        ),                          \
    .awdomain_s      ( AXEMIS``num``_AWDOMAIN      ),                          \
    .awmmussid_s     ( AXEMIS``num``_AWMMUSSID     ),                          \
    .awmmusid_s      ( AXEMIS``num``_AWMMUSID      ),                          \
    .awmmussidv_s    ( AXEMIS``num``_AWMMUSSIDV    ),                          \
    .awmmusecsid_s   ( AXEMIS``num``_AWMMUSECSID   ),                          \
    .awmmuatst_s     ( AXEMIS``num``_AWMMUATST     ),                          \
    .awatop_s        ( AXEMIS``num``_AWATOP        ),                          \
    .arvalid_s       ( AXEMIS``num``_ARVALID       ),                          \
    .arready_s       ( AXEMIS``num``_ARREADY       ),                          \
    .arid_s          ( AXEMIS``num``_ARID          ),                          \
    .araddr_s        ( AXEMIS``num``_ARADDR        ),                          \
    .arlen_s         ( AXEMIS``num``_ARLEN         ),                          \
    .arsize_s        ( AXEMIS``num``_ARSIZE        ),                          \
    .arburst_s       ( AXEMIS``num``_ARBURST       ),                          \
    .arlock_s        ( AXEMIS``num``_ARLOCK        ),                          \
    .arcache_s       ( AXEMIS``num``_ARCACHE       ),                          \
    .arprot_s        ( AXEMIS``num``_ARPROT        ),                          \
    .arqos_s         ( AXEMIS``num``_ARQOS         ),                          \
    .arregion_s      ( AXEMIS``num``_ARREGION      ),                          \
    .arsnoop_s       ( AXEMIS``num``_ARSNOOP       ),                          \
    .aruser_s        ( AXEMIS``num``_ARUSER        ),                          \
    .ardomain_s      ( AXEMIS``num``_ARDOMAIN      ),                          \
    .armmussid_s     ( AXEMIS``num``_ARMMUSSID     ),                          \
    .armmusid_s      ( AXEMIS``num``_ARMMUSID      ),                          \
    .armmussidv_s    ( AXEMIS``num``_ARMMUSSIDV    ),                          \
    .armmusecsid_s   ( AXEMIS``num``_ARMMUSECSID   ),                          \
    .armmuatst_s     ( AXEMIS``num``_ARMMUATST     ),                          \
    .wvalid_s        ( AXEMIS``num``_WVALID        ),                          \
    .wready_s        ( AXEMIS``num``_WREADY        ),                          \
    .wdata_s         ( AXEMIS``num``_WDATA         ),                          \
    .wstrb_s         ( AXEMIS``num``_WSTRB         ),                          \
    .wlast_s         ( AXEMIS``num``_WLAST         ),                          \
    .wuser_s         ( AXEMIS``num``_WUSER         ),                          \
    .rvalid_s        ( AXEMIS``num``_RVALID        ),                          \
    .rready_s        ( AXEMIS``num``_RREADY        ),                          \
    .rid_s           ( AXEMIS``num``_RID           ),                          \
    .rdata_s         ( AXEMIS``num``_RDATA         ),                          \
    .rresp_s         ( AXEMIS``num``_RRESP         ),                          \
    .rlast_s         ( AXEMIS``num``_RLAST         ),                          \
    .ruser_s         ( AXEMIS``num``_RUSER         ),                          \
    .bvalid_s        ( AXEMIS``num``_BVALID        ),                          \
    .bready_s        ( AXEMIS``num``_BREADY        ),                          \
    .bid_s           ( AXEMIS``num``_BID           ),                          \
    .bresp_s         ( AXEMIS``num``_BRESP         ),                          \
    .buser_s         ( AXEMIS``num``_BUSER         ),                          \
    .awakeup_s       ( AXEMIS``num``_AWAKEUP       ),                          \
\
    .awvalid_m       ( TBU``num``_AWVALID         ),                           \
    .awready_m       ( TBU``num``_AWREADY         ),                           \
    .awid_m          ( tbu``num``_awid            ),                           \
    .awaddr_m        ( TBU``num``_AWADDR          ),                           \
    .awlen_m         ( TBU``num``_AWLEN           ),                           \
    .awsize_m        ( TBU``num``_AWSIZE          ),                           \
    .awburst_m       ( TBU``num``_AWBURST         ),                           \
    .awlock_m        ( TBU``num``_AWLOCK          ),                           \
    .awcache_m       ( TBU``num``_AWCACHE         ),                           \
    .awprot_m        ( TBU``num``_AWPROT          ),                           \
    .awqos_m         ( TBU``num``_AWQOS           ),                           \
    .awregion_m      (                            ),                           \
    .awstashnid_m    ( TBU``num``_AWSTASHNID      ),                           \
    .awstashniden_m  ( TBU``num``_AWSTASHNIDEN    ),                           \
    .awstashlpid_m   ( TBU``num``_AWSTASHLPID     ),                           \
    .awstashlpiden_m ( TBU``num``_AWSTASHLPIDEN   ),                           \
    .awsnoop_m       ( TBU``num``_AWSNOOP         ),                           \
    .awuser_m        ( tbu``num``_awuser          ),                           \
    .awdomain_m      ( TBU``num``_AWDOMAIN        ),                           \
    .awmmusid_m      (                            ),                           \
    .awmmusecsid_m   (                            ),                           \
    .awatop_m        ( TBU``num``_AWATOP          ),                           \
    .arvalid_m       ( TBU``num``_ARVALID         ),                           \
    .arready_m       ( TBU``num``_ARREADY         ),                           \
    .arid_m          ( tbu``num``_arid            ),                           \
    .araddr_m        ( TBU``num``_ARADDR          ),                           \
    .arlen_m         ( TBU``num``_ARLEN           ),                           \
    .arsize_m        ( TBU``num``_ARSIZE          ),                           \
    .arburst_m       ( TBU``num``_ARBURST         ),                           \
    .arlock_m        ( TBU``num``_ARLOCK          ),                           \
    .arcache_m       ( TBU``num``_ARCACHE         ),                           \
    .arprot_m        ( TBU``num``_ARPROT          ),                           \
    .arqos_m         ( TBU``num``_ARQOS           ),                           \
    .arregion_m      (                            ),                           \
    .arsnoop_m       ( TBU``num``_ARSNOOP         ),                           \
    .aruser_m        ( tbu``num``_aruser          ),                           \
    .ardomain_m      ( TBU``num``_ARDOMAIN        ),                           \
    .armmusid_m      (                            ),                           \
    .armmusecsid_m   (                            ),                           \
    .wvalid_m        ( TBU``num``_WVALID          ),                           \
    .wready_m        ( TBU``num``_WREADY          ),                           \
    .wdata_m         ( TBU``num``_WDATA           ),                           \
    .wstrb_m         ( TBU``num``_WSTRB           ),                           \
    .wlast_m         ( TBU``num``_WLAST           ),                           \
    .wuser_m         ( TBU``num``_WUSER           ),                           \
    .rvalid_m        ( TBU``num``_RVALID          ),                           \
    .rready_m        ( TBU``num``_RREADY          ),                           \
    .rid_m           ( tbu``num``_rid             ),                           \
    .ruser_m         ( TBU``num``_RUSER           ),                           \
    .rdata_m         ( TBU``num``_RDATA           ),                           \
    .rresp_m         ( TBU``num``_RRESP[1:0]      ),                           \
    .rlast_m         ( TBU``num``_RLAST           ),                           \
    .bvalid_m        ( TBU``num``_BVALID          ),                           \
    .bready_m        ( TBU``num``_BREADY          ),                           \
    .bid_m           ( tbu``num``_bid             ),                           \
    .buser_m         ( TBU``num``_BUSER           ),                           \
    .bresp_m         ( TBU``num``_BRESP           ),                           \
    .awakeup_m       ( TBU``num``_AWAKEUP         ),                           \
\
    .tvalid_dti_dn   ( tbu``num``_tvalid_dti_dn   ),                           \
    .tready_dti_dn   ( tbu``num``_tready_dti_dn   ),                           \
    .tdata_dti_dn    ( tbu``num``_tdata_dti_dn    ),                           \
    .tkeep_dti_dn    ( tbu``num``_tkeep_dti_dn    ),                           \
    .tlast_dti_dn    ( tbu``num``_tlast_dti_dn    ),                           \
    .twakeup_dti_dn  ( tbu``num``_twakeup_dti_dn  ),                           \
\
    .tvalid_dti_up   ( tbu``num``_tvalid_dti_up   ),                           \
    .tready_dti_up   ( tbu``num``_tready_dti_up   ),                           \
    .tdata_dti_up    ( tbu``num``_tdata_dti_up    ),                           \
    .tkeep_dti_up    ( tbu``num``_tkeep_dti_up    ),                           \
    .tlast_dti_up    ( tbu``num``_tlast_dti_up    ),                           \
    .twakeup_dti_up  ( tbu``num``_twakeup_dti_up  ),                           \
\
    .qreqn_pd        ( 1'b1                       ) ,                          \
    .qacceptn_pd     (                            ) ,                          \
    .qdeny_pd        (                            ) ,                          \
    .qactive_pd      (                            ) ,                          \
    .qreqn_cg        ( 1'b1                       ) ,                          \
    .qacceptn_cg     (                            ) ,                          \
    .qdeny_cg        (                            ) ,                          \
    .qactive_cg      (                            ) ,                          \
    .pmusnapshot_req ( 1'b0                       ) ,                          \
    .pmusnapshot_ack (                            ) ,                          \
\
    .ras_irpt        ( tbu``num``_ras_irpt        ) ,                          \
    .pmu_irpt        ( tbu``num``_pmu_irpt        ) ,                          \
    .pcie_mode       ( `STATICCFG_PCIE_MODE       ) ,/* You must tie-off this signal to HIGH when the TBU is connected to a PCIe IF*/\
    .ns_sid_high     ( `STATICCFG_NS_SID_HIGH     ) ,/* You should check it                                                        */\
    .s_sid_high      ( `STATICCFG_S_SID_HIGH      ) ,/* You should check it                                                        */\
    .cmo_disable     ( `STATICCFG_CMO_DISABLE     ) ,/* You should check it                                                        */\
    .max_tok_trans   ( `STATICCFG_MAX_TOK_TRANS   ) ,/* You should check it                                                        */\
    .utlb_roundrobin ( `STATICCFG_UTLB_ROUNDROBIN ) ,/* You should check it                                                        */\
    .ecorevnum       ( `STATICCFG_ECOREVNUM       ) ,/* You should check it                                                        */\
    .sec_override    ( `STATICCFG_SEC_OVERRIDE    ) ,/* You should check it                                                        */\
    .dftcgen         ( 1'b0                       ) ,/* You should check it                                                        */\
    .dftrstdisable   ( 1'b0                       ) ,                          \
    .dftramhold      ( 1'b0                       ) ,                          \
    .mbistresetn     ( 1'b1                       ) ,                          \
    .mbistreq        ( 1'b0                       )                            \
);                                                                             \
\
adb400_r3_axi4_stream #(                                                         \
    .DATA_WIDTH     (160),                                                       \
    .ID_WIDTH       (6),                                                         \
    .DEST_WIDTH     (6),                                                         \
    .USER_WIDTH     (0)                                                          \
) u_adb_a4s_tbu``num``_dn(                                                       \
    .pwrq_permit_deny_sar_i (1'b0                                  ),            \
    .dftrstdisables         (1'b0                                  ),            \
\
    .pwrqreqns_i            (TBU``num``_A4SADB_DN_PWR_QREQn        ),            \
    .pwrqacceptns_o         (TBU``num``_A4SADB_DN_PWR_QACCEPTn     ),            \
    .pwrqactives_o          (TBU``num``_A4SADB_DN_PWR_QACTIVE      ),            \
    .pwrqdenys_o            (TBU``num``_A4SADB_DN_PWR_QDENY        ),            \
    .clkqreqns_i            (TBU``num``_A4SADB_DN_CLK_QREQn        ),            \
    .clkqacceptns_o         (TBU``num``_A4SADB_DN_CLK_QACCEPTn     ),            \
    .clkqdenys_o            (TBU``num``_A4SADB_DN_CLK_QACTIVE      ),            \
    .clkqactives_o          (TBU``num``_A4SADB_DN_CLK_QDENY        ),            \
\
    .aclks                  (TBU``num``_CLK                        ),            \
    .aresetns               (TBU``num``_RSTn                       ),            \
    .wakeups_i              (tbu``num``_twakeup_dti_dn             ),            \
    .tvalids                (tbu``num``_tvalid_dti_dn              ),            \
    .treadys                (tbu``num``_tready_dti_dn              ),            \
    .tdatas                 (tbu``num``_tdata_dti_dn               ),            \
    .tstrbs                 (20'b0 /* Unused (Only data-byte)*/    ),            \
    .tkeeps                 (tbu``num``_tkeep_dti_dn               ),            \
    .tlasts                 (tbu``num``_tlast_dti_dn               ),            \
    .tids                   (tbu``num``_tid_dti_dn                 ),            \
    .tdests                 (6'b0 /* Unnecessary(only 1 destination:TCU)*/),     \
    .tusers                 (1'b0 /* Unused                             */),     \
\
    .dftrstdisablem         (1'b0                                  ),            \
    .clkqreqnm_i            (1'b1                                  ),            \
    .clkqacceptnm_o         (),                                                  \
    .clkqdenym_o            (),                                                  \
    .clkqactivem_o          (),                                                  \
\
    .aclkm                  (TCU_CLK                               ),            \
    .aresetnm               (TCU_RSTn                              ),            \
    .wakeupm_o              (tbu``num``_adb_twakeup_dti_dn         ),            \
    .tvalidm                (tbu``num``_adb_tvalid_dti_dn          ),            \
    .treadym                (tbu``num``_adb_tready_dti_dn          ),            \
    .tdatam                 (tbu``num``_adb_tdata_dti_dn           ),            \
    .tstrbm                 (),                                                  \
    .tkeepm                 (tbu``num``_adb_tkeep_dti_dn           ),            \
    .tlastm                 (tbu``num``_adb_tlast_dti_dn           ),            \
    .tidm                   (tbu``num``_adb_tid_dti_dn             ),            \
    .tdestm                 (),                                                  \
    .tuserm                 ()                                                   \
);                                                                               \
adb400_r3_axi4_stream #(                                                         \
    .DATA_WIDTH     (`DTI_DATA_WIDTH),                                           \
    .ID_WIDTH       (`DTI_ID_WIDTH),                                             \
    .DEST_WIDTH     (`DTI_ID_WIDTH),                                             \
    .USER_WIDTH     (0)                                                          \
) u_adb_a4s_tbu``num``_up(                                                       \
    .pwrq_permit_deny_sar_i (1'b0                             ),                 \
    .dftrstdisables         (1'b0                             ),                 \
\
    .pwrqreqns_i            (1'b1                             ),                 \
    .pwrqacceptns_o         (),                                                  \
    .pwrqactives_o          (),                                                  \
    .pwrqdenys_o            (),                                                  \
    .clkqreqns_i            (1'b1                             ),                 \
    .clkqacceptns_o         (),                                                  \
    .clkqdenys_o            (),                                                  \
    .clkqactives_o          (),                                                  \
\
    .aclks                  (TCU_CLK                          ),                 \
    .aresetns               (TCU_RSTn                         ),                 \
    .wakeups_i              (tbu``num``_adb_twakeup_dti_up    ),                 \
    .tvalids                (tbu``num``_adb_tvalid_dti_up     ),                 \
    .treadys                (tbu``num``_adb_tready_dti_up     ),                 \
    .tdatas                 (tbu``num``_adb_tdata_dti_up      ),                 \
    .tstrbs                 (20'b0 /* Unused (Only data-byte)*/),                \
    .tkeeps                 (tbu``num``_adb_tkeep_dti_up      ),                 \
    .tlasts                 (tbu``num``_adb_tlast_dti_up      ),                 \
    .tids                   (6'b0 /* Unnecessary (only 1 source:TCU)*/),         \
    .tdests                 (tbu``num``_adb_tdest_dti_up      ),                 \
    .tusers                 (1'b0 /* Unused*/                 ),                 \
\
    .dftrstdisablem         (1'b0                             ),                 \
    .clkqreqnm_i            (TBU``num``_A4SADB_UP_CLK_REQN    ),                 \
    .clkqacceptnm_o         (TBU``num``_A4SADB_UP_CLK_QACCEPTN),                 \
    .clkqdenym_o            (TBU``num``_A4SADB_UP_CLK_QACTIVE ),                 \
    .clkqactivem_o          (TBU``num``_A4SADB_UP_CLK_QDENY   ),                 \
\
    .aclkm                  (TBU``num``_CLK                   ),                 \
    .aresetnm               (TBU``num``_RSTn                  ),                 \
    .wakeupm_o              (tbu``num``_twakeup_dti_up        ),                 \
    .tvalidm                (tbu``num``_tvalid_dti_up         ),                 \
    .treadym                (tbu``num``_tready_dti_up         ),                 \
    .tdatam                 (tbu``num``_tdata_dti_up          ),                 \
    .tstrbm                 (),                                                  \
    .tkeepm                 (tbu``num``_tkeep_dti_up          ),                 \
    .tlastm                 (tbu``num``_tlast_dti_up          ),                 \
    .tidm                   (),                                                  \
    .tdestm                 (),                                                  \
    .tuserm                 ()                                                   \
)



//`define MMUTBU_A4SADB_TEMPLATE(num)     \
//mmu600_r2_tbu_ace_lite                                                       \
//#(                                                                           \
//    .TBUCFG_ID_WIDTH          (`TBUCFG_ID_WIDTH          ) ,                   \
//    .TBUCFG_DATA_WIDTH        (`TBUCFG_DATA_WIDTH        ) ,                   \
//    .TBUCFG_ARUSER_WIDTH      (`TBUCFG_ARUSER_WIDTH      ) ,                   \
//    .TBUCFG_AWUSER_WIDTH      (`TBUCFG_AWUSER_WIDTH      ) ,                   \
//    .TBUCFG_RUSER_WIDTH       (`TBUCFG_RUSER_WIDTH       ) ,                   \
//    .TBUCFG_WUSER_WIDTH       (`TBUCFG_WUSER_WIDTH       ) ,                   \
//    .TBUCFG_BUSER_WIDTH       (`TBUCFG_BUSER_WIDTH       ) ,                   \
//    .TBUCFG_STASH             (`TBUCFG_STASH             ) ,                   \
//    .TBUCFG_SID_WIDTH         (`TBUCFG_SID_WIDTH         ) ,                   \
//    .TBUCFG_SSID_WIDTH        (`TBUCFG_SSID_WIDTH        ) ,                   \
//    .TBUCFG_WBUF_DEPTH        (`TBUCFG_WBUF_DEPTH        ) ,                   \
//    .TBUCFG_LFIFO_DEPTH       (`TBUCFG_LFIFO_DEPTH       ) ,                   \
//    .TBUCFG_XLATE_SLOTS       (`TBUCFG_XLATE_SLOTS       ) ,                   \
//    .TBUCFG_ROT_DEPTH         (`TBUCFG_ROT_DEPTH         ) ,                   \
//    .TBUCFG_WOT_DEPTH         (`TBUCFG_WOT_DEPTH         ) ,                   \
//    .TBUCFG_UTLB_DEPTH        (`TBUCFG_UTLB_DEPTH        ) ,                   \
//    .TBUCFG_MTLB_DEPTH        (`TBUCFG_MTLB_DEPTH        ) ,                   \
//    .TBUCFG_DIRECT_IDX        (`TBUCFG_DIRECT_IDX        ) ,                   \
//    .TBUCFG_MTLB_PARTS        (`TBUCFG_MTLB_PARTS        ) ,                   \
//    .TBUCFG_SI_AR_HNDSHK_MODE (`TBUCFG_SI_AR_HNDSHK_MODE ) ,                   \
//    .TBUCFG_SI_R_HNDSHK_MODE  (`TBUCFG_SI_R_HNDSHK_MODE  ) ,                   \
//    .TBUCFG_SI_AW_HNDSHK_MODE (`TBUCFG_SI_AW_HNDSHK_MODE ) ,                   \
//    .TBUCFG_SI_W_HNDSHK_MODE  (`TBUCFG_SI_W_HNDSHK_MODE  ) ,                   \
//    .TBUCFG_SI_B_HNDSHK_MODE  (`TBUCFG_SI_B_HNDSHK_MODE  ) ,                   \
//    .TBUCFG_MI_AR_HNDSHK_MODE (`TBUCFG_MI_AR_HNDSHK_MODE ) ,                   \
//    .TBUCFG_MI_R_HNDSHK_MODE  (`TBUCFG_MI_R_HNDSHK_MODE  ) ,                   \
//    .TBUCFG_MI_AW_HNDSHK_MODE (`TBUCFG_MI_AW_HNDSHK_MODE ) ,                   \
//    .TBUCFG_MI_W_HNDSHK_MODE  (`TBUCFG_MI_W_HNDSHK_MODE  ) ,                   \
//    .TBUCFG_MI_B_HNDSHK_MODE  (`TBUCFG_MI_B_HNDSHK_MODE  ) ,                   \
//    .TBUCFG_DTI_HNDSHK_MODE   (`TBUCFG_DTI_HNDSHK_MODE   ) ,                   \
//    .TBUCFG_MTLB_LKPRSP_MODE  (`TBUCFG_MTLB_LKPRSP_MODE  )                     \
//) u_mmu600_r2_tbu_ace_lite_xemis``num`` (                                      \
//    .aclk            ( AXEMIS``num``_CLK           ),                          \
//    .aresetn         ( AXEMIS``num``_RSTn          ),                          \
//    .awvalid_s       ( AXEMIS``num``_AWVALID       ),                          \
//    .awready_s       ( AXEMIS``num``_AWREADY       ),                          \
//    .awid_s          ( AXEMIS``num``_AWID          ),                          \
//    .awaddr_s        ( AXEMIS``num``_AWADDR        ),                          \
//    .awlen_s         ( AXEMIS``num``_AWLEN         ),                          \
//    .awsize_s        ( AXEMIS``num``_AWSIZE        ),                          \
//    .awburst_s       ( AXEMIS``num``_AWBURST       ),                          \
//    .awlock_s        ( AXEMIS``num``_AWLOCK        ),                          \
//    .awcache_s       ( AXEMIS``num``_AWCACHE       ),                          \
//    .awprot_s        ( AXEMIS``num``_AWPROT        ),                          \
//    .awqos_s         ( AXEMIS``num``_AWQOS         ),                          \
//    .awregion_s      ( AXEMIS``num``_AWREGION      ),                          \
//    .awstashnid_s    ( AXEMIS``num``_AWSTASHNID    ),                          \
//    .awstashniden_s  ( AXEMIS``num``_AWSTASHNIDEN  ),                          \
//    .awstashlpid_s   ( AXEMIS``num``_AWSTASHLPID   ),                          \
//    .awstashlpiden_s ( AXEMIS``num``_AWSTASHLPIDEN ),                          \
//    .awsnoop_s       ( AXEMIS``num``_AWSNOOP       ),                          \
//    .awuser_s        ( AXEMIS``num``_AWUSER        ),                          \
//    .awdomain_s      ( AXEMIS``num``_AWDOMAIN      ),                          \
//    .awmmussid_s     ( AXEMIS``num``_AWMMUSSID     ),                          \
//    .awmmusid_s      ( AXEMIS``num``_AWMMUSID      ),                          \
//    .awmmussidv_s    ( AXEMIS``num``_AWMMUSSIDV    ),                          \
//    .awmmusecsid_s   ( AXEMIS``num``_AWMMUSECSID   ),                          \
//    .awmmuatst_s     ( AXEMIS``num``_AWMMUATST     ),                          \
//    .awatop_s        ( AXEMIS``num``_AWATOP        ),                          \
//    .arvalid_s       ( AXEMIS``num``_ARVALID       ),                          \
//    .arready_s       ( AXEMIS``num``_ARREADY       ),                          \
//    .arid_s          ( AXEMIS``num``_ARID          ),                          \
//    .araddr_s        ( AXEMIS``num``_ARADDR        ),                          \
//    .arlen_s         ( AXEMIS``num``_ARLEN         ),                          \
//    .arsize_s        ( AXEMIS``num``_ARSIZE        ),                          \
//    .arburst_s       ( AXEMIS``num``_ARBURST       ),                          \
//    .arlock_s        ( AXEMIS``num``_ARLOCK        ),                          \
//    .arcache_s       ( AXEMIS``num``_ARCACHE       ),                          \
//    .arprot_s        ( AXEMIS``num``_ARPROT        ),                          \
//    .arqos_s         ( AXEMIS``num``_ARQOS         ),                          \
//    .arregion_s      ( AXEMIS``num``_ARREGION      ),                          \
//    .arsnoop_s       ( AXEMIS``num``_ARSNOOP       ),                          \
//    .aruser_s        ( AXEMIS``num``_ARUSER        ),                          \
//    .ardomain_s      ( AXEMIS``num``_ARDOMAIN      ),                          \
//    .armmussid_s     ( AXEMIS``num``_ARMMUSSID     ),                          \
//    .armmusid_s      ( AXEMIS``num``_ARMMUSID      ),                          \
//    .armmussidv_s    ( AXEMIS``num``_ARMMUSSIDV    ),                          \
//    .armmusecsid_s   ( AXEMIS``num``_ARMMUSECSID   ),                          \
//    .armmuatst_s     ( AXEMIS``num``_ARMMUATST     ),                          \
//    .wvalid_s        ( AXEMIS``num``_WVALID        ),                          \
//    .wready_s        ( AXEMIS``num``_WREADY        ),                          \
//    .wdata_s         ( AXEMIS``num``_WDATA         ),                          \
//    .wstrb_s         ( AXEMIS``num``_WSTRB         ),                          \
//    .wlast_s         ( AXEMIS``num``_WLAST         ),                          \
//    .wuser_s         ( AXEMIS``num``_WUSER         ),                          \
//    .rvalid_s        ( AXEMIS``num``_RVALID        ),                          \
//    .rready_s        ( AXEMIS``num``_RREADY        ),                          \
//    .rid_s           ( AXEMIS``num``_RID           ),                          \
//    .rdata_s         ( AXEMIS``num``_RDATA         ),                          \
//    .rresp_s         ( AXEMIS``num``_RRESP         ),                          \
//    .rlast_s         ( AXEMIS``num``_RLAST         ),                          \
//    .ruser_s         ( AXEMIS``num``_RUSER         ),                          \
//    .bvalid_s        ( AXEMIS``num``_BVALID        ),                          \
//    .bready_s        ( AXEMIS``num``_BREADY        ),                          \
//    .bid_s           ( AXEMIS``num``_BID           ),                          \
//    .bresp_s         ( AXEMIS``num``_BRESP         ),                          \
//    .buser_s         ( AXEMIS``num``_BUSER         ),                          \
//    .awakeup_s       ( AXEMIS``num``_AWAKEUP       ),                          \
//\
//    .awvalid_m       ( TBU``num``_AWVALID         ),                           \
//    .awready_m       ( TBU``num``_AWREADY         ),                           \
//    .awid_m          ( tbu``num``_awid            ),                           \
//    .awaddr_m        ( TBU``num``_AWADDR          ),                           \
//    .awlen_m         ( TBU``num``_AWLEN           ),                           \
//    .awsize_m        ( TBU``num``_AWSIZE          ),                           \
//    .awburst_m       ( TBU``num``_AWBURST         ),                           \
//    .awlock_m        ( TBU``num``_AWLOCK          ),                           \
//    .awcache_m       ( TBU``num``_AWCACHE         ),                           \
//    .awprot_m        ( TBU``num``_AWPROT          ),                           \
//    .awqos_m         ( TBU``num``_AWQOS           ),                           \
//    .awregion_m      (                            ),                           \
//    .awstashnid_m    ( TBU``num``_AWSTASHNID      ),                           \
//    .awstashniden_m  ( TBU``num``_AWSTASHNIDEN    ),                           \
//    .awstashlpid_m   ( TBU``num``_AWSTASHLPID     ),                           \
//    .awstashlpiden_m ( TBU``num``_AWSTASHLPIDEN   ),                           \
//    .awsnoop_m       ( TBU``num``_AWSNOOP         ),                           \
//    .awuser_m        ( tbu``num``_awuser          ),                           \
//    .awdomain_m      ( TBU``num``_AWDOMAIN        ),                           \
//    .awmmusid_m      (                            ),                           \
//    .awmmusecsid_m   (                            ),                           \
//    .awatop_m        ( TBU``num``_AWATOP          ),                           \
//    .arvalid_m       ( TBU``num``_ARVALID         ),                           \
//    .arready_m       ( TBU``num``_ARREADY         ),                           \
//    .arid_m          ( tbu``num``_arid            ),                           \
//    .araddr_m        ( TBU``num``_ARADDR          ),                           \
//    .arlen_m         ( TBU``num``_ARLEN           ),                           \
//    .arsize_m        ( TBU``num``_ARSIZE          ),                           \
//    .arburst_m       ( TBU``num``_ARBURST         ),                           \
//    .arlock_m        ( TBU``num``_ARLOCK          ),                           \
//    .arcache_m       ( TBU``num``_ARCACHE         ),                           \
//    .arprot_m        ( TBU``num``_ARPROT          ),                           \
//    .arqos_m         ( TBU``num``_ARQOS           ),                           \
//    .arregion_m      (                            ),                           \
//    .arsnoop_m       ( TBU``num``_ARSNOOP         ),                           \
//    .aruser_m        ( tbu``num``_aruser          ),                           \
//    .ardomain_m      ( TBU``num``_ARDOMAIN        ),                           \
//    .armmusid_m      (                            ),                           \
//    .armmusecsid_m   (                            ),                           \
//    .wvalid_m        ( TBU``num``_WVALID          ),                           \
//    .wready_m        ( TBU``num``_WREADY          ),                           \
//    .wdata_m         ( TBU``num``_WDATA           ),                           \
//    .wstrb_m         ( TBU``num``_WSTRB           ),                           \
//    .wlast_m         ( TBU``num``_WLAST           ),                           \
//    .wuser_m         ( TBU``num``_WUSER           ),                           \
//    .rvalid_m        ( TBU``num``_RVALID          ),                           \
//    .rready_m        ( TBU``num``_RREADY          ),                           \
//    .rid_m           ( tbu``num``_rid             ),                           \
//    .ruser_m         ( TBU``num``_RUSER           ),                           \
//    .rdata_m         ( TBU``num``_RDATA           ),                           \
//    .rresp_m         ( TBU``num``_RRESP[1:0]      ),                           \
//    .rlast_m         ( TBU``num``_RLAST           ),                           \
//    .bvalid_m        ( TBU``num``_BVALID          ),                           \
//    .bready_m        ( TBU``num``_BREADY          ),                           \
//    .bid_m           ( tbu``num``_bid             ),                           \
//    .buser_m         ( TBU``num``_BUSER           ),                           \
//    .bresp_m         ( TBU``num``_BRESP           ),                           \
//    .awakeup_m       ( TBU``num``_AWAKEUP         ),                           \
//\
//    .tvalid_dti_dn   ( tbu``num``_tvalid_dti_dn   ),                           \
//    .tready_dti_dn   ( tbu``num``_tready_dti_dn   ),                           \
//    .tdata_dti_dn    ( tbu``num``_tdata_dti_dn    ),                           \
//    .tkeep_dti_dn    ( tbu``num``_tkeep_dti_dn    ),                           \
//    .tlast_dti_dn    ( tbu``num``_tlast_dti_dn    ),                           \
//    .twakeup_dti_dn  ( tbu``num``_twakeup_dti_dn  ),                           \
//\
//    .tvalid_dti_up   ( tbu``num``_tvalid_dti_up   ),                           \
//    .tready_dti_up   ( tbu``num``_tready_dti_up   ),                           \
//    .tdata_dti_up    ( tbu``num``_tdata_dti_up    ),                           \
//    .tkeep_dti_up    ( tbu``num``_tkeep_dti_up    ),                           \
//    .tlast_dti_up    ( tbu``num``_tlast_dti_up    ),                           \
//    .twakeup_dti_up  ( tbu``num``_twakeup_dti_up  ),                           \
//\
//    .qreqn_pd        ( 1'b1                       ) ,                          \
//    .qacceptn_pd     (                            ) ,                          \
//    .qdeny_pd        (                            ) ,                          \
//    .qactive_pd      (                            ) ,                          \
//    .qreqn_cg        ( 1'b1                       ) ,                          \
//    .qacceptn_cg     (                            ) ,                          \
//    .qdeny_cg        (                            ) ,                          \
//    .qactive_cg      (                            ) ,                          \
//    .pmusnapshot_req ( 1'b0                       ) ,                          \
//    .pmusnapshot_ack (                            ) ,                          \
//\
//    .ras_irpt        ( tbu``num``_ras_irpt        ) ,                          \
//    .pmu_irpt        ( tbu``num``_pmu_irpt        ) ,                          \
//    .pcie_mode       ( `STATICCFG_PCIE_MODE       ) ,/* You must tie-off this signal to HIGH when the TBU is connected to a PCIe IF*/\
//    .ns_sid_high     ( `STATICCFG_NS_SID_HIGH     ) ,/* You should check it                                                        */\
//    .s_sid_high      ( `STATICCFG_S_SID_HIGH      ) ,/* You should check it                                                        */\
//    .cmo_disable     ( `STATICCFG_CMO_DISABLE     ) ,/* You should check it                                                        */\
//    .max_tok_trans   ( `STATICCFG_MAX_TOK_TRANS   ) ,/* You should check it                                                        */\
//    .utlb_roundrobin ( `STATICCFG_UTLB_ROUNDROBIN ) ,/* You should check it                                                        */\
//    .ecorevnum       ( `STATICCFG_ECOREVNUM       ) ,/* You should check it                                                        */\
//    .sec_override    ( `STATICCFG_SEC_OVERRIDE    ) ,/* You should check it                                                        */\
//    .dftcgen         ( 1'b0                       ) ,/* You should check it                                                        */\
//    .dftrstdisable   ( 1'b0                       ) ,                          \
//    .dftramhold      ( 1'b0                       ) ,                          \
//    .mbistresetn     ( 1'b1                       ) ,                          \
//    .mbistreq        ( 1'b0                       )                            \
//);                                                                             \
//\
//adb400_r3_axi4_stream #(                                                         \
//    .DATA_WIDTH     (160),                                                       \
//    .ID_WIDTH       (6),                                                         \
//    .DEST_WIDTH     (6),                                                         \
//    .USER_WIDTH     (0)                                                          \
//) u_adb_a4s_tbu``num``_dn(                                                       \
//    .pwrq_permit_deny_sar_i (1'b0                                  ),            \
//    .dftrstdisables         (1'b0                                  ),            \
//\
//    .pwrqreqns_i            (TBU``num``_A4SADB_DN_PWR_QREQn        ),            \
//    .pwrqacceptns_o         (TBU``num``_A4SADB_DN_PWR_QACCEPTn     ),            \
//    .pwrqactives_o          (TBU``num``_A4SADB_DN_PWR_QACTIVE      ),            \
//    .pwrqdenys_o            (TBU``num``_A4SADB_DN_PWR_QDENY        ),            \
//    .clkqreqns_i            (TBU``num``_A4SADB_DN_CLK_QREQn        ),            \
//    .clkqacceptns_o         (TBU``num``_A4SADB_DN_CLK_QACCEPTn     ),            \
//    .clkqdenys_o            (TBU``num``_A4SADB_DN_CLK_QACTIVE      ),            \
//    .clkqactives_o          (TBU``num``_A4SADB_DN_CLK_QDENY        ),            \
//\
//    .aclks                  (TBU``num``_CLK                        ),            \
//    .aresetns               (TBU``num``_RSTn                       ),            \
//    .wakeups_i              (tbu``num``_twakeup_dti_dn             ),            \
//    .tvalids                (tbu``num``_tvalid_dti_dn              ),            \
//    .treadys                (tbu``num``_tready_dti_dn              ),            \
//    .tdatas                 (tbu``num``_tdata_dti_dn               ),            \
//    .tstrbs                 (20'b0 /* Unused (Only data-byte)*/    ),            \
//    .tkeeps                 (tbu``num``_tkeep_dti_dn               ),            \
//    .tlasts                 (tbu``num``_tlast_dti_dn               ),            \
//    .tids                   (tbu``num``_tid_dti_dn                 ),            \
//    .tdests                 (6'b0 /* Unnecessary(only 1 destination:TCU)*/),     \
//    .tusers                 (1'b0 /* Unused                             */),     \
//\
//    .dftrstdisablem         (1'b0                                  ),            \
//    .clkqreqnm_i            (1'b1                                  ),            \
//    .clkqacceptnm_o         (),                                                  \
//    .clkqdenym_o            (),                                                  \
//    .clkqactivem_o          (),                                                  \
//\
//    .aclkm                  (TCU_CLK                               ),            \
//    .aresetnm               (TCU_RSTn                              ),            \
//    .wakeupm_o              (tbu``num``_adb_twakeup_dti_dn         ),            \
//    .tvalidm                (tbu``num``_adb_tvalid_dti_dn          ),            \
//    .treadym                (tbu``num``_adb_tready_dti_dn          ),            \
//    .tdatam                 (tbu``num``_adb_tdata_dti_dn           ),            \
//    .tstrbm                 (),                                                  \
//    .tkeepm                 (tbu``num``_adb_tkeep_dti_dn           ),            \
//    .tlastm                 (tbu``num``_adb_tlast_dti_dn           ),            \
//    .tidm                   (tbu``num``_adb_tid_dti_dn             ),            \
//    .tdestm                 (),                                                  \
//    .tuserm                 ()                                                   \
//);                                                                               \
//adb400_r3_axi4_stream #(                                                         \
//    .DATA_WIDTH     (`DTI_DATA_WIDTH),                                           \
//    .ID_WIDTH       (`DTI_ID_WIDTH),                                             \
//    .DEST_WIDTH     (`DTI_ID_WIDTH),                                             \
//    .USER_WIDTH     (0)                                                          \
//) u_adb_a4s_tbu``num``_up(                                                       \
//    .pwrq_permit_deny_sar_i (1'b0                             ),                 \
//    .dftrstdisables         (1'b0                             ),                 \
//\
//    .pwrqreqns_i            (1'b1                             ),                 \
//    .pwrqacceptns_o         (),                                                  \
//    .pwrqactives_o          (),                                                  \
//    .pwrqdenys_o            (),                                                  \
//    .clkqreqns_i            (1'b1                             ),                 \
//    .clkqacceptns_o         (),                                                  \
//    .clkqdenys_o            (),                                                  \
//    .clkqactives_o          (),                                                  \
//\
//    .aclks                  (TCU_CLK                          ),                 \
//    .aresetns               (TCU_RSTn                         ),                 \
//    .wakeups_i              (tbu``num``_adb_twakeup_dti_up    ),                 \
//    .tvalids                (tbu``num``_adb_tvalid_dti_up     ),                 \
//    .treadys                (tbu``num``_adb_tready_dti_up     ),                 \
//    .tdatas                 (tbu``num``_adb_tdata_dti_up      ),                 \
//    .tstrbs                 (20'b0 /* Unused (Only data-byte)*/),                \
//    .tkeeps                 (tbu``num``_adb_tkeep_dti_up      ),                 \
//    .tlasts                 (tbu``num``_adb_tlast_dti_up      ),                 \
//    .tids                   (6'b0 /* Unnecessary (only 1 source:TCU)*/),         \
//    .tdests                 (tbu``num``_adb_tdest_dti_up      ),                 \
//    .tusers                 (1'b0 /* Unused*/                 ),                 \
//\
//    .dftrstdisablem         (1'b0                             ),                 \
//    .clkqreqnm_i            (TBU``num``_A4SADB_UP_CLK_REQN    ),                 \
//    .clkqacceptnm_o         (TBU``num``_A4SADB_UP_CLK_QACCEPTN),                 \
//    .clkqdenym_o            (TBU``num``_A4SADB_UP_CLK_QACTIVE ),                 \
//    .clkqactivem_o          (TBU``num``_A4SADB_UP_CLK_QDENY   ),                 \
//\
//    .aclkm                  (TBU``num``_CLK                   ),                 \
//    .aresetnm               (TBU``num``_RSTn                  ),                 \
//    .wakeupm_o              (tbu``num``_twakeup_dti_up        ),                 \
//    .tvalidm                (tbu``num``_tvalid_dti_up         ),                 \
//    .treadym                (tbu``num``_tready_dti_up         ),                 \
//    .tdatam                 (tbu``num``_tdata_dti_up          ),                 \
//    .tstrbm                 (),                                                  \
//    .tkeepm                 (tbu``num``_tkeep_dti_up          ),                 \
//    .tlastm                 (tbu``num``_tlast_dti_up          ),                 \
//    .tidm                   (),                                                  \
//    .tdestm                 (),                                                  \
//    .tuserm                 ()                                                   \
//)
