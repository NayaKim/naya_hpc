//
// simapb.v
//

`timescale 1ns / 1ps

module simapb (
    input  wire                                 PClk,
    input  wire                                 PResetn,

    output reg  [31:0]                          PAddr,
    output reg                                  PSel,
    output reg                                  PEnable,
    input  wire                                 PReady,
    output reg                                  PWrite,
    output reg  [31:0]                          PWData,
    input  wire [31:0]                          PRData,
    input  wire                                 PSlvErr
);


    initial begin
        PSel        = 1'b0;
        PAddr       = 32'b0;
        PEnable     = 1'b0;
        PWrite      = 1'b0;
        PWData      = 32'b0;
    end



    task APB_WRITE;
        input   [31:0]  ADDR;
        input   [31:0]  DATA;
        reg             DONE;
    begin
        @(posedge PClk);
        PAddr   = ADDR;
        PSel    = 1'b1;
        PWrite  = 1'b1;
        PWData  = DATA;

        @(posedge PClk);
        PEnable = 1'b1;

        @(posedge PClk);
        DONE    = PReady;
        while (DONE == 1'b0)
        begin
            @(posedge PClk);
            DONE    = PReady;
        end

        PSel    = 1'b0;
        PEnable = 1'b0;

        @(posedge PClk);
    end
    endtask


    task APB_READ;
        input   [31:0]  ADDR;
        output  [31:0]  DATA;
        reg             DONE;
    begin
        @(posedge PClk);
        PAddr   = ADDR;
        PSel    = 1'b1;
        PWrite  = 1'b0;

        @(posedge PClk);
        PEnable = 1'b1;

        @(posedge PClk);
        DONE    = PReady;
        while (DONE == 1'b0)
        begin
            @(posedge PClk);
            DONE    = PReady;
        end
        DATA    = PRData;

        PSel    = 1'b0;
        PEnable = 1'b0;

        @(posedge PClk);
    end
    endtask


endmodule
