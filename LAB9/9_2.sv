`timescale 1ns/1ns
program ckrndex1();
    class Bus;
        rand bit [15:0] adr;
        rand bit [31:0] data;
        constraint c {adr[3:0] == 4'b0000;}
    endclass

    Bus a;

    initial
    begin
        a = new();
        repeat (50)
        begin
            if (a.randomize() == 1)
                $display ("adr = %h, data = %h", a.adr, a.data);
            else
                $display ("adr = %h, data = %h", a.adr, a.data);
        end
        #1 $finish;
    end
endprogram