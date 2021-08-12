`timescale 1ns/1ns

program cksystask1();
    int unsigned vui = 2013;
    shortreal vsr = 3.14;
    bit [16:0] vb16 = 16'habcd;
    enum {RED, YELLOW, GREEN=5} venum;
    typedef struct {int a; shortreal b;} twoint_t;
    twoint_t vstr;

    initial
    begin
        $display ("vui=%0d / %0d", vui, vui);
        $display ("vsr=%f / %e / %g", vsr, vsr, vsr);
        $display ("vb16=%b / %o / %h", vb16, vb16, vb16);
        $display ("venum=%0d / %s", venum, venum);
        $display ("vstr=%p", vstr);
        $display ("--------------");
        $display ("$typename of vui = %s", $typename(vui));
        $display ("$typename of vsr = %s", $typename(vsr));
        $display ("$typename of vb16 = %s", $typename(vb16));
        $display ("$typename of venum = %s", $typename(venum));
        $display ("$typename of vstr = %s", $typename(vstr));
        $display ("--------------");
        $display ("$bits of vui = %0d", $bits(vui));
        $display ("$bits of vsr = %0d", $bits(vsr));
        $display ("$bits of vb16 = %0d", $bits(vb16));
        $display ("$bits of venum = %0d", $bits(venum));
        $display ("$bits of vstr = %0d", $bits(vstr));
        $display ("--------------");
    end
endprogram