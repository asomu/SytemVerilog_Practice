`timescale 1ns/1ns

typedef struct{
    int x;
    int y;
}point_t;

typedef struct{
    string name;
    int color = 100;
    point_t pos, urp;
}rectangle_t;

program ckstrasn();

    int n = 7;
    point_t p1;
    rectangle_t r1, r2;

    initial
    begin
        #1 $display ("@ %gns p1 = %p", $time, p1);
        p1 = '{1, 2+n};
        #1 $display ("@ %gns p1 = %p", $time, p1);
        p1 = '{default:100};
        #1 $display ("@ %gns p1 = %p", $time, p1);

        #1 $display ("@ %gns r1 = %p", $time, r1);
        r1 = '{name:"S1", color:234, pos:'{x:50, y:50}, urp:'{x:70, y:70}};
        #1 $display("@ %gns r1 = %p", $time, r1);
        #1 $display("@ %gns r2 = %p", $time, r2);
        r2 = '{default:0};
        #1 $display("@ %gns r2 = %p", $time, r2);
        r2 = '{int:10, string:"Sx", default:0};
        #1 $display("@ %gns r2 = %p", $time, r2);
        #1 $finish;
    end
endprogram