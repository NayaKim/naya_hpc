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

`define TBU_ACE5L_PORT(num)  \
    output wire                                        TBU``num``_ACLKEN              ,   \
    output wire                                        TBU``num``_AWAKEUP             ,   \
    output wire [10:0]                                 TBU``num``_AWID                ,   \
    output wire [47:0]                                 TBU``num``_AWADDR              ,   \
    output wire [7:0]                                  TBU``num``_AWLEN               ,   \
    output wire [2:0]                                  TBU``num``_AWSIZE              ,   \
    output wire [1:0]                                  TBU``num``_AWBURST             ,   \
    output wire                                        TBU``num``_AWLOCK              ,   \
    output wire [3:0]                                  TBU``num``_AWCACHE             ,   \
    output wire [2:0]                                  TBU``num``_AWPROT              ,   \
    output wire [1:0]                                  TBU``num``_AWDOMAIN            ,   \
    output wire [3:0]                                  TBU``num``_AWSNOOP             ,   \
    output wire [3:0]                                  TBU``num``_AWQOS               ,   \
    output wire [3:0]                                  TBU``num``_AWNSAID             ,   \
    output wire [7:0]                                  TBU``num``_AWUSER              ,   \
    output wire [5:0]                                  TBU``num``_AWATOP              ,   \
    output wire [10:0]                                 TBU``num``_AWSTASHNID          ,   \
    output wire                                        TBU``num``_AWSTASHNIDEN        ,   \
    output wire [4:0]                                  TBU``num``_AWSTASHLPID         ,   \
    output wire                                        TBU``num``_AWSTASHLPIDEN       ,   \
    output wire                                        TBU``num``_AWTRACE             ,   \
    output wire [10:0]                                 TBU``num``_AWMPAM              ,   \
    output wire                                        TBU``num``_AWIDUNQ             ,   \
    output wire [1:0]                                  TBU``num``_AWTAGOP             ,   \
    output wire [1:0]                                  TBU``num``_AWLOOP              ,   \
    output wire [1:0]                                  TBU``num``_AWCMO               ,   \
    output wire                                        TBU``num``_AWVALID             ,   \
    input  wire                                        TBU``num``_AWREADY             ,   \
    output wire [`TBUCFG_DATA_WIDTH-1:0]               TBU``num``_WDATA               ,   \
    output wire [(`TBUCFG_DATA_WIDTH/8)-1:0]           TBU``num``_WSTRB               ,   \
    output wire                                        TBU``num``_WLAST               ,   \
    output wire                                        TBU``num``_WUSER               ,   \
    output wire                                        TBU``num``_WTRACE              ,   \
    output wire [(`TBUCFG_DATA_WIDTH/128)*4-1:0]       TBU``num``_WTAG                ,   \
    output wire [(`TBUCFG_DATA_WIDTH/128)-1:0]         TBU``num``_WTAGUPDATE          ,   \
    output wire [(`TBUCFG_DATA_WIDTH/64)-1:0]          TBU``num``_WPOISON             ,   \
    output wire [(`TBUCFG_DATA_WIDTH/8)-1:0]           TBU``num``_WDATACHK            ,   \
    output wire                                        TBU``num``_WVALID              ,   \
    input  wire                                        TBU``num``_WREADY              ,   \
    input  wire [10:0]                                 TBU``num``_BID                 ,   \
    input  wire [1:0]                                  TBU``num``_BRESP               ,   \
    input  wire [3:0]                                  TBU``num``_BUSER               ,   \
    input  wire                                        TBU``num``_BTRACE              ,   \
    input  wire                                        TBU``num``_BIDUNQ              ,   \
    input  wire [1:0]                                  TBU``num``_BLOOP               ,   \
    input  wire                                        TBU``num``_BCOMP               ,   \
    input  wire                                        TBU``num``_BPERSIST            ,   \
    input  wire                                        TBU``num``_BVALID              ,   \
    output wire                                        TBU``num``_BREADY              ,   \
    output wire [10:0]                                 TBU``num``_ARID                ,   \
    output wire [47:0]                                 TBU``num``_ARADDR              ,   \
    output wire [7:0]                                  TBU``num``_ARLEN               ,   \
    output wire [2:0]                                  TBU``num``_ARSIZE              ,   \
    output wire [1:0]                                  TBU``num``_ARBURST             ,   \
    output wire                                        TBU``num``_ARLOCK              ,   \
    output wire [3:0]                                  TBU``num``_ARCACHE             ,   \
    output wire [2:0]                                  TBU``num``_ARPROT              ,   \
    output wire [1:0]                                  TBU``num``_ARDOMAIN            ,   \
    output wire [3:0]                                  TBU``num``_ARSNOOP             ,   \
    output wire [3:0]                                  TBU``num``_ARQOS               ,   \
    output wire [3:0]                                  TBU``num``_ARNSAID             ,   \
    output wire [7:0]                                  TBU``num``_ARUSER              ,   \
    output wire                                        TBU``num``_ARTRACE             ,   \
    output wire [10:0]                                 TBU``num``_ARMPAM              ,   \
    output wire                                        TBU``num``_ARIDUNQ             ,   \
    output wire [1:0]                                  TBU``num``_ARTAGOP             ,   \
    output wire [1:0]                                  TBU``num``_ARLOOP              ,   \
    output wire                                        TBU``num``_ARCHUNKEN           ,   \
    output wire                                        TBU``num``_ARVALID             ,   \
    input  wire                                        TBU``num``_ARREADY             ,   \
    input  wire [10:0]                                 TBU``num``_RID                 ,   \
    input  wire [`TBUCFG_DATA_WIDTH-1:0]               TBU``num``_RDATA               ,   \
    input  wire [2:0]                                  TBU``num``_RRESP               ,   \
    input  wire                                        TBU``num``_RLAST               ,   \
    input  wire                                        TBU``num``_RUSER               ,   \
    input  wire                                        TBU``num``_RTRACE              ,   \
    input  wire [(`TBUCFG_DATA_WIDTH/64)-1:0]          TBU``num``_RPOISON             ,   \
    input  wire [(`TBUCFG_DATA_WIDTH/8)-1:0]           TBU``num``_RDATACHK            ,   \
    input  wire                                        TBU``num``_RIDUNQ              ,   \
    input  wire [1:0]                                  TBU``num``_RLOOP               ,   \
    input  wire                                        TBU``num``_RCHUNKV             ,   \
    input  wire [`AXEMIS_RCHUNKNUM_WIDTH-1:0]          TBU``num``_RCHUNKNUM           ,   \
    input  wire [`AXEMIS_RCHUNKSTRB_WIDTH-1:0]         TBU``num``_RCHUNKSTRB          ,   \
    input  wire                                        TBU``num``_RVALID              ,   \
    output wire                                        TBU``num``_RREADY

`define TBU_ACE5L_PORT_CONNECT(num) \
    .TBU``num``_ACLKEN               ( TBU``num``_ACLKEN           ),             \
    .TBU``num``_AWAKEUP              ( TBU``num``_AWAKEUP          ),             \
    .TBU``num``_AWID                 ( TBU``num``_AWID             ),             \
    .TBU``num``_AWADDR               ( TBU``num``_AWADDR           ),             \
    .TBU``num``_AWLEN                ( TBU``num``_AWLEN            ),             \
    .TBU``num``_AWSIZE               ( TBU``num``_AWSIZE           ),             \
    .TBU``num``_AWBURST              ( TBU``num``_AWBURST          ),             \
    .TBU``num``_AWLOCK               ( TBU``num``_AWLOCK           ),             \
    .TBU``num``_AWCACHE              ( TBU``num``_AWCACHE          ),             \
    .TBU``num``_AWPROT               ( TBU``num``_AWPROT           ),             \
    .TBU``num``_AWDOMAIN             ( TBU``num``_AWDOMAIN         ),             \
    .TBU``num``_AWSNOOP              ( TBU``num``_AWSNOOP          ),             \
    .TBU``num``_AWTAGOP              ( TBU``num``_AWTAGOP          ),             \
    .TBU``num``_AWQOS                ( TBU``num``_AWQOS            ),             \
    .TBU``num``_AWNSAID              ( TBU``num``_AWNSAID          ),             \
    .TBU``num``_AWUSER               ( TBU``num``_AWUSER           ),             \
    .TBU``num``_AWATOP               ( TBU``num``_AWATOP           ),             \
    .TBU``num``_AWSTASHNID           ( TBU``num``_AWSTASHNID       ),             \
    .TBU``num``_AWSTASHNIDEN         ( TBU``num``_AWSTASHNIDEN     ),             \
    .TBU``num``_AWSTASHLPID          ( TBU``num``_AWSTASHLPID      ),             \
    .TBU``num``_AWSTASHLPIDEN        ( TBU``num``_AWSTASHLPIDEN    ),             \
    .TBU``num``_AWTRACE              ( TBU``num``_AWTRACE          ),             \
    .TBU``num``_AWMPAM               ( TBU``num``_AWMPAM           ),             \
    .TBU``num``_AWIDUNQ              ( TBU``num``_AWIDUNQ          ),             \
    .TBU``num``_AWLOOP               ( TBU``num``_AWLOOP           ),             \
    .TBU``num``_AWCMO                ( TBU``num``_AWCMO            ),             \
    .TBU``num``_AWVALID              ( TBU``num``_AWVALID          ),             \
    .TBU``num``_AWREADY              ( TBU``num``_AWREADY          ),             \
    .TBU``num``_WDATA                ( TBU``num``_WDATA            ),             \
    .TBU``num``_WSTRB                ( TBU``num``_WSTRB            ),             \
    .TBU``num``_WLAST                ( TBU``num``_WLAST            ),             \
    .TBU``num``_WUSER                ( TBU``num``_WUSER            ),             \
    .TBU``num``_WTRACE               ( TBU``num``_WTRACE           ),             \
    .TBU``num``_WPOISON              ( TBU``num``_WPOISON          ),             \
    .TBU``num``_WDATACHK             ( TBU``num``_WDATACHK         ),             \
    .TBU``num``_WTAGUPDATE           ( TBU``num``_WTAGUPDATE       ),             \
    .TBU``num``_WTAG                 ( TBU``num``_WTAG             ),             \
    .TBU``num``_WVALID               ( TBU``num``_WVALID           ),             \
    .TBU``num``_WREADY               ( TBU``num``_WREADY           ),             \
    .TBU``num``_BID                  ( TBU``num``_BID              ),             \
    .TBU``num``_BRESP                ( TBU``num``_BRESP            ),             \
    .TBU``num``_BUSER                ( TBU``num``_BUSER            ),             \
    .TBU``num``_BTRACE               ( TBU``num``_BTRACE           ),             \
    .TBU``num``_BIDUNQ               ( TBU``num``_BIDUNQ           ),             \
    .TBU``num``_BLOOP                ( TBU``num``_BLOOP            ),             \
    .TBU``num``_BCOMP                ( TBU``num``_BCOMP            ),             \
    .TBU``num``_BPERSIST             ( TBU``num``_BPERSIST         ),             \
    .TBU``num``_BVALID               ( TBU``num``_BVALID           ),             \
    .TBU``num``_BREADY               ( TBU``num``_BREADY           ),             \
    .TBU``num``_ARID                 ( TBU``num``_ARID             ),             \
    .TBU``num``_ARADDR               ( TBU``num``_ARADDR           ),             \
    .TBU``num``_ARLEN                ( TBU``num``_ARLEN            ),             \
    .TBU``num``_ARSIZE               ( TBU``num``_ARSIZE           ),             \
    .TBU``num``_ARBURST              ( TBU``num``_ARBURST          ),             \
    .TBU``num``_ARLOCK               ( TBU``num``_ARLOCK           ),             \
    .TBU``num``_ARCACHE              ( TBU``num``_ARCACHE          ),             \
    .TBU``num``_ARPROT               ( TBU``num``_ARPROT           ),             \
    .TBU``num``_ARDOMAIN             ( TBU``num``_ARDOMAIN         ),             \
    .TBU``num``_ARSNOOP              ( TBU``num``_ARSNOOP          ),             \
    .TBU``num``_ARTAGOP              ( TBU``num``_ARTAGOP          ),             \
    .TBU``num``_ARQOS                ( TBU``num``_ARQOS            ),             \
    .TBU``num``_ARNSAID              ( TBU``num``_ARNSAID          ),             \
    .TBU``num``_ARUSER               ( TBU``num``_ARUSER           ),             \
    .TBU``num``_ARTRACE              ( TBU``num``_ARTRACE          ),             \
    .TBU``num``_ARMPAM               ( TBU``num``_ARMPAM           ),             \
    .TBU``num``_ARIDUNQ              ( TBU``num``_ARIDUNQ          ),             \
    .TBU``num``_ARLOOP               ( TBU``num``_ARLOOP           ),             \
    .TBU``num``_ARCHUNKEN            ( TBU``num``_ARCHUNKEN        ),             \
    .TBU``num``_ARVALID              ( TBU``num``_ARVALID          ),             \
    .TBU``num``_ARREADY              ( TBU``num``_ARREADY          ),             \
    .TBU``num``_RID                  ( TBU``num``_RID              ),             \
    .TBU``num``_RDATA                ( TBU``num``_RDATA            ),             \
    .TBU``num``_RRESP                ( TBU``num``_RRESP            ),             \
    .TBU``num``_RLAST                ( TBU``num``_RLAST            ),             \
    .TBU``num``_RUSER                ( TBU``num``_RUSER            ),             \
    .TBU``num``_RTRACE               ( TBU``num``_RTRACE           ),             \
    .TBU``num``_RPOISON              ( TBU``num``_RPOISON          ),             \
    .TBU``num``_RDATACHK             ( TBU``num``_RDATACHK         ),             \
    .TBU``num``_RIDUNQ               ( TBU``num``_RIDUNQ           ),             \
    .TBU``num``_RLOOP                ( TBU``num``_RLOOP            ),             \
    .TBU``num``_RCHUNKV              ( TBU``num``_RCHUNKV          ),             \
    .TBU``num``_RCHUNKNUM            ( TBU``num``_RCHUNKNUM        ),             \
    .TBU``num``_RCHUNKSTRB           ( TBU``num``_RCHUNKSTRB       ),             \
    .TBU``num``_RVALID               ( TBU``num``_RVALID           ),             \
    .TBU``num``_RREADY               ( TBU``num``_RREADY           )

`define AXEMIS_POWER_PORT(prefix)   \
    input wire [10:0]               prefix``_PWR_PACTIVE     ,   \
    output wire                     prefix``_PWR_PREQ        ,   \
    input wire                      prefix``_PWR_PACCEPT     ,   \
    input wire                      prefix``_PWR_PDENY       ,   \
    output wire [3:0]               prefix``_PWR_PSTATE      ,   \
    input wire                      prefix``_CLK_QACTIVE     ,   \
    output wire                     prefix``_CLK_QREQn       ,   \
    input wire                      prefix``_CLK_QACCEPTn    ,   \
    input wire                      prefix``_CLK_QDENY

`define AXEMIS_POWER_PORT_CONNECT(prefix0,prefix1)   \
    .``prefix0``_PWR_PACTIVE                 (``prefix1``_pwr_pactive    ),   \
    .``prefix0``_PWR_PREQ                    (``prefix1``_pwr_preq       ),   \
    .``prefix0``_PWR_PACCEPT                 (``prefix1``_pwr_paccept    ),   \
    .``prefix0``_PWR_PDENY                   (``prefix1``_pwr_pdeny      ),   \
    .``prefix0``_PWR_PSTATE                  (``prefix1``_pwr_pstate     ),   \
    .``prefix0``_CLK_QACTIVE                 (``prefix1``_clk_qactive    ),   \
    .``prefix0``_CLK_QREQn                   (``prefix1``_clk_qreqn      ),   \
    .``prefix0``_CLK_QACCEPTn                (``prefix1``_clk_qacceptn   ),   \
    .``prefix0``_CLK_QDENY                   (``prefix1``_clk_qdeny      )


`define AXEMIS_ACE5LADB_POWER_PORT(prefix)   \
    output wire                     prefix``_ACE5LADB_PWR_QACTIVE     ,   \
    input wire                      prefix``_ACE5LADB_PWR_QREQn       ,   \
    output wire                     prefix``_ACE5LADB_PWR_QACCEPTn    ,   \
    output wire                     prefix``_ACE5LADB_PWR_QDENY       ,   \
    output wire                     prefix``_ACE5LADB_CLK_QACTIVE     ,   \
    input wire                      prefix``_ACE5LADB_CLK_QREQn       ,   \
    output wire                     prefix``_ACE5LADB_CLK_QACCEPTn    ,   \
    output wire                     prefix``_ACE5LADB_CLK_QDENY

`define AXEMIS_ACE5LADB_POWER_PORT_CONNECT(prefix0,prefix1)   \
    .``prefix0``_ACE5LADB_PWR_QACTIVE        (``prefix1``_ace5ladb_pwr_qactive    ),   \
    .``prefix0``_ACE5LADB_PWR_QREQn          (``prefix1``_ace5ladb_pwr_qreqn      ),   \
    .``prefix0``_ACE5LADB_PWR_QACCEPTn       (``prefix1``_ace5ladb_pwr_qacceptn   ),   \
    .``prefix0``_ACE5LADB_PWR_QDENY          (``prefix1``_ace5ladb_pwr_qdeny      ),   \
    .``prefix0``_ACE5LADB_CLK_QACTIVE        (``prefix1``_ace5ladb_clk_qactive    ),   \
    .``prefix0``_ACE5LADB_CLK_QREQn          (``prefix1``_ace5ladb_clk_qreqn      ),   \
    .``prefix0``_ACE5LADB_CLK_QACCEPTn       (``prefix1``_ace5ladb_clk_qacceptn   ),   \
    .``prefix0``_ACE5LADB_CLK_QDENY          (``prefix1``_ace5ladb_clk_qdeny      )

`define AXEMIS_ACE5LADB_ASYNC_SLV_PORT(prefix)    \
    output wire                                     prefix``_SLVMUSTACCEPTREQN_ASYNC ,        \
    output wire                                     prefix``_SLVCANDENYREQN_ASYNC    ,        \
    input  wire                                     prefix``_SLVACCEPTN_ASYNC        ,        \
    input  wire                                     prefix``_SLVDENY_ASYNC           ,        \
    output wire                                     prefix``_SI_TO_MI_WAKEUP_ASYNC   ,        \
    input  wire                                     prefix``_MI_TO_SI_WAKEUP_ASYNC   ,        \
    output wire [ADB400_AW_FIFO_DEPTH-1:0]          prefix``_AW_WR_PTR_ASYNC         ,        \
    input  wire [ADB400_AW_FIFO_DEPTH-1:0]          prefix``_AW_RD_PTR_ASYNC         ,        \
    output wire [`AXEMIS_ADB_AW_PAYLOAD_WIDTH-1:0]  prefix``_AW_PAYLD_ASYNC          ,        \
    output wire [ ADB400_W_FIFO_DEPTH-1:0]          prefix``_W_WR_PTR_ASYNC          ,        \
    input  wire [ ADB400_W_FIFO_DEPTH-1:0]          prefix``_W_RD_PTR_ASYNC          ,        \
    output wire [`AXEMIS_ADB_W_PAYLOAD_WIDTH-1:0]   prefix``_W_PAYLD_ASYNC           ,        \
    input  wire [ ADB400_B_FIFO_DEPTH-1:0]          prefix``_B_WR_PTR_ASYNC          ,        \
    output wire [ ADB400_B_FIFO_DEPTH-1:0]          prefix``_B_RD_PTR_ASYNC          ,        \
    input  wire [`AXEMIS_ADB_B_PAYLOAD_WIDTH-1:0]   prefix``_B_PAYLD_ASYNC           ,        \
    output wire [ADB400_AR_FIFO_DEPTH-1:0]          prefix``_AR_WR_PTR_ASYNC         ,        \
    input  wire [ADB400_AR_FIFO_DEPTH-1:0]          prefix``_AR_RD_PTR_ASYNC         ,        \
    output wire [`AXEMIS_ADB_AR_PAYLOAD_WIDTH-1:0]  prefix``_AR_PAYLD_ASYNC          ,        \
    input  wire [ ADB400_R_FIFO_DEPTH-1:0]          prefix``_R_WR_PTR_ASYNC          ,        \
    output wire [ ADB400_R_FIFO_DEPTH-1:0]          prefix``_R_RD_PTR_ASYNC          ,        \
    input  wire [`AXEMIS_ADB_R_PAYLOAD_WIDTH-1:0]   prefix``_R_PAYLD_ASYNC

`define AXEMIS_ACE5LADB_ASYNC_MST_PORT(prefix)    \
    input  wire                                     prefix``_SLVMUSTACCEPTREQN_ASYNC ,        \
    input  wire                                     prefix``_SLVCANDENYREQN_ASYNC    ,        \
    output wire                                     prefix``_SLVACCEPTN_ASYNC        ,        \
    output wire                                     prefix``_SLVDENY_ASYNC           ,        \
    input  wire                                     prefix``_SI_TO_MI_WAKEUP_ASYNC   ,        \
    output wire                                     prefix``_MI_TO_SI_WAKEUP_ASYNC   ,        \
    input  wire [`ADB400_AW_FIFO_DEPTH-1:0]         prefix``_AW_WR_PTR_ASYNC         ,        \
    output wire [`ADB400_AW_FIFO_DEPTH-1:0]         prefix``_AW_RD_PTR_ASYNC         ,        \
    input  wire [`AXEMIS_ADB_AW_PAYLOAD_WIDTH-1:0]  prefix``_AW_PAYLD_ASYNC          ,        \
    input  wire [`ADB400_W_FIFO_DEPTH-1:0]          prefix``_W_WR_PTR_ASYNC          ,        \
    output wire [`ADB400_W_FIFO_DEPTH-1:0]          prefix``_W_RD_PTR_ASYNC          ,        \
    input  wire [`AXEMIS_ADB_W_PAYLOAD_WIDTH-1:0]   prefix``_W_PAYLD_ASYNC           ,        \
    output wire [`ADB400_B_FIFO_DEPTH-1:0]          prefix``_B_WR_PTR_ASYNC          ,        \
    input  wire [`ADB400_B_FIFO_DEPTH-1:0]          prefix``_B_RD_PTR_ASYNC          ,        \
    output wire [`AXEMIS_ADB_B_PAYLOAD_WIDTH-1:0]   prefix``_B_PAYLD_ASYNC           ,        \
    input  wire [`ADB400_AR_FIFO_DEPTH-1:0]         prefix``_AR_WR_PTR_ASYNC         ,        \
    output wire [`ADB400_AR_FIFO_DEPTH-1:0]         prefix``_AR_RD_PTR_ASYNC         ,        \
    input  wire [`AXEMIS_ADB_AR_PAYLOAD_WIDTH-1:0]  prefix``_AR_PAYLD_ASYNC          ,        \
    output wire [`ADB400_R_FIFO_DEPTH-1:0]          prefix``_R_WR_PTR_ASYNC          ,        \
    input  wire [`ADB400_R_FIFO_DEPTH-1:0]          prefix``_R_RD_PTR_ASYNC          ,        \
    output wire [`AXEMIS_ADB_R_PAYLOAD_WIDTH-1:0]   prefix``_R_PAYLD_ASYNC

`define AXEMIS_ACE5LADB_ASYNC_PORT_CONNECT(prefix0,prefix1)    \
    .``prefix0``_SLVMUSTACCEPTREQN_ASYNC    (``prefix1``_slvmustacceptreqn_async           ),        \
    .``prefix0``_SLVCANDENYREQN_ASYNC       (``prefix1``_slvcandenyreqn_async              ),        \
    .``prefix0``_SLVACCEPTN_ASYNC           (``prefix1``_slvacceptn_async                  ),        \
    .``prefix0``_SLVDENY_ASYNC              (``prefix1``_slvdeny_async                     ),        \
    .``prefix0``_SI_TO_MI_WAKEUP_ASYNC      (``prefix1``_si_to_mi_wakeup_async             ),        \
    .``prefix0``_MI_TO_SI_WAKEUP_ASYNC      (``prefix1``_mi_to_si_wakeup_async             ),        \
    .``prefix0``_AW_WR_PTR_ASYNC            (``prefix1``_aw_wr_ptr_async                   ),        \
    .``prefix0``_AW_RD_PTR_ASYNC            (``prefix1``_aw_rd_ptr_async                   ),        \
    .``prefix0``_AW_PAYLD_ASYNC             (``prefix1``_aw_payld_async                    ),        \
    .``prefix0``_W_WR_PTR_ASYNC             (``prefix1``_w_wr_ptr_async                    ),        \
    .``prefix0``_W_RD_PTR_ASYNC             (``prefix1``_w_rd_ptr_async                    ),        \
    .``prefix0``_W_PAYLD_ASYNC              (``prefix1``_w_payld_async                     ),        \
    .``prefix0``_B_WR_PTR_ASYNC             (``prefix1``_b_wr_ptr_async                    ),        \
    .``prefix0``_B_RD_PTR_ASYNC             (``prefix1``_b_rd_ptr_async                    ),        \
    .``prefix0``_B_PAYLD_ASYNC              (``prefix1``_b_payld_async                     ),        \
    .``prefix0``_AR_WR_PTR_ASYNC            (``prefix1``_ar_wr_ptr_async                   ),        \
    .``prefix0``_AR_RD_PTR_ASYNC            (``prefix1``_ar_rd_ptr_async                   ),        \
    .``prefix0``_AR_PAYLD_ASYNC             (``prefix1``_ar_payld_async                    ),        \
    .``prefix0``_R_WR_PTR_ASYNC             (``prefix1``_r_wr_ptr_async                    ),        \
    .``prefix0``_R_RD_PTR_ASYNC             (``prefix1``_r_rd_ptr_async                    ),        \
    .``prefix0``_R_PAYLD_ASYNC              (``prefix1``_r_payld_async                     )

`define AXEMIS_ACE5L_PORT(prefix)    \
    input  wire                                 prefix``_AWVALID,                  \
    output wire                                 prefix``_AWREADY,                  \
    input  wire [`TBUCFG_ID_WIDTH-1:0]          prefix``_AWID,                     \
    input  wire [63:0]                          prefix``_AWADDR,                   \
    input  wire [7:0]                           prefix``_AWLEN,                    \
    input  wire [2:0]                           prefix``_AWSIZE,                   \
    input  wire [1:0]                           prefix``_AWBURST,                  \
    input  wire                                 prefix``_AWLOCK,                   \
    input  wire [3:0]                           prefix``_AWCACHE,                  \
    input  wire [2:0]                           prefix``_AWPROT,                   \
    input  wire [3:0]                           prefix``_AWQOS,                    \
    input  wire [3:0]                           prefix``_AWREGION,                 \
    input  wire [10:0]                          prefix``_AWSTASHNID,               \
    input  wire                                 prefix``_AWSTASHNIDEN,             \
    input  wire [4:0]                           prefix``_AWSTASHLPID,              \
    input  wire                                 prefix``_AWSTASHLPIDEN,            \
    input  wire [3:0]                           prefix``_AWSNOOP,                  \
    input  wire [`TBUCFG_AWUSER_WIDTH-1:0]      prefix``_AWUSER,                   \
    input  wire [1:0]                           prefix``_AWDOMAIN,                 \
    input  wire [`TBUCFG_SSID_WIDTH-1:0]        prefix``_AWMMUSSID,                \
    input  wire [`TBUCFG_SID_WIDTH-1:0]         prefix``_AWMMUSID,                 \
    input  wire                                 prefix``_AWMMUSSIDV,               \
    input  wire                                 prefix``_AWMMUSECSID,              \
    input  wire                                 prefix``_AWMMUATST,                \
    input  wire [5:0]                           prefix``_AWATOP,                   \
    input  wire                                 prefix``_ARVALID,                  \
    output wire                                 prefix``_ARREADY,                  \
    input  wire [`TBUCFG_ID_WIDTH-1:0]          prefix``_ARID,                     \
    input  wire [63:0]                          prefix``_ARADDR,                   \
    input  wire [7:0]                           prefix``_ARLEN,                    \
    input  wire [2:0]                           prefix``_ARSIZE,                   \
    input  wire [1:0]                           prefix``_ARBURST,                  \
    input  wire                                 prefix``_ARLOCK,                   \
    input  wire [3:0]                           prefix``_ARCACHE,                  \
    input  wire [2:0]                           prefix``_ARPROT,                   \
    input  wire [3:0]                           prefix``_ARQOS,                    \
    input  wire [3:0]                           prefix``_ARREGION,                 \
    input  wire [3:0]                           prefix``_ARSNOOP,                  \
    input  wire [`TBUCFG_ARUSER_WIDTH-1:0]      prefix``_ARUSER,                   \
    input  wire [1:0]                           prefix``_ARDOMAIN,                 \
    input  wire [`TBUCFG_SSID_WIDTH-1:0]        prefix``_ARMMUSSID,                \
    input  wire [`TBUCFG_SID_WIDTH-1:0]         prefix``_ARMMUSID,                 \
    input  wire                                 prefix``_ARMMUSSIDV,               \
    input  wire                                 prefix``_ARMMUSECSID,              \
    input  wire                                 prefix``_ARMMUATST,                \
    input  wire                                 prefix``_WVALID,                   \
    output wire                                 prefix``_WREADY,                   \
    input  wire [`TBUCFG_DATA_WIDTH-1:0]        prefix``_WDATA,                    \
    input  wire [`TBUCFG_DATA_WIDTH/8-1:0]      prefix``_WSTRB,                    \
    input  wire                                 prefix``_WLAST,                    \
    input  wire [`TBUCFG_WUSER_WIDTH-1:0]       prefix``_WUSER,                    \
    output wire                                 prefix``_RVALID,                   \
    input  wire                                 prefix``_RREADY,                   \
    output wire [`TBUCFG_ID_WIDTH-1:0]          prefix``_RID,                      \
    output wire [`TBUCFG_DATA_WIDTH-1:0]        prefix``_RDATA,                    \
    output wire [1:0]                           prefix``_RRESP,                    \
    output wire                                 prefix``_RLAST,                    \
    output wire [`TBUCFG_RUSER_WIDTH-1:0]       prefix``_RUSER,                    \
    output wire                                 prefix``_BVALID,                   \
    input  wire                                 prefix``_BREADY,                   \
    output wire [`TBUCFG_ID_WIDTH-1:0]          prefix``_BID,                      \
    output wire [1:0]                           prefix``_BRESP,                    \
    output wire [`TBUCFG_BUSER_WIDTH-1:0]       prefix``_BUSER,                    \
    input  wire                                 prefix``_AWAKEUP

`define AXEMIS_ACE5L_PORT_CONNECT(p_prefix, w_prefix)    \
    .``p_prefix``_AWVALID            ( ``w_prefix``_awvalid       ),      \
    .``p_prefix``_AWREADY            ( ``w_prefix``_awready       ),      \
    .``p_prefix``_AWID               ( ``w_prefix``_awid          ),      \
    .``p_prefix``_AWADDR             ( ``w_prefix``_awaddr        ),      \
    .``p_prefix``_AWLEN              ( ``w_prefix``_awlen         ),      \
    .``p_prefix``_AWSIZE             ( ``w_prefix``_awsize        ),      \
    .``p_prefix``_AWBURST            ( ``w_prefix``_awburst       ),      \
    .``p_prefix``_AWLOCK             ( ``w_prefix``_awlock        ),      \
    .``p_prefix``_AWCACHE            ( ``w_prefix``_awcache       ),      \
    .``p_prefix``_AWPROT             ( ``w_prefix``_awprot        ),      \
    .``p_prefix``_AWQOS              ( ``w_prefix``_awqos         ),      \
    .``p_prefix``_AWREGION           ( ``w_prefix``_awregion      ),      \
    .``p_prefix``_AWSTASHNID         ( ``w_prefix``_awstashnid    ),      \
    .``p_prefix``_AWSTASHNIDEN       ( ``w_prefix``_awstashniden  ),      \
    .``p_prefix``_AWSTASHLPID        ( ``w_prefix``_awstashlpid   ),      \
    .``p_prefix``_AWSTASHLPIDEN      ( ``w_prefix``_awstashlpiden ),      \
    .``p_prefix``_AWSNOOP            ( ``w_prefix``_awsnoop       ),      \
    .``p_prefix``_AWUSER             ( ``w_prefix``_awuser        ),      \
    .``p_prefix``_AWDOMAIN           ( ``w_prefix``_awdomain      ),      \
    .``p_prefix``_AWMMUSSID          ( ``w_prefix``_awmmussid     ),      \
    .``p_prefix``_AWMMUSID           ( ``w_prefix``_awmmusid      ),      \
    .``p_prefix``_AWMMUSSIDV         ( ``w_prefix``_awmmussidv    ),      \
    .``p_prefix``_AWMMUSECSID        ( ``w_prefix``_awmmusecsid   ),      \
    .``p_prefix``_AWMMUATST          ( ``w_prefix``_awmmuatst     ),      \
    .``p_prefix``_AWATOP             ( ``w_prefix``_awatop        ),      \
    .``p_prefix``_ARVALID            ( ``w_prefix``_arvalid       ),      \
    .``p_prefix``_ARREADY            ( ``w_prefix``_arready       ),      \
    .``p_prefix``_ARID               ( ``w_prefix``_arid          ),      \
    .``p_prefix``_ARADDR             ( ``w_prefix``_araddr        ),      \
    .``p_prefix``_ARLEN              ( ``w_prefix``_arlen         ),      \
    .``p_prefix``_ARSIZE             ( ``w_prefix``_arsize        ),      \
    .``p_prefix``_ARBURST            ( ``w_prefix``_arburst       ),      \
    .``p_prefix``_ARLOCK             ( ``w_prefix``_arlock        ),      \
    .``p_prefix``_ARCACHE            ( ``w_prefix``_arcache       ),      \
    .``p_prefix``_ARPROT             ( ``w_prefix``_arprot        ),      \
    .``p_prefix``_ARQOS              ( ``w_prefix``_arqos         ),      \
    .``p_prefix``_ARREGION           ( ``w_prefix``_arregion      ),      \
    .``p_prefix``_ARSNOOP            ( ``w_prefix``_arsnoop       ),      \
    .``p_prefix``_ARUSER             ( ``w_prefix``_aruser        ),      \
    .``p_prefix``_ARDOMAIN           ( ``w_prefix``_ardomain      ),      \
    .``p_prefix``_ARMMUSSID          ( ``w_prefix``_armmussid     ),      \
    .``p_prefix``_ARMMUSID           ( ``w_prefix``_armmusid      ),      \
    .``p_prefix``_ARMMUSSIDV         ( ``w_prefix``_armmussidv    ),      \
    .``p_prefix``_ARMMUSECSID        ( ``w_prefix``_armmusecsid   ),      \
    .``p_prefix``_ARMMUATST          ( ``w_prefix``_armmuatst     ),      \
    .``p_prefix``_WVALID             ( ``w_prefix``_wvalid        ),      \
    .``p_prefix``_WREADY             ( ``w_prefix``_wready        ),      \
    .``p_prefix``_WDATA              ( ``w_prefix``_wdata         ),      \
    .``p_prefix``_WSTRB              ( ``w_prefix``_wstrb         ),      \
    .``p_prefix``_WLAST              ( ``w_prefix``_wlast         ),      \
    .``p_prefix``_WUSER              ( ``w_prefix``_wuser         ),      \
    .``p_prefix``_RVALID             ( ``w_prefix``_rvalid        ),      \
    .``p_prefix``_RREADY             ( ``w_prefix``_rready        ),      \
    .``p_prefix``_RID                ( ``w_prefix``_rid           ),      \
    .``p_prefix``_RDATA              ( ``w_prefix``_rdata         ),      \
    .``p_prefix``_RRESP              ( ``w_prefix``_rresp         ),      \
    .``p_prefix``_RLAST              ( ``w_prefix``_rlast         ),      \
    .``p_prefix``_RUSER              ( ``w_prefix``_ruser         ),      \
    .``p_prefix``_BVALID             ( ``w_prefix``_bvalid        ),      \
    .``p_prefix``_BREADY             ( ``w_prefix``_bready        ),      \
    .``p_prefix``_BID                ( ``w_prefix``_bid           ),      \
    .``p_prefix``_BRESP              ( ``w_prefix``_bresp         ),      \
    .``p_prefix``_BUSER              ( ``w_prefix``_buser         ),      \
    .``p_prefix``_AWAKEUP            ( ``w_prefix``_awakeup       )


/*
`define TCU_ACE5L_PORT  \
    output wire                                        TCU_ACLKEN               ,   \
    output wire                                        TCU_AWAKEUP              ,   \
    output wire [10:0]                                 TCU_AWID                 ,   \
    output wire [47:0]                                 TCU_AWADDR               ,   \
    output wire [7:0]                                  TCU_AWLEN                ,   \
    output wire [2:0]                                  TCU_AWSIZE               ,   \
    output wire [1:0]                                  TCU_AWBURST              ,   \
    output wire                                        TCU_AWLOCK               ,   \
    output wire [3:0]                                  TCU_AWCACHE              ,   \
    output wire [2:0]                                  TCU_AWPROT               ,   \
    output wire [1:0]                                  TCU_AWDOMAIN             ,   \
    output wire [3:0]                                  TCU_AWSNOOP              ,   \
    output wire [3:0]                                  TCU_AWQOS                ,   \
    output wire [3:0]                                  TCU_AWNSAID              ,   \
    output wire [7:0]                                  TCU_AWUSER               ,   \
    output wire [5:0]                                  TCU_AWATOP               ,   \
    output wire [10:0]                                 TCU_AWSTASHNID           ,   \
    output wire                                        TCU_AWSTASHNIDEN         ,   \
    output wire [4:0]                                  TCU_AWSTASHLPID          ,   \
    output wire                                        TCU_AWSTASHLPIDEN        ,   \
    output wire                                        TCU_AWTRACE              ,   \
    output wire [10:0]                                 TCU_AWMPAM               ,   \
    output wire                                        TCU_AWIDUNQ              ,   \
    output wire [1:0]                                  TCU_AWTAGOP              ,   \
    output wire [1:0]                                  TCU_AWLOOP               ,   \
    output wire [1:0]                                  TCU_AWCMO                ,   \
    output wire                                        TCU_AWVALID              ,   \
    input  wire                                        TCU_AWREADY              ,   \
    output wire [TCUCFG_QTW_DATA_WIDTH-1:0]            TCU_WDATA                ,   \
    output wire [(TCUCFG_QTW_DATA_WIDTH/8)-1:0]        TCU_WSTRB                ,   \
    output wire                                        TCU_WLAST                ,   \
    output wire                                        TCU_WUSER                ,   \
    output wire                                        TCU_WTRACE               ,   \
    output wire [(TCUCFG_QTW_DATA_WIDTH/128)*4-1:0]    TCU_WTAG                 ,   \
    output wire [(TCUCFG_QTW_DATA_WIDTH/128)-1:0]      TCU_WTAGUPDATE           ,   \
    output wire [(TCUCFG_QTW_DATA_WIDTH/64)-1:0]       TCU_WPOISON              ,   \
    output wire [(TCUCFG_QTW_DATA_WIDTH/8)-1:0]        TCU_WDATACHK             ,   \
    output wire                                        TCU_WVALID               ,   \
    input  wire                                        TCU_WREADY               ,   \
    input  wire [10:0]                                 TCU_BID                  ,   \
    input  wire [1:0]                                  TCU_BRESP                ,   \
    input  wire [3:0]                                  TCU_BUSER                ,   \
    input  wire                                        TCU_BTRACE               ,   \
    input  wire                                        TCU_BIDUNQ               ,   \
    input  wire [1:0]                                  TCU_BLOOP                ,   \
    input  wire                                        TCU_BCOMP                ,   \
    input  wire                                        TCU_BPERSIST             ,   \
    input  wire                                        TCU_BVALID               ,   \
    output wire                                        TCU_BREADY               ,   \
    output wire [10:0]                                 TCU_ARID                 ,   \
    output wire [47:0]                                 TCU_ARADDR               ,   \
    output wire [7:0]                                  TCU_ARLEN                ,   \
    output wire [2:0]                                  TCU_ARSIZE               ,   \
    output wire [1:0]                                  TCU_ARBURST              ,   \
    output wire                                        TCU_ARLOCK               ,   \
    output wire [3:0]                                  TCU_ARCACHE              ,   \
    output wire [2:0]                                  TCU_ARPROT               ,   \
    output wire [1:0]                                  TCU_ARDOMAIN             ,   \
    output wire [3:0]                                  TCU_ARSNOOP              ,   \
    output wire [3:0]                                  TCU_ARQOS                ,   \
    output wire [3:0]                                  TCU_ARNSAID              ,   \
    output wire [7:0]                                  TCU_ARUSER               ,   \
    output wire                                        TCU_ARTRACE              ,   \
    output wire [10:0]                                 TCU_ARMPAM               ,   \
    output wire                                        TCU_ARIDUNQ              ,   \
    output wire [1:0]                                  TCU_ARTAGOP              ,   \
    output wire [1:0]                                  TCU_ARLOOP               ,   \
    output wire                                        TCU_ARCHUNKEN            ,   \
    output wire                                        TCU_ARVALID              ,   \
    input  wire                                        TCU_ARREADY              ,   \
    input  wire [10:0]                                 TCU_RID                  ,   \
    input  wire [TCUCFG_QTW_DATA_WIDTH-1:0]            TCU_RDATA                ,   \
    input  wire [2:0]                                  TCU_RRESP                ,   \
    input  wire                                        TCU_RLAST                ,   \
    input  wire                                        TCU_RUSER                ,   \
    input  wire                                        TCU_RTRACE               ,   \
    input  wire [(TCUCFG_QTW_DATA_WIDTH/64)-1:0]       TCU_RPOISON              ,   \
    input  wire [(TCUCFG_QTW_DATA_WIDTH/8)-1:0]        TCU_RDATACHK             ,   \
    input  wire                                        TCU_RIDUNQ               ,   \
    input  wire [1:0]                                  TCU_RLOOP                ,   \
    input  wire                                        TCU_RCHUNKV              ,   \
    input  wire [`AXEMIS_RCHUNKNUM_WIDTH-1:0]          TCU_RCHUNKNUM            ,   \
    input  wire [`AXEMIS_RCHUNKSTRB_WIDTH-1:0]         TCU_RCHUNKSTRB           ,   \
    input  wire                                        TCU_RVALID               ,   \
    output wire                                        TCU_RREADY               ,   \
    input  wire [47:0]                                 TCU_ACADDR               ,   \
    input  wire [3:0]                                  TCU_ACSNOOP              ,   \
    input  wire [2:0]                                  TCU_ACPROT               ,   \
    input  wire [3:0]                                  TCU_ACVMIDEXT            ,   \
    input  wire                                        TCU_ACTRACE              ,   \
    input  wire                                        TCU_ACVALID              ,   \
    output wire                                        TCU_ACREADY              ,   \
    input  wire                                        TCU_ACWAKEUP             ,   \
    output wire [4:0]                                  TCU_CRRESP               ,   \
    output wire                                        TCU_CRTRACE              ,   \
    output wire                                        TCU_CRVALID              ,   \
    input  wire                                        TCU_CRREADY              ,   \
    output wire                                        TCU_SYSCOREQ             ,   \
    input  wire                                        TCU_SYSCOACK

`define TCU_ACE5L_PORT_CONNECT \
    .TCU_ACLKEN                ( TCU_ACLKEN            ),         \
    .TCU_AWAKEUP               ( TCU_AWAKEUP           ),         \
    .TCU_AWID                  ( TCU_AWID              ),         \
    .TCU_AWADDR                ( TCU_AWADDR            ),         \
    .TCU_AWLEN                 ( TCU_AWLEN             ),         \
    .TCU_AWSIZE                ( TCU_AWSIZE            ),         \
    .TCU_AWBURST               ( TCU_AWBURST           ),         \
    .TCU_AWLOCK                ( TCU_AWLOCK            ),         \
    .TCU_AWCACHE               ( TCU_AWCACHE           ),         \
    .TCU_AWPROT                ( TCU_AWPROT            ),         \
    .TCU_AWDOMAIN              ( TCU_AWDOMAIN          ),         \
    .TCU_AWSNOOP               ( TCU_AWSNOOP           ),         \
    .TCU_AWTAGOP               ( TCU_AWTAGOP           ),         \
    .TCU_AWQOS                 ( TCU_AWQOS             ),         \
    .TCU_AWNSAID               ( TCU_AWNSAID           ),         \
    .TCU_AWUSER                ( TCU_AWUSER            ),         \
    .TCU_AWATOP                ( TCU_AWATOP            ),         \
    .TCU_AWSTASHNID            ( TCU_AWSTASHNID        ),         \
    .TCU_AWSTASHNIDEN          ( TCU_AWSTASHNIDEN      ),         \
    .TCU_AWSTASHLPID           ( TCU_AWSTASHLPID       ),         \
    .TCU_AWSTASHLPIDEN         ( TCU_AWSTASHLPIDEN     ),         \
    .TCU_AWTRACE               ( TCU_AWTRACE           ),         \
    .TCU_AWMPAM                ( TCU_AWMPAM            ),         \
    .TCU_AWIDUNQ               ( TCU_AWIDUNQ           ),         \
    .TCU_AWLOOP                ( TCU_AWLOOP            ),         \
    .TCU_AWCMO                 ( TCU_AWCMO             ),         \
    .TCU_AWVALID               ( TCU_AWVALID           ),         \
    .TCU_AWREADY               ( TCU_AWREADY           ),         \
    .TCU_WDATA                 ( TCU_WDATA             ),         \
    .TCU_WSTRB                 ( TCU_WSTRB             ),         \
    .TCU_WLAST                 ( TCU_WLAST             ),         \
    .TCU_WUSER                 ( TCU_WUSER             ),         \
    .TCU_WTRACE                ( TCU_WTRACE            ),         \
    .TCU_WPOISON               ( TCU_WPOISON           ),         \
    .TCU_WDATACHK              ( TCU_WDATACHK          ),         \
    .TCU_WTAGUPDATE            ( TCU_WTAGUPDATE        ),         \
    .TCU_WTAG                  ( TCU_WTAG              ),         \
    .TCU_WVALID                ( TCU_WVALID            ),         \
    .TCU_WREADY                ( TCU_WREADY            ),         \
    .TCU_BID                   ( TCU_BID               ),         \
    .TCU_BRESP                 ( TCU_BRESP             ),         \
    .TCU_BUSER                 ( TCU_BUSER             ),         \
    .TCU_BTRACE                ( TCU_BTRACE            ),         \
    .TCU_BIDUNQ                ( TCU_BIDUNQ            ),         \
    .TCU_BLOOP                 ( TCU_BLOOP             ),         \
    .TCU_BCOMP                 ( TCU_BCOMP             ),         \
    .TCU_BPERSIST              ( TCU_BPERSIST          ),         \
    .TCU_BVALID                ( TCU_BVALID            ),         \
    .TCU_BREADY                ( TCU_BREADY            ),         \
    .TCU_ARID                  ( TCU_ARID              ),         \
    .TCU_ARADDR                ( TCU_ARADDR            ),         \
    .TCU_ARLEN                 ( TCU_ARLEN             ),         \
    .TCU_ARSIZE                ( TCU_ARSIZE            ),         \
    .TCU_ARBURST               ( TCU_ARBURST           ),         \
    .TCU_ARLOCK                ( TCU_ARLOCK            ),         \
    .TCU_ARCACHE               ( TCU_ARCACHE           ),         \
    .TCU_ARPROT                ( TCU_ARPROT            ),         \
    .TCU_ARDOMAIN              ( TCU_ARDOMAIN          ),         \
    .TCU_ARSNOOP               ( TCU_ARSNOOP           ),         \
    .TCU_ARTAGOP               ( TCU_ARTAGOP           ),         \
    .TCU_ARQOS                 ( TCU_ARQOS             ),         \
    .TCU_ARNSAID               ( TCU_ARNSAID           ),         \
    .TCU_ARUSER                ( TCU_ARUSER            ),         \
    .TCU_ARTRACE               ( TCU_ARTRACE           ),         \
    .TCU_ARMPAM                ( TCU_ARMPAM            ),         \
    .TCU_ARIDUNQ               ( TCU_ARIDUNQ           ),         \
    .TCU_ARLOOP                ( TCU_ARLOOP            ),         \
    .TCU_ARCHUNKEN             ( TCU_ARCHUNKEN         ),         \
    .TCU_ARVALID               ( TCU_ARVALID           ),         \
    .TCU_ARREADY               ( TCU_ARREADY           ),         \
    .TCU_RID                   ( TCU_RID               ),         \
    .TCU_RDATA                 ( TCU_RDATA             ),         \
    .TCU_RRESP                 ( TCU_RRESP             ),         \
    .TCU_RLAST                 ( TCU_RLAST             ),         \
    .TCU_RUSER                 ( TCU_RUSER             ),         \
    .TCU_RTRACE                ( TCU_RTRACE            ),         \
    .TCU_RPOISON               ( TCU_RPOISON           ),         \
    .TCU_RDATACHK              ( TCU_RDATACHK          ),         \
    .TCU_RIDUNQ                ( TCU_RIDUNQ            ),         \
    .TCU_RLOOP                 ( TCU_RLOOP             ),         \
    .TCU_RCHUNKV               ( TCU_RCHUNKV           ),         \
    .TCU_RCHUNKNUM             ( TCU_RCHUNKNUM         ),         \
    .TCU_RCHUNKSTRB            ( TCU_RCHUNKSTRB        ),         \
    .TCU_RVALID                ( TCU_RVALID            ),         \
    .TCU_RREADY                ( TCU_RREADY            ),         \
    .TCU_ACADDR                ( TCU_ACADDR            ),         \
    .TCU_ACSNOOP               ( TCU_ACSNOOP           ),         \
    .TCU_ACPROT                ( TCU_ACPROT            ),         \
    .TCU_ACVMIDEXT             ( TCU_ACVMIDEXT         ),         \
    .TCU_ACTRACE               ( TCU_ACTRACE           ),         \
    .TCU_ACVALID               ( TCU_ACVALID           ),         \
    .TCU_ACREADY               ( TCU_ACREADY           ),         \
    .TCU_ACWAKEUP              ( TCU_ACWAKEUP          ),         \
    .TCU_CRRESP                ( TCU_CRRESP            ),         \
    .TCU_CRTRACE               ( TCU_CRTRACE           ),         \
    .TCU_CRVALID               ( TCU_CRVALID           ),         \
    .TCU_CRREADY               ( TCU_CRREADY           ),         \
    .TCU_SYSCOREQ              ( TCU_SYSCOREQ          ),         \
    .TCU_SYSCOACK              ( TCU_SYSCOACK          )

`define TBU_A4SADB_POWER_PORT(num)   \
    output wire                     TBU``num``_A4SADB_UP_CLK_QACTIVE     ,   \
    input wire                      TBU``num``_A4SADB_UP_CLK_QREQn       ,   \
    output wire                     TBU``num``_A4SADB_UP_CLK_QACCEPTn    ,   \
    output wire                     TBU``num``_A4SADB_UP_CLK_QDENY       ,   \
    output wire                     TBU``num``_A4SADB_DN_PWR_QACTIVE     ,   \
    input wire                      TBU``num``_A4SADB_DN_PWR_QREQn       ,   \
    output wire                     TBU``num``_A4SADB_DN_PWR_QACCEPTn    ,   \
    output wire                     TBU``num``_A4SADB_DN_PWR_QDENY       ,   \
    output wire                     TBU``num``_A4SADB_DN_CLK_QACTIVE     ,   \
    input wire                      TBU``num``_A4SADB_DN_CLK_QREQn       ,   \
    output wire                     TBU``num``_A4SADB_DN_CLK_QACCEPTn    ,   \
    output wire                     TBU``num``_A4SADB_DN_CLK_QDENY

`define TBU_A4SADB_POWER_PORT_CONNECT(num)   \
    .TBU``num``_A4SADB_UP_CLK_QACTIVE           (),         \
    .TBU``num``_A4SADB_UP_CLK_QREQn             (1'b1),     \
    .TBU``num``_A4SADB_UP_CLK_QACCEPTn          (),         \
    .TBU``num``_A4SADB_UP_CLK_QDENY             (),         \
    .TBU``num``_A4SADB_DN_PWR_QACTIVE           (),         \
    .TBU``num``_A4SADB_DN_PWR_QREQn             (1'b0),     \
    .TBU``num``_A4SADB_DN_PWR_QACCEPTn          (),         \
    .TBU``num``_A4SADB_DN_PWR_QDENY             (),         \
    .TBU``num``_A4SADB_DN_CLK_QACTIVE           (),         \
    .TBU``num``_A4SADB_DN_CLK_QREQn             (1'b1),     \
    .TBU``num``_A4SADB_DN_CLK_QACCEPTn          (),         \
    .TBU``num``_A4SADB_DN_CLK_QDENY             ()



*/
