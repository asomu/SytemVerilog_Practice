`timescale 1ns/1ns

program chunion();

    typedef enum {INT,REAL} dtype_t;
    typedef struct{
        dtype_t sort;
        union{
            int i;
            real r;
        }value;
    }data_t;

    typedef union tagged{
        int i;
        real r;
    }datatag_t;

    data_t d1;
    datatag_t dtag1;
    int ai;
    real ar;

    initial
    begin
        #1 $display("@ %gns d1 = %p, dtag1 = %p", $time, d1, dtag1);
        d1.value.r = 3.14;
        d1.sort = REAL;
        dtag1 = tagged r 3.14;
        #1 $display("@ %gns d1 = %p, dtag1 = %p", $time, d1, dtag1);
        d1.value.i = 2013;
        d1.sort = INT;
        dtag1 = tagged i 2013;
        #1 $display("@ %gns d1 = %p, dtag1 = %p", $time, d1, dtag1);
        ai = d1.value.i;
        ar = d1.value.r;
        #1 $display("@ %gns ai = %0d, ar = %f", $time, ai, ar);
        ai = 0; ar = 0.0;
        case (d1.sort)
            INT: ai = d1.value.i;
            REAL: ar = d1.value.r;
        endcase
        #1 $display("@ %gns ai = %0d, ar = %f", $time, ai, ar);
        ai = dtag1.i;
        ar = dtag1.r;
        #1 $display("@ %gns ai = %0d, ar = %f", $time, ai, ar);
    end
endprogram
