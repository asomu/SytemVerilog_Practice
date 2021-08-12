`timescale 1ns/1ns
program ckpasval();
    logic [63:0] a;
    logic [3:0] s;
    logic [7:0] z;

    function automatic logic [7:0] fngetbyte(
        const ref logic [63:0] word, const ref logic [3:0] nth
        );
        
        int i;
        logic [7:0] tmpbyte = 'x;
        for (i=0; i<=7; i++) tmpbyte[i] = word[8*nth+i];
        return (tmpbyte);
    endfunction

    initial
    begin
        #1 a = 64'h7766554433221100;
        for(s=0;s<=7;s++)
        begin
            #1 z = fngetbyte(a,s);
            $display ("@ %gns z = a[%0d] = %h in a = %h", $time, s,z,a);
        end

        #1 $finish;
    end
endprogram

    