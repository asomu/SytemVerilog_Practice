`timescale 1ns/1ns

program cksemapor();

    task automatic agent(string name, int nwait);
        sem.get(1);
        $display ("@ %gns : %s get key.", $time, name);
        #(nwait);
        sem.put(1);
        $display ("@ %gns : %s put key.", $time, name);
    endtask

    task automatic agenttry (string name, int nwait);
        bit success = 0;
        repeat (5)
        begin
            if (sem.try_get(1))
            begin
                $display ("@ %gns : %s get key.", $time, name);
                #(nwait);
                sem.put(1);
                $display ("@ %gns : %s put key.", $time, name);
                success = 1;
                break;
            end
            else#(nwait);
        end
        if (!success)
            $display("@ %gns : %s fail to get key.", $time, name);
    endtask
    
    semaphore sem = new(2);
    initial
    begin
        agent("AGN_FIRST", 1);
        fork
            agent("AGN_P0", 5);
            agent("AGN_P1", 20);
            agent("AGN_P3", 10);
            agenttry("AGENTRY", 1);
        join
        agent("AGN_LAST",3);
        #1 $finish;
    end
endprogram
