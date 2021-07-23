`timescale 1ns/1ns

program ckmember();

    int a[$] = {1,2,3,4,5,6,7};
    int n;
    logic [2:0] d;

    initial
    begin
        n = 5;
        if (n inside {a})
            #1 $display("@ %gns %0d is inside %p", $time, n, a);
        else
            #1 $display("@ %gns %0d is not inside %p", $time, n, a);

        n = 55;
        if (n inside {a})
            #1 $display("@ %gns %0d is inside %p", $time, n, a);
        else
            #1 $display("@ %gns %0d is not inside %p", $time, n, a);

        d = 3'b1z1;
        if (d inside {3'b1?1, 3'b011})
            #1 $display("@ %gns %b is inside conditions", $time, d);
        else
            #1 $display("@ %gns %b is not inside conditions", $time, d);

        d = 3'b110;
        if (d inside {3'b1?1, 3'b011})
            #1 $display("@ %gns %b is inside conditions", $time, d);
        else
            #1 $display("@ %gns %b is not inside conditions", $time, d);

        n = 40;
        if (d inside {[16:23], [32:47]})
            #1 $display("@ %gns %b is inside conditions", $time, n);
        else
            #1 $display("@ %gns %b is not inside conditions", $time, n);

        n = 27;
        if (d inside {[16:23], [32:47]})
            #1 $display("@ %gns %b is inside conditions", $time, n);
        else
            #1 $display("@ %gns %b is not inside conditions", $time, n);

        #1 $finish;
    end
endprogram