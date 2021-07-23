`define RESOLUTION 1024
`timescale 1ns/1ns

program cknadps();

    int unsigned rnd1, rnd2, tmprnd1, tmprnd2;
    int unsigned nsame = 0, nlesser = 0, nbigger = 0, ntotal = 0;

    initial
    begin
        WLOOP : while(1)
        begin
            rnd1 = $random;
            rnd2 = $random;
            tmprnd1 = rnd1 % `RESOLUTION;
            tmprnd2 = rnd2 % `RESOLUTION;

            if(tmprnd1 == tmprnd2)
            begin
                $display("Diable WLOOP because %0d == %0d", tmprnd1, tmprnd2);
                disable WLOOP;
            end

            if (rnd1 < rnd2) ++nlesser;
            else if (rnd1 > rnd2) ++nbigger;
            else ++nsame;

            ++ntotal;
        end

        $display("ntotal = %0d", ntotal);
        $display("nlesser = %0d", nlesser);
        $display("nsame = %0d", nsame);
        $display("nbigger = %0d", nbigger);

        #1 $finish;
    end
endprogram
        