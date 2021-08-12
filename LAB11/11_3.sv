`timescale 1ns/1ns

module testbench ();
    logic clk = 0;
    logic [7:0] din;
    logic [7:0] dout;
    logic rst_n;

    always #5 clk = ~clk;

    initial
    begin
        $monitor("@ %gns rst_n = %b, clk = %b, din = %d, dout = %0d", $time, rst_n, clk, din, dout);
    end

    ckclkskew SCKCLCBL(
        .dout(dout),
        .clk(clk),
        .din(din),
        .rst_n(rst_n)
    );

    reg8b SREG8B (
        .q(dout),
        .clk(clk),
        .d(din),
        .rst_n(rst_n)
    );
endmodule

module reg8b(
    output logic [7:0] q,
    input logic clk,
    input logic [7:0] d,
    input logic rst_n,
);
    always_ff @(posedge clk, negedge rst_n)
    begin
        if(!rst_n) q<=1'b0;
        else q<=d;
    end
endmodule

program ckclkskew(    
    input logic clk,
    input logic [7:0] dout,
    output logic [7:0] din,
    output logic rst_n,
);
    default clocking cb @(posedge clk);
        input #2 dout;
        input #3 din, rst_n;
    endclocking

    initial
    begin
        rst_n = 0;
        din = '0;
        ##1 cb.rst_n = 1;

        for (int i = 0; i<3; i++)
            ##1 cb.din = $random;
        #20 $finish;
    end
endprogram