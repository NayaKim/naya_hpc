/*****************************************************************************
 *
 * Copyright Processor Research Group, 2006-2021, All rights reserved.
 * Intelligent SoC Research Department,
 * Electronics and Telecommunications Research Institute (ETRI)
 *
 * THESE DOCUMENTS CONTAIN CONFIDENTIAL INFORMATION AND KNOWLEDGE 
 * WHICH IS THE PROPERTY OF ETRI. NO PART OF THIS PUBLICATION IS 
 * TO BE USED FOR ANY OTHER PURPOSE, AND THESE ARE NOT TO BE 
 * REPRODUCED, COPIED, DISCLOSED, TRANSMITTED, STORED IN A RETRIEVAL 
 * SYSTEM OR TRANSLATED INTO ANY OTHER HUMAN OR COMPUTER LANGUAGE, 
 * IN ANY FORM, BY ANY MEANS, IN WHOLE OR IN PART, WITHOUT THE 
 * COMPLETE PRIOR WRITTEN PERMISSION OF ETRI.
 *
 *****************************************************************************
 *
 * XEMIS defines
 *
 *****************************************************************************/

//-----------------------------------------------------------------------------
//
// XEMIS Base Address
//
// * XEMIS0 : 0x00_0000
// * XEMIS1 : 0x10_0000
// * XEMIS2 : 0x20_0000
// * XEMIS3 : 0x30_0000
// * XEMIS4 : 0x40_0000
// * XEMIS5 : 0x50_0000
// * XEMIS6 : 0x60_0000
// * XEMIS7 : 0x70_0000
// * MMUTCU : 0x80_0000
// * CRP    : 0xE0_0000 (Not defined here)
//
//-----------------------------------------------------------------------------

