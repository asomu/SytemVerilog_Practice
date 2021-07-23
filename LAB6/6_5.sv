`timescale 1ns/1ns

program ckbcps ();
    int sum = 0;

    initial
    begin
        for(int i=1;i<15;i++)
        begin
            if(i==11) break;
            else if (i % 2) continue;
            sum += i;
            #1 $display("@ %g sum + %0d = %0d", $time, i, sum);
        end

        #1 $finish;
    end

    final
    begin
        $display("@ %g In final block", $time);
        $display("@ %g Bye!!", $time);
    end
endprogram