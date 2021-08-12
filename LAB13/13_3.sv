`timescale 1ns/1ns

module son();
    task print();
        $display("%m : in son module");
    endtask
endmodule

module mother();
    task print();
        $display("%m : in mother module");
    endtask

    son USON();
    initial begin
        $root.TOP.USON.print();
        $root.TOP.UMOM.print();
        $root.TOP.print();
    end
endmodule

module TOP();
    mother UMOM();
    son USON();
    task print();
        $display("%m : in TOP module");
    endtask
endmodule