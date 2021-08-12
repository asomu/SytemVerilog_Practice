`timescale 1ns/1ns

import ComplexPkg::Complex;
import ComplexPkg::add;

program ckhapkg();
    Complex a = '{1.2, 3.4};
    Complex b = '{5.6, 7.8};
    Complex z;

    initial
    begin
        $display("a.r = %f, a.i = %f", a.r, a.i);
        $display("b.r = %f, b.i = %f", b.r, b.i);
        z = add(a,b)
        $display("z.r = %f, z.i = %f", z.r, z.i);

        z = ComplexPkg::mum(a,b);
        $display("z.r = %f, z.i = %f", z.r, z.i);
        #1 $finish;
    end
endprogram
