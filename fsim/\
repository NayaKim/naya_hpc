`timescale 1ns/1ps

module tb_top();

parameter TX_SIZE   = 10; //240 * 320 * 2;


wire            ACLK;
wire            ARESETN;
wire    [3:0]   M_AXI_Aw_Id;
wire    [31:0]  M_AXI_Aw_Addr;
wire    [3:0]   M_AXI_Aw_Len;
wire    [2:0]   M_AXI_Aw_Size;
wire    [1:0]   M_AXI_Aw_Burst;
wire            M_AXI_Aw_Lock;
wire    [3:0]   M_AXI_Aw_Cache;
wire    [2:0]   M_AXI_Aw_Prot;
wire    [3:0]   M_AXI_Aw_Qos;
wire            M_AXI_Aw_User;
wire            M_AXI_Aw_Valid;
wire            M_AXI_Aw_Ready;

wire    [31:0]  M_AXI_W_Data;
wire    [3:0]   M_AXI_W_Strb;
wire            M_AXI_W_Last;
wire            M_AXI_W_User;
wire            M_AXI_W_Valid;
wire            M_AXI_W_Ready;
wire    [3:0]   M_AXI_B_Id;
wire    [1:0]   M_AXI_B_Resp;
reg             M_AXI_W_Id;         //  master output, slave input.
reg             M_AXI_B_User;       //  master input slave output.
wire            M_AXI_B_Valid;
wire            M_AXI_B_Ready;
wire    [3:0]   M_AXI_Ar_Id;
wire    [31:0]  M_AXI_Ar_Addr;
wire    [3:0]   M_AXI_Ar_Len;
wire    [2:0]   M_AXI_Ar_Size;
wire    [1:0]   M_AXI_Ar_Burst;
wire            M_AXI_Ar_Lock;
wire    [3:0]   M_AXI_Ar_Cache;
wire    [2:0]   M_AXI_Ar_Prot;
wire    [3:0]   M_AXI_Ar_Qos;
wire            M_AXI_Ar_User;
wire            M_AXI_Ar_Valid;
wire            M_AXI_Ar_Ready;
wire    [3:0]   M_AXI_R_Id;
wire    [31:0]  M_AXI_R_Data;
wire    [1:0]   M_AXI_R_Resp;
wire            M_AXI_R_Last;
wire            M_AXI_R_User;
wire            M_AXI_R_Valid;
wire            M_AXI_R_Ready;
   // APB Slave Interface
wire            axmscl_apb_pclk;
wire            PResetn;
wire            PSel;
wire            PEnable;
wire            PWrite;
wire    [31:0]  PAddr;
wire    [31:0]  PWData;
wire    [31:0]  PRData;
wire            PReady;
wire            PSlvErr;
   // SPI Bus Protocol
wire            o_SPI_Interrupt;
wire            o_SPI_DMA_Interrupt;
wire            o_SPI_DCX;
wire            o_SPI_CSn;
wire            o_SPI_SCLK;
wire            o_SPI_MOSI;
wire            i_SPI_MISO;

reg             memory_init;

wire       w_rd;
wire       w_cnt_done;
wire [7:0] w_rxd;

//******************************************************************
// SPI LCD Register 
//******************************************************************
reg  [31:0] REG_SPI0_PRES; 	   // 0x00
reg  [31:0] REG_SPI0_CTRL;     // 0x04
reg  [31:0] REG_SPI0_TXR;	   // 0x08
reg  [31:0] REG_SPI0_RXR;	   // 0x0C
reg  [31:0] REG_SPI0_CCV;	   // 0x10
reg  [31:0] REG_SPI0_SR;	   // 0x14
reg  [31:0] REG_SPI0_FCTRL;	   // 0x18
reg  [31:0] REG_SPI0_FSR;	   // 0x1C
reg  [31:0] REG_SPI0_TIME; 	   // 0x20
reg  [31:0] REG_SPI0_INTR;	   // 0x24
reg  [31:0] REG_SPI0_CLR;	   // 0x28

reg  [31:0] REG_SPI0_TXBASE;   // 0x2C
reg  [31:0] REG_SPI0_RXBASE;   // 0x30
reg  [31:0] REG_SPI0_PCKT;	   // 0x34
reg  [31:0] REG_SPI0_DMA_CTRL; // 0x38
reg  [31:0] REG_SPI0_DMA_SR;   // 0x3C
reg  [31:0] REG_SPI0_DMA_INTR; // 0x40
reg  [31:0] REG_SPI0_DMA_CLR;  // 0x44
reg  [31:0] REG_SPI0_DMA_ROT;  // 0x48
reg  [31:0] REG_SPI0_RCONST;   // 0x4C
reg  [31:0] REG_SPI0_PCONST;   // 0x50

//******************************************************************
// SPI LCD Bitfield
//******************************************************************
//PRES
reg [15:0]  PRES_SCKPRES;
//CTRL
reg         CTRL_EN;
reg         CTRL_DEN;
reg         CTRL_MODE;
reg         CTRL_CPOL;
reg         CTRL_CPHA;
reg         CTRL_LSB;
reg         CTRL_CSM;  
reg [2:0]   CTRL_EMA;
reg [1:0]   CTRL_EMAW;
reg         CTRL_DCX;
reg         CTRL_CS;
//TXR
reg [7:0]   TXR_TXD;
//RXR
reg [7:0]   RXR_RXD;
//CCV
reg [15: 0] CCV_TXCNT; 
reg [15: 0] CCV_RXCNT; 
//SR
reg         SR_BUSY;
reg [5:0]   SR_IRQ;
reg [5:0]   SR_FLAG_IRQ;
//FCTRL
reg [5:0]   FCTRL_TXLEVEL; 
reg [5:0]   FCTRL_RXLEVEL; 
reg         FCTRL_TXEN; 
reg         FCTRL_RXEN; 
//FSR
reg [7:0]   FSR_TXDIFF; 
reg [7:0]   FSR_RXDIFF; 
reg         FSR_TXF;     
reg         FSR_TXE;      
reg         FSR_RXF;       
reg         FSR_RXE;        
//TIME
reg [7:0]   TIME_CSSCK; 
reg [7:0]   TIME_SCKCS; 
reg [7:0]   TIME_INTERD; 
//INTR
reg [5:0]   INTR_IEN;
//CLR
reg         CLR_CLRTC;   
reg         CLR_CLRRC;   
reg         CLR_CLRTX; 
reg         CLR_CLRRX; 
reg [5:0]   CLR_ICLR;

// TXBASE
reg  [31:0] TXBASE_TX_BASE;
// RXBASE
reg  [31:0] RXBASE_RX_BASE;
// PCKT
reg  [15:0] PCKT_COUNT;
reg  [15:0] PCKT_SIZE;
// DMA_CTRL
reg         DMA_CTRL_EN;
reg         DMA_CTRL_DTE;
reg         DMA_CTRL_DRE;
reg         DMA_CTRL_TEND;
reg         DMA_CTRL_REND;
reg         DMA_CTRL_CONT;
reg  [1:0]  DMA_CTRL_TXAM;
reg  [1:0]  DMA_CTRL_RXAM;
reg         DMA_CTRL_DCT;
reg         DMA_CTRL_DRQS;
// DMA_SR
reg  [15:0] DMA_SR_TXPCNT;
reg  [15:0] DMA_SR_RXPCNT;
// DMA_INTR
reg         DMA_INTR_ISD;
reg         DMA_INTR_ISP;
reg         DMA_INTR_IED;
reg         DMA_INTR_IEP;
reg  [11:0] DMA_INTR_IRQPCNT;
// DMA_CLR
reg         DMA_CLR_ISDCLR;
reg         DMA_CLR_ISPCLR;
reg         DMA_CLR_PCLR;
// DMA_ROT
reg         DMA_ROT_RTEN;
reg  [1:0]  DMA_ROT_RUNIT;
reg  [10:0] DMA_ROT_RSTRIDE;
// RCONST
reg  [4:0]  RCONST_BLEN;
reg  [13:0] RCONST_BSTRIDE;
// PCONST
reg  [17:0] PCONST_PSTRIDE;


// --------------------------------------------------------------------------
//  SPI LCD CONSTANTS
// --------------------------------------------------------------------------
`define PIXEL_ROW    320 // 320
`define PIXEL_COL    240 // 240
`define PCK_P_FRAME  160
`define RGB_BYTE     3
`define FRAME_NUM    4

