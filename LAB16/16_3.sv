`timescale 1ns/1ns

module ckasccn();

    logic clk, gnt, req;
    logic [7:0] adr;
    time ct;

    property prop1;
        @(posedge clk)
        (gnt && ~req && adr == 100);
    endproperty

    AS1 : assert property (prop1)
        $display("@ %3gns Find property <prop1>.", $time);
        else;
    
    always #5 clk = ~clk;

    initial
    begin
        clk = 0;
        gnt = 0; req = 0; adr = 0;
        #10 gnt = 0; req = 1; adr = 0;
        #10 gnt = 1; req = 0; adr = 0;
        #10 gnt = 1; req = 1; adr = 0;
        #10 gnt = 0; req = 0; adr = 100;
        #10 gnt = 0; req = 1; adr = 100;
        #10 gnt = 1; req = 0; adr = 100;
        #10 gnt = 1; req = 1; adr = 100;
        #10 gnt = 0; req = 0; adr = 0;
        #3 $finish;
    end

    always @ (posedge clk)
    begin
        $display("@ %3gns @posedge(clk) gnt = %b, req = %b, adr = %0d", $time, gnt, req, adr);
    end
endmodule