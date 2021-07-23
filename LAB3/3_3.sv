`timescale 1ns/1ns

program ckdynary();

    int ram[];
    int rom[7:0] = '{1,2,3,4};
    int n;

    initial
    begin
        ram = new[8];
        #1 $display("@ %gns ram = %p", $time, ram);
        n = ram.size();
        #1 $display("@ %gns Size of ram = %0d", $time, n);
        ram = rom;
        #1 $display ("@ %gns rom = %p", $time, rom);
        $display (" ram = %p", ram);
        $display (" ram[0] = %0d", ram[0]);
        $display (" ram[1] = %0d", ram[1]);
        $display (" ram[2] = %0d", ram[2]);
        $display (" ram[3] = %0d", ram[3]);
        $display (" ram[4] = %0d", ram[4]);
        $display (" ram[5] = %0d", ram[5]);
        $display (" ram[6] = %0d", ram[6]);
        $display (" ram[7] = %0d", ram[7]);
        #1 $display ("@ %gns Size of ram = %0d", $time, n);
        ram.delete();
        n = ram.size();
        #1 $display ("@ %gns Size of ram = %0d", $time, n);
        #1 $finish;
    end
endprogram
