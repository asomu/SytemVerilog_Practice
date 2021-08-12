`timescale 1ns/1ns

module ckasimm();

    logic clk, grant, req1, req2;
    time ct;

    initial
    begin
        clk = 0;
        grant = 0; req1 = 1; req2 = 1;
        #10 grant = 1; req1 = 1; req2 = 1;
        #10 grant = 1; req1 = 0; req2 = 1;
        #10 grant = 1; req1 = 1; req2 = 0;
        #10 grant = 1; req1 = 0; req2 = 0;
        #10 grant = 1; req1 = 0; req2 = 0;
        #10 grant = 1; req1 = 1; req2 = 1;

        #3 $finish;
    end

    always #5 clk = ~clk;

    always @ (posedge clk)
    begin
        if (grant == 1)
        begin
            assert (req1 || req2)
            else
            begin
                ct = $time;
                $error("Fail (req1 = %b, req2 = %b) at time %g", req1, req2, ct);
            end
        end
    end
endmodule
