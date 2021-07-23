`timescale 1ns/10ps

typedef struct {
    int vi = 0;
    byte vb = 0;
    shortreal vr = 1.0;
} num3_t;

program ckstr();
    num3_t a;
    num3_t b = '{10,20,3.3};
    num3_t c = '{default:0};
    num3_t d[0:1] = '{'{20, 30, 4.4}, '{30, 40, 5.5}};

    initial
    begin
        $display ("a = %p", a);
        $display ("b.vi = %0d, b.vb = %0d, b.vr = %f", b.vi, b.vb, b.vr);
        $display ("c = %p", c);
        $display ("d[0] = %p", d[0]);
        $display ("d[1] = %p", d[1]);
        #1 $finish;
    end
endprogram