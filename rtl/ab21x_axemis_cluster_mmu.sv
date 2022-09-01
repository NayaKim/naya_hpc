/**********************************************************************
#-- COPYRIGHT (C) 2020,
#-- ETRI, (Electronics and Telecommunication Research Institute)
#-- ALL RIGHT RESERVED
#----------------------------------------------------------------------
#
#-- Module for the AB21MP_EARTH 
#
#--  Created by Juyeob Kim (juyeob@etri.re.kr)
#
#----------------------------------------------------------------------
#--Revision History Here
#----------------------------------------------------------------------
#--Rev              Date              Comments
#
#
#*********************************************************************/
`include "ab21x_axemis_cluster_defs.svh"

module AB21X_AXEMIS_CLUSTER_MMU (
    input  wire                                         CLK_XMSCL_APB            ,
    input  wire                                         TCU_CLK                  ,
    input  wire                                         TBU0_CLK                 ,
    input  wire                                         TBU1_CLK                 ,
    input  wire                                         TBU2_CLK                 ,
    input  wire                                         TBU3_CLK                 ,
    input  wire                                         TBU4_CLK                 ,
    input  wire                                         TBU5_CLK                 ,
    input  wire                                         TBU6_CLK                 ,
    input  wire                                         TBU7_CLK                 ,
    input  wire                                         AXEMIS0_CLK              ,
    input  wire                                         AXEMIS1_CLK              ,
    input  wire                                         AXEMIS2_CLK              ,
    input  wire                                         AXEMIS3_CLK              ,
    input  wire                                         AXEMIS4_CLK              ,
    input  wire                                         AXEMIS5_CLK              ,
    input  wire                                         AXEMIS6_CLK              ,
    input  wire                                         AXEMIS7_CLK              ,

    input  wire                                         RSTn_XMSCL_APB           ,
    input  wire                                         TCU_RSTn                 ,
    input  wire                                         TBU0_RSTn                ,
    input  wire                                         TBU1_RSTn                ,
    input  wire                                         TBU2_RSTn                ,
    input  wire                                         TBU3_RSTn                ,
    input  wire                                         TBU4_RSTn                ,
    input  wire                                         TBU5_RSTn                ,
    input  wire                                         TBU6_RSTn                ,
    input  wire                                         TBU7_RSTn                ,
    input  wire                                         AXEMIS0_RSTn             ,
    input  wire                                         AXEMIS1_RSTn             ,
    input  wire                                         AXEMIS2_RSTn             ,
    input  wire                                         AXEMIS3_RSTn             ,
    input  wire                                         AXEMIS4_RSTn             ,
    input  wire                                         AXEMIS5_RSTn             ,
    input  wire                                         AXEMIS6_RSTn             ,
    input  wire                                         AXEMIS7_RSTn             ,

    output wire                                        TCU_ACLKEN               ,
    output wire                                        TCU_AWAKEUP              ,
    output wire [10:0]                                 TCU_AWID                 ,
    output wire [47:0]                                 TCU_AWADDR               ,
    output wire [7:0]                                  TCU_AWLEN                ,
    output wire [2:0]                                  TCU_AWSIZE               ,
    output wire [1:0]                                  TCU_AWBURST              ,
    output wire                                        TCU_AWLOCK               ,
    output wire [3:0]                                  TCU_AWCACHE              ,
    output wire [2:0]                                  TCU_AWPROT               ,
    output wire [1:0]                                  TCU_AWDOMAIN             ,
    output wire [3:0]                                  TCU_AWSNOOP              ,
    output wire [3:0]                                  TCU_AWQOS                ,
    output wire [3:0]                                  TCU_AWNSAID              ,
    output wire [7:0]                                  TCU_AWUSER               ,
    output wire [5:0]                                  TCU_AWATOP               ,
    output wire [10:0]                                 TCU_AWSTASHNID           ,
    output wire                                        TCU_AWSTASHNIDEN         ,
    output wire [4:0]                                  TCU_AWSTASHLPID          ,
    output wire                                        TCU_AWSTASHLPIDEN        ,
    output wire                                        TCU_AWTRACE              ,
    output wire [10:0]                                 TCU_AWMPAM               ,
    output wire                                        TCU_AWIDUNQ              ,
    output wire [1:0]                                  TCU_AWTAGOP              ,
    output wire [1:0]                                  TCU_AWLOOP               ,
    output wire [1:0]                                  TCU_AWCMO                ,
    output wire                                        TCU_AWVALID              ,
    input  wire                                        TCU_AWREADY              ,
    output wire [`TCUCFG_QTW_DATA_WIDTH-1:0]           TCU_WDATA                ,
    output wire [(`TCUCFG_QTW_DATA_WIDTH/8)-1:0]       TCU_WSTRB                ,
    output wire                                        TCU_WLAST                ,
    output wire                                        TCU_WUSER                ,
    output wire                                        TCU_WTRACE               ,
    output wire [(`TCUCFG_QTW_DATA_WIDTH/128)*4-1:0]   TCU_WTAG                 ,
    output wire [(`TCUCFG_QTW_DATA_WIDTH/128)-1:0]     TCU_WTAGUPDATE           ,
    output wire [(`TCUCFG_QTW_DATA_WIDTH/64)-1:0]      TCU_WPOISON              ,
    output wire [(`TCUCFG_QTW_DATA_WIDTH/8)-1:0]       TCU_WDATACHK             ,
    output wire                                        TCU_WVALID               ,
    input  wire                                        TCU_WREADY               ,
    input  wire [10:0]                                 TCU_BID                  ,
    input  wire [1:0]                                  TCU_BRESP                ,
    input  wire [3:0]                                  TCU_BUSER                ,
    input  wire                                        TCU_BTRACE               ,
    input  wire                                        TCU_BIDUNQ               ,
    input  wire [1:0]                                  TCU_BLOOP                ,
    input  wire                                        TCU_BCOMP                ,
    input  wire                                        TCU_BPERSIST             ,
    input  wire                                        TCU_BVALID               ,
    output wire                                        TCU_BREADY               ,
    output wire [10:0]                                 TCU_ARID                 ,
    output wire [47:0]                                 TCU_ARADDR               ,
    output wire [7:0]                                  TCU_ARLEN                ,
    output wire [2:0]                                  TCU_ARSIZE               ,
    output wire [1:0]                                  TCU_ARBURST              ,
    output wire                                        TCU_ARLOCK               ,
    output wire [3:0]                                  TCU_ARCACHE              ,
    output wire [2:0]                                  TCU_ARPROT               ,
    output wire [1:0]                                  TCU_ARDOMAIN             ,
    output wire [3:0]                                  TCU_ARSNOOP              ,
    output wire [3:0]                                  TCU_ARQOS                ,
    output wire [3:0]                                  TCU_ARNSAID              ,
    output wire [7:0]                                  TCU_ARUSER               ,
    output wire                                        TCU_ARTRACE              ,
    output wire [10:0]                                 TCU_ARMPAM               ,
    output wire                                        TCU_ARIDUNQ              ,
    output wire [1:0]                                  TCU_ARTAGOP              ,
    output wire [1:0]                                  TCU_ARLOOP               ,
    output wire                                        TCU_ARCHUNKEN            ,
    output wire                                        TCU_ARVALID              ,
    input  wire                                        TCU_ARREADY              ,
    input  wire [10:0]                                 TCU_RID                  ,
    input  wire [`TCUCFG_QTW_DATA_WIDTH-1:0]           TCU_RDATA                ,
    input  wire [2:0]                                  TCU_RRESP                ,
    input  wire                                        TCU_RLAST                ,
    input  wire                                        TCU_RUSER                ,
    input  wire                                        TCU_RTRACE               ,
    input  wire [(`TCUCFG_QTW_DATA_WIDTH/64)-1:0]      TCU_RPOISON              ,
    input  wire [(`TCUCFG_QTW_DATA_WIDTH/8)-1:0]       TCU_RDATACHK             ,
    input  wire                                        TCU_RIDUNQ               ,
    input  wire [1:0]                                  TCU_RLOOP                ,
    input  wire                                        TCU_RCHUNKV              ,
    input  wire [`AXEMIS_RCHUNKNUM_WIDTH-1:0]          TCU_RCHUNKNUM            ,
    input  wire [`AXEMIS_RCHUNKSTRB_WIDTH-1:0]         TCU_RCHUNKSTRB           ,
    input  wire                                        TCU_RVALID               ,
    output wire                                        TCU_RREADY               ,
    input  wire [47:0]                                 TCU_ACADDR               ,
    input  wire [3:0]                                  TCU_ACSNOOP              ,
    input  wire [2:0]                                  TCU_ACPROT               ,
    input  wire [3:0]                                  TCU_ACVMIDEXT            ,
    input  wire                                        TCU_ACTRACE              ,
    input  wire                                        TCU_ACVALID              ,
    output wire                                        TCU_ACREADY              ,
    input  wire                                        TCU_ACWAKEUP             ,
    output wire [4:0]                                  TCU_CRRESP               ,
    output wire                                        TCU_CRTRACE              ,
    output wire                                        TCU_CRVALID              ,
    input  wire                                        TCU_CRREADY              ,
    output wire                                        TCU_SYSCOREQ             ,
    input  wire                                        TCU_SYSCOACK             ,

`ifdef AB_TEST_MMU_IN_TB
`else
    // XEMIS-ADB(slv) <-> ADB(mst)-TBU
    `AXEMIS_ACE5LADB_ASYNC_MST_PORT(AXEMIS0),
    `AXEMIS_ACE5LADB_ASYNC_MST_PORT(AXEMIS1),
    `AXEMIS_ACE5LADB_ASYNC_MST_PORT(AXEMIS2),
    `AXEMIS_ACE5LADB_ASYNC_MST_PORT(AXEMIS3),
    `AXEMIS_ACE5LADB_ASYNC_MST_PORT(AXEMIS4),
    `AXEMIS_ACE5LADB_ASYNC_MST_PORT(AXEMIS5),
    `AXEMIS_ACE5LADB_ASYNC_MST_PORT(AXEMIS6),
    `AXEMIS_ACE5LADB_ASYNC_MST_PORT(AXEMIS7),
`endif

    // TBU <-> CMN
    `TBU_ACE5L_PORT(0),
    `TBU_ACE5L_PORT(1),
    `TBU_ACE5L_PORT(2),
    `TBU_ACE5L_PORT(3),
    `TBU_ACE5L_PORT(4),
    `TBU_ACE5L_PORT(5),
    `TBU_ACE5L_PORT(6),
    `TBU_ACE5L_PORT(7),

    // TCU PROG IF (APB)
    input  wire [31:0]                    PADDR,
    input  wire [2:0]                     PPROT,
    input  wire                           PSEL,
    input  wire                           PENABLE,
    input  wire                           PWRITE,
    input  wire [31:0]                    PWDATA,
    input  wire [3:0]                     PSTRB,
    output wire                           PREADY,
    output wire [31:0]                    PRDATA,
    output wire                           PSLVERR,
    input  wire                           PWAKEUP,
                                                                  
    output wire [24:0]                    IRQ
);                                                             

// Alignment of the bitwidth.
wire [15:0] tbu0_awid;
wire [15:0] tbu1_awid;
wire [15:0] tbu2_awid;
wire [15:0] tbu3_awid;
wire [15:0] tbu4_awid;
wire [15:0] tbu5_awid;
wire [15:0] tbu6_awid;
wire [15:0] tbu7_awid;
wire [44:0] tbu0_awuser;
wire [44:0] tbu1_awuser;
wire [44:0] tbu2_awuser;
wire [44:0] tbu3_awuser;
wire [44:0] tbu4_awuser;
wire [44:0] tbu5_awuser;
wire [44:0] tbu6_awuser;
wire [44:0] tbu7_awuser;
wire [15:0] tbu0_arid;
wire [15:0] tbu1_arid;
wire [15:0] tbu2_arid;
wire [15:0] tbu3_arid;
wire [15:0] tbu4_arid;
wire [15:0] tbu5_arid;
wire [15:0] tbu6_arid;
wire [15:0] tbu7_arid;
wire [44:0] tbu0_aruser;
wire [44:0] tbu1_aruser;
wire [44:0] tbu2_aruser;
wire [44:0] tbu3_aruser;
wire [44:0] tbu4_aruser;
wire [44:0] tbu5_aruser;
wire [44:0] tbu6_aruser;
wire [44:0] tbu7_aruser;
wire [15:0] tbu0_rid;
wire [15:0] tbu1_rid;
wire [15:0] tbu2_rid;
wire [15:0] tbu3_rid;
wire [15:0] tbu4_rid;
wire [15:0] tbu5_rid;
wire [15:0] tbu6_rid;
wire [15:0] tbu7_rid;
wire [15:0] tbu0_bid;
wire [15:0] tbu1_bid;
wire [15:0] tbu2_bid;
wire [15:0] tbu3_bid;
wire [15:0] tbu4_bid;
wire [15:0] tbu5_bid;
wire [15:0] tbu6_bid;
wire [15:0] tbu7_bid;

wire [2:0] tcu_awsnoop;
wire [6:0] tcu_awid;
wire [6:0] tcu_arid;
wire [6:0] tcu_rid;
wire [6:0] tcu_bid;

wire [31:0] tcu_paddr;
wire [2:0]  tcu_pprot;
wire        tcu_psel;
wire        tcu_penable;
wire        tcu_pwrite;
wire [31:0] tcu_pwdata;
wire [3:0]  tcu_pstrb;
wire        tcu_pready;
wire [31:0] tcu_prdata;
wire        tcu_pslverr;

wire        tcu_event_q_irpt_s;  
wire        tcu_event_q_irpt_ns; 
wire        tcu_pri_q_irpt_ns;   
wire        tcu_cmd_sync_irpt_ns;
wire        tcu_cmd_sync_irpt_s; 
wire        tcu_global_irpt_ns;  
wire        tcu_global_irpt_s;   
wire        tcu_ras_irpt;        
wire        tcu_pmu_irpt;        

wire        tbu0_ras_irpt;        
wire        tbu1_ras_irpt;        
wire        tbu2_ras_irpt;        
wire        tbu3_ras_irpt;        
wire        tbu4_ras_irpt;        
wire        tbu5_ras_irpt;        
wire        tbu6_ras_irpt;        
wire        tbu7_ras_irpt;        

wire        tbu0_pmu_irpt;        
wire        tbu1_pmu_irpt;        
wire        tbu2_pmu_irpt;        
wire        tbu3_pmu_irpt;       
wire        tbu4_pmu_irpt;        
wire        tbu5_pmu_irpt;        
wire        tbu6_pmu_irpt;        
wire        tbu7_pmu_irpt;        

`ifdef AB_TEST_MMU_IN_TB
`else
// ADB(mst) to MMU TBU
`AXEMIS_ACE5L_WIRE_IN_MMU_TEMPLATE(axemis0);
`AXEMIS_ACE5L_WIRE_IN_MMU_TEMPLATE(axemis1);
`AXEMIS_ACE5L_WIRE_IN_MMU_TEMPLATE(axemis2);
`AXEMIS_ACE5L_WIRE_IN_MMU_TEMPLATE(axemis3);
`AXEMIS_ACE5L_WIRE_IN_MMU_TEMPLATE(axemis4);
`AXEMIS_ACE5L_WIRE_IN_MMU_TEMPLATE(axemis5);
`AXEMIS_ACE5L_WIRE_IN_MMU_TEMPLATE(axemis6);
`AXEMIS_ACE5L_WIRE_IN_MMU_TEMPLATE(axemis7);


// Translate AxUSER bits to each field
`AXEMIS_TRANS_USER_TO_ACE5L_IN_MMU_TEMPLATE(0,axemis0);
`AXEMIS_TRANS_USER_TO_ACE5L_IN_MMU_TEMPLATE(1,axemis1);
`AXEMIS_TRANS_USER_TO_ACE5L_IN_MMU_TEMPLATE(2,axemis2);
`AXEMIS_TRANS_USER_TO_ACE5L_IN_MMU_TEMPLATE(3,axemis3);
`AXEMIS_TRANS_USER_TO_ACE5L_IN_MMU_TEMPLATE(4,axemis4);
`AXEMIS_TRANS_USER_TO_ACE5L_IN_MMU_TEMPLATE(5,axemis5);
`AXEMIS_TRANS_USER_TO_ACE5L_IN_MMU_TEMPLATE(6,axemis6);
`AXEMIS_TRANS_USER_TO_ACE5L_IN_MMU_TEMPLATE(7,axemis7);

/*
`define AXEMIS_TRANS_USER_TO_ACE5L_IN_MMU_TEMPLATE(num_prefix) \
    wire [`AXEMIS_ADB_AWUSER_WIDTH-1:0] tbu``num``_adb400_awuser;                               \
    wire [`AXEMIS_ADB_ARUSER_WIDTH-1:0] tbu``num``_adb400_aruser;                               \
    \
    assign ``prefix``_adb_awuser       [`AXEMIS_USER_WIDTH        -1: 0] = tbu``num``_adb400_awuser[`AXEMIS_USER_START        + `AXEMIS_USER_WIDTH        -1: `AXEMIS_USER_START       ] ;      \
    assign ``prefix``_adb_awmmussid    [`AXEMIS_MMUSSID_WIDTH     -1: 0] = tbu``num``_adb400_awuser[`AXEMIS_MMUSSID_START     + `AXEMIS_MMUSSID_WIDTH     -1: `AXEMIS_MMUSSID_START    ] ;      \
    assign ``prefix``_adb_awmmusid     [`AXEMIS_MMUSID_WIDTH      -1: 0] = tbu``num``_adb400_awuser[`AXEMIS_MMUSID_START      + `AXEMIS_MMUSID_WIDTH      -1: `AXEMIS_MMUSID_START     ] ;      \
    assign ``prefix``_adb_awmmussidv   [`AXEMIS_MMUSSIDV_WIDTH    -1: 0] = tbu``num``_adb400_awuser[`AXEMIS_MMUSSIDV_START    + `AXEMIS_MMUSSIDV_WIDTH    -1: `AXEMIS_MMUSSIDV_START   ] ;      \
    assign ``prefix``_adb_awmmusecsid  [`AXEMIS_MMUSECSID_WIDTH   -1: 0] = tbu``num``_adb400_awuser[`AXEMIS_MMUSECSID_START   + `AXEMIS_MMUSECSID_WIDTH   -1: `AXEMIS_MMUSECSID_START  ] ;      \
    assign ``prefix``_adb_awmmuatst    [`AXEMIS_MMUATST_WIDTH     -1: 0] = tbu``num``_adb400_awuser[`AXEMIS_MMUATST_START     + `AXEMIS_MMUATST_WIDTH     -1: `AXEMIS_MMUATST_START    ] ;      \
    assign ``prefix``_adb_awstashnid   [`AXEMIS_STASHNID_WIDTH    -1: 0] = tbu``num``_adb400_awuser[`AXEMIS_STASHNID_START    + `AXEMIS_STASHNID_WIDTH    -1: `AXEMIS_STASHNID_START   ] ;      \
    assign ``prefix``_adb_awstashniden [`AXEMIS_STASHNIDEN_WIDTH  -1: 0] = tbu``num``_adb400_awuser[`AXEMIS_STASHNIDEN_START  + `AXEMIS_STASHNIDEN_WIDTH  -1: `AXEMIS_STASHNIDEN_START ] ;      \
    assign ``prefix``_adb_awstashlpid  [`AXEMIS_STASHLPID_WIDTH   -1: 0] = tbu``num``_adb400_awuser[`AXEMIS_STASHLPID_START   + `AXEMIS_STASHLPID_WIDTH   -1: `AXEMIS_STASHLPID_START  ] ;      \
    assign ``prefix``_adb_awstashlpiden[`AXEMIS_STASHLPIDEN_WIDTH -1: 0] = tbu``num``_adb400_awuser[`AXEMIS_STASHLPIDEN_START + `AXEMIS_STASHLPIDEN_WIDTH -1: `AXEMIS_STASHLPIDEN_START] ;      \
    assign ``prefix``_adb_awatop       [`AXEMIS_ATOP_WIDTH        -1: 0] = tbu``num``_adb400_awuser[`AXEMIS_ATOP_START        + `AXEMIS_ATOP_WIDTH        -1: `AXEMIS_ATOP_START       ] ;      \
    \
    assign ``prefix``_adb_aruser       [`AXEMIS_USER_WIDTH        -1: 0] = tbu``num``_adb400_aruser[`AXEMIS_USER_START        + `AXEMIS_USER_WIDTH        -1: `AXEMIS_USER_START       ] ;      \
    assign ``prefix``_adb_armmussid    [`AXEMIS_MMUSSID_WIDTH     -1: 0] = tbu``num``_adb400_aruser[`AXEMIS_MMUSSID_START     + `AXEMIS_MMUSSID_WIDTH     -1: `AXEMIS_MMUSSID_START    ] ;      \
    assign ``prefix``_adb_armmusid     [`AXEMIS_MMUSID_WIDTH      -1: 0] = tbu``num``_adb400_aruser[`AXEMIS_MMUSID_START      + `AXEMIS_MMUSID_WIDTH      -1: `AXEMIS_MMUSID_START     ] ;      \
    assign ``prefix``_adb_armmussidv   [`AXEMIS_MMUSSIDV_WIDTH    -1: 0] = tbu``num``_adb400_aruser[`AXEMIS_MMUSSIDV_START    + `AXEMIS_MMUSSIDV_WIDTH    -1: `AXEMIS_MMUSSIDV_START   ] ;      \
    assign ``prefix``_adb_armmusecsid  [`AXEMIS_MMUSECSID_WIDTH   -1: 0] = tbu``num``_adb400_aruser[`AXEMIS_MMUSECSID_START   + `AXEMIS_MMUSECSID_WIDTH   -1: `AXEMIS_MMUSECSID_START  ] ;      \
    assign ``prefix``_adb_armmuatst    [`AXEMIS_MMUATST_WIDTH     -1: 0] = tbu``num``_adb400_aruser[`AXEMIS_MMUATST_START     + `AXEMIS_MMUATST_WIDTH     -1: `AXEMIS_MMUATST_START    ]
*/
`endif

assign TBU0_AWID  = tbu0_awid[10:0];
assign TBU1_AWID  = tbu1_awid[10:0];
assign TBU2_AWID  = tbu2_awid[10:0];
assign TBU3_AWID  = tbu3_awid[10:0];
assign TBU4_AWID  = tbu4_awid[10:0];
assign TBU5_AWID  = tbu5_awid[10:0];
assign TBU6_AWID  = tbu6_awid[10:0];
assign TBU7_AWID  = tbu7_awid[10:0];
assign TBU0_AWUSER = tbu0_awuser[7:0];
assign TBU1_AWUSER = tbu1_awuser[7:0];
assign TBU2_AWUSER = tbu2_awuser[7:0];
assign TBU3_AWUSER = tbu3_awuser[7:0];
assign TBU4_AWUSER = tbu4_awuser[7:0];
assign TBU5_AWUSER = tbu5_awuser[7:0];
assign TBU6_AWUSER = tbu6_awuser[7:0];
assign TBU7_AWUSER = tbu7_awuser[7:0];
assign TBU0_ARID  = tbu0_arid[10:0];
assign TBU1_ARID  = tbu1_arid[10:0];
assign TBU2_ARID  = tbu2_arid[10:0];
assign TBU3_ARID  = tbu3_arid[10:0];
assign TBU4_ARID  = tbu4_arid[10:0];
assign TBU5_ARID  = tbu5_arid[10:0];
assign TBU6_ARID  = tbu6_arid[10:0];
assign TBU7_ARID  = tbu7_arid[10:0];
assign TBU0_ARUSER = tbu0_aruser[7:0];
assign TBU1_ARUSER = tbu1_aruser[7:0];
assign TBU2_ARUSER = tbu2_aruser[7:0];
assign TBU3_ARUSER = tbu3_aruser[7:0];
assign TBU4_ARUSER = tbu4_aruser[7:0];
assign TBU5_ARUSER = tbu5_aruser[7:0];
assign TBU6_ARUSER = tbu6_aruser[7:0];
assign TBU7_ARUSER = tbu7_aruser[7:0];
assign tbu0_rid = { 5'b00000,  TBU0_RID};
assign tbu1_rid = { 5'b00000,  TBU1_RID};
assign tbu2_rid = { 5'b00000,  TBU2_RID};
assign tbu3_rid = { 5'b00000,  TBU3_RID};
assign tbu4_rid = { 5'b00000,  TBU4_RID};
assign tbu5_rid = { 5'b00000,  TBU5_RID};
assign tbu6_rid = { 5'b00000,  TBU6_RID};
assign tbu7_rid = { 5'b00000,  TBU7_RID};
assign tbu0_bid = { 5'b00000,  TBU0_BID};
assign tbu1_bid = { 5'b00000,  TBU1_BID};
assign tbu2_bid = { 5'b00000,  TBU2_BID};
assign tbu3_bid = { 5'b00000,  TBU3_BID};
assign tbu4_bid = { 5'b00000,  TBU4_BID};
assign tbu5_bid = { 5'b00000,  TBU5_BID};
assign tbu6_bid = { 5'b00000,  TBU6_BID};
assign tbu7_bid = { 5'b00000,  TBU7_BID};

assign TCU_AWSNOOP = {1'b0, tcu_awsnoop};
assign TCU_AWID = {4'b0000, tcu_awid};
assign TCU_ARID = {4'b0000, tcu_arid};
assign tcu_rid = TCU_RID[6:0];
assign tcu_bid = TCU_BID[6:0];

assign TCU_ACLKEN       = 1'b1;
assign TCU_ARCHUNKEN    = 1'b0;
assign TCU_ARNSAID      = 4'b0;          
assign TCU_ARUSER       = 8'b0;   
assign TCU_ARTRACE      = 1'b0;
assign TCU_ARMPAM       = 11'b0;           
assign TCU_ARIDUNQ      = 1'b0;          
assign TCU_ARTAGOP      = 2'b0;
assign TCU_ARLOOP       = 2'b0;
assign TCU_AWNSAID      = 4'b0;          
assign TCU_AWUSER       = 8'b0;           
assign TCU_AWATOP       = 6'b0;           
assign TCU_AWSTASHNID   = 11'b0;       
assign TCU_AWSTASHNIDEN = 1'b0;     
assign TCU_AWSTASHLPID  = 5'b0;      
assign TCU_AWSTASHLPIDEN= 1'b0;    
assign TCU_AWTRACE      = 1'b0;           
assign TCU_AWMPAM       = 11'b0;            
assign TCU_AWIDUNQ      = 1'b0;         
assign TCU_AWTAGOP      = 2'b0;          
assign TCU_AWLOOP       = 2'b0;          
assign TCU_AWCMO        = 2'b0;            
assign TCU_WUSER        = 1'b0;           
assign TCU_WTRACE       = 1'b0;          
assign TCU_WTAG         = 8'b0;
assign TCU_WTAGUPDATE   = 2'b0;
assign TCU_WPOISON      = 4'b0;         
assign TCU_WDATACHK     = 32'b0;        
assign TCU_CRTRACE      = 1'b0;

assign TBU0_ACLKEN      = 1'b1;
assign TBU1_ACLKEN      = 1'b1;
assign TBU2_ACLKEN      = 1'b1;
assign TBU3_ACLKEN      = 1'b1;
assign TBU4_ACLKEN      = 1'b1;
assign TBU5_ACLKEN      = 1'b1;
assign TBU6_ACLKEN      = 1'b1;
assign TBU7_ACLKEN      = 1'b1;

assign TBU0_AWCMO       = 2'b0;
assign TBU1_AWCMO       = 2'b0;
assign TBU2_AWCMO       = 2'b0;
assign TBU3_AWCMO       = 2'b0;
assign TBU4_AWCMO       = 2'b0;
assign TBU5_AWCMO       = 2'b0;
assign TBU6_AWCMO       = 2'b0;
assign TBU7_AWCMO       = 2'b0;

assign TBU0_AWIDUNQ     = 1'b0;
assign TBU1_AWIDUNQ     = 1'b0;
assign TBU2_AWIDUNQ     = 1'b0;
assign TBU3_AWIDUNQ     = 1'b0;
assign TBU4_AWIDUNQ     = 1'b0;
assign TBU5_AWIDUNQ     = 1'b0;
assign TBU6_AWIDUNQ     = 1'b0;
assign TBU7_AWIDUNQ     = 1'b0;

assign TBU0_AWLOOP      = 2'b0;
assign TBU1_AWLOOP      = 2'b0;
assign TBU2_AWLOOP      = 2'b0;
assign TBU3_AWLOOP      = 2'b0;
assign TBU4_AWLOOP      = 2'b0;
assign TBU5_AWLOOP      = 2'b0;
assign TBU6_AWLOOP      = 2'b0;
assign TBU7_AWLOOP      = 2'b0;

assign TBU0_AWMPAM      = 11'b0;
assign TBU1_AWMPAM      = 11'b0;
assign TBU2_AWMPAM      = 11'b0;
assign TBU3_AWMPAM      = 11'b0;
assign TBU4_AWMPAM      = 11'b0;
assign TBU5_AWMPAM      = 11'b0;
assign TBU6_AWMPAM      = 11'b0;
assign TBU7_AWMPAM      = 11'b0;

assign TBU0_AWNSAID     = 4'b0;
assign TBU1_AWNSAID     = 4'b0;
assign TBU2_AWNSAID     = 4'b0;
assign TBU3_AWNSAID     = 4'b0;
assign TBU4_AWNSAID     = 4'b0;
assign TBU5_AWNSAID     = 4'b0;
assign TBU6_AWNSAID     = 4'b0;
assign TBU7_AWNSAID     = 4'b0;

assign TBU0_AWTRACE     = 1'b0;
assign TBU1_AWTRACE     = 1'b0;
assign TBU2_AWTRACE     = 1'b0;
assign TBU3_AWTRACE     = 1'b0;
assign TBU4_AWTRACE     = 1'b0;
assign TBU5_AWTRACE     = 1'b0;
assign TBU6_AWTRACE     = 1'b0;
assign TBU7_AWTRACE     = 1'b0;

assign TBU0_AWTAGOP     = 2'b0;
assign TBU1_AWTAGOP     = 2'b0;
assign TBU2_AWTAGOP     = 2'b0;
assign TBU3_AWTAGOP     = 2'b0;
assign TBU4_AWTAGOP     = 2'b0;
assign TBU5_AWTAGOP     = 2'b0;
assign TBU6_AWTAGOP     = 2'b0;
assign TBU7_AWTAGOP     = 2'b0;

assign TBU0_ARCHUNKEN   = 1'b0;
assign TBU1_ARCHUNKEN   = 1'b0;
assign TBU2_ARCHUNKEN   = 1'b0;
assign TBU3_ARCHUNKEN   = 1'b0;
assign TBU4_ARCHUNKEN   = 1'b0;
assign TBU5_ARCHUNKEN   = 1'b0;
assign TBU6_ARCHUNKEN   = 1'b0;
assign TBU7_ARCHUNKEN   = 1'b0;

assign TBU0_ARIDUNQ     = 1'b0;
assign TBU1_ARIDUNQ     = 1'b0;
assign TBU2_ARIDUNQ     = 1'b0;
assign TBU3_ARIDUNQ     = 1'b0;
assign TBU4_ARIDUNQ     = 1'b0;
assign TBU5_ARIDUNQ     = 1'b0;
assign TBU6_ARIDUNQ     = 1'b0;
assign TBU7_ARIDUNQ     = 1'b0;

assign TBU0_ARLOOP      = 2'b0;
assign TBU1_ARLOOP      = 2'b0;
assign TBU2_ARLOOP      = 2'b0;
assign TBU3_ARLOOP      = 2'b0;
assign TBU4_ARLOOP      = 2'b0;
assign TBU5_ARLOOP      = 2'b0;
assign TBU6_ARLOOP      = 2'b0;
assign TBU7_ARLOOP      = 2'b0;

assign TBU0_ARMPAM      = 11'b0;
assign TBU1_ARMPAM      = 11'b0;
assign TBU2_ARMPAM      = 11'b0;
assign TBU3_ARMPAM      = 11'b0;
assign TBU4_ARMPAM      = 11'b0;
assign TBU5_ARMPAM      = 11'b0;
assign TBU6_ARMPAM      = 11'b0;
assign TBU7_ARMPAM      = 11'b0;

assign TBU0_ARNSAID     = 4'b0;
assign TBU1_ARNSAID     = 4'b0;
assign TBU2_ARNSAID     = 4'b0;
assign TBU3_ARNSAID     = 4'b0;
assign TBU4_ARNSAID     = 4'b0;
assign TBU5_ARNSAID     = 4'b0;
assign TBU6_ARNSAID     = 4'b0;
assign TBU7_ARNSAID     = 4'b0;

assign TBU0_ARTRACE     = 1'b0;
assign TBU1_ARTRACE     = 1'b0;
assign TBU2_ARTRACE     = 1'b0;
assign TBU3_ARTRACE     = 1'b0;
assign TBU4_ARTRACE     = 1'b0;
assign TBU5_ARTRACE     = 1'b0;
assign TBU6_ARTRACE     = 1'b0;
assign TBU7_ARTRACE     = 1'b0;

assign TBU0_ARTAGOP     = 2'b0;
assign TBU1_ARTAGOP     = 2'b0;
assign TBU2_ARTAGOP     = 2'b0;
assign TBU3_ARTAGOP     = 2'b0;
assign TBU4_ARTAGOP     = 2'b0;
assign TBU5_ARTAGOP     = 2'b0;
assign TBU6_ARTAGOP     = 2'b0;
assign TBU7_ARTAGOP     = 2'b0;

assign TBU0_WDATACHK    = 32'b0;
assign TBU1_WDATACHK    = 32'b0;
assign TBU2_WDATACHK    = 32'b0;
assign TBU3_WDATACHK    = 32'b0;
assign TBU4_WDATACHK    = 32'b0;
assign TBU5_WDATACHK    = 32'b0;
assign TBU6_WDATACHK    = 32'b0;
assign TBU7_WDATACHK    = 32'b0;

assign TBU0_WPOISON     = 4'b0;
assign TBU1_WPOISON     = 4'b0;
assign TBU2_WPOISON     = 4'b0;
assign TBU3_WPOISON     = 4'b0;
assign TBU4_WPOISON     = 4'b0;
assign TBU5_WPOISON     = 4'b0;
assign TBU6_WPOISON     = 4'b0;
assign TBU7_WPOISON     = 4'b0;

assign TBU0_WTRACE      = 1'b0;
assign TBU1_WTRACE      = 1'b0;
assign TBU2_WTRACE      = 1'b0;
assign TBU3_WTRACE      = 1'b0;
assign TBU4_WTRACE      = 1'b0;
assign TBU5_WTRACE      = 1'b0;
assign TBU6_WTRACE      = 1'b0;
assign TBU7_WTRACE      = 1'b0;

assign TBU0_WTAGUPDATE  = 2'b0;
assign TBU1_WTAGUPDATE  = 2'b0;
assign TBU2_WTAGUPDATE  = 2'b0;
assign TBU3_WTAGUPDATE  = 2'b0;
assign TBU4_WTAGUPDATE  = 2'b0;
assign TBU5_WTAGUPDATE  = 2'b0;
assign TBU6_WTAGUPDATE  = 2'b0;
assign TBU7_WTAGUPDATE  = 2'b0;

assign TBU0_WTAG        = 8'b0;
assign TBU1_WTAG        = 8'b0;
assign TBU2_WTAG        = 8'b0;
assign TBU3_WTAG        = 8'b0;
assign TBU4_WTAG        = 8'b0;
assign TBU5_WTAG        = 8'b0;
assign TBU6_WTAG        = 8'b0;
assign TBU7_WTAG        = 8'b0;

assign IRQ[0]           = tcu_event_q_irpt_s;  
assign IRQ[1]           = tcu_event_q_irpt_ns; 
assign IRQ[2]           = tcu_pri_q_irpt_ns;   
assign IRQ[3]           = tcu_cmd_sync_irpt_ns;
assign IRQ[4]           = tcu_cmd_sync_irpt_s; 
assign IRQ[5]           = tcu_global_irpt_ns;  
assign IRQ[6]           = tcu_global_irpt_s;   
assign IRQ[7]           = tcu_ras_irpt;        
assign IRQ[8]           = tcu_pmu_irpt;

assign IRQ[9]           = tbu0_ras_irpt;
assign IRQ[10]          = tbu1_ras_irpt;
assign IRQ[11]          = tbu2_ras_irpt;
assign IRQ[12]          = tbu3_ras_irpt;
assign IRQ[13]          = tbu4_ras_irpt;
assign IRQ[14]          = tbu5_ras_irpt;
assign IRQ[15]          = tbu6_ras_irpt;
assign IRQ[16]          = tbu7_ras_irpt;

assign IRQ[17]          = tbu0_pmu_irpt;
assign IRQ[18]          = tbu1_pmu_irpt;
assign IRQ[19]          = tbu2_pmu_irpt;
assign IRQ[20]          = tbu3_pmu_irpt;
assign IRQ[21]          = tbu4_pmu_irpt;
assign IRQ[22]          = tbu5_pmu_irpt;
assign IRQ[23]          = tbu6_pmu_irpt;
assign IRQ[24]          = tbu7_pmu_irpt;
//----------------------------------------------------------------------------
// TCU Wires
//----------------------------------------------------------------------------

// TCU <-> DTI_SWITCH_8x1
wire                            tcu_tvalid_dti_dn;
wire                            tcu_tready_dti_dn;
wire [`DTI_DATA_WIDTH-1:0]      tcu_tdata_dti_dn;
wire [(`DTI_DATA_WIDTH/8)-1:0]  tcu_tkeep_dti_dn;
wire                            tcu_tlast_dti_dn;
wire [`DTI_ID_WIDTH-1:0]        tcu_tid_dti_dn;
wire                            tcu_twakeup_dti_dn;

wire                            tcu_tvalid_dti_up;
wire                            tcu_tready_dti_up;
wire [`DTI_DATA_WIDTH-1:0]      tcu_tdata_dti_up;
wire [(`DTI_DATA_WIDTH/8)-1:0]  tcu_tkeep_dti_up;
wire                            tcu_tlast_dti_up;
wire [`DTI_ID_WIDTH-1:0]        tcu_tdest_dti_up;
wire                            tcu_twakeup_dti_up;

// TBU <-> DTI_SWITCH_8x1
`MMUTBU_A4S_WIRE(0);
`MMUTBU_A4S_WIRE(1);
`MMUTBU_A4S_WIRE(2);
`MMUTBU_A4S_WIRE(3);
`MMUTBU_A4S_WIRE(4);
`MMUTBU_A4S_WIRE(5);
`MMUTBU_A4S_WIRE(6);
`MMUTBU_A4S_WIRE(7);

//----------------------------------------------------------------------------
// TCU TOP 
//----------------------------------------------------------------------------

// APB4 SYNC
AB21X_SYSF_APB4_SYNC u_apb4_sync
(
    .rst_pclk       (~RSTn_XMSCL_APB),
    .pclk           (CLK_XMSCL_APB  ),
    .penable        (PENABLE        ),
    .psel           (PSEL           ),
    .pready         (PREADY         ),
    .pslverr        (PSLVERR        ),
    .pwrite         (PWRITE         ),
    .pstrb          (PSTRB          ),
    .pprot          (PPROT          ),
    .paddr          (PADDR          ),
    .pwdata         (PWDATA         ),
    .prdata         (PRDATA         ),

    .rst_pclk_s     (~TCU_RSTn      ),
    .pclk_s         (TCU_CLK        ),
    .penable_s      (tcu_penable    ),
    .psel_s         (tcu_psel       ),
    .pready_s       (tcu_pready     ),
    .pslverr_s      (tcu_pslverr    ),
    .pwrite_s       (tcu_pwrite     ),
    .pstrb_s        (tcu_pstrb      ),
    .pprot_s        (tcu_pprot      ),
    .paddr_s        (tcu_paddr      ),
    .pwdata_s       (tcu_pwdata     ),
    .prdata_s       (tcu_prdata     )
);


mmu600_r2_tcu
#(
  .TCUCFG_QTW_DATA_WIDTH  ( `TCUCFG_QTW_DATA_WIDTH  ) ,
  .TCUCFG_WCS1L0_DEPTH    ( `TCUCFG_WCS1L0_DEPTH    ) ,
  .TCUCFG_WCS1L1_DEPTH    ( `TCUCFG_WCS1L1_DEPTH    ) ,
  .TCUCFG_WCS1L2_DEPTH    ( `TCUCFG_WCS1L2_DEPTH    ) ,
  .TCUCFG_WCS1L3_DEPTH    ( `TCUCFG_WCS1L3_DEPTH    ) ,
  .TCUCFG_WCS2L0_DEPTH    ( `TCUCFG_WCS2L0_DEPTH    ) ,
  .TCUCFG_WCS2L1_DEPTH    ( `TCUCFG_WCS2L1_DEPTH    ) ,
  .TCUCFG_WCS2L2_DEPTH    ( `TCUCFG_WCS2L2_DEPTH    ) ,
  .TCUCFG_WCS2L3_DEPTH    ( `TCUCFG_WCS2L3_DEPTH    ) ,
  .TCUCFG_CC_DEPTH        ( `TCUCFG_CC_DEPTH        ) ,
  .TCUCFG_CC_IDXGEN_MODE  ( `TCUCFG_CC_IDXGEN_MODE  ) ,
  .TCUCFG_NUM_TBU         ( `TCUCFG_NUM_TBU         ) ,
  .TCUCFG_XLATE_SLOTS     ( `TCUCFG_XLATE_SLOTS     ) ,
  .TCUCFG_PTW_SLOTS       ( `TCUCFG_PTW_SLOTS       ) ,
  .TCUCFG_CTW_SLOTS       ( `TCUCFG_CTW_SLOTS       ) ,
  .TCUCFG_DTI_HNDSHK_MODE ( `TCUCFG_DTI_HNDSHK_MODE ) ,
  .TCUCFG_WC_LKPRSP_MODE  ( `TCUCFG_WC_LKPRSP_MODE  ) ,
  .TCUCFG_CC_LKPRSP_MODE  ( `TCUCFG_CC_LKPRSP_MODE  ) ,
  .TCUCFG_DTI_ATS         ( `TCUCFG_DTI_ATS         ) 
)
u_mmu600_r2_tcu_xemis (
  .aclk             ( TCU_CLK                ) ,
  .aresetn          ( TCU_RSTn               ) ,
  .awvalid_qtw      ( TCU_AWVALID            ) ,
  .awready_qtw      ( TCU_AWREADY            ) ,
  .awid_qtw         ( tcu_awid               ) ,
  .awaddr_qtw       ( TCU_AWADDR             ) ,
  .awregion_qtw     (                        ) ,
  .awlen_qtw        ( TCU_AWLEN              ) ,
  .awsize_qtw       ( TCU_AWSIZE             ) ,
  .awburst_qtw      ( TCU_AWBURST            ) ,
  .awlock_qtw       ( TCU_AWLOCK             ) ,
  .awcache_qtw      ( TCU_AWCACHE            ) ,
  .awprot_qtw       ( TCU_AWPROT             ) ,
  .awqos_qtw        ( TCU_AWQOS              ) ,
  .awdomain_qtw     ( TCU_AWDOMAIN           ) ,
  .awsnoop_qtw      ( tcu_awsnoop            ) ,
  .arvalid_qtw      ( TCU_ARVALID            ) ,
  .arready_qtw      ( TCU_ARREADY            ) ,
  .arid_qtw         ( tcu_arid               ) , // You should check it
  .araddr_qtw       ( TCU_ARADDR             ) ,
  .arregion_qtw     (                        ) ,
  .arlen_qtw        ( TCU_ARLEN              ) ,
  .arsize_qtw       ( TCU_ARSIZE             ) ,
  .arburst_qtw      ( TCU_ARBURST            ) ,
  .arlock_qtw       ( TCU_ARLOCK             ) ,
  .arcache_qtw      ( TCU_ARCACHE            ) ,
  .arprot_qtw       ( TCU_ARPROT             ) ,
  .arqos_qtw        ( TCU_ARQOS              ) ,
  .ardomain_qtw     ( TCU_ARDOMAIN           ) ,
  .arsnoop_qtw      ( TCU_ARSNOOP            ) ,
  .wvalid_qtw       ( TCU_WVALID             ) ,
  .wready_qtw       ( TCU_WREADY             ) ,
  .wdata_qtw        ( TCU_WDATA              ) ,
  .wstrb_qtw        ( TCU_WSTRB              ) ,
  .wlast_qtw        ( TCU_WLAST              ) ,
  .rvalid_qtw       ( TCU_RVALID             ) ,
  .rready_qtw       ( TCU_RREADY             ) ,
  .rid_qtw          ( tcu_rid                ) , // You should check it
  .rdata_qtw        ( TCU_RDATA              ) ,
  .rresp_qtw        ( TCU_RRESP[1:0]         ) ,
  .rlast_qtw        ( TCU_RLAST              ) ,
  .bvalid_qtw       ( TCU_BVALID             ) ,
  .bready_qtw       ( TCU_BREADY             ) ,
  .bid_qtw          ( tcu_bid                ) , // You should check it
  .bresp_qtw        ( TCU_BRESP              ) ,
  .acvalid_qtw      ( TCU_ACVALID            ) ,
  .acready_qtw      ( TCU_ACREADY            ) ,
  .acaddr_qtw       ( TCU_ACADDR             ) ,
  .acprot_qtw       ( TCU_ACPROT             ) ,
  .acsnoop_qtw      ( TCU_ACSNOOP            ) ,
  .acvmidext_qtw    ( TCU_ACVMIDEXT          ) ,
  .crvalid_qtw      ( TCU_CRVALID            ) ,
  .crready_qtw      ( TCU_CRREADY            ) ,
  .crresp_qtw       ( TCU_CRRESP             ) ,
  .awakeup_qtw      ( TCU_AWAKEUP            ) ,
  .acwakeup_qtw     ( TCU_ACWAKEUP           ) ,
  .syscoreq         ( TCU_SYSCOREQ           ) ,
  .syscoack         ( TCU_SYSCOACK           ) ,

  .paddr_prog       ( tcu_paddr[20:0]        ) ,
  .pprot_prog       ( tcu_pprot              ) ,
  .psel_prog        ( tcu_psel               ) ,
  .penable_prog     ( tcu_penable            ) ,
  .pwrite_prog      ( tcu_pwrite             ) ,
  .pwdata_prog      ( tcu_pwdata             ) ,
  .pstrb_prog       ( tcu_pstrb              ) ,
  .pready_prog      ( tcu_pready             ) ,
  .prdata_prog      ( tcu_prdata             ) ,
  .pslverr_prog     ( tcu_pslverr            ) ,
  .pwakeup_prog     ( PWAKEUP                ) ,

  .tvalid_dti_up    ( tcu_tvalid_dti_up      ) ,
  .tready_dti_up    ( tcu_tready_dti_up      ) ,
  .tdata_dti_up     ( tcu_tdata_dti_up       ) ,
  .tkeep_dti_up     ( tcu_tkeep_dti_up       ) ,
  .tlast_dti_up     ( tcu_tlast_dti_up       ) ,
  .tdest_dti_up     ( tcu_tdest_dti_up       ) ,
  .twakeup_dti_up   ( tcu_twakeup_dti_up     ) ,
  .tvalid_dti_dn    ( tcu_tvalid_dti_dn      ) ,
  .tready_dti_dn    ( tcu_tready_dti_dn      ) ,
  .tdata_dti_dn     ( tcu_tdata_dti_dn       ) ,
  .tkeep_dti_dn     ( tcu_tkeep_dti_dn       ) ,
  .tlast_dti_dn     ( tcu_tlast_dti_dn       ) ,
  .tid_dti_dn       ( tcu_tid_dti_dn         ) ,
  .twakeup_dti_dn   ( tcu_twakeup_dti_dn     ) ,
  .qreqn_pd         ( 1'b1                   ) ,
  .qacceptn_pd      (                        ) ,
  .qdeny_pd         (                        ) ,
  .qactive_pd       (                        ) ,
  .qreqn_cg         ( 1'b1                   ) ,
  .qacceptn_cg      (                        ) ,
  .qdeny_cg         (                        ) ,
  .qactive_cg       (                        ) ,
  .pmusnapshot_req  ( 1'b0                   ) ,
  .pmusnapshot_ack  (                        ) ,
  .event_q_irpt_s   ( tcu_event_q_irpt_s     ) ,
  .event_q_irpt_ns  ( tcu_event_q_irpt_ns    ) ,
  .pri_q_irpt_ns    ( tcu_pri_q_irpt_ns      ) ,
  .cmd_sync_irpt_ns ( tcu_cmd_sync_irpt_ns   ) ,
  .cmd_sync_irpt_s  ( tcu_cmd_sync_irpt_s    ) ,
  .global_irpt_ns   ( tcu_global_irpt_ns     ) ,
  .global_irpt_s    ( tcu_global_irpt_s      ) ,
  .ras_irpt         ( tcu_ras_irpt           ) ,
  .pmu_irpt         ( tcu_pmu_irpt           ) ,
  .evento           (                        ) ,
  .sup_cohacc       ( `STATICCFG_SUP_COHACC   ) ,
  .sup_btm          ( `STATICCFG_SUP_BTM      ) ,
  .sup_sev          ( `STATICCFG_SUP_SEV      ) ,
  .sup_oas          ( `STATICCFG_SUP_OAS      ) ,
  .sec_override     ( `STATICCFG_SEC_OVERRIDE ) ,
  .ecorevnum        ( `STATICCFG_ECOREVNUM    ) ,
  .dftcgen          ( 1'b0                   ) ,
  .dftrstdisable    ( 1'b0                   ) ,
  .dftramhold       ( 1'b0                   ) ,
  .mbistresetn      ( 1'b1                   ) ,
  .mbistreq         ( 1'b0                   ) 
);

//----------------------------------------------------------------------------
// TBU #0~#7
//----------------------------------------------------------------------------
`ifdef AB_TEST_MMU_IN_TB

`MMU_TEST_MST_TEMPLATE(0);
`MMU_TEST_MST_TEMPLATE(1);
`MMU_TEST_MST_TEMPLATE(2);
`MMU_TEST_MST_TEMPLATE(3);
`MMU_TEST_MST_TEMPLATE(4);
`MMU_TEST_MST_TEMPLATE(5);
`MMU_TEST_MST_TEMPLATE(6);
`MMU_TEST_MST_TEMPLATE(7);

`else // AB_TEST_MMU_IN_TB

//  MMU TBU & ACE ADB(mst) instantiation
`MMUTBU_ACE5LADB_TEMPLATE(0,axemis0);
`MMUTBU_ACE5LADB_TEMPLATE(1,axemis1);
`MMUTBU_ACE5LADB_TEMPLATE(2,axemis2);
`MMUTBU_ACE5LADB_TEMPLATE(3,axemis3);
`MMUTBU_ACE5LADB_TEMPLATE(4,axemis4);
`MMUTBU_ACE5LADB_TEMPLATE(5,axemis5);
`MMUTBU_ACE5LADB_TEMPLATE(6,axemis6);
`MMUTBU_ACE5LADB_TEMPLATE(7,axemis7);

//`MMUTBU_A4SADB_TEMPLATE(0);
//`MMUTBU_A4SADB_TEMPLATE(1);
//`MMUTBU_A4SADB_TEMPLATE(2);
//`MMUTBU_A4SADB_TEMPLATE(3);
//`MMUTBU_A4SADB_TEMPLATE(4);
//`MMUTBU_A4SADB_TEMPLATE(5);
//`MMUTBU_A4SADB_TEMPLATE(6);
//`MMUTBU_A4SADB_TEMPLATE(7);

//`MMUTBU_INSTANCE(0);
//`MMUTBU_INSTANCE(1);
//`MMUTBU_INSTANCE(2);
//`MMUTBU_INSTANCE(3);
//`MMUTBU_INSTANCE(4);
//`MMUTBU_INSTANCE(5);
//`MMUTBU_INSTANCE(6);
//`MMUTBU_INSTANCE(7);

`endif // AB_TEST_MMU_IN_TB
//----------------------------------------------------------------------------
// DTI Base Switch 8x1 TOP
//----------------------------------------------------------------------------

// DTI TID values
assign tbu0_tid_dti_dn = 6'b000000;
assign tbu1_tid_dti_dn = 6'b000001;
assign tbu2_tid_dti_dn = 6'b000010;
assign tbu3_tid_dti_dn = 6'b000011;
assign tbu4_tid_dti_dn = 6'b000100;
assign tbu5_tid_dti_dn = 6'b000101;
assign tbu6_tid_dti_dn = 6'b000110;
assign tbu7_tid_dti_dn = 6'b000111;

mmu600_r2_bas_switch_8x1 #( 
    .DATA_WIDTH (`DTI_DATA_WIDTH) ,
    .ID_WIDTH   (`DTI_ID_WIDTH  ) ,
    .DECMIN_SI0 (`DTI_DECMIN_SI0) ,
    .DECMAX_SI0 (`DTI_DECMAX_SI0) ,
    .DECMIN_SI1 (`DTI_DECMIN_SI1) ,
    .DECMAX_SI1 (`DTI_DECMAX_SI1) ,
    .DECMIN_SI2 (`DTI_DECMIN_SI2) ,
    .DECMAX_SI2 (`DTI_DECMAX_SI2) ,
    .DECMIN_SI3 (`DTI_DECMIN_SI3) ,
    .DECMAX_SI3 (`DTI_DECMAX_SI3) ,
    .DECMIN_SI4 (`DTI_DECMIN_SI4) ,
    .DECMAX_SI4 (`DTI_DECMAX_SI4) ,
    .DECMIN_SI5 (`DTI_DECMIN_SI5) ,
    .DECMAX_SI5 (`DTI_DECMAX_SI5) ,
    .DECMIN_SI6 (`DTI_DECMIN_SI6) ,
    .DECMAX_SI6 (`DTI_DECMAX_SI6) ,
    .DECMIN_SI7 (`DTI_DECMIN_SI7) ,
    .DECMAX_SI7 (`DTI_DECMAX_SI7)
)
u_mmu600_r2_bas_switch_8x1_xemis
( 
    .aclk                       (TCU_CLK             ),
    .aresetn                    (TCU_RSTn            ),
    
    .tvalid_dti_dn_s0           (tbu0_tvalid_dti_dn  ),
    .tready_dti_dn_s0           (tbu0_tready_dti_dn  ),
    .tdata_dti_dn_s0            (tbu0_tdata_dti_dn   ),
    .tkeep_dti_dn_s0            (tbu0_tkeep_dti_dn   ),
    .tid_dti_dn_s0              (tbu0_tid_dti_dn     ),
    .tlast_dti_dn_s0            (tbu0_tlast_dti_dn   ),
    
    .tvalid_dti_dn_s1           (tbu1_tvalid_dti_dn  ),
    .tready_dti_dn_s1           (tbu1_tready_dti_dn  ),
    .tdata_dti_dn_s1            (tbu1_tdata_dti_dn   ),
    .tkeep_dti_dn_s1            (tbu1_tkeep_dti_dn   ),
    .tid_dti_dn_s1              (tbu1_tid_dti_dn     ),
    .tlast_dti_dn_s1            (tbu1_tlast_dti_dn   ),
    
    .tvalid_dti_dn_s2           (tbu2_tvalid_dti_dn  ),
    .tready_dti_dn_s2           (tbu2_tready_dti_dn  ),
    .tdata_dti_dn_s2            (tbu2_tdata_dti_dn   ),
    .tkeep_dti_dn_s2            (tbu2_tkeep_dti_dn   ),
    .tid_dti_dn_s2              (tbu2_tid_dti_dn     ),
    .tlast_dti_dn_s2            (tbu2_tlast_dti_dn   ),
    
    .tvalid_dti_dn_s3           (tbu3_tvalid_dti_dn  ),
    .tready_dti_dn_s3           (tbu3_tready_dti_dn  ),
    .tdata_dti_dn_s3            (tbu3_tdata_dti_dn   ),
    .tkeep_dti_dn_s3            (tbu3_tkeep_dti_dn   ),
    .tid_dti_dn_s3              (tbu3_tid_dti_dn     ),
    .tlast_dti_dn_s3            (tbu3_tlast_dti_dn   ),

    .tvalid_dti_dn_s4           (tbu4_tvalid_dti_dn  ),
    .tready_dti_dn_s4           (tbu4_tready_dti_dn  ),
    .tdata_dti_dn_s4            (tbu4_tdata_dti_dn   ),
    .tkeep_dti_dn_s4            (tbu4_tkeep_dti_dn   ),
    .tid_dti_dn_s4              (tbu4_tid_dti_dn     ),
    .tlast_dti_dn_s4            (tbu4_tlast_dti_dn   ),

    .tvalid_dti_dn_s5           (tbu5_tvalid_dti_dn  ),
    .tready_dti_dn_s5           (tbu5_tready_dti_dn  ),
    .tdata_dti_dn_s5            (tbu5_tdata_dti_dn   ),
    .tkeep_dti_dn_s5            (tbu5_tkeep_dti_dn   ),
    .tid_dti_dn_s5              (tbu5_tid_dti_dn     ),
    .tlast_dti_dn_s5            (tbu5_tlast_dti_dn   ),

    .tvalid_dti_dn_s6           (tbu6_tvalid_dti_dn  ),
    .tready_dti_dn_s6           (tbu6_tready_dti_dn  ),
    .tdata_dti_dn_s6            (tbu6_tdata_dti_dn   ),
    .tkeep_dti_dn_s6            (tbu6_tkeep_dti_dn   ),
    .tid_dti_dn_s6              (tbu6_tid_dti_dn     ),
    .tlast_dti_dn_s6            (tbu6_tlast_dti_dn   ),

    .tvalid_dti_dn_s7           (tbu7_tvalid_dti_dn  ),
    .tready_dti_dn_s7           (tbu7_tready_dti_dn  ),
    .tdata_dti_dn_s7            (tbu7_tdata_dti_dn   ),
    .tkeep_dti_dn_s7            (tbu7_tkeep_dti_dn   ),
    .tid_dti_dn_s7              (tbu7_tid_dti_dn     ),
    .tlast_dti_dn_s7            (tbu7_tlast_dti_dn   ),
    
    .tvalid_dti_dn_m            (tcu_tvalid_dti_dn   ),
    .tready_dti_dn_m            (tcu_tready_dti_dn   ),
    .tdata_dti_dn_m             (tcu_tdata_dti_dn    ),
    .tkeep_dti_dn_m             (tcu_tkeep_dti_dn    ),
    .tid_dti_dn_m               (tcu_tid_dti_dn      ),
    .tlast_dti_dn_m             (tcu_tlast_dti_dn    ),
    
    .tvalid_dti_up_s0           (tbu0_tvalid_dti_up  ),
    .tready_dti_up_s0           (tbu0_tready_dti_up  ),
    .tdata_dti_up_s0            (tbu0_tdata_dti_up   ),
    .tkeep_dti_up_s0            (tbu0_tkeep_dti_up   ),
    .tdest_dti_up_s0            (tbu0_tdest_dti_up   ),
    .tlast_dti_up_s0            (tbu0_tlast_dti_up   ),
    
    .tvalid_dti_up_s1           (tbu1_tvalid_dti_up  ),
    .tready_dti_up_s1           (tbu1_tready_dti_up  ),
    .tdata_dti_up_s1            (tbu1_tdata_dti_up   ),
    .tkeep_dti_up_s1            (tbu1_tkeep_dti_up   ),
    .tdest_dti_up_s1            (tbu1_tdest_dti_up   ),
    .tlast_dti_up_s1            (tbu1_tlast_dti_up   ),
    
    .tvalid_dti_up_s2           (tbu2_tvalid_dti_up  ),
    .tready_dti_up_s2           (tbu2_tready_dti_up  ),
    .tdata_dti_up_s2            (tbu2_tdata_dti_up   ),
    .tkeep_dti_up_s2            (tbu2_tkeep_dti_up   ),
    .tdest_dti_up_s2            (tbu2_tdest_dti_up   ),
    .tlast_dti_up_s2            (tbu2_tlast_dti_up   ),
    
    .tvalid_dti_up_s3           (tbu3_tvalid_dti_up  ),
    .tready_dti_up_s3           (tbu3_tready_dti_up  ),
    .tdata_dti_up_s3            (tbu3_tdata_dti_up   ),
    .tkeep_dti_up_s3            (tbu3_tkeep_dti_up   ),
    .tdest_dti_up_s3            (tbu3_tdest_dti_up   ),
    .tlast_dti_up_s3            (tbu3_tlast_dti_up   ),
    
    .tvalid_dti_up_s4           (tbu4_tvalid_dti_up  ),
    .tready_dti_up_s4           (tbu4_tready_dti_up  ),
    .tdata_dti_up_s4            (tbu4_tdata_dti_up   ),
    .tkeep_dti_up_s4            (tbu4_tkeep_dti_up   ),
    .tdest_dti_up_s4            (tbu4_tdest_dti_up   ),
    .tlast_dti_up_s4            (tbu4_tlast_dti_up   ),

    .tvalid_dti_up_s5           (tbu5_tvalid_dti_up  ),
    .tready_dti_up_s5           (tbu5_tready_dti_up  ),
    .tdata_dti_up_s5            (tbu5_tdata_dti_up   ),
    .tkeep_dti_up_s5            (tbu5_tkeep_dti_up   ),
    .tdest_dti_up_s5            (tbu5_tdest_dti_up   ),
    .tlast_dti_up_s5            (tbu5_tlast_dti_up   ),

    .tvalid_dti_up_s6           (tbu6_tvalid_dti_up  ),
    .tready_dti_up_s6           (tbu6_tready_dti_up  ),
    .tdata_dti_up_s6            (tbu6_tdata_dti_up   ),
    .tkeep_dti_up_s6            (tbu6_tkeep_dti_up   ),
    .tdest_dti_up_s6            (tbu6_tdest_dti_up   ),
    .tlast_dti_up_s6            (tbu6_tlast_dti_up   ),
    
    .tvalid_dti_up_s7           (tbu7_tvalid_dti_up  ),
    .tready_dti_up_s7           (tbu7_tready_dti_up  ),
    .tdata_dti_up_s7            (tbu7_tdata_dti_up   ),
    .tkeep_dti_up_s7            (tbu7_tkeep_dti_up   ),
    .tdest_dti_up_s7            (tbu7_tdest_dti_up   ),
    .tlast_dti_up_s7            (tbu7_tlast_dti_up   ),

    .tvalid_dti_up_m            (tcu_tvalid_dti_up   ),
    .tready_dti_up_m            (tcu_tready_dti_up   ),
    .tdata_dti_up_m             (tcu_tdata_dti_up    ),
    .tkeep_dti_up_m             (tcu_tkeep_dti_up    ),
    .tdest_dti_up_m             (tcu_tdest_dti_up    ),
    .tlast_dti_up_m             (tcu_tlast_dti_up    ),
    
    .twakeup_dti_dn_s0          (tbu0_twakeup_dti_dn ),
    .twakeup_dti_dn_s1          (tbu1_twakeup_dti_dn ),
    .twakeup_dti_dn_s2          (tbu2_twakeup_dti_dn ),
    .twakeup_dti_dn_s3          (tbu3_twakeup_dti_dn ),
    .twakeup_dti_dn_s4          (tbu4_twakeup_dti_dn ),
    .twakeup_dti_dn_s5          (tbu5_twakeup_dti_dn ),
    .twakeup_dti_dn_s6          (tbu6_twakeup_dti_dn ),
    .twakeup_dti_dn_s7          (tbu7_twakeup_dti_dn ),
    .twakeup_dti_dn_m           (tcu_twakeup_dti_dn  ),
    
    .twakeup_dti_up_s0          (tbu0_twakeup_dti_up ),
    .twakeup_dti_up_s1          (tbu1_twakeup_dti_up ),
    .twakeup_dti_up_s2          (tbu2_twakeup_dti_up ),
    .twakeup_dti_up_s3          (tbu3_twakeup_dti_up ),
    .twakeup_dti_up_s4          (tbu4_twakeup_dti_up ),
    .twakeup_dti_up_s5          (tbu5_twakeup_dti_up ),
    .twakeup_dti_up_s6          (tbu6_twakeup_dti_up ),
    .twakeup_dti_up_s7          (tbu7_twakeup_dti_up ),
    .twakeup_dti_up_m           (tcu_twakeup_dti_up  ) 
);

endmodule
