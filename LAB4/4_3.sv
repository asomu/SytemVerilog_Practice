`timescale 1ns/1ns

program ckclinh();
    class BaseTr;
        bit [7:0] data;
        bit parity;
        int delay;

        function new();
            data = 8'b0;
            parity = 1'b1;
            delay = 0;
        endfunction

        virtual function void calparity();
        endfunction

        task print();
            $display ("@ %gns data=%b, parity=%b, delay=%0d", $time, data, parity, delay);
        endtask
    endclass


    class OddParityTr extends BaseTr;
        int delay = 1;
        function new (int delay);
            super.new();
            this.delay = delay + super.delay;
        endfunction

        function void calparity();
            parity = 1'b1;
            for(int i=0; i<=7;i++)
                parity = parity^data[i];
        endfunction

        task print();
            $display ("@ %gns data=%b, parity=%b, delay=%0d", $time, data, parity, delay);
        endtask
    endclass
            
    class EvenParityTr extends BaseTr;
        int delay = 2;
        function new (int delay);
            super.new();
            this.delay = delay + super.delay;
        endfunction

        function void calparity();
            parity = 1'b0;
            for(int i=0; i<=7;i++)
                parity = parity^data[i];
        endfunction

        task print();
            $display ("@ %gns data=%b, parity=%b, delay=%0d", $time, data, parity, delay);
        endtask
    endclass

    OddParityTr oddptr;
    EvenParityTr evenptr;
    BaseTr p;

    initial
    begin
        $display ("@ %gns Test odd parity transaction.", $time);
        #1 oddptr = new(2);
        #1 oddptr.print();
        #1 oddptr.data = 8'b00001111;
        #1 oddptr.calparity();
        #1 oddptr.print();
        $display ("@ %gns Test Even parity transaction.", $time);
        #1 evenptr = new(3);
        #1 evenptr.print();
        #1 evenptr.data = 8'b11100000;
        #1 evenptr.calparity();
        #1 evenptr.print();
        #1 p = oddptr;
        #1 p.calparity();
        #1 p.data = 8'b00001111;
        #1 p.print();
        #1 p = evenptr;
        #1 p.calparity();
        #1 p.print();
        #1 $finish;
    end
endprogram

        