`timescale 1ns/1ns
program ckrndex2();

    class Bus;
        rand bit [15:0] adr;
        rand bit [31:0] data;
        constraint c1 {adr[3:0] == 4'b0000;}
        constraint c2 {adr[15:12] == 4'b1111;}
    endclass

    Bus a;
    int res;

    initial
    begin
        a = new();

        $display ("#### OFF Random Mode of All.");
        a.rand_mode(0);
        repeat(5)
        begin
            res = a.randomize();
            $display ("adr = %h, data = %h", a.adr, a.data);
        end

        $display("#### ON Radom Mode of All with Constraint c1.");
        a.c1.constraint_mode(1);
        a.c2.constraint_mode(0);
        a.rand_mode(1);
        repeat (5)
        begin
            res = a.randomize();
            $display ("adr = %h, data = %h", a.adr, a.data);
        end
        
        $display("#### ON Radom Mode of All with Constraint c2.");
        a.c1.constraint_mode(0);
        a.c2.constraint_mode(1);
        a.rand_mode(1);
        repeat (5)
        begin
            res = a.randomize();
            $display ("adr = %h, data = %h", a.adr, a.data);
        end
        
        $display("#### ON Radom Mode of All with Constraint c1 & c2.");
        a.c1.constraint_mode(1);
        a.data.rand_mode(0);
        a.rand_mode(0);
        repeat (5)
        begin
            res = a.randomize();
            $display ("adr = %h, data = %h", a.adr, a.data);
        end

        #1 $finish;
    end
endprogram

        