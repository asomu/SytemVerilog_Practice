`timescale 1ns/1ns

program ckasoray();
    int ram[int];
    int i;

    initial
    begin
        ram[1] = 1;
        ram[3] = 3;
        ram[178] = 178;
        ram[999] = 999;
        ram[5000] = 5000;
        #1 $display ("@ %gns ram = %p", $time, ram);
        #1 $display ("@ %gns #Element = %0d", $time, ram.num());
        #1 $display ("@ %gns Exitst[2]? = %0d", $time, ram.exists(2));
   		#1 $display ("@ %gns Exist[999]? = %0d", $time, ram.exists(999));

        if (ram.first(i))
        begin
            #1 $display ("@ %gns First index = %0d / value = %0d", $time, i, ram[i]);
            while (ram.next(i))
                $display("Next index = %0d / value = %0d", i, ram[i]);
        end
        if (ram.last(i))
        begin
            #1 $display ("@ %gns Last index = %0d / value = %0d", $time, i, ram[i]);
            while (ram.prev(i))
                $display("Previous index = %0d / value = %0d", i, ram[i]);
        end
        ram.delete(999);
        #1 $display("@ %gns #Element = %d", $time, ram.num());
        #1 $finish;
    end
endprogram
    