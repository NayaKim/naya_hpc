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
`define AXEMIS_APB_WIRE(prefix)  \
    wire [31:0]                     prefix``_ap_paddr;                       \
    wire                            prefix``_ap_pselx;                       \
    wire                            prefix``_ap_penable;                     \
    wire                            prefix``_ap_pwrite;                      \
    wire                            prefix``_ap_pready;                      \
    wire                            prefix``_ap_pslverr;                     \
    wire [31:0]                     prefix``_ap_pwdata;                      \
    wire [31:0]                     prefix``_ap_prdata;                      \
    wire [2:0]                      prefix``_ap_pprot;                       \
    wire [3:0]                      prefix``_ap_pstrb

`define AXEMIS_POWER_WIRE(prefix)  \
    /* CRP to PPT */   \
    wire                            prefix``_pwr_preq;                       \
    wire [3:0]                      prefix``_pwr_pstate;                     \
    wire                            prefix``_pwr_paccept;                    \
    wire                            prefix``_pwr_pdeny;                      \
    wire [10:0]                     prefix``_pwr_pactive;                    \
    wire                            prefix``_clk_qreqn;                      \
    wire                            prefix``_clk_qacceptn;                   \
    wire                            prefix``_clk_qdeny;                      \
    wire                            prefix``_clk_qactive

