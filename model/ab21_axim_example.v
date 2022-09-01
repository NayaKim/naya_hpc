
/*****************************************************************************
 *
 * Copyright Processor Design Group, 2006-2021, All rights reserved.
 * Processor Team, SoC Research Department
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
 * Single read/write axi master example
 *
 *****************************************************************************/

module axi_master_example # (
    parameter       DATASIZE          = 32,
    parameter       DATAWIDTH         = 64,
    parameter       ADDRWIDTH         = 32
)(
    input  [ADDRWIDTH-1:0]          AxADDR                          ,
    input            [7:0]          AxLEN                           ,
    input   [DATASIZE-1:0]          AxDATA                          ,
    input                           RWTEST                          ,

    input                           mst_aresetn                     ,
    input                           mst_aclk                        ,
    
    // write address channel signals
    output          [15:0]          mst_awid                        ,
    output [ADDRWIDTH-1:0]          mst_awaddr                      ,
    output          [7:0]           mst_awlen                       ,
    output           [2:0]          mst_awsize                      ,
    output           [1:0]          mst_awburst                     ,
    output                          mst_awvalid                     ,
    input                           mst_awready                     ,
    
    // write data channel signals
    output              [15:0]      mst_wid                         ,
    output     [DATAWIDTH-1:0]      mst_wdata                       ,
    output [(DATAWIDTH/8)-1:0]      mst_wstrb                       ,
    output                          mst_wlast                       ,
    output                          mst_wvalid                      ,
    input                           mst_wready                      ,
    
    // write response channel signals
    input           [15:0]          mst_bid                         ,
    input           [1:0]           mst_bresp                       ,
    input                           mst_bvalid                      ,
    output                          mst_bready                      ,
    
    // read address channel signals
    output          [15:0]          mst_arid                        ,
    output [ADDRWIDTH-1:0]          mst_araddr                      ,
    output          [7:0]           mst_arlen                       ,
    output          [2:0]           mst_arsize                      ,
    output          [1:0]           mst_arburst                     ,
    output                          mst_arvalid                     ,
    input                           mst_arready                     ,
    
    // read data channel signals
    input           [15:0]          mst_rid                         ,
    input  [DATAWIDTH-1:0]          mst_rdata                       ,
    input           [1:0]           mst_rresp                       ,
    input                           mst_rlast                       ,
    input                           mst_rvalid                      ,
    output                          mst_rready                      
);



//////////////////////////////////////////////////////////////////

wire                                    datasize04              ;
wire                                    datasize08              ;
wire                                    datasize16              ;
wire                                    datasize32              ;

wire                                    databus032              ;
wire                                    databus064              ;
wire                                    databus128              ;
wire                                    databus256              ;

assign  databus032  = (DATAWIDTH ==  32); // Byte
assign  databus064  = (DATAWIDTH ==  64); // Byte
assign  databus128  = (DATAWIDTH == 128); // Byte
assign  databus256  = (DATAWIDTH == 256); // Byte

assign  datasize032  = (DATASIZE ==  32); // Byte
assign  datasize064  = (DATASIZE ==  64); // Byte
assign  datasize128  = (DATASIZE == 128); // Byte
assign  datasize256  = (DATASIZE == 256); // Byte

//assign  narrow_transfer = (DATAWIDTH > DATASIZE)? 1'b1 : 1'b0;
wire wider_transfer = (DATAWIDTH < DATASIZE)? 1'b1 : 1'b0;

//wire    [31:0]                  hwdata_o032                     ;
//wire    [63:0]                  hwdata_o064                     ;
//wire    [127:0]                 hwdata_o128                     ;
//wire    [255:0]                 hwdata_o256                     ;
initial begin
    if(DATAWIDTH < DATASIZE) begin
        $display ("### %m does not support the transfer of (DATASIZE>DATAWIDTH).");
        $display("(Currently, DATASIZE=%03d, DATAWIDTH=%03d)", DATASIZE, DATAWIDTH);
        $finish;
    end
