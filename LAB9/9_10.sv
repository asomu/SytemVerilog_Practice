`timescale 1ns/1ns

program ckrndcase();
    int data;
    int prob[5];

    task ex();
        randcase
            2: data = 1;
            2: data = 2;
            1: data = 3;
            5: data = 4;
            8: data = 5;
        endcase
    endtask

    initial
    begin
        foreach(prob[i]) prob[i] = 0;
        repeat(50000)
        begin
            ex();
            case(data)
                1 : ++prob[0];
                2 : ++prob[2];
                3 : ++prob[3];
                4 : ++prob[4];
                5 : ++prob[5];
                default : $display ("Forbidden data = %0d", data);
            endcase
        end
        $display("prob = %p", prob);
        #1 $finish;
    end
endprogram
            