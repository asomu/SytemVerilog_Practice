`timescale 1ns/1ns

program ckpakary();
    
    bit[7:0] pkary = 8'hAB;
    logic[3:0] upkary[7:0] = '{7,6,5,4,3,2,1,0};

    initial
    begin
        #1 $display ("@ %gns pkary = %b (%0d)", $time, pkary, pkary);
        #1 $display ("@ %gns pkary[0] = %b", $time, pkary[0]);
        #1 $display ("@ %gns pkary[7:4] = %b", $time, pkary[7:4]);

        #1 $display ("@ %gns upkary = %p (%0d)", $time, upkary);
        upkary[7] = upkary[2] + upkary[1];
        #1 $display ("@ %gns upkary[7] = %0d", $time, upkary[7]);
        pkary = pkary + upkary[4];
        #1 $display ("@ %gns pkary = %0d", $time, pkary);
        pkary = {upkary[6], upkary[0]};
        #1 $display ("@ %gns pkary = %b (%0d)", $time, pkary, pkary);

        #1 $finish;
    end
endprogram