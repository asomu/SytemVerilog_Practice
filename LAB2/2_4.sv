`timescale 1ns/1ns


module chevtdt();
    event start;
    event done;
    event empty = null;

    initial
    begin
        #1 -> start;
        #1 -> empty;
        #1 -> done;
        #1 $finish;
    end

    always @(start)
    begin : ALW1
        $display("# %gns ALW1 by start event.", $time);
        @(done);
        $display("# %gns ALW1 by done event.", $time);
    end

    always @ (done)
    begin : ALW2
        $display("# %gns ALW2 by done event.", $time);
    end

    always @ (empty)
    begin : ALW3
        $display("# %gns ALW3 by empty event.", $time);
    end
endmodule