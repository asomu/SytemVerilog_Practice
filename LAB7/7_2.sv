`timescale 1ns/1ns

module ckalwcmb(
    output logic sum,
    output logic co,
    input logic a,
    input logic b,
    input logic ci
);

    logic[2:0] itmp;
    logic[1:0] otmp;

    initial
    begin
        $monitor ("@ %gns %b+%b+%b = %b%b", $time, a, b, ci, co, sum);
        a = 0;
        b = 0;
        ci = 0;
        repeat(10) #1 {a, b, ci} = $random;
        #1 $finish;
    end

    always_comb 
    begin
        itmp = {a, b, ci};
        unique case (itmp)
            3'b000 : otmp = 2'b00;
            3'b001 : otmp = 2'b10;
            3'b010 : otmp = 2'b10;
            3'b011 : otmp = 2'b01;
            3'b100 : otmp = 2'b10;
            3'b101 : otmp = 2'b01;
            3'b110 : otmp = 2'b01;
            default : otmp = 2'b11;
        endcase
        sum = otmp[1];
        co = otmp[0];
    end
endmodule