//2 state type에 없는 값이 들어오면 x, z 가 들어오면, 0로 표현됨.

`timescale 1ns/1ns

program ckint();
    integer a; // signed 32bit
    int b; //32bit signed
    shortint unsigned c; //16bit

    initial
    begin
        a = '0;
        b = a;
        $display ("@ %gns a = %h b = %h", $time, a, b);
        #1 a = 'x;
        b = a;
        $display ("@ %gns a = %h b = %h", $time, a, b);
        #1 a = '1;
        b = a;
        $display ("@ %gns a = %h b = %h", $time, a, b);
        #1 a = 'z;
        b = a;
        $display ("@ %gns a = %h b = %h", $time, a, b);
        #1 a = 32'b1111111100000000xxxxxxxxzzzzzzzz;
        b = int'(a);
        $display ("@ %gns a = %h b = %h", $time, a, b);
        c = -234;
        $display ("c = %d", c);
        #1 $finish;
    end
endprogram