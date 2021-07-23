`timescale 1ns/1ns

module ckifeps();
    byte a = 0;

    initial
    begin
        repeat(7) #1 a++;
        #1 $finish;
    end

    always @(*)
    begin
        unique if ((a == 0) || (a == 1))
            $display("@ %g Unique a(%0d) == 0 or 1", $time, a);
        else if ( a == 2)
            $display("@ %g Unique a(%0d) == 2", $time, a);
        else if ( a == 4)
            $display("@ %g Unique a(%0d) == 4", $time, a);
        else $display("@ %g Unique else a(%0d)", $time, a);
    end

    always @(*)
    begin
        priority if (a[2:1] == 0)
            $display("@ %g Priority a[2:1](%b) in %b == 0", $time, a[2:1], a);
        else if ( a[2] == 0 )
            $display("@ %g Priority a[2](%b) in %b == 0", $time, a[2], a);        
        else $display("@ %g Priority else a(%b)", $time, a);
    end
endmodule