`timescale 1ns/1ns

program ckary();
    int a[1:6] = {0,1,2,3,4,5};
    int b[1:2][1:3] = '{'{0,1,2},'{3{4}}};

    initial
    begin
        $display ("a = %p", a);
        $display ("b[1][1] = %0d",b[1][1]);
        $display ("b[1][1] = %0d",b[1][2]);
        $display ("b[1][1] = %0d",b[1][3]);
        $display ("b[1][1] = %0d",b[2][1]);
        $display ("b[1][1] = %0d",b[2][2]);
        $display ("b[1][1] = %0d",b[2][3]);
        #1 $finish;
    end
endprogram
