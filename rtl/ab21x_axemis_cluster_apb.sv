/**********************************************************************
#-- COPYRIGHT (C) 2021,
#-- ETRI, (Electronics and Telecommunication Research Institute)
#-- ALL RIGHT RESERVED
#----------------------------------------------------------------------
#
#-- AXEMIS_APB Top module
#
#--  Created by HyumMi Kim (chaos0218@etri.re.kr)
#
#----------------------------------------------------------------------
#--Revision History Here
#----------------------------------------------------------------------
#--Rev              Date              Comments
#
#
#*********************************************************************/

`include "ab21x_axemis_cluster_defs.svh"

module AB21X_AXEMIS_CLUSTER_APB  
(
    input					            AXMSCL_PCLK              ,
    input					            AXMSCL_PRST              ,
    input   [31:0]                      AXMSCL_PADDR             ,
    input                               AXMSCL_PSELX             ,
    input                               AXMSCL_PENABLE           ,
    input                               AXMSCL_PWRITE            ,
    input   [2:0]                       AXMSCL_PPROT             ,
    input   [3:0]                       AXMSCL_PSTRB             ,
    output reg                          AXMSCL_PREADY            ,
    output reg                          AXMSCL_PSLVERR           ,
    input   [31:0]                      AXMSCL_PWDATA            ,
    output reg [31:0]                   AXMSCL_PRDATA            ,
    
    output  [31:0]                      AXEMIS0_AP_PADDR         ,
    output                              AXEMIS0_AP_PSELX         ,
    output                              AXEMIS0_AP_PENABLE       ,
    output                              AXEMIS0_AP_PWRITE        ,
    input                               AXEMIS0_AP_PREADY        ,
    input                               AXEMIS0_AP_PSLVERR       ,
    output  [31:0]                      AXEMIS0_AP_PWDATA        ,
    input   [31:0]                      AXEMIS0_AP_PRDATA        ,
    output  [3:0]                       AXEMIS0_AP_PSTRB         ,   
    output  [2:0]                       AXEMIS0_AP_PPROT         ,
    
    output  [31:0]                      AXEMIS1_AP_PADDR         ,
    output                              AXEMIS1_AP_PSELX         ,
    output                              AXEMIS1_AP_PENABLE       ,
    output                              AXEMIS1_AP_PWRITE        ,
    input                               AXEMIS1_AP_PREADY        ,
    input                               AXEMIS1_AP_PSLVERR       ,
    output  [31:0]                      AXEMIS1_AP_PWDATA        ,
    input   [31:0]                      AXEMIS1_AP_PRDATA        ,
    output  [3:0]                       AXEMIS1_AP_PSTRB         ,   
    output  [2:0]                       AXEMIS1_AP_PPROT         ,
   
    output  [31:0]                      AXEMIS2_AP_PADDR         ,
    output                              AXEMIS2_AP_PSELX         ,
    output                              AXEMIS2_AP_PENABLE       ,
    output                              AXEMIS2_AP_PWRITE        ,
    input                               AXEMIS2_AP_PREADY        ,
    input                               AXEMIS2_AP_PSLVERR       ,
    output  [31:0]                      AXEMIS2_AP_PWDATA        ,
    input   [31:0]                      AXEMIS2_AP_PRDATA        ,
    output  [3:0]                       AXEMIS2_AP_PSTRB         ,   
    output  [2:0]                       AXEMIS2_AP_PPROT         ,
   
    output  [31:0]                      AXEMIS3_AP_PADDR         ,
    output                              AXEMIS3_AP_PSELX         ,
    output                              AXEMIS3_AP_PENABLE       ,
    output                              AXEMIS3_AP_PWRITE        ,
    input                               AXEMIS3_AP_PREADY        ,
    input                               AXEMIS3_AP_PSLVERR       ,
    output  [31:0]                      AXEMIS3_AP_PWDATA        ,
    input   [31:0]                      AXEMIS3_AP_PRDATA        ,
    output  [3:0]                       AXEMIS3_AP_PSTRB         ,   
    output  [2:0]                       AXEMIS3_AP_PPROT         ,
   
    output  [31:0]                      AXEMIS4_AP_PADDR         ,
    output                              AXEMIS4_AP_PSELX         ,
    output                              AXEMIS4_AP_PENABLE       ,
    output                              AXEMIS4_AP_PWRITE        ,
    input                               AXEMIS4_AP_PREADY        ,
    input                               AXEMIS4_AP_PSLVERR       ,
    output  [31:0]                      AXEMIS4_AP_PWDATA        ,
    input   [31:0]                      AXEMIS4_AP_PRDATA        ,
    output  [3:0]                       AXEMIS4_AP_PSTRB         ,   
    output  [2:0]                       AXEMIS4_AP_PPROT         ,
   
    output  [31:0]                      AXEMIS5_AP_PADDR         ,
    output                              AXEMIS5_AP_PSELX         ,
    output                              AXEMIS5_AP_PENABLE       ,
    output                              AXEMIS5_AP_PWRITE        ,
    input                               AXEMIS5_AP_PREADY        ,
    input                               AXEMIS5_AP_PSLVERR       ,
    output  [31:0]                      AXEMIS5_AP_PWDATA        ,
    input   [31:0]                      AXEMIS5_AP_PRDATA        ,
    output  [3:0]                       AXEMIS5_AP_PSTRB         ,   
    output  [2:0]                       AXEMIS5_AP_PPROT         ,
   
    output  [31:0]                      AXEMIS6_AP_PADDR         ,
    output                              AXEMIS6_AP_PSELX         ,
    output                              AXEMIS6_AP_PENABLE       ,
    output                              AXEMIS6_AP_PWRITE        ,
    input                               AXEMIS6_AP_PREADY        ,
    input                               AXEMIS6_AP_PSLVERR       ,
    output  [31:0]                      AXEMIS6_AP_PWDATA        ,
    input   [31:0]                      AXEMIS6_AP_PRDATA        ,
    output  [3:0]                       AXEMIS6_AP_PSTRB         ,   
    output  [2:0]                       AXEMIS6_AP_PPROT         ,
   
    output  [31:0]                      AXEMIS7_AP_PADDR         ,
    output                              AXEMIS7_AP_PSELX         ,
    output                              AXEMIS7_AP_PENABLE       ,
    output                              AXEMIS7_AP_PWRITE        ,
    input                               AXEMIS7_AP_PREADY        ,
    input                               AXEMIS7_AP_PSLVERR       ,
    output  [31:0]                      AXEMIS7_AP_PWDATA        ,
    input   [31:0]                      AXEMIS7_AP_PRDATA        ,
    output  [3:0]                       AXEMIS7_AP_PSTRB         ,   
    output  [2:0]                       AXEMIS7_AP_PPROT         ,

    output  [31:0]                      AMMUTCU_PADDR            ,
    output                              AMMUTCU_PSELX            ,
    output                              AMMUTCU_PENABLE          ,
    output                              AMMUTCU_PWRITE           ,
    output  [2:0]                       AMMUTCU_PPROT            ,
    output  [3:0]                       AMMUTCU_PSTRB            ,
    input                               AMMUTCU_PREADY           ,
    input                               AMMUTCU_PSLVERR          ,
    output  [31:0]                      AMMUTCU_PWDATA           ,
    input   [31:0]                      AMMUTCU_PRDATA
);

//temp

assign AXEMIS0_AP_PADDR     = AXMSCL_PADDR  ;
assign AXEMIS0_AP_PENABLE   = AXMSCL_PENABLE;
assign AXEMIS0_AP_PWRITE    = AXMSCL_PWRITE ;
assign AXEMIS0_AP_PWDATA    = AXMSCL_PWDATA ;
assign AXEMIS0_AP_PSTRB     = AXMSCL_PSTRB  ;
assign AXEMIS0_AP_PPROT     = AXMSCL_PPROT  ;

assign AXEMIS1_AP_PADDR     = AXMSCL_PADDR  ;
assign AXEMIS1_AP_PENABLE   = AXMSCL_PENABLE;
assign AXEMIS1_AP_PWRITE    = AXMSCL_PWRITE ;
assign AXEMIS1_AP_PWDATA    = AXMSCL_PWDATA ;
assign AXEMIS1_AP_PSTRB     = AXMSCL_PSTRB  ;
assign AXEMIS1_AP_PPROT     = AXMSCL_PPROT  ;

assign AXEMIS2_AP_PADDR     = AXMSCL_PADDR  ;
assign AXEMIS2_AP_PENABLE   = AXMSCL_PENABLE;
assign AXEMIS2_AP_PWRITE    = AXMSCL_PWRITE ;
assign AXEMIS2_AP_PWDATA    = AXMSCL_PWDATA ;
assign AXEMIS2_AP_PSTRB     = AXMSCL_PSTRB  ;
assign AXEMIS2_AP_PPROT     = AXMSCL_PPROT  ;

assign AXEMIS3_AP_PADDR     = AXMSCL_PADDR  ;
assign AXEMIS3_AP_PENABLE   = AXMSCL_PENABLE;
assign AXEMIS3_AP_PWRITE    = AXMSCL_PWRITE ;
assign AXEMIS3_AP_PWDATA    = AXMSCL_PWDATA ;
assign AXEMIS3_AP_PSTRB     = AXMSCL_PSTRB  ;
assign AXEMIS3_AP_PPROT     = AXMSCL_PPROT  ;

assign AXEMIS4_AP_PADDR     = AXMSCL_PADDR  ;
assign AXEMIS4_AP_PENABLE   = AXMSCL_PENABLE;
assign AXEMIS4_AP_PWRITE    = AXMSCL_PWRITE ;
assign AXEMIS4_AP_PWDATA    = AXMSCL_PWDATA ;
assign AXEMIS4_AP_PSTRB     = AXMSCL_PSTRB  ;
assign AXEMIS4_AP_PPROT     = AXMSCL_PPROT  ;

assign AXEMIS5_AP_PADDR     = AXMSCL_PADDR  ;
assign AXEMIS5_AP_PENABLE   = AXMSCL_PENABLE;
assign AXEMIS5_AP_PWRITE    = AXMSCL_PWRITE ;
assign AXEMIS5_AP_PWDATA    = AXMSCL_PWDATA ;
assign AXEMIS5_AP_PSTRB     = AXMSCL_PSTRB  ;
assign AXEMIS5_AP_PPROT     = AXMSCL_PPROT  ;

assign AXEMIS6_AP_PADDR     = AXMSCL_PADDR  ;
assign AXEMIS6_AP_PENABLE   = AXMSCL_PENABLE;
assign AXEMIS6_AP_PWRITE    = AXMSCL_PWRITE ;
assign AXEMIS6_AP_PWDATA    = AXMSCL_PWDATA ;
assign AXEMIS6_AP_PSTRB     = AXMSCL_PSTRB  ;
assign AXEMIS6_AP_PPROT     = AXMSCL_PPROT  ;

assign AXEMIS7_AP_PADDR     = AXMSCL_PADDR  ;
assign AXEMIS7_AP_PENABLE   = AXMSCL_PENABLE;
assign AXEMIS7_AP_PWRITE    = AXMSCL_PWRITE ;
assign AXEMIS7_AP_PWDATA    = AXMSCL_PWDATA ;
assign AXEMIS7_AP_PSTRB     = AXMSCL_PSTRB  ;
assign AXEMIS7_AP_PPROT     = AXMSCL_PPROT  ;

assign AMMUTCU_PADDR        = AXMSCL_PADDR     ; 
assign AMMUTCU_PENABLE      = AXMSCL_PENABLE   ;
assign AMMUTCU_PWRITE       = AXMSCL_PWRITE    ;
assign AMMUTCU_PWDATA       = AXMSCL_PWDATA    ;
assign AMMUTCU_PPROT        = AXMSCL_PPROT     ;
assign AMMUTCU_PSTRB        = AXMSCL_PSTRB     ;

assign AXEMIS0_AP_PSELX     = ({8'b0,AXMSCL_PADDR[23:20], 20'b0} == `ABI_AB_XEMIS0_BASE)    ? AXMSCL_PSELX : 1'b0;
assign AXEMIS1_AP_PSELX     = ({8'b0,AXMSCL_PADDR[23:20], 20'b0} == `ABI_AB_XEMIS1_BASE)    ? AXMSCL_PSELX : 1'b0;
assign AXEMIS2_AP_PSELX     = ({8'b0,AXMSCL_PADDR[23:20], 20'b0} == `ABI_AB_XEMIS2_BASE)    ? AXMSCL_PSELX : 1'b0;
assign AXEMIS3_AP_PSELX     = ({8'b0,AXMSCL_PADDR[23:20], 20'b0} == `ABI_AB_XEMIS3_BASE)    ? AXMSCL_PSELX : 1'b0;
assign AXEMIS4_AP_PSELX     = ({8'b0,AXMSCL_PADDR[23:20], 20'b0} == `ABI_AB_XEMIS4_BASE)    ? AXMSCL_PSELX : 1'b0;
assign AXEMIS5_AP_PSELX     = ({8'b0,AXMSCL_PADDR[23:20], 20'b0} == `ABI_AB_XEMIS5_BASE)    ? AXMSCL_PSELX : 1'b0;
assign AXEMIS6_AP_PSELX     = ({8'b0,AXMSCL_PADDR[23:20], 20'b0} == `ABI_AB_XEMIS6_BASE)    ? AXMSCL_PSELX : 1'b0;
assign AXEMIS7_AP_PSELX     = ({8'b0,AXMSCL_PADDR[23:20], 20'b0} == `ABI_AB_XEMIS7_BASE)    ? AXMSCL_PSELX : 1'b0;
assign AMMUTCU_PSELX        = ({8'b0,AXMSCL_PADDR[23:23], 23'b0} == `ABI_AB_MMUTCU_BASE)    ? AXMSCL_PSELX : 1'b0;

