`timescale 1ns/1ns

program ckasnop();
    var logic [15:0] a = 20000;
    var logic [15:0] b = '{4:1, 2:1, default:0};
    var logic [15:0] c = '0;
    
    initial
    begin
        $display ("a = %0d, b=%0d, c= %0d",a,b,c);
        c = a + b;
        $display ("%0d + %0d = %0d", a, b, c);
        c = a - b;
        $display ("%0d - %0d = %0d", a, b, c);
        c = a * b;
        $display ("%0d * %0d = %0d", a, b, c);
        c = a / b;
        $display ("%0d / %0d = %0d", a, b, c);
        c = a % b;
        $display ("%0d %s %0d = %0d", a, "%", b, c);
        
        c = a & b;
        $display ("%0d & %0d = %0d", a, b, c);
        c = a | b;
        $display ("%0d | %0d = %0d", a, b, c);
        c = a ^ b;
        $display ("%0d ^ %0d = %0d", a, b, c);
        c = ~a;
        $display ("~%b = %b", a, c);
        c = b << 3;
        $display ("%b (%0d) << 3 = %b (%0d)",b, b, c, c);
        c = c >> 2;
        $display ("%b (%0d) << 2 = %b (%0d)",b, b, c, c);

        #1 $finish;
    end
endprogram
