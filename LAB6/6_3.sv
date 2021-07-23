`timescale 1ns/1ns

module ckcasps();
    logic [2:0] a = 0, b = 0;

    initial
    begin
        repeat(7) #1 a++;
        #1 a = 3'b00z;
        #1 a = 3'b0xx;
        repeat(7) #1 b++;
        #1 b = 3'b00z;
        #1 b = 3'b0xx;
        #1 $finish;
    end

    always @(a)
    begin
        unique case(a)
            0,1: $display("@ %g Unique a(%d) == 0 or 1", $time, a);
            7: $display("@ %g Unique a(%d) == 7", $time, a);
            default: $display("@ %g Unique default a(%d)", $time, a);
        endcase
    end

    always @(b)
    begin
        priority casez(b)
          3'b00? : $display("@ %g priority b(%b) == 00?", $time, b);
          3'b0??: $display("@ %g priority b(%b) == 0??", $time, b);
          default: $display("@ %g priority default b(%b)", $time, b);
        endcase
    end
endmodule