end
//always @(posedge mst_aclk or negedge mst_aresetn) begin
//
//end
//generate
//    if(DATAWIDTH < DATASIZE) begin
//        wider_transfer
//        $display ("### AXIM do not support the transfer of (DATASIZE>DATAWIDTH).(%m)");
//    end
//endgenerate


////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////

assign  mst_awid        = 16'h0;
assign  mst_wid         = 16'h0;
assign  mst_awburst     = 2'b01;
//assign  mst_wstrb       = {(DATAWIDTH/8){1'b1}};
//assign  mst_wstrb       = {{(DATAWIDTH/8-DATASIZE){1'b0}},{(DATASIZE){1'b1}}};
assign  mst_bready      = 1'b1;
assign  mst_arid        = 16'h0;
assign  mst_arburst     = 2'b01;
assign  mst_rready      = 1'b1;

assign  mst_awsize      =
                datasize032 ? 3'b010 :
                datasize064 ? 3'b011 :
                datasize128 ? 3'b100 :
                datasize256 ? 3'b101 :
                0;
assign  mst_arsize      =
                datasize032 ? 3'b010 :
                datasize064 ? 3'b011 :
                datasize128 ? 3'b100 :
                datasize256 ? 3'b101 :
                0;

assign  mst_awlen       = AxLEN;
//                (CMD_LENGTH ==  1) ? 4'h0 :
//                (CMD_LENGTH ==  2) ? 4'h1 :
//                (CMD_LENGTH ==  3) ? 4'h2 :
//                (CMD_LENGTH ==  4) ? 4'h3 :
//                (CMD_LENGTH ==  5) ? 4'h4 :
//                (CMD_LENGTH ==  6) ? 4'h5 :
//                (CMD_LENGTH ==  7) ? 4'h6 :
//                (CMD_LENGTH ==  8) ? 4'h7 :
//                (CMD_LENGTH ==  9) ? 4'h8 :
//                (CMD_LENGTH == 10) ? 4'h9 :
//                (CMD_LENGTH == 11) ? 4'ha :
//                (CMD_LENGTH == 12) ? 4'hb :
//                (CMD_LENGTH == 13) ? 4'hc :
//                (CMD_LENGTH == 14) ? 4'hd :
//                (CMD_LENGTH == 15) ? 4'he :
//                (CMD_LENGTH == 16) ? 4'hf :
//                4'h0;

assign  mst_arlen       = AxLEN;
//                (CMD_LENGTH ==  1) ? 4'h0 :
//                (CMD_LENGTH ==  2) ? 4'h1 :
//                (CMD_LENGTH ==  3) ? 4'h2 :
//                (CMD_LENGTH ==  4) ? 4'h3 :
//                (CMD_LENGTH ==  5) ? 4'h4 :
//                (CMD_LENGTH ==  6) ? 4'h5 :
//                (CMD_LENGTH ==  7) ? 4'h6 :
//                (CMD_LENGTH ==  8) ? 4'h7 :
//                (CMD_LENGTH ==  9) ? 4'h8 :
//                (CMD_LENGTH == 10) ? 4'h9 :
//                (CMD_LENGTH == 11) ? 4'ha :
//                (CMD_LENGTH == 12) ? 4'hb :
//                (CMD_LENGTH == 13) ? 4'hc :
//                (CMD_LENGTH == 14) ? 4'hd :
//                (CMD_LENGTH == 15) ? 4'he :
//                (CMD_LENGTH == 16) ? 4'hf :
//                4'h0;


////////////////////////////////////////////////////////////




////////////////////////////////////////////////////////////


reg                     master_start                    ;
reg [(DATAWIDTH/8)-1:0] mst_wstrb                       ;
reg [ADDRWIDTH-1:0]     mst_awaddr                      ;
reg                     mst_awvalid                     ;
reg                     master_wrcmd_issued             ;