`define AXEMIS_ACE5LADB_POWER_WIRE(prefix)  \
    /* CRP to MMUADB */   \
    wire                            prefix``_ace5ladb_pwr_qreqn;                  \
    wire                            prefix``_ace5ladb_pwr_qacceptn;               \
    wire                            prefix``_ace5ladb_pwr_qdeny;                  \
    wire                            prefix``_ace5ladb_pwr_qactive;                \
    wire                            prefix``_ace5ladb_clk_qreqn;                  \
    wire                            prefix``_ace5ladb_clk_qacceptn;               \
    wire                            prefix``_ace5ladb_clk_qdeny;                  \
    wire                            prefix``_ace5ladb_clk_qactive

`define AXEMIS_ACE5LADB_ASYNC_WIRE(prefix)  \
    wire                                     prefix``_slvmustacceptreqn_async; \
    wire                                     prefix``_slvcandenyreqn_async;    \
    wire                                     prefix``_slvacceptn_async;        \
    wire                                     prefix``_slvdeny_async;           \
    wire                                     prefix``_si_to_mi_wakeup_async;   \
    wire                                     prefix``_mi_to_si_wakeup_async;   \
    wire [`ADB400_AW_FIFO_DEPTH-1:0]         prefix``_aw_wr_ptr_async;         \
    wire [`ADB400_AW_FIFO_DEPTH-1:0]         prefix``_aw_rd_ptr_async;         \
    wire [`AXEMIS_ADB_AW_PAYLOAD_WIDTH-1:0]  prefix``_aw_payld_async;          \
    wire [`ADB400_W_FIFO_DEPTH-1:0]          prefix``_w_wr_ptr_async;          \
    wire [`ADB400_W_FIFO_DEPTH-1:0]          prefix``_w_rd_ptr_async;          \
    wire [`AXEMIS_ADB_W_PAYLOAD_WIDTH-1:0]   prefix``_w_payld_async;           \
    wire [`ADB400_B_FIFO_DEPTH-1:0]          prefix``_b_wr_ptr_async;          \
    wire [`ADB400_B_FIFO_DEPTH-1:0]          prefix``_b_rd_ptr_async;          \
    wire [`AXEMIS_ADB_B_PAYLOAD_WIDTH-1:0]   prefix``_b_payld_async;           \
    wire [`ADB400_AR_FIFO_DEPTH-1:0]         prefix``_ar_wr_ptr_async;         \
    wire [`ADB400_AR_FIFO_DEPTH-1:0]         prefix``_ar_rd_ptr_async;         \
    wire [`AXEMIS_ADB_AR_PAYLOAD_WIDTH-1:0]  prefix``_ar_payld_async;          \
    wire [`ADB400_R_FIFO_DEPTH-1:0]          prefix``_r_wr_ptr_async;          \
    wire [`ADB400_R_FIFO_DEPTH-1:0]          prefix``_r_rd_ptr_async;          \
    wire [`AXEMIS_ADB_R_PAYLOAD_WIDTH-1:0]   prefix``_r_payld_async

`define AXEMIS_ACE5L_WIRE_IN_MMU_TEMPLATE(prefix)  \
    wire                                    prefix``_adb_awvalid;                        \
    wire                                    prefix``_adb_awready;                        \
    wire [`TBUCFG_ID_WIDTH-1:0]             prefix``_adb_awid;                           \
    wire [63:0]                             prefix``_adb_awaddr;                         \
    wire [7:0]                              prefix``_adb_awlen;                          \
    wire [2:0]                              prefix``_adb_awsize;                         \
    wire [1:0]                              prefix``_adb_awburst;                        \
    wire                                    prefix``_adb_awlock;                         \
    wire [3:0]                              prefix``_adb_awcache;                        \
    wire [2:0]                              prefix``_adb_awprot;                         \
    wire [3:0]                              prefix``_adb_awqos;                          \
    wire [3:0]                              prefix``_adb_awregion;                       \
    wire [`AXEMIS_STASHNID_WIDTH-1:0]       prefix``_adb_awstashnid;                     \
    wire [`AXEMIS_STASHNIDEN_WIDTH-1:0]     prefix``_adb_awstashniden;                   \
    wire [`AXEMIS_STASHLPID_WIDTH-1:0]      prefix``_adb_awstashlpid;                    \
    wire [`AXEMIS_STASHLPIDEN_WIDTH-1:0]    prefix``_adb_awstashlpiden;                  \
    wire [2:0]                              prefix``_adb_awsnoop;                        \
    wire [`TBUCFG_AWUSER_WIDTH-1:0]         prefix``_adb_awuser;                         \
    wire [1:0]                              prefix``_adb_awdomain;                       \
    wire [`AXEMIS_MMUSSID_WIDTH-1:0]        prefix``_adb_awmmussid;                      \
    wire [`AXEMIS_MMUSID_WIDTH-1:0]         prefix``_adb_awmmusid;                       \
    wire [`AXEMIS_MMUSSIDV_WIDTH-1:0]       prefix``_adb_awmmussidv;                     \
    wire [`AXEMIS_MMUSECSID_WIDTH-1:0]      prefix``_adb_awmmusecsid;                    \
    wire [`AXEMIS_MMUATST_WIDTH-1:0]        prefix``_adb_awmmuatst;                      \
    wire [5:0]                              prefix``_adb_awatop;                         \
    wire                                    prefix``_adb_arvalid;                        \
    wire                                    prefix``_adb_arready;                        \
    wire [`TBUCFG_ID_WIDTH-1:0]             prefix``_adb_arid;                           \
    wire [63:0]                             prefix``_adb_araddr;                         \
    wire [7:0]                              prefix``_adb_arlen;                          \
    wire [2:0]                              prefix``_adb_arsize;                         \
    wire [1:0]                              prefix``_adb_arburst;                        \
    wire                                    prefix``_adb_arlock;                         \
    wire [3:0]                              prefix``_adb_arcache;                        \
    wire [2:0]                              prefix``_adb_arprot;                         \
    wire [3:0]                              prefix``_adb_arqos;                          \
    wire [3:0]                              prefix``_adb_arregion;                       \
    wire [3:0]                              prefix``_adb_arsnoop;                        \
    wire [`TBUCFG_ARUSER_WIDTH-1:0]         prefix``_adb_aruser;                         \
    wire [1:0]                              prefix``_adb_ardomain;                       \
    wire [`AXEMIS_MMUSSID_WIDTH-1:0]        prefix``_adb_armmussid;                      \
    wire [`AXEMIS_MMUSID_WIDTH-1:0]         prefix``_adb_armmusid;                       \
    wire [`AXEMIS_MMUSSIDV_WIDTH-1:0]       prefix``_adb_armmussidv;                     \
    wire [`AXEMIS_MMUSECSID_WIDTH-1:0]      prefix``_adb_armmusecsid;                    \
    wire [`AXEMIS_MMUATST_WIDTH-1:0]        prefix``_adb_armmuatst;                      \
    wire                                    prefix``_adb_wvalid;                         \
    wire                                    prefix``_adb_wready;                         \
    wire [`TBUCFG_DATA_WIDTH-1:0]           prefix``_adb_wdata;                          \
    wire [`TBUCFG_DATA_WIDTH/8-1:0]         prefix``_adb_wstrb;                          \
    wire                                    prefix``_adb_wlast;                          \
    wire [`TBUCFG_WUSER_WIDTH-1:0]          prefix``_adb_wuser;                          \
    wire                                    prefix``_adb_rvalid;                         \
    wire                                    prefix``_adb_rready;                         \
    wire [`TBUCFG_ID_WIDTH-1:0]             prefix``_adb_rid;                            \
    wire [`TBUCFG_DATA_WIDTH-1:0]           prefix``_adb_rdata;                          \
    wire [1:0]                              prefix``_adb_rresp;                          \
    wire                                    prefix``_adb_rlast;                          \
    wire [`TBUCFG_RUSER_WIDTH-1:0]          prefix``_adb_ruser;                          \
    wire                                    prefix``_adb_bvalid;                         \
    wire                                    prefix``_adb_bready;                         \
    wire [`TBUCFG_ID_WIDTH-1:0]             prefix``_adb_bid;                            \
    wire [1:0]                              prefix``_adb_bresp;                          \
    wire [`TBUCFG_BUSER_WIDTH-1:0]          prefix``_adb_buser;                          \
    wire                                    prefix``_adb_awakeup

`define AXEMIS_TRANS_USER_TO_ACE5L_IN_MMU_TEMPLATE(num,prefix) \
wire [`AXEMIS_ADB_AWUSER_WIDTH-1:0] tbu``num``_adb400_awuser;                               \
wire [`AXEMIS_ADB_ARUSER_WIDTH-1:0] tbu``num``_adb400_aruser;                               \
\
assign prefix``_adb_awuser       [`AXEMIS_USER_WIDTH        -1: 0] = tbu``num``_adb400_awuser[`AXEMIS_USER_START        + `AXEMIS_USER_WIDTH        -1: `AXEMIS_USER_START       ] ;      \
assign prefix``_adb_awmmussid    [`AXEMIS_MMUSSID_WIDTH     -1: 0] = tbu``num``_adb400_awuser[`AXEMIS_MMUSSID_START     + `AXEMIS_MMUSSID_WIDTH     -1: `AXEMIS_MMUSSID_START    ] ;      \
assign prefix``_adb_awmmusid     [`AXEMIS_MMUSID_WIDTH      -1: 0] = tbu``num``_adb400_awuser[`AXEMIS_MMUSID_START      + `AXEMIS_MMUSID_WIDTH      -1: `AXEMIS_MMUSID_START     ] ;      \
assign prefix``_adb_awmmussidv   [`AXEMIS_MMUSSIDV_WIDTH    -1: 0] = tbu``num``_adb400_awuser[`AXEMIS_MMUSSIDV_START    + `AXEMIS_MMUSSIDV_WIDTH    -1: `AXEMIS_MMUSSIDV_START   ] ;      \
assign prefix``_adb_awmmusecsid  [`AXEMIS_MMUSECSID_WIDTH   -1: 0] = tbu``num``_adb400_awuser[`AXEMIS_MMUSECSID_START   + `AXEMIS_MMUSECSID_WIDTH   -1: `AXEMIS_MMUSECSID_START  ] ;      \
assign prefix``_adb_awmmuatst    [`AXEMIS_MMUATST_WIDTH     -1: 0] = tbu``num``_adb400_awuser[`AXEMIS_MMUATST_START     + `AXEMIS_MMUATST_WIDTH     -1: `AXEMIS_MMUATST_START    ] ;      \
assign prefix``_adb_awstashnid   [`AXEMIS_STASHNID_WIDTH    -1: 0] = tbu``num``_adb400_awuser[`AXEMIS_STASHNID_START    + `AXEMIS_STASHNID_WIDTH    -1: `AXEMIS_STASHNID_START   ] ;      \
assign prefix``_adb_awstashniden [`AXEMIS_STASHNIDEN_WIDTH  -1: 0] = tbu``num``_adb400_awuser[`AXEMIS_STASHNIDEN_START  + `AXEMIS_STASHNIDEN_WIDTH  -1: `AXEMIS_STASHNIDEN_START ] ;      \
assign prefix``_adb_awstashlpid  [`AXEMIS_STASHLPID_WIDTH   -1: 0] = tbu``num``_adb400_awuser[`AXEMIS_STASHLPID_START   + `AXEMIS_STASHLPID_WIDTH   -1: `AXEMIS_STASHLPID_START  ] ;      \
assign prefix``_adb_awstashlpiden[`AXEMIS_STASHLPIDEN_WIDTH -1: 0] = tbu``num``_adb400_awuser[`AXEMIS_STASHLPIDEN_START + `AXEMIS_STASHLPIDEN_WIDTH -1: `AXEMIS_STASHLPIDEN_START] ;      \
assign prefix``_adb_awatop       [`AXEMIS_ATOP_WIDTH        -1: 0] = tbu``num``_adb400_awuser[`AXEMIS_ATOP_START        + `AXEMIS_ATOP_WIDTH        -1: `AXEMIS_ATOP_START       ] ;      \
\
assign prefix``_adb_aruser       [`AXEMIS_USER_WIDTH        -1: 0] = tbu``num``_adb400_aruser[`AXEMIS_USER_START        + `AXEMIS_USER_WIDTH        -1: `AXEMIS_USER_START       ] ;      \
assign prefix``_adb_armmussid    [`AXEMIS_MMUSSID_WIDTH     -1: 0] = tbu``num``_adb400_aruser[`AXEMIS_MMUSSID_START     + `AXEMIS_MMUSSID_WIDTH     -1: `AXEMIS_MMUSSID_START    ] ;      \
assign prefix``_adb_armmusid     [`AXEMIS_MMUSID_WIDTH      -1: 0] = tbu``num``_adb400_aruser[`AXEMIS_MMUSID_START      + `AXEMIS_MMUSID_WIDTH      -1: `AXEMIS_MMUSID_START     ] ;      \
assign prefix``_adb_armmussidv   [`AXEMIS_MMUSSIDV_WIDTH    -1: 0] = tbu``num``_adb400_aruser[`AXEMIS_MMUSSIDV_START    + `AXEMIS_MMUSSIDV_WIDTH    -1: `AXEMIS_MMUSSIDV_START   ] ;      \
assign prefix``_adb_armmusecsid  [`AXEMIS_MMUSECSID_WIDTH   -1: 0] = tbu``num``_adb400_aruser[`AXEMIS_MMUSECSID_START   + `AXEMIS_MMUSECSID_WIDTH   -1: `AXEMIS_MMUSECSID_START  ] ;      \
assign prefix``_adb_armmuatst    [`AXEMIS_MMUATST_WIDTH     -1: 0] = tbu``num``_adb400_aruser[`AXEMIS_MMUATST_START     + `AXEMIS_MMUATST_WIDTH     -1: `AXEMIS_MMUATST_START    ]

`define MMUTBU_A4S_WIRE(num)    \
    wire                            tbu``num``_tvalid_dti_dn;                                           \
    wire                            tbu``num``_tready_dti_dn;                                           \
    wire [`DTI_DATA_WIDTH-1:0]      tbu``num``_tdata_dti_dn;                                            \
    wire [(`DTI_DATA_WIDTH/8)-1:0]  tbu``num``_tkeep_dti_dn;                                            \
    wire [`DTI_ID_WIDTH-1:0]        tbu``num``_tid_dti_dn;                                              \
    wire                            tbu``num``_tlast_dti_dn;                                            \
    wire                            tbu``num``_twakeup_dti_dn;                                          \
    wire                            tbu``num``_tvalid_dti_up;                                           \
    wire                            tbu``num``_tready_dti_up;                                           \
    wire [`DTI_DATA_WIDTH-1:0]      tbu``num``_tdata_dti_up;                                            \
    wire [(`DTI_DATA_WIDTH/8)-1:0]  tbu``num``_tkeep_dti_up;                                            \
    wire [`DTI_ID_WIDTH-1:0]        tbu``num``_tdest_dti_up;                                            \
    wire                            tbu``num``_tlast_dti_up;                                            \
    wire                            tbu``num``_twakeup_dti_up

`define TBU_ACE5L_WIRE(num) \
    wire                                        TBU``num``_ACLKEN              ;   \
    wire                                        TBU``num``_AWAKEUP             ;   \
    wire [10:0]                                 TBU``num``_AWID                ;   \
    wire [47:0]                                 TBU``num``_AWADDR              ;   \
    wire [7:0]                                  TBU``num``_AWLEN               ;   \
    wire [2:0]                                  TBU``num``_AWSIZE              ;   \
    wire [1:0]                                  TBU``num``_AWBURST             ;   \
    wire                                        TBU``num``_AWLOCK              ;   \
    wire [3:0]                                  TBU``num``_AWCACHE             ;   \
    wire [2:0]                                  TBU``num``_AWPROT              ;   \
    wire [1:0]                                  TBU``num``_AWDOMAIN            ;   \
    wire [3:0]                                  TBU``num``_AWSNOOP             ;   \
    wire [3:0]                                  TBU``num``_AWQOS               ;   \
    wire [3:0]                                  TBU``num``_AWNSAID             ;   \
    wire [7:0]                                  TBU``num``_AWUSER              ;   \
    wire [5:0]                                  TBU``num``_AWATOP              ;   \
    wire [10:0]                                 TBU``num``_AWSTASHNID          ;   \
    wire                                        TBU``num``_AWSTASHNIDEN        ;   \
    wire [4:0]                                  TBU``num``_AWSTASHLPID         ;   \
    wire                                        TBU``num``_AWSTASHLPIDEN       ;   \
    wire                                        TBU``num``_AWTRACE             ;   \
    wire [10:0]                                 TBU``num``_AWMPAM              ;   \
    wire                                        TBU``num``_AWIDUNQ             ;   \
    wire [1:0]                                  TBU``num``_AWTAGOP             ;   \
    wire [1:0]                                  TBU``num``_AWLOOP              ;   \
    wire [1:0]                                  TBU``num``_AWCMO               ;   \
    wire                                        TBU``num``_AWVALID             ;   \
    wire                                        TBU``num``_AWREADY             ;   \
    wire [`TBUCFG_DATA_WIDTH-1:0]               TBU``num``_WDATA               ;   \
    wire [(`TBUCFG_DATA_WIDTH/8)-1:0]           TBU``num``_WSTRB               ;   \
    wire                                        TBU``num``_WLAST               ;   \
    wire                                        TBU``num``_WUSER               ;   \
    wire                                        TBU``num``_WTRACE              ;   \
    wire [(`TBUCFG_DATA_WIDTH/128)*4-1:0]       TBU``num``_WTAG                ;   \
    wire [(`TBUCFG_DATA_WIDTH/128)-1:0]         TBU``num``_WTAGUPDATE          ;   \
    wire [(`TBUCFG_DATA_WIDTH/64)-1:0]          TBU``num``_WPOISON             ;   \
    wire [(`TBUCFG_DATA_WIDTH/8)-1:0]           TBU``num``_WDATACHK            ;   \
    wire                                        TBU``num``_WVALID              ;   \
    wire                                        TBU``num``_WREADY              ;   \
    wire [10:0]                                 TBU``num``_BID                 ;   \
    wire [1:0]                                  TBU``num``_BRESP               ;   \
    wire [3:0]                                  TBU``num``_BUSER               ;   \
    wire                                        TBU``num``_BTRACE              ;   \
    wire                                        TBU``num``_BIDUNQ              ;   \
    wire [1:0]                                  TBU``num``_BLOOP               ;   \
    wire                                        TBU``num``_BCOMP               ;   \
    wire                                        TBU``num``_BPERSIST            ;   \
    wire                                        TBU``num``_BVALID              ;   \
    wire                                        TBU``num``_BREADY              ;   \
    wire [10:0]                                 TBU``num``_ARID                ;   \
    wire [47:0]                                 TBU``num``_ARADDR              ;   \
    wire [7:0]                                  TBU``num``_ARLEN               ;   \
    wire [2:0]                                  TBU``num``_ARSIZE              ;   \
    wire [1:0]                                  TBU``num``_ARBURST             ;   \
    wire                                        TBU``num``_ARLOCK              ;   \
    wire [3:0]                                  TBU``num``_ARCACHE             ;   \
    wire [2:0]                                  TBU``num``_ARPROT              ;   \
    wire [1:0]                                  TBU``num``_ARDOMAIN            ;   \
    wire [3:0]                                  TBU``num``_ARSNOOP             ;   \
    wire [3:0]                                  TBU``num``_ARQOS               ;   \
    wire [3:0]                                  TBU``num``_ARNSAID             ;   \
    wire [7:0]                                  TBU``num``_ARUSER              ;   \
    wire                                        TBU``num``_ARTRACE             ;   \
    wire [10:0]                                 TBU``num``_ARMPAM              ;   \
    wire                                        TBU``num``_ARIDUNQ             ;   \
    wire [1:0]                                  TBU``num``_ARTAGOP             ;   \
    wire [1:0]                                  TBU``num``_ARLOOP              ;   \
    wire                                        TBU``num``_ARCHUNKEN           ;   \
    wire                                        TBU``num``_ARVALID             ;   \
    wire                                        TBU``num``_ARREADY             ;   \
    wire [10:0]                                 TBU``num``_RID                 ;   \
    wire [`TBUCFG_DATA_WIDTH-1:0]               TBU``num``_RDATA               ;   \
    wire [2:0]                                  TBU``num``_RRESP               ;   \
    wire                                        TBU``num``_RLAST               ;   \
    wire                                        TBU``num``_RUSER               ;   \
    wire                                        TBU``num``_RTRACE              ;   \
    wire [(`TBUCFG_DATA_WIDTH/64)-1:0]          TBU``num``_RPOISON             ;   \
    wire [(`TBUCFG_DATA_WIDTH/8)-1:0]           TBU``num``_RDATACHK            ;   \
    wire                                        TBU``num``_RIDUNQ              ;   \
    wire [1:0]                                  TBU``num``_RLOOP               ;   \
    wire                                        TBU``num``_RCHUNKV             ;   \
    wire [`AXEMIS_RCHUNKNUM_WIDTH-1:0]          TBU``num``_RCHUNKNUM           ;   \
    wire [`AXEMIS_RCHUNKSTRB_WIDTH-1:0]         TBU``num``_RCHUNKSTRB          ;   \
    wire                                        TBU``num``_RVALID              ;   \
    wire                                        TBU``num``_RREADY

`define TBU_INPORT_TIED_ZERO(num) \
    assign TBU``num``_AWREADY             = 1'b0;                                 \
    assign TBU``num``_WREADY              = 1'b0;                                 \
    assign TBU``num``_BID                 = 11'b0;                                \
    assign TBU``num``_BRESP               = 2'b0;                                 \
    assign TBU``num``_BUSER               = 4'b0;                                 \
    assign TBU``num``_BTRACE              = 1'b0;                                 \
    assign TBU``num``_BIDUNQ              = 1'b0;                                 \
    assign TBU``num``_BLOOP               = 2'b0;                                 \
    assign TBU``num``_BCOMP               = 1'b0;                                 \
    assign TBU``num``_BPERSIST            = 1'b0;                                 \
    assign TBU``num``_BVALID              = 1'b0;                                 \
    assign TBU``num``_ARREADY             = 1'b0;                                 \
    assign TBU``num``_RID                 = 11'b0;                                \
    assign TBU``num``_RDATA               = {`TBUCFG_DATA_WIDTH{1'b0}};           \
    assign TBU``num``_RRESP               = 3'b0;                                 \
    assign TBU``num``_RLAST               = 1'b0;                                 \
    assign TBU``num``_RUSER               = 1'b0;                                 \
    assign TBU``num``_RTRACE              = 1'b0;                                 \
    assign TBU``num``_RPOISON             = {(`TBUCFG_DATA_WIDTH/64){1'b0}};      \
    assign TBU``num``_RDATACHK            = {(`TBUCFG_DATA_WIDTH/8){1'b0}};       \
    assign TBU``num``_RIDUNQ              = 1'b0;                                 \
    assign TBU``num``_RLOOP               = 2'b0;                                 \
    assign TBU``num``_RCHUNKV             = 1'b0;                                 \
    assign TBU``num``_RCHUNKNUM           = {`AXEMIS_RCHUNKNUM_WIDTH{1'b0}};      \
    assign TBU``num``_RCHUNKSTRB          = {`AXEMIS_RCHUNKSTRB_WIDTH{1'b0}};     \
    assign TBU``num``_RVALID              = 1'b0

`define TBU_OUTPORT_TIED_ZERO(num)  \
    assign TBU``num``_CLK           = 1'b0;                       \
    assign TBU``num``_RSTn          = 1'b0;                       \
    assign TBU``num``_ACLKEN        = 1'b0;                       \
    assign TBU``num``_AWAKEUP       = 1'b0;                       \
    assign TBU``num``_AWID          = 11'b00000000000;            \
    assign TBU``num``_AWADDR        = {48{1'b0}};                 \
    assign TBU``num``_AWLEN         = 8'h00;                      \
    assign TBU``num``_AWSIZE        = 3'b000;                     \
    assign TBU``num``_AWBURST       = 2'b00;                      \
    assign TBU``num``_AWLOCK        = 1'b0;                       \
    assign TBU``num``_AWCACHE       = 4'h0;                       \
    assign TBU``num``_AWPROT        = 3'b000;                     \
    assign TBU``num``_AWDOMAIN      = 2'b00;                      \
    assign TBU``num``_AWSNOOP       = 4'h0;                       \
    assign TBU``num``_AWQOS         = 4'h0;                       \
    assign TBU``num``_AWNSAID       = 4'h0;                       \
    assign TBU``num``_AWUSER        = 8'h00;                      \
    assign TBU``num``_AWATOP        = 6'b000000;                  \
    assign TBU``num``_AWSTASHNID    = 11'b00000000000;            \
    assign TBU``num``_AWSTASHNIDEN  = 1'b0;                       \
    assign TBU``num``_AWSTASHLPID   = 5'b00000;                   \
    assign TBU``num``_AWSTASHLPIDEN = 1'b0;                       \
    assign TBU``num``_AWTRACE       = 1'b0;                       \
    assign TBU``num``_AWMPAM        = 11'b00000000000;            \
    assign TBU``num``_AWIDUNQ       = 1'b0;                       \
    assign TBU``num``_AWTAGOP       = 2'b0;                       \
    assign TBU``num``_AWLOOP        = 2'b00;                      \
    assign TBU``num``_AWCMO         = 2'b00;                      \
    assign TBU``num``_AWVALID       = 1'b0;                       \
    assign TBU``num``_WDATA         = {`TBUCFG_DATA_WIDTH{1'b0}};  \
    assign TBU``num``_WSTRB         = {(`TBUCFG_DATA_WIDTH/8){1'b0}};\
    assign TBU``num``_WLAST         = 1'b0;                       \
    assign TBU``num``_WUSER         = 1'b0;                       \
    assign TBU``num``_WTRACE        = 1'b0;                       \
    assign TBU``num``_WTAG          = {((`TBUCFG_DATA_WIDTH/128)*4){1'b0}};\
    assign TBU``num``_WTAGUPDATE    = {(`TBUCFG_DATA_WIDTH/128){1'b0}};\
    assign TBU``num``_WPOISON       = {(`TBUCFG_DATA_WIDTH/64){1'b0}};\
    assign TBU``num``_WDATACHK      = {(`TBUCFG_DATA_WIDTH/8){1'b0}};\
    assign TBU``num``_WVALID        = 1'b0;                       \
    assign TBU``num``_BREADY        = 1'b0;                       \
    assign TBU``num``_ARID          = 11'b00000000000;            \
    assign TBU``num``_ARADDR        = {48{1'b0}};                 \
    assign TBU``num``_ARLEN         = 8'h00;                      \
    assign TBU``num``_ARSIZE        = 3'b000;                     \
    assign TBU``num``_ARBURST       = 2'b00;                      \
    assign TBU``num``_ARLOCK        = 1'b0;                       \
    assign TBU``num``_ARCACHE       = 4'h0;                       \
    assign TBU``num``_ARPROT        = 3'b000;                     \
    assign TBU``num``_ARDOMAIN      = 2'b00;                      \
    assign TBU``num``_ARSNOOP       = 4'h0;                       \
    assign TBU``num``_ARQOS         = 4'h0;                       \
    assign TBU``num``_ARNSAID       = 4'h0;                       \
    assign TBU``num``_ARUSER        = 8'h00;                      \
    assign TBU``num``_ARTRACE       = 1'b0;                       \
    assign TBU``num``_ARMPAM        = 11'b00000000000;            \
    assign TBU``num``_ARIDUNQ       = 1'b0;                       \
    assign TBU``num``_ARTAGOP       = 2'b00;                      \
    assign TBU``num``_ARLOOP        = 2'b00;                      \
    assign TBU``num``_ARCHUNKEN     = 1'b0;                       \
    assign TBU``num``_ARVALID       = 1'b0;                       \
    assign TBU``num``_RREADY        = 1'b0

