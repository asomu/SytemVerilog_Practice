`timescale 1ns/1ns
interface exif(
    input logic clk
);
    logic rst_n;
    logic [7:0] d;
    logic [7:0] q;

    modport reg8bif (input rst_n, clk, d, output q);
    modport prgif (input clk, q, output rst_n, d);

endinterface

module reg8b (exif.reg8bif mif);
    always_ff @(posedge mif.clk, negedge mif.rst_n)
    begin
        if(!mif.rst_n) mif.q <= 1'b0;
        else mif.q <= mif.d;
    end
endmodule

program ckproif(exif.prgif pif);
    initial
    begin
        pif.d <= '0;
        pif.rst_n <= 0;
        #7 pif.rst_n <= 1;

        for (int i = 0; i < 2; i++)
        begin
            @(negedge pif.clk);
            pif.d <= $random;
        end

        #20 $finish;
    end
endprogram

module testbench();
    logic clk = 0;
    always #5 clk = ~clk;

    initial
    begin
        $monitor("@ %2gns rst_n = %b, clk = %b, din = %3d, dout = %0d", $time, TBIF.rst_n, clk, TBIF.d, TBIF.q);
    end

    exif TBIF(.clk(clk));
    ckproif SCKCLKBL(.pif(TBIF));
    reg8b SREG8B(.mif(TBIF));
endmodule