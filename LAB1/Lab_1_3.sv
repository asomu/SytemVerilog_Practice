`timescale 1ns/1ns

program ckreal();
    real r;
    shortreal sr;

    initial
    begin
        $monitor ("@ %gns r = %e sr = %e", $time, r, sr);
        r = '0;
        sr = '0;
        #1 r = 1.2345678912345678e10;
        sr = 1.23456789123456789e10;
        #1 r = -1234567891;
        sr = shortint'(r);
        #1 $finish;
    end
endprogram