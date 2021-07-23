`timescale 1ns/1ns

package mypkg;
    typedef enum {ADD, SUB} operator_t;
    typedef struct{
        int a;
        int b;
        int z;
    }opcode_t;
endpackage

import mypkg::*;

module ckenum();
    event calculate;
    operator_t act;
    opcode_t data = '{50, 30, 0};

    always @(calculate)
    begin: ALU
        case(act)
            ADD : data.z = data.a + data.b;
            SUB : data.z = data.a - data.b;
            MUL : data.z = data.a * data.b;
        endcase
    end

    initial
    begin
        act = ADD;
        #10 -> calculate;
        #1 $display("# %gns %0d + %0d - %0d", $time, data.a, data.b, data.z);
        act = SUB;
        #20 -> calculate;
        #1 $display("# %gns %0d + %0d - %0d", $time, data.a, data.b, data.z);
        act = MUL;
        #30 -> calculate;
        #1 $display("# %gns %0d + %0d * %0d", $time, data.a, data.b, data.z);
        #1 $finish;
    end
endmodule