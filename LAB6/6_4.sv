`timescale 1ns/1ns

program ckwhlps();
    int prod [1:4][1:2];
    int i, j;

    initial
    begin
        $display("do-while statment");
        i=0;
        do
        begin
            #1 $display("i = %0d", i);
            i++;
        end
        while (i < 3);

        $display("\nwhile statmen");
        while(i < 7)
        begin
            #1 $display("i = %0d", i);
            i++;
        end

        $display("\nfor statment");
        for(int i=0; i<4; i++)
            #1 $display("i = %0d", i);
        
        $display("\nforeach statement");
        foreach(prod[i,j])
            #1 $display("prod[%0d][%0d] = %0d", i, j, i*j);
        #1 $finish;
    end
endprogram