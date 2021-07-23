`timescale 1ns/1ns

program ckstream();

    int a = {8'b11110001, 8'b11110010, 8'b11110011, 8'b11110100};
    bit [7:0] b = 1, c = 2, d = 3, e =4;
    bit [31:0] stream;

    initial
    begin
        #1 $display("@ %gns a = %h", $time, a);
        stream = {<< byte{a}};
        #1 $display("@ %gns stream = %h", $time, stream);
        stream = {<< 4{a}};
        #1 $display("@ %gns stream = %h", $time, stream);
        #1 $display("@ %gns b=%h(%b), c=%h(%b), d=%h(%b), e=%h(%b)", $time, a,a,b,b,c,c,d,d,e,e);
        stream = {<<{b,c,d,e}};
        #1 $display("@ %gns stream = %h", $time, stream);
        stream = {>>{b,c,d,e}};
        #1 $display("@ %gns stream = %h", $time, stream);

        #1 $finish;
    end
endprogram