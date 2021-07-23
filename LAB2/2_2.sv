`timescale 1ns/1ns

program ckintdt();
    bit vbit;
    byte vbyte;
    shortint vshortint;
    int vint;
    longint vlongint;
    integer vinteger;

    bit unsigned vbitu;
    byte unsigned vbyteu;
    shortint unsigned vshortintu;
    int unsigned vintu;
    longint unsigned vlongintu;
    integer unsigned vintegeru;

    initial
    begin
        vbit = {128{1'b1}};
        vbyte = {128{1'b1}};
        vshortint = {128{1'b1}};
        vint = {128{1'b1}};
        vlongint = {128{1'b1}};
        vinteger = {128{1'b1}};
        $display("vbit = %0d", vbit);
        $display("vbyte = %0d", vbyte);
        $display("vshortint = %0d", vshortint);
        $display("vint = %0d", vint);
        $display("vlongint = %0d", vlongint);
        $display("vinteger = %0d", vinteger);

        vbitu = {128{1'b1}};
        vbyteu = {128{1'b1}};
        vshortintu = {128{1'b1}};
        vintu = {128{1'b1}};
        vlongintu = {128{1'b1}};
        vintegeru = {128{1'b1}};
        $display("vbitu = %0d", vbitu);
        $display("vbyteu = %0d", vbyteu);
        $display("vshortintu = %0d", vshortintu);
        $display("vintu = %0d", vintu);
        $display("vlingintu = %0d", vlongintu);
        $display("vintegeru = %0d", vintegeru);

        vbit = {{31{4'b0000}}, {4'b10xz}};
        vbyte = {{31{4'b0000}}, {4'b10xz}};
        vshortint = {{31{4'b0000}}, {4'b10xz}};
        vint = {{31{4'b0000}}, {4'b10xz}};
        vlongint = {{31{4'b0000}}, {4'b10xz}};
        vinteger = {{31{4'b0000}}, {4'b10xz}};
        $display("vbit = %0b", vbit);
        $display("vbyte = %0b", vbyte);
        $display("vshortint = %0b", vshortint);
        $display("vint = %0b", vint);
        $display("vlongint = %0b", vlongint);
        $display("vinteger = %0b", vinteger);

        #1 $finish;
    end
endpr

