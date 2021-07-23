`timescale 1ns/1ns

typedef struct packed{
    logic [15:0] srcadr;
    logic [15:0] dstadr;
    logic [31:0] data;
} packet_t;

typedef union packed{
    packet_t packet;
    logic [7:0][7:0] bytes;
} upacket_t;

program ckunion();
    upacket_t p1;

    initial
    begin
        p1.bytes[7] = 7;
        p1.bytes[6] = 6;
        p1.bytes[5] = 5;
        p1.bytes[4] = 4;
        p1.bytes[3] = 3;
        p1.bytes[2] = 2;
        p1.bytes[1] = 1;
        p1.bytes[0] = 0;

        #1 $display ("@ %gns p1.bytes = %p", $time, p1.bytes);
        #1 $display ("@ %gns p1.packet.srcadr = %h", $time, p1.packet.srcadr);
        #1 $display ("@ %gns p1.packet.dstadr = %h", $time, p1.packet.dstadr);
        #1 $display ("@ %gns p1.packet.data = %h", $time, p1.packet.data);

        #1 $finish;

    end
endprogram