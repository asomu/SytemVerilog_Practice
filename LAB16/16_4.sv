`timescale 1ns/1ns

module ckasbin();

    logic clk, req, gnt, busy;
    logic SQreq[] = '{ 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0 };
    logic SQgnt[] = '{ 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0 };
    logic SQbusy[] = '{ 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0 };

    property prop1;
        @(posedge clk)
        $past(!req, 1) ##1 ($rose(gnt) and $past(!gnt, 1));
    endproperty

    property prop2;
        @(posedge clk)
        $past(!req, 1) ##1 $rose(gnt) ##1 $fell(gnt);
    endproperty
    
    property prop3;
        @(posedge clk)
        req ##1 gnt ##1 busy ##1 (!req and !gnt and !busy);
    endproperty
    
    property prop4;
        @(posedge clk)
        req ##[1:3] gnt;
    endproperty

    AS1 : assert property (prop1)
        $display("@ %3gns Find property <prop1>.", $time);
        else ;
    AS2 : assert property (prop2)
        $display("@ %3gns Find property <prop2>.", $time);
        else ;
    AS3 : assert property (prop3)
        $display("@ %3gns Find property <prop3>.", $time);
        else ;
    AS4 : assert property (prop4)
        $display("@ %3gns Find property <prop4>.", $time);
        else ;

    initial begin
        clk = 0;
        req <= SQreq[0]; gnt <= SQgnt[0]; busy <= SQbusy[0];
        for (int i=1; i<SQgnt.size(); i++)
        begin
            #10 req <= SQreq[i]; gnt <= SQgnt[i]; busy <= SQbusy[i];
        end

        #1 $finish;
    end

    always #5 clk = ~clk;

    always @ (posedge clk)
    begin
        $display ("@ %3gns @psedge(clk) req = %b, gnt = %b, busy = %b", $time, req, gnt, busy);
    end
endmodule
