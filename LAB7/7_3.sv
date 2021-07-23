`timescale 1ns/1ns

module ckalwlch(
    output logic q,
    input logic reset_n,
    input logic g,
    input logic d
);

    initial
    begin
        $monitor ("@ %gns reset_n(%b) g(%b) : d(%b) => q(%b)", $time, reset_n, g, d, q);
        reset_n = 1'b0;
        g = 1'b0;
        d = 1'b0;
        #1 reset_n = 1'b1;
        #1 g = 1'b1;
        #1 d = 1'b1;
        #1 d = 1'b0;
        #1 g = 1'b0;
        #1 d = 1'b1;
        #1 d = 1'b0;
        #1 $finish;
    end

    always_latch
    begin
        if (!reset_n) q = 1'b0;
        else if (g) q = d;        
    end
endmodule