/*
`define MMUTBU_A4SADB_WIRE(num)    \
    wire         tbu``num``_adb_tvalid_dti_dn;                                       \
    wire         tbu``num``_adb_tready_dti_dn;                                       \
    wire [159:0] tbu``num``_adb_tdata_dti_dn;                                        \
    wire [19:0]  tbu``num``_adb_tkeep_dti_dn;                                        \
    wire [5:0]   tbu``num``_adb_tid_dti_dn;                                          \
    wire         tbu``num``_adb_tlast_dti_dn;                                        \
    wire         tbu``num``_adb_twakeup_dti_dn;                                      \
    wire         tbu``num``_adb_tvalid_dti_up;                                       \
    wire         tbu``num``_adb_tready_dti_up;                                       \
    wire [159:0] tbu``num``_adb_tdata_dti_up;                                        \
    wire [19:0]  tbu``num``_adb_tkeep_dti_up;                                        \
    wire [5:0]   tbu``num``_adb_tdest_dti_up;                                        \
    wire         tbu``num``_adb_tlast_dti_up;                                        \
    wire         tbu``num``_adb_twakeup_dti_up

`define TCU_OUTPORT_TIED_ZERO  \
    assign TCU_CLK           = 1'b0;                        \
    assign TCU_RSTn          = 1'b0;                        \
    assign TCU_ACLKEN        = 1'b0;                        \
    assign TCU_AWAKEUP       = 1'b0;                        \
    assign TCU_AWID          = 11'b00000000000;             \
    assign TCU_AWADDR        = {48{1'b0}};                  \
    assign TCU_AWLEN         = 8'h00;                       \
    assign TCU_AWSIZE        = 3'b000;                      \
    assign TCU_AWBURST       = 2'b00;                       \
    assign TCU_AWLOCK        = 1'b0;                        \
    assign TCU_AWCACHE       = 4'h0;                        \
    assign TCU_AWPROT        = 3'b000;                      \
    assign TCU_AWDOMAIN      = 2'b00;                       \
    assign TCU_AWSNOOP       = 4'h0;                        \
    assign TCU_AWQOS         = 4'h0;                        \
    assign TCU_AWNSAID       = 4'h0;                        \
    assign TCU_AWUSER        = 8'h00;                       \
    assign TCU_AWATOP        = 6'b000000;                   \
    assign TCU_AWSTASHNID    = 11'b00000000000;             \
    assign TCU_AWSTASHNIDEN  = 1'b0;                        \
    assign TCU_AWSTASHLPID   = 5'b00000;                    \
    assign TCU_AWSTASHLPIDEN = 1'b0;                        \
    assign TCU_AWTRACE       = 1'b0;                        \
    assign TCU_AWMPAM        = 11'b00000000000;             \
    assign TCU_AWIDUNQ       = 1'b0;                        \
    assign TCU_AWTAGOP       = 2'b0;                        \
    assign TCU_AWLOOP        = 2'b00;                       \
    assign TCU_AWCMO         = 2'b00;                       \
    assign TCU_AWVALID       = 1'b0;                        \
    assign TCU_WDATA         = {TCUCFG_QTW_DATA_WIDTH{1'b0}};   \
    assign TCU_WSTRB         = {(TCUCFG_QTW_DATA_WIDTH/8){1'b0}};\
    assign TCU_WLAST         = 1'b0;                        \
    assign TCU_WUSER         = 1'b0;                        \
    assign TCU_WTRACE        = 1'b0;                        \
    assign TCU_WTAG          = {(TCUCFG_QTW_DATA_WIDTH/128)*4{1'b0}};\
    assign TCU_WTAGUPDATE    = {(TCUCFG_QTW_DATA_WIDTH/128){1'b0}};\
    assign TCU_WPOISON       = {(TCUCFG_QTW_DATA_WIDTH/64){1'b0}};\
    assign TCU_WDATACHK      = {(TCUCFG_QTW_DATA_WIDTH/8){1'b0}};\
    assign TCU_WVALID        = 1'b0;                        \
    assign TCU_BREADY        = 1'b0;                        \
    assign TCU_ARID          = 11'b00000000000;             \
    assign TCU_ARADDR        = {48{1'b0}};                  \
    assign TCU_ARLEN         = 8'h00;                       \
    assign TCU_ARSIZE        = 3'b000;                      \
    assign TCU_ARBURST       = 2'b00;                       \
    assign TCU_ARLOCK        = 1'b0;                        \
    assign TCU_ARCACHE       = 4'b0000;                     \
    assign TCU_ARPROT        = 3'b000;                      \
    assign TCU_ARDOMAIN      = 2'b00;                       \
    assign TCU_ARSNOOP       = 4'h0;                        \
    assign TCU_ARQOS         = 4'h0;                        \
    assign TCU_ARNSAID       = 4'h0;                        \
    assign TCU_ARUSER        = 8'h00;                       \
    assign TCU_ARTRACE       = 1'b0;                        \
    assign TCU_ARMPAM        = 11'b00000000000;             \
    assign TCU_ARIDUNQ       = 1'b0;                        \
    assign TCU_ARTAGOP       = 2'b00;                       \
    assign TCU_ARLOOP        = 2'b00;                       \
    assign TCU_ARCHUNKEN     = 1'b0;                        \
    assign TCU_ARVALID       = 1'b0;                        \
    assign TCU_RREADY        = 1'b0;                        \
    assign TCU_ACREADY       = 1'b0;                        \
    assign TCU_CRRESP        = 5'b00000;                    \
    assign TCU_CRTRACE       = 1'b0;                        \
    assign TCU_CRVALID       = 1'b0;                        \
    assign TCU_SYSCOREQ      = 1'b0
*/