always @(posedge mst_aclk or negedge mst_aresetn) begin
        if (!mst_aresetn) begin
                master_start    <= 1'b0;
        end
        else begin
                master_start    <= 1'b1;
        end
end

always @(posedge mst_aclk or negedge mst_aresetn) begin
        if (!mst_aresetn) begin
                master_wrcmd_issued     <= 1'b0;
        end
        else begin
                if (mst_awvalid & mst_awready) begin
                        master_wrcmd_issued     <= 1'b1;
                end
                else begin
                        master_wrcmd_issued     <= master_wrcmd_issued;
                end
        end
end

always @(posedge mst_aclk or negedge mst_aresetn) begin
        if (!mst_aresetn) begin
                mst_awaddr <= AxADDR;
        end
        else begin
            mst_awaddr <= mst_awaddr;
        end
        // else begin
        //         if (mst_awvalid & mst_awready) begin
        //                 mst_awvalid     <= 1'b0;
        //                 mst_awaddr <= mst_awaddr + (AxLEN+1)*(awsize)
        //         end
        //         else if (master_start & !master_wrcmd_issued) begin
        //                 mst_awvalid     <= 1'b1;
        //         end
        //         else begin
        //                 mst_awvalid     <= mst_awvalid;
        //         end
        // end
end


always @(posedge mst_aclk or negedge mst_aresetn) begin
        if (!mst_aresetn) begin
                mst_awvalid     <= 1'b0;
        end
        else begin
                if (mst_awvalid & mst_awready) begin
                        mst_awvalid     <= 1'b0;
                end
                else if (master_start & !master_wrcmd_issued) begin
                        mst_awvalid     <= 1'b1;
                end
                else begin
                        mst_awvalid     <= mst_awvalid;
                end
        end
end

////////////////////////////////////////////////////////////

reg     [DATAWIDTH-1:0] mst_wdata                       ;
wire                    mst_wlast                       ;
reg                     mst_wvalid                      ;
reg                     master_wrdat_issued             ;
reg     [31:0]          master_wcnt                     ;
reg     [DATASIZE-1:0]  master_wr_data                  ;

always @(posedge mst_aclk or negedge mst_aresetn) begin
        if (!mst_aresetn) begin
                master_wrdat_issued     <= 1'b0;
        end
        else begin
                if (mst_wlast & mst_wready) begin
                        master_wrdat_issued     <= 1'b1;
                end
                else begin
                        master_wrdat_issued     <= master_wrdat_issued;
                end
        end
end

always @(posedge mst_aclk or negedge mst_aresetn) begin
        if (!mst_aresetn) begin
                mst_wvalid      <= 1'b0;
        end
        else begin
                if (mst_wlast & mst_wready) begin
                        mst_wvalid      <= 1'b0;
                end
                else if (master_start & !master_wrdat_issued) begin
                        mst_wvalid      <= 1'b1;
                end
                else begin
                        mst_wvalid      <= mst_wvalid;
                end
        end
end

always @(posedge mst_aclk or negedge mst_aresetn) begin
        if (!mst_aresetn) begin
                //master_wcnt     <= 32'h0;
                master_wcnt     <= 32'h1;
        end
        else begin
                if (mst_wvalid & mst_wready) begin
                        master_wcnt     <= master_wcnt + 32'h1;
                end
                else begin
                        master_wcnt     <= master_wcnt;
                end
        end
end

assign  mst_wlast       = (AxLEN==0) ? mst_wvalid :(master_wcnt == (AxLEN+1));
//assign  mst_wlast       = (master_wcnt == CMD_LENGTH);

