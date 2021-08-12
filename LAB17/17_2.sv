`timescale 1ns/1ns

module ram(
    input logic [7:0] addr,
    input logic rwb,
    input logic en,
    inout wire logic [7:0] data);

    var logic [7:0] mem [0:255];
    var logic [7:0] tmp;

    always @(en)
    begin
        if(en)
        begin
            if(rwb) tmp = mem[addr];
            else mem[addr] = data;
        end
        else tmp = 'z;
    end

    assign data = tmp;
endmodule

module ckcvsim();
    logic [7:0] addr;
    logic rwb;
    logic en;
    logic [7:0] wdata;
    wire logic [7:0] data;

    covergroup memcov @ (posedge en);
        address : coverpoint addr{
            bins low = {[0:50]};
            bins mid = {[51:150]};
            bins high = {[151:255]};
        }
        read_write : coverpoint rwb{
            bins write = {0};
            bins read = {1};
        }
    endgroup

    assign data = wdata;

    memcov SMEMCOV = new();
    ram SRAM(.*);

    initial
    begin
        for (int i = 0;i<30;i++)
        begin
            #1 en <= 0;
            #1 en <= 1;
            rwb <= 0;
            addr <= $random;
            wdata <= addr;
            #1 en <= 0;
            wdata <= 'z;
            #1 en <= 1;
            rwb <= 1;
        end
        #1 $finish;
    end
endmodule
