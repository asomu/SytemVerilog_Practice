`timescale 1ns/1ns
program ckqueue();

    int q[$] = {11,22,33,55,66};
    int i;

    initial
    begin
        #1 $display("@ %gns queue = %p", $time, q);
        q = {77, q};
        #1 $display("@ %gns queue = %p", $time, q);
        q = q[1:$];
        #1 $display("@ %gns queue = %p", $time, q);
        q.push_front(99);
        #1 $display("@ %gns queue = %p", $time, q);
        q.push_back(88);
        #1 $display("@ %gns queue = %p", $time, q);
        q.insert(4,44);
        #1 $display("@ %gns queue = %p", $time, q);
        i = q.pop_front();
        #1 $display("@ %gns First element %0d int %p", $time, i, q);
        i = q.pop_back();
        #1 $display("@ %gns Last element %0d int %p", $time, i, q);
        q.delete(4);
        #1 $display("@ %gns Size of queue = %0d in %p", $time, q.size(), q);
        q = {11, 33};
        #1 $display("@ %gns queue = %p (%8b, %8b)", $time, q, q[0], q[1]);
        $display(" Sum of queue = %0d", q.sum());
        $display(" Product of queue = %0d", q.product());
        $display(" AND of queue = %08b", q.and());
        $display(" OR of queue = %08b", q.or());
        $display(" XOR of queue = %08b", q.xor());

        #1 $finish;
    end
endprogram