always @(posedge mst_aclk or negedge mst_aresetn) begin
        if (!mst_aresetn) begin
                master_wr_data  <= AxDATA;
        end
        else begin
                if (mst_wvalid & mst_wready) begin
                        master_wr_data  <= master_wr_data + {(DATASIZE){1'b1}};
                end
                else begin
                        master_wr_data  <= master_wr_data;
                end
        end
end

always @(*) begin
  for(int idx = 0; idx < DATAWIDTH/DATASIZE; idx++) begin
    if(AxADDR[3:2] == idx) begin
      mst_wdata[DATASIZE*idx +: DATASIZE] = master_wr_data;
      mst_wstrb[(DATASIZE/8)*idx +: (DATASIZE/8)] = {(DATASIZE/8){1'b1}};
    end 
    else begin
      mst_wdata[DATASIZE*idx +: DATASIZE] = {DATASIZE{1'b0}};
      mst_wstrb[(DATASIZE/8)*idx +: (DATASIZE/8)] = {(DATASIZE/8){1'b0}};
    end
  end 
end 

//genvar i;
//generate
//for(i=0; i<(DATAWIDTH/DATASIZE); i=i+1) begin
//    assign mst_wdata[(DATAWIDTH/(DATAWIDTH/DATASIZE))*i +: DATASIZE] = master_wr_data;
//end
//endgenerate
//assign  mst_wdata       = 
//                databus032 ?  master_wr_data :
//                databus064 ? {master_wr_data,master_wr_data} :
//                databus128 ? {master_wr_data,master_wr_data,master_wr_data,master_wr_data} :
//                databus256 ? {master_wr_data,master_wr_data,master_wr_data,master_wr_data,master_wr_data,master_wr_data,master_wr_data,master_wr_data} :
//                0;


////////////////////////////////////////////////////////////
reg [1:0]               master_read_start               ;
reg [ADDRWIDTH-1:0]     mst_araddr                      ;
reg                     mst_arvalid                     ;
reg                     master_rdcmd_issued             ;

always @(posedge mst_aclk or negedge mst_aresetn) begin
        if (!mst_aresetn) begin
                master_read_start       <= 2'b0;
        end
        else begin
                if (mst_wlast & mst_wready & RWTEST) begin
                        master_read_start       <= 2'b01;
                end
                else if((master_read_start[0]==1) && mst_bvalid) begin
                        master_read_start       <= 2'b10;
                end
                else begin
                        master_read_start       <= master_read_start;
                end
        end
end

always @(posedge mst_aclk or negedge mst_aresetn) begin
        if (!mst_aresetn) begin
                master_rdcmd_issued     <= 1'b0;
        end
        else begin
                if (mst_arvalid & mst_arready) begin
                        master_rdcmd_issued     <= 1'b1;
                end
                else begin
                        master_rdcmd_issued     <= master_rdcmd_issued;
                end
        end
end

always @(posedge mst_aclk or negedge mst_aresetn) begin
        if (!mst_aresetn) begin
                mst_araddr <= AxADDR;
        end
        else begin
            mst_araddr <= mst_araddr;
        end
        // else begin
        //         if (mst_awvalid & mst_awready) begin
        //                 mst_awvalid     <= 1'b0;
        //                 mst_awaddr <= mst_awaddr + (AxLEN+1)*(awsize)
        //         end
        //         else if (master_start & !master_wrcmd_issued) begin
        //                 mst_awvalid     <= 1'b1;
        //         end
        //         else begin
        //                 mst_awvalid     <= mst_awvalid;
        //         end
        // end
end

always @(posedge mst_aclk or negedge mst_aresetn) begin
        if (!mst_aresetn) begin
                mst_arvalid     <= 1'b0;
        end
        else begin
                if (mst_arvalid & mst_arready) begin
                        mst_arvalid     <= 1'b0;
                end
                else if (master_read_start[1] & !master_rdcmd_issued) begin
                        mst_arvalid     <= 1'b1;
                end
                else begin
                        mst_arvalid     <= mst_arvalid;
                end
        end
end



////////////////////////////////////////////////////////////
reg     [DATASIZE-1:0]              master_rd_data                  ;
wire                                master_rd_data_chk              ;
wire    [(DATAWIDTH/DATASIZE)-1:0]  master_rd_data_chk_err          ;

reg                                 master_rd_err_flag              ;
reg                                 master_rd_check_result          ;

assign  master_rd_data_chk      = mst_rvalid & mst_rready;

always @(posedge mst_aclk or negedge mst_aresetn) begin
        if (!mst_aresetn) begin
                master_rd_data  <= AxDATA;
        end
        else begin
                if (master_rd_data_chk) begin
                        master_rd_data  <= master_rd_data + {(DATASIZE){1'b1}};
                end
                else begin
                        master_rd_data  <= master_rd_data;
                end
        end
end

//integer ii;
//reg     [DATAWIDTH-1:0]           read_data                       ;
//always @(*) begin
//        for (ii=0;ii<DATAWIDTH;ii=ii+1) read_data[ii]     = (mst_rdata[ii] === 1'bx) ? 1'b0 : mst_rdata[ii];
//end
//wire [DATAWIDTH-1:0] read_data = {mst_rdata[31:0], mst_rdata[31:0], mst_rdata[31:0], mst_rdata[31:0]};
genvar j;
generate
for(j=0; j<(DATAWIDTH/DATASIZE); j=j+1) begin
    assign master_rd_data_chk_err[j] = (master_rd_data_chk & (mst_rdata[(DATAWIDTH/(DATAWIDTH/DATASIZE))*j +: DATASIZE] !== master_rd_data));
end
endgenerate

//assign  master_rd_data_chk_err  = 
//                databus032 ? (master_rd_data_chk & (mst_rdata[31:0] !== master_rd_data)) :
//                databus064 ? (master_rd_data_chk & ({mst_rdata[31:0], mst_rdata[31:0]} !== {master_rd_data,master_rd_data})) :
//                databus128 ? (master_rd_data_chk & ({mst_rdata[31:0], mst_rdata[31:0], mst_rdata[31:0], mst_rdata[31:0]} !== {master_rd_data,master_rd_data,master_rd_data,master_rd_data})) :
//                databus256 ? (master_rd_data_chk & ({mst_rdata[31:0], mst_rdata[31:0], mst_rdata[31:0], mst_rdata[31:0], mst_rdata[31:0], mst_rdata[31:0], mst_rdata[31:0], mst_rdata[31:0]} !== {master_rd_data,master_rd_data,master_rd_data,master_rd_data,master_rd_data,master_rd_data,master_rd_data,master_rd_data})) :
//                0;

always @(posedge mst_aclk or negedge mst_aresetn) begin
        if (!mst_aresetn) begin
                master_rd_err_flag      <= 1'b0;
        end
        else begin
                if (|master_rd_data_chk_err) begin
                        master_rd_err_flag      <= 1'b1;
                end
                else begin
                        master_rd_err_flag      <= master_rd_err_flag;
                end
        end
end

////////////////////////////////////////////////////////////

always @(posedge mst_aclk or negedge mst_aresetn) begin
        if (!mst_aresetn) begin
                master_rd_check_result  <= 1'b0;
        end
        else begin
                master_rd_check_result  <= mst_rlast & mst_rvalid & mst_rready;
        end
end

reg test_passed;
always @(posedge mst_aclk or negedge mst_aresetn) begin
        if (!mst_aresetn) begin
            test_passed <= 1'b0;
        end
        else begin
                if (RWTEST & master_rd_check_result) begin
                        if (master_rd_err_flag == 1'b0) begin
                                $display ("");
                                $display ("\n===========================================================\n");
                                $display ("  ===> [%m] : Data compare PASS.");
                                $display ("\n===========================================================\n");
                                $display ("");
                                test_passed <= 1'b1;
                        end
                        else begin
                                $display ("");
                                $display ("\n===========================================================\n");
                                $display ("  ===> [%m] : Data compare ERROR!!!");
                                $display ("\n===========================================================\n");
                                $display ("");
                        end
                end
        end
end







endmodule



