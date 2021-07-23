`timescale 1ns/1ns

program ckstr();
    string a;
    byte b;
    byte c[0:10];

    initial
    begin
        $display("@ %gns a = %s", $time, a);
        #1 a = "Hello World!";
        $display("@ %gns a = %s", $time, a);
        #1 b = "H!";
        $display("@ %gns b = %s (%0d)", $time, b, b);
        #1 b = "e";
        $display("@ %gns b = %s (%0d)", $time, b, b);
        #1 c = "Hello World!";
        $display("@ %gns c = %p", $time, b);
        #1 $finish;
    end
endprogram