`define DCX          o_SPI_DCX
`define CS           o_SPI_CSn

//******************************************************************
// Run Test
//******************************************************************
integer fp_spi_lcd_out[0:`FRAME_NUM-1];
integer i;
integer n;
integer frame;
integer done;

reg [  7:0] rx_din [0:15];
reg [  7:0] temp;



initial begin
    memory_init  = 0;
    M_AXI_W_Id   = 0;       //  master output, slave input.
    M_AXI_B_User = 0;       //  master input slave output.

    $display("**********************************************");
    $display("  SPI Master Test                             ");
    $display("**********************************************");
    
    @(posedge ARESETN)
    #1000

	
    //******************************************************************
    // SPI Register Bit Initialize
    //******************************************************************
     PRES_SCKPRES		= 16'h0;
     CTRL_EN			= 01'h1;
     CTRL_DEN			= 01'h0;
     CTRL_MODE			= 01'h0;
     CTRL_CPOL			= 01'h0;
     CTRL_CPHA			= 01'h0;
     CTRL_LSB			= 01'h0;
     CTRL_CSM			= 01'h0;
     CTRL_EMA			= 03'h4;
     CTRL_EMAW			= 02'h0;
     CTRL_DCX			= 01'h0;
     CTRL_CS			= 01'h1;
     TXR_TXD			= 08'h0;
     RXR_RXD			= 08'h0;
     CCV_TXCNT			= 16'h0;
     CCV_RXCNT			= 16'h0;
     SR_BUSY			= 01'h0;
     SR_IRQ				= 06'h0;
     SR_FLAG_IRQ		= 06'h0;
     FCTRL_TXLEVEL		= 06'h0;
     FCTRL_RXLEVEL		= 06'h0;
     FCTRL_TXEN			= 01'h0;
     FCTRL_RXEN			= 01'h0;
     FSR_TXDIFF			= 08'h0;
     FSR_RXDIFF			= 08'h0; 
     FSR_TXF			= 01'h0;
     FSR_TXE			= 01'h1;
     FSR_RXF			= 01'h0;
     FSR_RXE			= 01'h1;
     TIME_CSSCK			= 08'h0;
     TIME_SCKCS			= 08'h0;
     TIME_INTERD		= 08'h0;
     INTR_IEN			= 06'h0;
     CLR_CLRTC			= 01'h0;
     CLR_CLRRC			= 01'h0;
     CLR_CLRTX			= 01'h0;
     CLR_CLRRX			= 01'h0;
     CLR_ICLR			= 06'h0;
    
     TXBASE_TX_BASE		= 32'h0;
     RXBASE_RX_BASE		= 32'h0;
     PCKT_COUNT			= 16'h0;
     PCKT_SIZE			= 16'h0;
     DMA_CTRL_EN		= 01'h0;
     DMA_CTRL_DTE		= 01'h0;
     DMA_CTRL_DRE		= 01'h0;
     DMA_CTRL_TEND		= 01'h0;
     DMA_CTRL_REND		= 01'h0;
     DMA_CTRL_CONT		= 01'h0;
     DMA_CTRL_TXAM		= 02'h0;
     DMA_CTRL_RXAM		= 02'h0;
     DMA_CTRL_DCT		= 01'h0;
     DMA_CTRL_DRQS		= 01'h0;
     DMA_SR_TXPCNT		= 16'h0;
     DMA_SR_RXPCNT		= 16'h0;
     DMA_INTR_ISD		= 01'h0;
     DMA_INTR_ISP		= 01'h0;
     DMA_INTR_IED		= 01'h0;
     DMA_INTR_IEP		= 01'h0;
     DMA_INTR_IRQPCNT	= 12'h0;
     DMA_CLR_ISDCLR		= 01'h0;
     DMA_CLR_ISPCLR		= 01'h0;
     DMA_CLR_PCLR		= 01'h0;
     DMA_ROT_RTEN		= 01'h0;
     DMA_ROT_RUNIT		= 02'h0;
     DMA_ROT_RSTRIDE	= 11'h0;
     RCONST_BLEN		= 05'h0;
     RCONST_BSTRIDE		= 14'h0;
     PCONST_PSTRIDE		= 18'h0;

/*
    //SPI Master Register Settings
    REG_SPI0_PRES      = {16'h0, PRES_SCKPRES};
    REG_SPI0_CTRL      = {CTRL_EN, CTRL_DEN, 6'h0, CTRL_CPOL, CTRL_CPHA, 3'h0, CTRL_LSB, 1'b0, CTRL_CSM, 3'd0, CTRL_EMA, CTRL_EMAW, 3'd0, CTRL_DCX, 3'h0, CTRL_CS};
    REG_SPI0_TXR       = {24'h0, TXR_TXD};
    REG_SPI0_FCTRL     = {2'h0, FCTRL_TXLEVEL, 2'h0, FCTRL_RXLEVEL, 7'h0, FCTRL_TXEN, 7'h0, FCTRL_RXEN};
    REG_SPI0_TIME      = {TIME_CSSCK, TIME_SCKCS, 8'h0, TIME_INTERD};
    REG_SPI0_INTR      = {26'd0, INTR_IEN};
    REG_SPI0_ICLR      = {3'h0, CLR_CLRTC, 3'h0, CLR_CLRRC, 3'h0, CLR_CLRTX, 3'h0, CLR_CLRRX, 10'b0, CLR_ICLR};

    REG_SPI0_TXBASE    = {TXBASE_TX_BASE};
    REG_SPI0_RXBASE    = {RXBASE_RX_BASE};
    REG_SPI0_PCKT      = {PCKT_COUNT, PCKT_SIZE};
    REG_SPI0_DMA_CTRL  = {DMA_CTRL_EN, DMA_CTRL_DTE, DMA_CTRL_DRE, 3'd0, DMA_CTRL_TEND, DMA_CTRL_REND, DMA_CTRL_CONT, 3'd0, DMA_CTRL_TXAM, DMA_CTRL_RXAM, 7'd0, DMA_CTRL_DCT, 7'd0, DMA_CTRL_DRQS};
    REG_SPI0_DMA_INTR  = {3'd0, DMA_INTR_ISD, 3'd0, DMA_INTR_ISP, 3'd0, DMA_INTR_IED, 3'd0, DMA_INTR_IEP, 4'd0, DMA_INTR_IRQPCNT};
    REG_SPI0_DMA_CLR   = {7'd0, DMA_CLR_ISDCLR, 7'd0, DMA_CLR_ISPCLR, 15'd0, DMA_CLR_PCLR };
    REG_SPI0_DMA_ROT   = {DMA_ROT_RTEN, 5'd0, DMA_ROT_RUNIT, 13'd0, DMA_ROT_RSTRIDE};
    REG_SPI0_RCONST    = {11'd0, RCONST_BLEN, 2'd0, RCONST_BSTRIDE};
    REG_SPI0_PCONST    = {14'd0, PCONST_PSTRIDE};
*/    

//******************************************************************
// SPI Initialize (Write APB Regs)
//****************************************************************** 
	PRES_SCKPRES       = 2;
	
	FCTRL_TXEN         = 1;
	FCTRL_RXEN         = 0;

	CTRL_EN            = 1;
	CTRL_DEN           = 0;
	CTRL_CSM           = 0;
	CTRL_CS            = 0;
	CTRL_DCX           = 0;
	
	DMA_INTR_IEP       = 0;
	DMA_INTR_IED       = 1;

	DMA_CTRL_DRQS      = 0;
	DMA_CTRL_DCT       = 0;
	DMA_CTRL_DRE       = 1;
	DMA_CTRL_DTE       = 0;

	PCKT_COUNT         = `PCK_P_FRAME;
	PCKT_SIZE          = (`PIXEL_ROW*`PIXEL_COL*`RGB_BYTE)/(`PCK_P_FRAME);

	DMA_ROT_RTEN       = 1;
	DMA_ROT_RUNIT      = `RGB_BYTE-1;
	DMA_ROT_RSTRIDE	   = `PIXEL_COL;

	RCONST_BLEN        = (`PIXEL_ROW*`RGB_BYTE)/`PCK_P_FRAME;
	RCONST_BSTRIDE     = (`PIXEL_COL*`RGB_BYTE);

	PCONST_PSTRIDE     = (`PIXEL_ROW*`RGB_BYTE);

    REG_SPI0_PRES      = {16'h0, PRES_SCKPRES};
    REG_SPI0_FCTRL     = {2'h0, FCTRL_TXLEVEL, 2'h0, FCTRL_RXLEVEL, 7'h0, FCTRL_TXEN, 7'h0, FCTRL_RXEN};
    REG_SPI0_CTRL      = {CTRL_EN, CTRL_DEN, 6'h0, CTRL_CPOL, CTRL_CPHA, 3'h0, CTRL_LSB, 1'b0, CTRL_CSM, 3'd0, CTRL_EMA, CTRL_EMAW, 3'd0, CTRL_DCX, 3'h0, CTRL_CS};
    REG_SPI0_DMA_INTR  = {3'd0, DMA_INTR_ISD, 3'd0, DMA_INTR_ISP, 3'd0, DMA_INTR_IED, 3'd0, DMA_INTR_IEP, 4'd0, DMA_INTR_IRQPCNT};
    REG_SPI0_DMA_CTRL  = {DMA_CTRL_EN, DMA_CTRL_DTE, DMA_CTRL_DRE, 3'd0, DMA_CTRL_TEND, DMA_CTRL_REND, DMA_CTRL_CONT, 3'd0, DMA_CTRL_TXAM, DMA_CTRL_RXAM, 7'd0, DMA_CTRL_DCT, 7'd0, DMA_CTRL_DRQS};
    REG_SPI0_PCKT      = {PCKT_COUNT, PCKT_SIZE};
    REG_SPI0_DMA_ROT   = {DMA_ROT_RTEN, 5'd0, DMA_ROT_RUNIT, 13'd0, DMA_ROT_RSTRIDE};
    REG_SPI0_RCONST    = {11'd0, RCONST_BLEN, 2'd0, RCONST_BSTRIDE};
    REG_SPI0_PCONST    = {14'd0, PCONST_PSTRIDE};
	
	u_simapb.APB_WRITE(32'h0000_0000, REG_SPI0_PRES);
    u_simapb.APB_WRITE(32'h0000_0018, REG_SPI0_FCTRL);
    u_simapb.APB_WRITE(32'h0000_0004, REG_SPI0_CTRL);
    u_simapb.APB_WRITE(32'h0000_0040, REG_SPI0_DMA_INTR);
    u_simapb.APB_WRITE(32'h0000_0038, REG_SPI0_DMA_CTRL);
    u_simapb.APB_WRITE(32'h0000_0034, REG_SPI0_PCKT);
    u_simapb.APB_WRITE(32'h0000_0048, REG_SPI0_DMA_ROT);
    u_simapb.APB_WRITE(32'h0000_004C, REG_SPI0_RCONST);
    u_simapb.APB_WRITE(32'h0000_0050, REG_SPI0_PCONST);
    //u_simapb.APB_WRITE(32'h0000_0054, 32'h00000); u_simapb.APB_READ(32'h0000_0054);
    //u_simapb.APB_WRITE(32'h0000_0054, 32'h00001); u_simapb.APB_READ(32'h0000_0054);
    //u_simapb.APB_WRITE(32'h0000_0054, 32'h00002); u_simapb.APB_READ(32'h0000_0054);
    //u_simapb.APB_WRITE(32'h0000_0054, 32'h00003); u_simapb.APB_READ(32'h0000_0054);
    
//******************************************************************
//  LCD Initialize (Write Command)
//****************************************************************** 
	frame = 0;
    $display("LCD APB Regs initialized");
//******************************************************************
// SPI Write Data 
//******************************************************************
	repeat(`FRAME_NUM) begin

		     if (frame == 0) $readmemh("./img_00.data", tb_top.u_axi_slave_model.SSRAM.memory);
		else if (frame == 1) $readmemh("./img_01.data", tb_top.u_axi_slave_model.SSRAM.memory);
		else if (frame == 2) $readmemh("./img_02.data", tb_top.u_axi_slave_model.SSRAM.memory);
		else if (frame == 3) $readmemh("./img_03.data", tb_top.u_axi_slave_model.SSRAM.memory);
    	$display("  read mem done");

		CTRL_DEN           = 0;
		CTRL_DCX           = 0;
    	REG_SPI0_CTRL      = {CTRL_EN, CTRL_DEN, 6'h0, CTRL_CPOL, CTRL_CPHA, 3'h0, CTRL_LSB, 1'b0, CTRL_CSM, 3'd0, CTRL_EMA, CTRL_EMAW, 3'd0, CTRL_DCX, 3'h0, CTRL_CS};
   		u_simapb.APB_WRITE(32'h0000_0004, REG_SPI0_CTRL);
    	#10000
		
		TXR_TXD            = 8'h2c;
    	REG_SPI0_TXR       = {24'h0, TXR_TXD};
		u_simapb.APB_WRITE(32'h0000_0008, REG_SPI0_TXR);
        $display("SPI TXR write");
    	#10000

		CTRL_DEN           = 1;
		CTRL_DCX           = 1;
    	REG_SPI0_CTRL      = {CTRL_EN, CTRL_DEN, 6'h0, CTRL_CPOL, CTRL_CPHA, 3'h0, CTRL_LSB, 1'b0, CTRL_CSM, 3'd0, CTRL_EMA, CTRL_EMAW, 3'd0, CTRL_DCX, 3'h0, CTRL_CS};
   		u_simapb.APB_WRITE(32'h0000_0004, REG_SPI0_CTRL);
		
		RXBASE_RX_BASE     = 0;
		DMA_CTRL_EN        = 1;
    	REG_SPI0_RXBASE    = {RXBASE_RX_BASE};
    	REG_SPI0_DMA_CTRL  = {DMA_CTRL_EN, DMA_CTRL_DTE, DMA_CTRL_DRE, 3'd0, DMA_CTRL_TEND, DMA_CTRL_REND, DMA_CTRL_CONT, 3'd0, DMA_CTRL_TXAM, DMA_CTRL_RXAM, 7'd0, DMA_CTRL_DCT, 7'd0, DMA_CTRL_DRQS};
    	u_simapb.APB_WRITE(32'h0000_0030, REG_SPI0_RXBASE);
    	u_simapb.APB_WRITE(32'h0000_0038, REG_SPI0_DMA_CTRL);

		@(posedge o_SPI_DMA_Interrupt)
		DMA_CLR_ISDCLR     = 1;
    	REG_SPI0_DMA_CLR   = {7'd0, DMA_CLR_ISDCLR, 7'd0, DMA_CLR_ISPCLR, 15'd0, DMA_CLR_PCLR };
    	u_simapb.APB_WRITE(32'h0000_0044, REG_SPI0_DMA_CLR);
		
		frame = frame + 1;
		#10000;
	end
	$display("Success");
	#5000;
	$finish;
end

//******************************************************************
//  OUTPUT DATA RECEIVER 
//******************************************************************
initial begin
	i = 0;
	n = 0;
	fp_spi_lcd_out[0] = $fopen("./img_output_00.data", "w");
	fp_spi_lcd_out[1] = $fopen("./img_output_01.data", "w");
	fp_spi_lcd_out[2] = $fopen("./img_output_02.data", "w");
	fp_spi_lcd_out[3] = $fopen("./img_output_03.data", "w");

	repeat(`FRAME_NUM) begin
		i = 0;
		forever begin
			@(posedge w_cnt_done)
			temp = w_rxd;
			if((temp==8'h2c) & (~`DCX & ~`CS)) break;
		end

		repeat(`PIXEL_ROW*`PIXEL_COL*`RGB_BYTE) begin
		    @(posedge w_cnt_done)
		    temp = w_rxd;
			rx_din[i] = temp;
			i = i + 1;
			if(i==4) begin
			    $fwrite(fp_spi_lcd_out[n], "%02x%02x%02x%02x\n", rx_din[0],  rx_din[1],  rx_din[2],  rx_din[3]);
			    i = 0;
			end
		end
	
		$display("ddr.data img generation completed.. tb_spi1/img/img_output_[##].data");
		$fclose(fp_spi_lcd_out[n]);
		n = n + 1;
	end
end


//--------------------------------------------------------------------------
//
// AXEMIS MMU (TBUx8 + TCU)
//
//--------------------------------------------------------------------------

AB21X_AXEMIS_CLUSTER_MMU u30_axemis_mmu (
    .CLK_XMSCL_APB             ( axmscl_apb_pclk    ), 
    .TCU_CLK                   ( ammutcu_clk        ),
    .TBU0_CLK                  ( ammutcu_clk        ),
    .TBU1_CLK                  ( ammutcu_clk        ),
    .TBU2_CLK                  ( ammutcu_clk        ),
    .TBU3_CLK                  ( ammutcu_clk        ),
    .TBU4_CLK                  ( ammutcu_clk        ),
    .TBU5_CLK                  ( ammutcu_clk        ),
    .TBU6_CLK                  ( ammutcu_clk        ),
    .TBU7_CLK                  ( ammutcu_clk        ),

    .AXEMIS0_CLK               ( axemis0_clk        ),
    .AXEMIS1_CLK               ( axemis1_clk        ),
    .AXEMIS2_CLK               ( axemis2_clk        ),
    .AXEMIS3_CLK               ( axemis3_clk        ),
    .AXEMIS4_CLK               ( axemis4_clk        ),
    .AXEMIS5_CLK               ( axemis5_clk        ),
    .AXEMIS6_CLK               ( axemis6_clk        ),
    .AXEMIS7_CLK               ( axemis7_clk        ),
    
    .RSTn_XMSCL_APB            ( ~axmscl_apb_prst   ),
    .TCU_RSTn                  ( ~ammutcu_rst       ),
    .TBU0_RSTn                 ( ~ammutcu_rst       ),
    .TBU1_RSTn                 ( ~ammutcu_rst       ),
    .TBU2_RSTn                 ( ~ammutcu_rst       ),
    .TBU3_RSTn                 ( ~ammutcu_rst       ),
    .TBU4_RSTn                 ( ~ammutcu_rst       ),
    .TBU5_RSTn                 ( ~ammutcu_rst       ),
    .TBU6_RSTn                 ( ~ammutcu_rst       ),
    .TBU7_RSTn                 ( ~ammutcu_rst       ),

    .AXEMIS0_RSTn              ( ~axemis0_rst       ),
    .AXEMIS1_RSTn              ( ~axemis1_rst       ),
    .AXEMIS2_RSTn              ( ~axemis2_rst       ),
    .AXEMIS3_RSTn              ( ~axemis3_rst       ),
    .AXEMIS4_RSTn              ( ~axemis4_rst       ),
    .AXEMIS5_RSTn              ( ~axemis5_rst       ),
    .AXEMIS6_RSTn              ( ~axemis6_rst       ),
    .AXEMIS7_RSTn              ( ~axemis7_rst       ),

    // MMU-TCU programming IF
    .PADDR                     ( ammutcu_paddr         ),
    .PPROT                     ( ammutcu_pprot         ),
    .PSEL                      ( ammutcu_psel          ),
    .PENABLE                   ( ammutcu_penable       ),
    .PWRITE                    ( ammutcu_pwrite        ),
    .PWDATA                    ( ammutcu_pwdata        ),
    .PSTRB                     ( ammutcu_pstrb         ),
    .PREADY                    ( ammutcu_pready        ),
    .PRDATA                    ( ammutcu_prdata        ),
    .PSLVERR                   ( ammutcu_pslverr       ),
    .PWAKEUP                   ( 1'b1                  ),
    
`ifdef AB_TEST_MMU_IN_TB
`else
    // AXEMIS(adb-slv) => TBU(adb-mst)
    `AXEMIS_ACE5LADB_ASYNC_PORT_CONNECT(AXEMIS0,axemis0),
    `AXEMIS_ACE5LADB_ASYNC_PORT_CONNECT(AXEMIS1,axemis1),
    `AXEMIS_ACE5LADB_ASYNC_PORT_CONNECT(AXEMIS2,axemis2),
    `AXEMIS_ACE5LADB_ASYNC_PORT_CONNECT(AXEMIS3,axemis3),
    `AXEMIS_ACE5LADB_ASYNC_PORT_CONNECT(AXEMIS4,axemis4),
    `AXEMIS_ACE5LADB_ASYNC_PORT_CONNECT(AXEMIS5,axemis5),
    `AXEMIS_ACE5LADB_ASYNC_PORT_CONNECT(AXEMIS6,axemis6),
    `AXEMIS_ACE5LADB_ASYNC_PORT_CONNECT(AXEMIS7,axemis7),
`endif

    .TCU_ACLKEN                ( TCU_ACLKEN            ),
    .TCU_AWAKEUP               ( TCU_AWAKEUP           ),
    .TCU_AWID                  ( TCU_AWID              ),
    .TCU_AWADDR                ( TCU_AWADDR            ),
    .TCU_AWLEN                 ( TCU_AWLEN             ),
    .TCU_AWSIZE                ( TCU_AWSIZE            ),
    .TCU_AWBURST               ( TCU_AWBURST           ),
    .TCU_AWLOCK                ( TCU_AWLOCK            ),
    .TCU_AWCACHE               ( TCU_AWCACHE           ),
    .TCU_AWPROT                ( TCU_AWPROT            ),
    .TCU_AWDOMAIN              ( TCU_AWDOMAIN          ),
    .TCU_AWSNOOP               ( TCU_AWSNOOP           ),
    .TCU_AWTAGOP               ( TCU_AWTAGOP           ),
    .TCU_AWQOS                 ( TCU_AWQOS             ),
    .TCU_AWNSAID               ( TCU_AWNSAID           ),
    .TCU_AWUSER                ( TCU_AWUSER            ),
    .TCU_AWATOP                ( TCU_AWATOP            ),
    .TCU_AWSTASHNID            ( TCU_AWSTASHNID        ),
    .TCU_AWSTASHNIDEN          ( TCU_AWSTASHNIDEN      ),
    .TCU_AWSTASHLPID           ( TCU_AWSTASHLPID       ),
    .TCU_AWSTASHLPIDEN         ( TCU_AWSTASHLPIDEN     ),
    .TCU_AWTRACE               ( TCU_AWTRACE           ),
    .TCU_AWMPAM                ( TCU_AWMPAM            ),
    .TCU_AWIDUNQ               ( TCU_AWIDUNQ           ),
    .TCU_AWLOOP                ( TCU_AWLOOP            ),
    .TCU_AWCMO                 ( TCU_AWCMO             ),
    .TCU_AWVALID               ( TCU_AWVALID           ),
    .TCU_AWREADY               ( TCU_AWREADY           ),
    .TCU_WDATA                 ( TCU_WDATA             ),
    .TCU_WSTRB                 ( TCU_WSTRB             ),
    .TCU_WLAST                 ( TCU_WLAST             ),
    .TCU_WUSER                 ( TCU_WUSER             ),
    .TCU_WTRACE                ( TCU_WTRACE            ),
    .TCU_WPOISON               ( TCU_WPOISON           ),
    .TCU_WDATACHK              ( TCU_WDATACHK          ),
    .TCU_WTAGUPDATE            ( TCU_WTAGUPDATE        ),
    .TCU_WTAG                  ( TCU_WTAG              ),
    .TCU_WVALID                ( TCU_WVALID            ),
    .TCU_WREADY                ( TCU_WREADY            ),
    .TCU_BID                   ( TCU_BID               ),
    .TCU_BRESP                 ( TCU_BRESP             ),
    .TCU_BUSER                 ( TCU_BUSER             ),
    .TCU_BTRACE                ( TCU_BTRACE            ),
    .TCU_BIDUNQ                ( TCU_BIDUNQ            ),
    .TCU_BLOOP                 ( TCU_BLOOP             ),
    .TCU_BCOMP                 ( TCU_BCOMP             ),
    .TCU_BPERSIST              ( TCU_BPERSIST          ),
    .TCU_BVALID                ( TCU_BVALID            ),
    .TCU_BREADY                ( TCU_BREADY            ),
    .TCU_ARID                  ( TCU_ARID              ),
    .TCU_ARADDR                ( TCU_ARADDR            ),
    .TCU_ARLEN                 ( TCU_ARLEN             ),
    .TCU_ARSIZE                ( TCU_ARSIZE            ),
    .TCU_ARBURST               ( TCU_ARBURST           ),
    .TCU_ARLOCK                ( TCU_ARLOCK            ),
    .TCU_ARCACHE               ( TCU_ARCACHE           ),
    .TCU_ARPROT                ( TCU_ARPROT            ),
    .TCU_ARDOMAIN              ( TCU_ARDOMAIN          ),
    .TCU_ARSNOOP               ( TCU_ARSNOOP           ),
    .TCU_ARTAGOP               ( TCU_ARTAGOP           ),
    .TCU_ARQOS                 ( TCU_ARQOS             ),
    .TCU_ARNSAID               ( TCU_ARNSAID           ),
    .TCU_ARUSER                ( TCU_ARUSER            ),
    .TCU_ARTRACE               ( TCU_ARTRACE           ),
    .TCU_ARMPAM                ( TCU_ARMPAM            ),
    .TCU_ARIDUNQ               ( TCU_ARIDUNQ           ),
    .TCU_ARLOOP                ( TCU_ARLOOP            ),
    .TCU_ARCHUNKEN             ( TCU_ARCHUNKEN         ),
    .TCU_ARVALID               ( TCU_ARVALID           ),
    .TCU_ARREADY               ( TCU_ARREADY           ),
    .TCU_RID                   ( TCU_RID               ),
    .TCU_RDATA                 ( TCU_RDATA             ),
    .TCU_RRESP                 ( TCU_RRESP             ),
    .TCU_RLAST                 ( TCU_RLAST             ),
    .TCU_RUSER                 ( TCU_RUSER             ),
    .TCU_RTRACE                ( TCU_RTRACE            ),
    .TCU_RPOISON               ( TCU_RPOISON           ),
    .TCU_RDATACHK              ( TCU_RDATACHK          ),
    .TCU_RIDUNQ                ( TCU_RIDUNQ            ),
    .TCU_RLOOP                 ( TCU_RLOOP             ),
    .TCU_RCHUNKV               ( TCU_RCHUNKV           ),
    .TCU_RCHUNKNUM             ( TCU_RCHUNKNUM         ),
    .TCU_RCHUNKSTRB            ( TCU_RCHUNKSTRB        ),
    .TCU_RVALID                ( TCU_RVALID            ),
    .TCU_RREADY                ( TCU_RREADY            ),
    .TCU_ACADDR                ( TCU_ACADDR            ),
    .TCU_ACSNOOP               ( TCU_ACSNOOP           ),
    .TCU_ACPROT                ( TCU_ACPROT            ),
    .TCU_ACVMIDEXT             ( TCU_ACVMIDEXT         ),
    .TCU_ACTRACE               ( TCU_ACTRACE           ),
    .TCU_ACVALID               ( TCU_ACVALID           ),
    .TCU_ACREADY               ( TCU_ACREADY           ),
    .TCU_ACWAKEUP              ( TCU_ACWAKEUP          ),
    .TCU_CRRESP                ( TCU_CRRESP            ),
    .TCU_CRTRACE               ( TCU_CRTRACE           ),
    .TCU_CRVALID               ( TCU_CRVALID           ),
    .TCU_CRREADY               ( TCU_CRREADY           ),
    .TCU_SYSCOREQ              ( TCU_SYSCOREQ          ),
    .TCU_SYSCOACK              ( TCU_SYSCOACK          ),

    // TBU => CMN
    `TBU_ACE5L_PORT_CONNECT(0), // TBU0_ARADDR
    `TBU_ACE5L_PORT_CONNECT(1),
    `TBU_ACE5L_PORT_CONNECT(2),
    `TBU_ACE5L_PORT_CONNECT(3),
    `TBU_ACE5L_PORT_CONNECT(4),
    `TBU_ACE5L_PORT_CONNECT(5),
    `TBU_ACE5L_PORT_CONNECT(6),
    `TBU_ACE5L_PORT_CONNECT(7),
 
    .IRQ                       ( mmu_irq               )
);




//--------------------------------------------------------------------
//  CRM & APB TASK
//--------------------------------------------------------------------
simcrm u_simcrm(
    .ACLK   ( ammutcu_clk     ),
    .PCLK   ( axmscl_apb_pclk ),
    .ARESETN( ammutcu_rst     ),
    .PRESETN( axmscl_apb_prst )
);

simapb u_simapb(
    .PClk   ( axmscl_apb_pclk ),
    .PResetn( axmscl_apb_prst ),
    .PAddr  ( ammutcu_paddr   ),
    .PSel   ( ammutcu_psel    ),
    .PEnable( ammutcu_penable ),
    .PReady ( ammutcu_preday  ),
    .PWrite ( ammutcu_pwrite  ),
    .PWData ( ammutcu_pwdata  ),
    .PRData ( ammutcu_prdata  ),
    .PSlvErr( ammutcu_pslverr )
);

initial begin
  $shm_open("wave");
  $shm_probe("ASM", tb_top);
end // initial

endmodule
