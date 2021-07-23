`timescale 1ns/1ns
module ckevent();
    logic clk = 0;
    logic rst, enable;

    initial
    begin
        #1 rst = 1;
        #1 rst = 0;
        #3 enable = 1;
        #5 enable = 0;
        #10 rst = 1;
        #50 $finish;
    end

    always #5 clk = ~clk;

    always @(enable)
    begin
        if (enable) $display("@ %gns Enable in always_comb", $time);
    end

    always_ff @(posedge clk, negedge rst)
    begin
        if (!rst) $display("@ %gns Active low reset in always", $time);
        else $display ("@ %gns Rising edge clock in always", $time);
    end
endmodule