`timescale 1ns/1ns

module cktask();
    logic [15:0] data;
    logic clk, parity;

    task genparity(
        input logic [15:0] data,
        output logic parity);

        repeat(3) @(posedge clk);
        parity = ^data;
        return;
    endtask

    always begin
       #1 clk = ~clk;
       $display ("@ %gns clk = %d", $time, clk); 
    end

    initial
    begin
        clk = 1'b0;
        #2 data = 16'b1111000011110000;
        $display ("@ %gns Task begins.", $time);
        genparity(data, parity);
        $display ("@ %gns Task finished.", $time);
        $display ("@ %gns clk = %d : parity = %b from data = %b", $time, clk, parity, data);
        #1 $finish;
    end
endmodule