`timescale 1ns/1ns

program ckrndins();

    typedef enum {"low", "mid", "high"} AddType;

    class Bus;
        rand AddType atype;
        rand bit [15:0] addr;
        rand bit [31:0] data;
        constraint c {
            (atype == "low") -> addr inside {[0:90]};
            (atype == "mid") -> addr inside {[91:127]};
            (atype == "high") -> addr inside {[128:255]};
        }
    endclass

    Bus a;

    initial
    begin
        a = new();
        for (int i=0; i< 20; i++)
        begin
            if (a.randomize())
                $display("atype=%4s, adr = %4d, data = %h(%0d)", a.atype, a.addr, a.data, a.data);
            else
                $display("Randomization failed.");
        end

        #1 $finish;
    end

endprogram
