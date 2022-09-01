//
// simcrm.v
//

`timescale 1ns / 1ps
`define A_EQ_P

module simcrm (
    output reg      ACLK,
    output reg      PCLK,

    output reg      ARESETN,
    output reg      PRESETN
);

    //parameter   ACLK_FREQ   = 200.0;                    // 200MHz
    parameter   ACLK_FREQ   = 100.0;                    // 200MHz
    parameter   ACLK_TIME   = 1000.0 / ACLK_FREQ;       //

    parameter   PCLK_DIVS   = 2;                        // ACLK / (2**(PCLK_DIVS))

    wire        PCLKEN,

    reg             rstn;
    reg     [3:0]   divs;

    initial begin
        ACLK = 1'b0;
        PCLK = 1'b0;
        divs = PCLK_DIVS;

        #(1000)
        #(1000)
        rstn = 1'b0;
        #(1000)
        rstn = 1'b1;

    end
    always #(ACLK_TIME/2.0) ACLK <= ~ACLK;
	`ifdef A_EQ_P    
	always #(ACLK_TIME/2.0) PCLK <= ~PCLK;
    assign PCLKEN = 1;
	`else
    always @(posedge ACLK)
    begin
        if (divs == 0)
            divs <= PCLK_DIVS;
        else
            divs <= (divs - 1);
    end
    always @(posedge ACLK)
    begin
        if (divs == 0)
            PCLK <= ~PCLK;
    end 
    assign PCLKEN = (PCLK == 1'b0) & (divs == 0);
	`endif


    always @(posedge ACLK)
    begin
        //if ((PCLK == 1'b0) & (divs == 0))
        //begin
            ARESETN <= rstn;
            PRESETN <= rstn;
        //end
    end

endmodule
