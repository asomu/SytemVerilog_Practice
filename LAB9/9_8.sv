`timescale 1ns/1ns

program ckrndord();

    class SolveBefore;
        rand bit x;
        rand bit [1:0] y;
        constraint cxy{
            (x==0) -> y == 0;
            solve x before y;
        }
        constraint cyx {
            (x == 0) -> y ==0;
            solve y before x;
        }
    endclass

    SolveBefore a;
    int idx, res, prob[8];

    initial
    begin
        a = new();
        a.cxy.constraint_mode(1);
        a.cyx.constraint_mode(0);
        foreach (prob[i]) prob[i] = 0;
        repeat (10000)
        begin
            res = a.randomize();
            if (!res) $display ("Randomization failed.");
            idx = 32'({a.x, a.y});
            ++prob[idx];
        end
        $display("prob = %p in <solve y before x>", prob);

        a.cxy.constraint_mode(0);
        a.cyx.constraint_mode(1);
        foreach (prob[i]) prob[i] = 0;
        repeat (10000)
        begin
            res = a.randomize();
            if (!res) $display ("Randomization failed.");
            idx = 32'({a.x, a.y});
            ++prob[idx];
        end
        $display("prob = %p in <solve x before y>", prob);
        #1 $finish;
    end
endprogram