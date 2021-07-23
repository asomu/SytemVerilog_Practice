`timescale 1ns/1ns

program ckclconst();
    class SIMPLE;
        const int N = 333;
        const int ID;
        static int idn = 1;
        string name;

        function new (string name);
            this.name = name;
            this.ID = this.idn;
        endfunction

        static task incidn(int offset);
            idn = idn + offset;
            // name = "DEF";
        endtask

        task print();
            $display ("@ %gns N=%0d, ID=%0d, idn=%0d, name=%s", $time, N, ID, idn, name);
        endtask
    endclass

    SIMPLE a, b, c;

    initial
    begin
        #1 a = new("A");
        // a.ID = 5;
        a.print();
        a.incidn(10);
        #1 b = new("B");
        b.print();
        b.incidn(-3);
        #1 c = new("C");
        c.print();

        #1 $finish;
    end
endprogram
