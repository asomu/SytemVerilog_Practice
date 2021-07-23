`timescale 1ns/10ps

program cktime();
    time a;
    initial
    begin
        $monitor("@ %gns a = %0t", $time, a);
        #1 a = 1ns;
        #1 a = 0.4ns;
        #1 a = 0.5ns;
        #1 a = 1.47ns + 30ps;
        #1 a = 1.47ns + 3ps;
        #1 $finish;
    end
endprogram