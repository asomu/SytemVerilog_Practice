`timescale 1ns/1ns

program ckfnretn();

    logic [7:0] a, b;
    logic [15:0] res;

    function logic [15:0] fnmult (input logic [7:0] x,y);
        fnmult = 16'(x * y);
    endfunction
    
    function logic [15:0] fnadd (input logic [7:0] x,y);
        fnadd = 16'(x + y);
    endfunction

    initial
    begin
        #1 a = 15; b = 7;
        #1 res = fnmult(a,b);
        $display ("$ %gns a = %b(%0d), b = %b(%0d), res = %b(%0d)", $time, a,a,b,b,res,res);
        #1 res = fnadd(a,b);
        $display ("$ %gns a = %b(%0d), b = %b(%0d), res = %b(%0d)", $time, a,a,b,b,res,res);
        $finish;

    end
endprogram

    