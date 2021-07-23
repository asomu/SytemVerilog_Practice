`timescale 1ns/1ns

program ckrndsiz();
    class Packet;
        rand bit [7:0] data[];
        contraint c{
            data.size inside {[3:8]};
            foreach (data[i]) data[i] == i;
        }
    endclass

    Packet a;
    int res;

    initial
    begin
        a = new();
        repeat (10)
        begin
            res = a.randomize();
            if(res) $display ("data = %p", a.data);
            else $display ("Randomization failed.");
        end

        #1 $finish;
    end
endprogram