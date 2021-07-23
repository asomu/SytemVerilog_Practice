`timescale 1ns/1ns
program ckrndprpt();

    class Packet;
        bit[7:0] min, max;
        rand bit[7:0] data;
        bit parity;
        constraint c{
            data >= min;
            data <= max;
        }

        function void pre_randomize();
            this.min = 10;
            this.max = 20;
        endfunction

        function void post_randomize();
            parity = ^data;
        endfunction
    endclass
    

    Packet a;
    int res;

    initial
    begin
        a = new();
        repeat(10)
        begin
            res = a.randomize();
            if(res) $display("min = %0d, max = %0d, data = %b(%0d), parity = %b", a.min, a.max, a.data, a.data, a.parity);
            else $display ("Randomization failed.");
        end
        #1 $finish;
    end
endprogram