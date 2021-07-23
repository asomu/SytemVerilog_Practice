`timescale 1ns/1ns

program ckclpara();

    class STACK #(type T = int);
        local T items[$];

        function new();
        endfunction

        task push(T data);
            items.push_front(data);
        endtask

        task pop (ref T data);
            data = items.pop_front();
        endtask

        task print();
            $display ("@ %gns %p", $time, items);
        endtask
    endclass
    
    STACK #(logic [7:0]) a;
    STACK #(real) b;
    logic [7:0] apop;
    real bpop;

    initial
    begin
        a = new();
        a.push(8'b00000001);
        a.push(8'b00000010);
        a.push(8'b00000011);
        a.push(8'b00000100);
        a.print();
        a.pop(apop);
        a.print();

        b = new();
        b.push(1.2);
        b.push(3.4);
        b.push(5.6);
        b.push(7.8);
        b.print();
        b.pop(bpop);
        b.print();

        $finish;
    end
endprogram