`timescale 1ns/1ns

program ckcast();

    typedef struct{
        logic p;
        logic[7:0];
    }data_t;

    int unsigned vint = '1;
    int vtmp;
    logic [8:0] vlogic;
    data_t packet;

    initial
    begin
        $display("vint = %0d(%b)", vint, vint);
        vtmp = signed'(vint);
        $display("signed of vint = %0d(%b)", vtmp, vtmp);

        vint = int'(2.0*3.0);
        $display("vint = %0d(%b)", vint, vint);
        
        vtmp = ~vint;
        vlogic = 9'(vtmp);
        $display("vlogic = %b from %b", vlogic, vtmp);

        packet = datra_t'(vlogic);
        $display("packet.p = %b, packet.d = %b", packet.p, packet.d);

        #1 $finish;
    end
endprogram
