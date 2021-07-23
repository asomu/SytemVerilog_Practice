`timescale 1ns/1ns

program ckclhide();
    class BaseP;
        local int data;
        protected int adr;
        string name;

        function new (string name);
            this.data = 0;
            this.adr = 0;
            this.name = name;
        endfunction

        function void set (int data, adr);
            this.data = data;
            this.adr = adr;
        endfunction

        task print();
            $display ("@ %gns data=%0d, adr=%d, name=%s", $time, data, adr, name);
        endtask
    endclass

    class Packet extends BaseP;
        int delay;

        function new (string name)
            super.new(name);
        endfunction

        function void set(int data, adr);
            super.set(data, adr);
            // this.adr = adr;
        endfunction

        task print();
            super.print();
        endtask
    endclass

    BaseP a;
    Packet b;
    
    initial
    begin
        #1 a = new("A");
        #1 a.set(30,50);
        #1 a.print();
        #1 b = new("B");
        #1 b.set(70,80);
        #1 b.print();
        #1 $finish;
    end
endprogram