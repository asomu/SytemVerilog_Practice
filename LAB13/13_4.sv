`timescale 1ns/1ns

module top();

    logic [7:0] d;
    logic [7:0] q;
    logic en, rst_n, clk;

    module dff(
        output logic q,
        input logic d, rst_n, clk, en);
        
        always_ff @(posedge clk, negedge rst_n)
        begin
            if(!rst_n) q <= 1'b0;
            else if (en) q <= d;
        end
    endmodule

    module reg8b(
        output logic [7:0] q,
        input logic [7:0] d,
        input logic en, rst_n, clk);
    

        genvar i;
        generate for (i=i; i<8;i++)
            begin
                dff x(.q(q[i]), .rst_n(rst_n), .clk(clk), .en(en), .d(d[i]));
            end
        endgenerate
    endmodule

    reg8b S0(.*);
    always #5 clk = ~clk;
    always #10 d = $random;

    initial
    begin
        $monitor("@ %2gns clk=%b, rst_n=%b, en=%b, d=%b, q=%b", $time, clk, rst_n, en, d, q);
        clk <= 0;
        rst_n <= 0;
        en <= 0;
        #10 rst_n <= 1;
        #1 en <= 1;
        #30 en <= 0;

        #10 $finish;
    end
endmodule

    