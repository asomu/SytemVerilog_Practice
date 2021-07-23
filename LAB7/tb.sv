module d_ff(clk, resetn, q, d);
    input clk;
    input resetn;
    input d;
    output q;

    reg q;

    always @ (posedge clk)
        if(!resetn)
            q <= 0;
        else
            q <= d;
endmodule

module tb_top();
    reg clk;
    reg resetn;
    reg d;
    wire q;

    d_ff d_ff0(.clk(clk),
                .resetn(resetn),
                .d(d),
                .q(q)
                );

    always #10 clk <= ~clk;

    initial begin
        resetn <= 0;
        d <= 0;

        #10 resetn <=1;
        #5 d <= 1;;
        #8 d<=0
        #2 d<=1;
        #10 d<=0;
        $ $finish;
    end
endmodule