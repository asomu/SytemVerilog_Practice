`timescale 1ns/1ns
program ckfndef();
    logic [7:0] a, b, z;

    function logic [7:0] fnmux(
        logic [7:0] d0 = 8'b00110011, d1 = 8'b11001100,
        logic s = 0
    );

        logic [7:0] out;
        out = s ? d1 : d0;
        $display("@ %gns d0=%b, d1=%b, s=%b, out=%b", $time, d0, d1, s, out);
        return (out);
    endfunction

    initial
    begin
        #1 a = 8'b11110000; b = 8'b00001111;
        #1 z = fnmux(,,);
        #1 z = fnmux(,,1);
        #1 z = fnmux(a,,);
        #1 z = fnmux(a,b,1);

        #1 $finish;
    end
endprogram