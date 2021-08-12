`timescale 1ns/1ns

program ckmainbox();
    task automatic tarnsmitter (string name, int num, nwait);
        logic [7:0] data;

        for (int i = 1; i<=num; i++)
        begin
            data = 8'(i);
            mbox.put(data);
            $display ("@ %2gns : %s puts data %0d.", $time, name, data);
            #(nwait);
        end
    endtask

    task automatic receiver(string name, int num, nwait);
        logic [7:0] data;
        repeat (num)
        begin
            mbox.get(data);
            $display("@ %2gns : %s gets data %0d.", $time, name, data);
            #(nwait);
        end
    endtask

    mailbox #(logic [7:0]) mbox = new();
    initial
    begin
        fork
            tarnsmitter("MASTER", 9,1);
            receiver("SLAVE0", 3, 2);
            receiver("SLAVE1", 3, 3);
            receiver("SLAVE2", 3, 5);
        join
        #1 $finish;
    end
endprogram
