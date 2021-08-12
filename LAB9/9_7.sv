`timescale 1ns/1ns

program ckrnddist();

    class Packet;
        rand bit[7:0] data;
        constraint c {
            data dist{
                [100:102] :=1,
                200:=6,
                250:=9
            };
        }
    endclass

    Packet a;
    int res, nlow = 0, nmid = 0, nhigh = 0;

    initial
    begin
        a = new();
        repeat(1000)
        begin
            res = a.randomize();
            if (!res) $display ("Randomization failed!");
            if(100 <= a.data && a.data <=102) ++nlow;
            else if (200 == a.data) ++nmid;
            else if (250 == a.data) ++nhigh;
            else $display("Forbidden a.data = %0d.", a.data);
        end
        $display("nlow = %0d, nmid = %0d, nhigh = %0d", nlow, nmid, nhigh);
        #1 $finish;
    end
endprogram
