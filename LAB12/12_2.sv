`timescale 1ns/1ns

module counter(
    input logic clk, reset, enable,
    output logic [3:0] count
);
    always @ (posedge clk, posedge reset)
    begin
        if (reset) count <= '0;
        else if (enable) count ++;
    end
endmodule

program ckproblk(
    input logic clk,
    input logic [3:0] count,
    output logic reset, enable
);
    initial
    begin
        $monitor("@ %gns rest = %b, clk = %b, enable = %b, count = %0d", $time, reset, clk, enable, count);
        enable = 0;
        reset = 1;
        #7 reset = 0;
        @ (negedge clk) enable = 1;
        repeat (5) @ (posedge clk);
        @ (negedge clk) enable = 0;
        testbench.summerize();

        #15 $finish;
    end
endprogram

module testbench();
    logic clk = 0;
    wire reset, enable;
    wire [3:0] count;

    always #5 clk = ~clk;

    ckproblk SPROBLK(.*);
    counter SCOUNTER(.*);

    task summerize();
        $display("@ %gns count in testbench module = %0d", $time, count);
    endtask
endmodule