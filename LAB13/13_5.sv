`timescale 1ns/1ns
module gcd
    #(parameter int width = 8)
    (
        input logic reset,
        input logic clock,
        input logic load_n,
        input logic [width-1:0] a,
        input logic [width-1:0] b,
        output logic done,
        output logic [width-1:0] y
    );

    logic a_enqual_b, al_lessthan_b, a_greaterthan_b, done_hold;
    logic [width-1:0] a_new;
    logic [width-1:0] a_hold;
    logic [width-1:0] b_hold;

    assign y = a_hold;
    assign done = done_hold;

    always_ff@(posedge clock, negedge reset)
    begin: SUB_PROC
        if(!reset)
        begin
            a_hold <= {width{1'b0}};
            b_hold <= {width{1'b0}};
            done_hold <= {width{1'b0}};
        end
        else if(!load_n)
        begin
            a_hold <= a;
            b_hold <= b;
            done_hold <= 1'b0;
        end
        else if(a_enqual_b)
        begin            
            done_hold <= 1'b0;
        end
        else if(a_greaterthan_b)
        begin
            a_hold <= a_hold - b_hold;
            done_hold <= 1'b0;
        end
        else if(al_lessthan_b)
        begin
            b_hold <= b_hold - a_hold;
            done_hold <= 1'b0;
        end
    end

    always_comb
    begin: COMP_PROC
        if(a_hold == b_hold)
        begin
            a_enqual_b = 1'b1;
            a_lessthan_b = 1'b0;
            a_greaterthan_b = 1'b0;
        end
        else if(a_hold > b_hold)
        begin
            a_enqual_b = 1'b0;
            a_lessthan_b = 1'b0;
            a_greaterthan_b = 1'b1;
        end
        else if(a_hold < b_hold)
        begin
            a_enqual_b = 1'b0;
            a_lessthan_b = 1'b1;
            a_greaterthan_b = 1'b0;
        end
    end
    endmodule
