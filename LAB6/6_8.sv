`timescale 1ns/1ns

module ckseqnc();

    logic clk = 0;
    logic a, b, c, d, e;

    sequence abc;
        @(posedge clk) a ##1 b ##1 c;
    endsequence

    sequence de;
        @(posedge clk) d ##[2:5] e;
    endsequence

    initial
    begin
        repeat(2)
        begin
            #2 a = 1;
            d = 1;
            #2 b = 1;
            e = 1;
            #2 c = 1;
            #2 a = 0;
            b = 0;
            c = 0;
            e = 0;
        end
        #1 $finish;
    end

    always #1 clk = ~clk;

    always @(posedge clk)
    begin
        $display("@ %g abc = (%b%b%b), de=(%b%b)", $time, a, b, c, d, e);
    end

    always @(posedge clk)
    begin
        @(abc) $display ("@ %gns Sequence abc is asserted.", $time);
    end

    initial
    begin
        forever
        begin
            wait (abc.triggered || de.triggered);
            if(abc.triggered) begin
                $display("@ %gns Sequence abc is triggered.", $time);
            end
            if(de.triggered) begin
                $display("@ %gns Sequence de is triggered.", $time);
            end
            #2;
        end
    end
endmodule