`timescale 1ns/1ns
program ckudt();
    typedef int ary2x4_t [0:1][0:3];
    ary2x4_t a;
    int b [0:1][0:1][0:1] = '{'{'{1,2},'{3,4}},'{'{5,6},'{7,8}}};

    initial
    begin
        $display("b[0][0][0] = %0d", b[0][0][0]);
        $display("b[0][0][1] = %0d", b[0][0][1]);
        $display("b[0][0][0] = %0d", b[0][1][0]);
        $display("b[0][0][1] = %0d", b[0][1][1]);
        $display("b[0][0][0] = %0d", b[1][0][0]);
        $display("b[0][0][1] = %0d", b[1][0][1]);
        $display("b[0][0][0] = %0d", b[1][1][0]);
        $display("b[0][0][1] = %0d", b[1][1][1]);

        a = ary2x4_t '(b);

        $display("a[0][0] = %0d", a[0][0]);
        $display("a[0][1] = %0d", a[0][1]);
        $display("a[0][2] = %0d", a[0][2]);
        $display("a[0][3] = %0d", a[0][3]);
        $display("a[1][0] = %0d", a[1][0]);
        $display("a[1][1] = %0d", a[1][1]);
        $display("a[1][2] = %0d", a[1][2]);
        $display("a[1][3] = %0d", a[1][3]);
        #1 $finish;
    end
endprogram
