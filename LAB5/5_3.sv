`timescale 1ns/1ns


program cklgcop();
    bit [7:0] a = 8'b01xz_01xz;
    logic [7:0] b = 8'b01xz_01xz;
    integer c = 32'b01xz_01xz;
    int d = 32'b01xz_01xz;

    initial
    begin
        $display ("a(bit) = %b", a);
        $display ("b(logic) = %b", b);
        $display ("c(integer) = %b", c);
        $display ("d(int) = %b", d);
        $display ("a + b = %b", a + b);
        $display ("c + d = %b", c + d);
        a = 10;
        b = 20;
        c = 30;
        d = 40;
        $display ("a(bit) = %b (%0d)", a, a);
        $display ("b(logic) = %b (%0d)",a , b);
        $display ("c(integer) = %b (%0d)",b, c);
        $display ("d(int) = %b (%0d)",d, d );
        $display ("a + b = %b (%0d)", a + b, a + b);
        $display ("c + d = %b (%0d)", c + d, c + d);

        #1 $finish;
    end
endprogram