`define ABI_AB_XEMIS0_BASE                  (32'h0000_0000)
`define ABI_AB_XEMIS1_BASE                  (32'h0010_0000)
`define ABI_AB_XEMIS2_BASE                  (32'h0020_0000)
`define ABI_AB_XEMIS3_BASE                  (32'h0030_0000)
`define ABI_AB_XEMIS4_BASE                  (32'h0040_0000)
`define ABI_AB_XEMIS5_BASE                  (32'h0050_0000)
`define ABI_AB_XEMIS6_BASE                  (32'h0060_0000)
`define ABI_AB_XEMIS7_BASE                  (32'h0070_0000)
`define ABI_AB_MMUTCU_BASE                  (32'h0080_0000)

//-----------------------------------------------------------------------------
//
// XEMIS Local Base Address
//
// * XECM : 0x00_0000 (0x0000: CSR to be BROADCAST)
// * XPPT : 0x01_0000
// * XCSH : 0x02_0000
//
//-----------------------------------------------------------------------------

`define ABI_AB_XEMIS_CBRD_BASE             (20'h0_0000)
`define ABI_AB_XEMIS_XEC0_BASE             (20'h0_1000)
`define ABI_AB_XEMIS_XEC1_BASE             (20'h0_2000)
`define ABI_AB_XEMIS_XEC2_BASE             (20'h0_3000)
`define ABI_AB_XEMIS_XEC3_BASE             (20'h0_4000)
`define ABI_AB_XEMIS_XEC4_BASE             (20'h0_5000)
`define ABI_AB_XEMIS_XEC5_BASE             (20'h0_6000)
`define ABI_AB_XEMIS_XEC6_BASE             (20'h0_7000)
`define ABI_AB_XEMIS_XEC7_BASE             (20'h0_8000)
`define ABI_AB_XEMIS_XPPT_BASE             (20'h1_0000)
`define ABI_AB_XEMIS_XCSH_BASE             (20'h2_0000)


//-----------------------------------------------------------------------------
//
// XEMIS/MMU parameters
//
//-----------------------------------------------------------------------------


//--o MMU600-TBU parameters

`define TBUCFG_ID_WIDTH                 (16)
`define TBUCFG_SSID_WIDTH               (20)
`define TBUCFG_SID_WIDTH                (16)
`define TBUCFG_DATA_WIDTH               (256)
`define TBUCFG_AWUSER_WIDTH             (32)
`define TBUCFG_ARUSER_WIDTH             (32)
`define TBUCFG_WUSER_WIDTH              (1)
`define TBUCFG_RUSER_WIDTH              (1)
`define TBUCFG_BUSER_WIDTH              (4)
`define TBUCFG_STASH                    (1)
`define TBUCFG_WBUF_DEPTH               (8)
`define TBUCFG_LFIFO_DEPTH              (4)
`define TBUCFG_XLATE_SLOTS              (8)
`define TBUCFG_ROT_DEPTH                (8)
`define TBUCFG_WOT_DEPTH                (8)
`define TBUCFG_UTLB_DEPTH               (32)
`define TBUCFG_MTLB_DEPTH               (256)
`define TBUCFG_SI_AR_HNDSHK_MODE        (0)
`define TBUCFG_SI_R_HNDSHK_MODE         (0)
`define TBUCFG_SI_AW_HNDSHK_MODE        (0)
`define TBUCFG_SI_W_HNDSHK_MODE         (0)
`define TBUCFG_SI_B_HNDSHK_MODE         (0)
`define TBUCFG_MI_AR_HNDSHK_MODE        (0)
`define TBUCFG_MI_R_HNDSHK_MODE         (0)
`define TBUCFG_MI_AW_HNDSHK_MODE        (0)
`define TBUCFG_MI_W_HNDSHK_MODE         (0)
`define TBUCFG_MI_B_HNDSHK_MODE         (0)
`define TBUCFG_DTI_HNDSHK_MODE          (0)
`define TBUCFG_MTLB_LKPRSP_MODE         (0)
`define TBUCFG_DIRECT_IDX               (0)
`define TBUCFG_MTLB_PARTS               (1)
`define STATICCFG_NS_SID_HIGH           (8'b00000000)
`define STATICCFG_S_SID_HIGH            (8'b00000000)
`define STATICCFG_MAX_TOK_TRANS         (3'b000)
`define STATICCFG_PCIE_MODE             (1'b0)
`define STATICCFG_UTLB_ROUNDROBIN       (1'b0)
`define STATICCFG_CMO_DISABLE           (1'b0)

//--o MMU600-TCU parameters

`define TCUCFG_PROG_DATA_WIDTH          (32)
`define TCUCFG_QTW_ADDR_WIDTH           (48)
`define TCU_DTI_DATA_WIDTH              (160)
`define TCU_DTI_ID_WIDTH                (6)
`define TCUCFG_DVM_DEPTH                (8)
`define TCUCFG_QTW_DATA_WIDTH           (256)
`define TCUCFG_WCS1L0_DEPTH             (128)
`define TCUCFG_WCS1L1_DEPTH             (256)
`define TCUCFG_WCS1L2_DEPTH             (512)
`define TCUCFG_WCS1L3_DEPTH             (1024)
`define TCUCFG_WCS2L0_DEPTH             (0)
`define TCUCFG_WCS2L1_DEPTH             (0)
`define TCUCFG_WCS2L2_DEPTH             (0)
`define TCUCFG_WCS2L3_DEPTH             (0)
`define TCUCFG_CC_DEPTH                 (32)
`define TCUCFG_CC_IDXGEN_MODE           (0)
`define TCUCFG_NUM_TBU                  (14)
`define TCUCFG_DTI_ATS                  (0)
`define TCUCFG_XLATE_SLOTS              (128)
`define TCUCFG_PTW_SLOTS                (64)
`define TCUCFG_CTW_SLOTS                (4)
`define TCUCFG_DTI_HNDSHK_MODE          (0)
`define TCUCFG_WC_LKPRSP_MODE           (0)
`define TCUCFG_CC_LKPRSP_MODE           (0)
`define STATICCFG_SUP_COHACC            (1'b1)
`define STATICCFG_SUP_BTM               (1'b1)
`define STATICCFG_SUP_SEV               (1'b0)
`define STATICCFG_SUP_OAS               (3'b101)
`define STATICCFG_ECOREVNUM             (4'b0000)
`define STATICCFG_SEC_OVERRIDE          (1'b0)

//--o MMU600-DTI parameters
`define DTI_NUM_DTI_MASTERS             (8)
`define DTI_DATA_WIDTH                  (160)
`define DTI_ID_WIDTH                    (6)
`define DTI_DECMIN_SI0                  (0)
`define DTI_DECMAX_SI0                  (0)
`define DTI_DECMIN_SI1                  (1)
`define DTI_DECMAX_SI1                  (1)
`define DTI_DECMIN_SI2                  (2)
`define DTI_DECMAX_SI2                  (2)
`define DTI_DECMIN_SI3                  (3)
`define DTI_DECMAX_SI3                  (3)
`define DTI_DECMIN_SI4                  (4)
`define DTI_DECMAX_SI4                  (4)
`define DTI_DECMIN_SI5                  (5)
`define DTI_DECMAX_SI5                  (5)
`define DTI_DECMIN_SI6                  (6)
`define DTI_DECMAX_SI6                  (6)
`define DTI_DECMIN_SI7                  (7)
`define DTI_DECMAX_SI7                  (7)

`define ADB400_ADDR_WIDTH              (64)
`define ADB400_DATA_WIDTH              (256)
`define ADB400_AWID_WIDTH              (`TBUCFG_ID_WIDTH)
`define ADB400_ARID_WIDTH              (`TBUCFG_ID_WIDTH)
`define ADB400_AWUSER_WIDTH            (`AXEMIS_ADB_AWUSER_WIDTH)
`define ADB400_WUSER_WIDTH             (`TBUCFG_WUSER_WIDTH)
`define ADB400_BUSER_WIDTH             (`TBUCFG_BUSER_WIDTH)
`define ADB400_ARUSER_WIDTH            (`AXEMIS_ADB_ARUSER_WIDTH)
`define ADB400_RUSER_WIDTH             (`TBUCFG_RUSER_WIDTH)
`define ADB400_NSAID_WIDTH             (4)
`define ADB400_AW_FIFO_DEPTH           (4)
`define ADB400_W_FIFO_DEPTH            (6)
`define ADB400_B_FIFO_DEPTH            (2)
`define ADB400_AR_FIFO_DEPTH           (4)
`define ADB400_R_FIFO_DEPTH            (6)
`define ADB400_AW_OPREG                (1)
`define ADB400_W_OPREG                 (1)
`define ADB400_B_OPREG                 (1)
`define ADB400_AR_OPREG                (1)
`define ADB400_R_OPREG                 (1)
`define ADB400_SI_SYNC_LEVELS          (2)
`define ADB400_MI_SYNC_LEVELS          (2)

//--o XEMIS parameters

`define AXEMIS_RCHUNKNUM_WIDTH         (7)
`define AXEMIS_RCHUNKSTRB_WIDTH        (2)

/*  if DATA_WIDTH == 512:
        AXEMIS_RCHUNKNUM_WIDTH 6
        AXEMIS_RCHUNKSTRB_WIDTH 4

    if DATA_WIDTH == 256:  (Current)
        AXEMIS_RCHUNKNUM_WIDTH 7
        AXEMIS_RCHUNKSTRB_WIDTH 2
    
    if DATA_WIDTH == 128:
        AXEMIS_RCHUNKNUM_WIDTH 8
        AXEMIS_RCHUNKSTRB_WIDTH 1
*/

`define AXEMIS_USER_WIDTH              (32                                                         )
`define AXEMIS_MMUSID_WIDTH            (`TBUCFG_SID_WIDTH                                          )
`define AXEMIS_MMUSSID_WIDTH           (`TBUCFG_SSID_WIDTH                                         )
`define AXEMIS_MMUSSIDV_WIDTH          (1                                                          )
`define AXEMIS_MMUSECSID_WIDTH         (1                                                          )
`define AXEMIS_MMUATST_WIDTH           (1                                                          )
`define AXEMIS_STASHNID_WIDTH          (11                                                         )
`define AXEMIS_STASHNIDEN_WIDTH        (1                                                          )
`define AXEMIS_STASHLPID_WIDTH         (5                                                          )
`define AXEMIS_STASHLPIDEN_WIDTH       (1                                                          )
`define AXEMIS_ATOP_WIDTH              (6                                                          )
`define AXEMIS_USER_START              (0                                                          )
`define AXEMIS_MMUSID_START            (`AXEMIS_USER_START          + `AXEMIS_USER_WIDTH           )
`define AXEMIS_MMUSSID_START           (`AXEMIS_MMUSID_START        + `AXEMIS_MMUSID_WIDTH         )
`define AXEMIS_MMUSSIDV_START          (`AXEMIS_MMUSSID_START       + `AXEMIS_MMUSSID_WIDTH        )
`define AXEMIS_MMUSECSID_START         (`AXEMIS_MMUSSIDV_START      + `AXEMIS_MMUSSIDV_WIDTH       )
`define AXEMIS_MMUATST_START           (`AXEMIS_MMUSECSID_START     + `AXEMIS_MMUSECSID_WIDTH      )
`define AXEMIS_STASHNID_START          (`AXEMIS_MMUATST_START       + `AXEMIS_MMUATST_WIDTH        )
`define AXEMIS_STASHNIDEN_START        (`AXEMIS_STASHNID_START      + `AXEMIS_STASHNID_WIDTH       )
`define AXEMIS_STASHLPID_START         (`AXEMIS_STASHNIDEN_START    + `AXEMIS_STASHNIDEN_WIDTH     )
`define AXEMIS_STASHLPIDEN_START       (`AXEMIS_STASHLPID_START     + `AXEMIS_STASHLPID_WIDTH      )
`define AXEMIS_ATOP_START              (`AXEMIS_STASHLPIDEN_START   + `AXEMIS_STASHLPIDEN_WIDTH    )

`define AXEMIS_ADB_AWUSER_WIDTH        (`AXEMIS_USER_WIDTH          \
                                       +`AXEMIS_MMUSID_WIDTH        \
                                       +`AXEMIS_MMUSSID_WIDTH       \
                                       +`AXEMIS_MMUSSIDV_WIDTH      \
                                       +`AXEMIS_MMUSECSID_WIDTH     \
                                       +`AXEMIS_MMUATST_WIDTH       \
                                       +`AXEMIS_STASHNID_WIDTH      \
                                       +`AXEMIS_STASHNIDEN_WIDTH    \
                                       +`AXEMIS_STASHLPID_WIDTH     \
                                       +`AXEMIS_STASHLPIDEN_WIDTH   \
                                       +`AXEMIS_ATOP_WIDTH          \
                                       )

`define AXEMIS_ADB_ARUSER_WIDTH        (`AXEMIS_USER_WIDTH          \
                                       +`AXEMIS_MMUSID_WIDTH        \
                                       +`AXEMIS_MMUSSID_WIDTH       \
                                       +`AXEMIS_MMUSSIDV_WIDTH      \
                                       +`AXEMIS_MMUSECSID_WIDTH     \
                                       +`AXEMIS_MMUATST_WIDTH       \
                                       )

`define AXEMIS_ADB_AW_PAYLOAD_WIDTH    (                            \
                                        (`ADB400_AWUSER_WIDTH       \
                                        +`ADB400_AWID_WIDTH         \
                                        +64 /* awaddr */            \
                                        +4  /* nsaid */             \
                                        +4  /* awregion */          \
                                        +8  /* awlen */             \
                                        +3  /* awsize */            \
                                        +2  /* awburst */           \
                                        +2  /* awdomain */          \
                                        +3  /* awsnoop */           \
                                        +2  /* awbar */             \
                                        +1  /* awlock */            \
                                        +4  /* awcache */           \
                                        +3  /* awprot */            \
                                        +4  /* awqos */             \
                                        +0                          \
                                        )                           \
                                       *`ADB400_AW_FIFO_DEPTH       \
                                       )

`define AXEMIS_ADB_W_PAYLOAD_WIDTH     (                            \
                                        (`ADB400_WUSER_WIDTH        \
                                        +`ADB400_DATA_WIDTH         \
                                        +(`ADB400_DATA_WIDTH/8)     \
                                        +1  /* wlast */             \
                                        +0                          \
                                        )                           \
                                        *`ADB400_W_FIFO_DEPTH       \
                                        )

`define AXEMIS_ADB_B_PAYLOAD_WIDTH     (                            \
                                        (`ADB400_BUSER_WIDTH        \
                                        +`ADB400_AWID_WIDTH         \
                                        +2  /* bresp */             \
                                        +0                          \
                                       )                            \
                                       *`ADB400_B_FIFO_DEPTH        \
                                       )

`define AXEMIS_ADB_AR_PAYLOAD_WIDTH    (                            \
                                        (`ADB400_ARUSER_WIDTH       \
                                        +`ADB400_ARID_WIDTH         \
                                        +`ADB400_ADDR_WIDTH  /* araddr */\
                                        +`ADB400_NSAID_WIDTH /* nsaid */ \
                                        +4  /* arregion */              \
                                        +8  /* arlen */                 \
                                        +3  /* arsize */                \
                                        +2  /* arburst */               \
                                        +2  /* ardomain */              \
                                        +4  /* arsnoop */               \
                                        +2  /* arbar */                 \
                                        +1  /* arlock */                \
                                        +4  /* arcache */               \
                                        +3  /* arprot */                \
                                        +4  /* arqos */                 \
                                        +0                              \
                                        )                               \
                                       *`ADB400_AR_FIFO_DEPTH           \
                                       )

`define AXEMIS_ADB_R_PAYLOAD_WIDTH     (                                \
                                        (`ADB400_RUSER_WIDTH            \
                                        +`ADB400_ARID_WIDTH             \
                                        +`ADB400_DATA_WIDTH             \
                                        +2  /* rresp */                 \
                                        +1  /* rlast */                 \
                                        +0                              \
                                        )                               \
                                       *`ADB400_R_FIFO_DEPTH            \
                                       )


`include "ab21x_axemis_cluster_defs_wire.svh"
`include "ab21x_axemis_cluster_defs_port.svh"
`include "ab21x_axemis_cluster_defs_template.svh"

`define XEM_DATA_WIDTH      (256)
`define XEC_ADDRESS_WIDTH   (48)
`define XEC_INSTR_WIDTH     (32)
`define XEMIS_NO_AXECM      (4)
`define XEC_XLEN            (64)
`define XEC_TIMER_FREQ      (1000)
`define XEC_CLOCK_FREQ      (62500000)
