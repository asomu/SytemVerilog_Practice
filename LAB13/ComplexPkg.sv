package ComplexPkg;
    typedef struct{
        real r, i;
    } Complex;

    function Complex add(Complex a, b);
        add.r = a.r + b.r;
        add.i = a.i + b.i;
    endfunction

    function Complex mul(Complex a, b);
        mul.r = (a.r * b.r) - (a.i * b.i)
        mul.i = (a.r * b.r) + (a.i * b.i)
    endfunction
endpackage:ComplexPkg
