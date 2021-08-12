`timescale 1ns/1ns

program ckrndwith();

    class Bus;
        rand bit [15:0] adr;
        rand bit [31:0] data;
        constraint c {adr[3:0] == 4'b0000;}
    endclass

    Bus a;
    int res;

    initial
    begin
        a = new();
        repeat (10)
        begin
            res = a.randomize() with {
                adr[15:12] == 4'b1111;
            };
            if (res) $display ("adr = %h, data = %h", a.adr, a.data);
            else $display ("Randomization failed.");

        end

        #1 $finish;
    end
endprogram