always @(*) begin
    case(1)
    AXEMIS0_AP_PSELX    : AXMSCL_PRDATA <= AXEMIS0_AP_PRDATA;
    AXEMIS1_AP_PSELX    : AXMSCL_PRDATA <= AXEMIS1_AP_PRDATA;
    AXEMIS2_AP_PSELX    : AXMSCL_PRDATA <= AXEMIS2_AP_PRDATA;
    AXEMIS3_AP_PSELX    : AXMSCL_PRDATA <= AXEMIS3_AP_PRDATA;
    AXEMIS4_AP_PSELX    : AXMSCL_PRDATA <= AXEMIS4_AP_PRDATA;
    AXEMIS5_AP_PSELX    : AXMSCL_PRDATA <= AXEMIS5_AP_PRDATA;
    AXEMIS6_AP_PSELX    : AXMSCL_PRDATA <= AXEMIS6_AP_PRDATA;
    AXEMIS7_AP_PSELX    : AXMSCL_PRDATA <= AXEMIS7_AP_PRDATA;
    AMMUTCU_PSELX       : AXMSCL_PRDATA <= AMMUTCU_PRDATA   ;
    default             : AXMSCL_PRDATA <= 32'b0;
    endcase
end

always @(*) begin
    case(1)
    AXEMIS0_AP_PSELX    : begin AXMSCL_PREADY <= AXEMIS0_AP_PREADY; AXMSCL_PSLVERR <= AXEMIS0_AP_PSLVERR; end
    AXEMIS1_AP_PSELX    : begin AXMSCL_PREADY <= AXEMIS1_AP_PREADY; AXMSCL_PSLVERR <= AXEMIS1_AP_PSLVERR; end
    AXEMIS2_AP_PSELX    : begin AXMSCL_PREADY <= AXEMIS2_AP_PREADY; AXMSCL_PSLVERR <= AXEMIS2_AP_PSLVERR; end
    AXEMIS3_AP_PSELX    : begin AXMSCL_PREADY <= AXEMIS3_AP_PREADY; AXMSCL_PSLVERR <= AXEMIS3_AP_PSLVERR; end
    AXEMIS4_AP_PSELX    : begin AXMSCL_PREADY <= AXEMIS4_AP_PREADY; AXMSCL_PSLVERR <= AXEMIS4_AP_PSLVERR; end
    AXEMIS5_AP_PSELX    : begin AXMSCL_PREADY <= AXEMIS5_AP_PREADY; AXMSCL_PSLVERR <= AXEMIS5_AP_PSLVERR; end
    AXEMIS6_AP_PSELX    : begin AXMSCL_PREADY <= AXEMIS6_AP_PREADY; AXMSCL_PSLVERR <= AXEMIS6_AP_PSLVERR; end
    AXEMIS7_AP_PSELX    : begin AXMSCL_PREADY <= AXEMIS7_AP_PREADY; AXMSCL_PSLVERR <= AXEMIS7_AP_PSLVERR; end
    AMMUTCU_PSELX       : begin AXMSCL_PREADY <= AMMUTCU_PREADY   ; AXMSCL_PSLVERR <= AMMUTCU_PSLVERR   ; end
    default             : begin AXMSCL_PREADY <= 1'b1             ; AXMSCL_PSLVERR <= 1'b0              ; end
    endcase
end

endmodule
