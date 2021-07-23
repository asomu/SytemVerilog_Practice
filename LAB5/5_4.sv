`timescale 1ns/1ns

program ckwildeq();
    logic [7:0] a = '1;
    logic [7:0] b;

    initial
    begin
        b = 8'b1xxx_z1xz;
        $display ("a = %b", a);
        $display ("b = %b", b);
        if (a==b) $display ("a is equal to b with ==.\n");
        else $display("a is NOT equal to b with ==.\n");

        b = 8'b1xxx_z1xz;
        $display ("a = %b", a);
        $display ("b = %b", b);
        if (a==?b) $display ("a is equal to b with ==?.\n");
        else $display("a is NOT equal to b with ==?.\n");
        if (a!=?b) $display ("a is NOT equal to b with !=?.\n");
        else $display("a is equal to b with !=?.\n");

        b = 8'b1xxx_z1x0;
        $display ("a = %b", a);
        $display ("b = %b", b);
        if (a==?b) $display ("a is equal to b with ==?.\n");
        else $display("a is NOT equal to b with ==?.\n");
        if (a!=?b) $display ("a is NOT equal to b with !=?.\n");
        else $display("a is equal to b with !=?.\n");

        #1 $finish;
    end
endprogram