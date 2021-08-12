`timescale 1ns/1ns

module ckclkbl();
    logic clk;
    logic [7:0] dout, din;

    default clocking cb @(posedge clk);
        input din;
        output dout;
    endclocking

    always #5 clk = ~clk;

    initial
    begin
        $monitor("@ %gns clk = %b, din/cb.din = %0d/%0d, dout/cb.dout = %0d/%0d",
        $time, clk, din, cb.din, dout, cb.dout);
        clk <= 0;
        fork
            begin
                din <= 0;
                #50 din <=1;
                #10 din <=0;
                #10 din <=1;
            end
            begin
                ##1 cb.dout <= 8'd1;
                ##2 cb.dout <= 8'd3;
                ##2 cb.dout <= 8'd5;
                @(cb.din) cb.dout <= 8'd10;
                @(posedge cb.din) cb.dout <= 8'd20;
            end
        join

        #10 $finish;
    end
endmodule