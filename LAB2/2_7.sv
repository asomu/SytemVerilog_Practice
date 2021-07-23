`timescale 1ns/1ns

typedef struct packed{
    logic p;
    logic [7:0] d;
}data_t;

module cksrtdt();
    logic tmp;
    data_t packet;

    always_comb
    begin
        tmp = 1'b1;
      for (int i=0; i<=7;i=i+1)
            tmp = tmp ^ packet.d[i];
            packet.p = tmp;
    end

    initial
    begin
        #10 packet.d = 8'b01010101;
        #1 $display("# %gns %b %b", $time, packet.d, packet.p);
        #10 packet.d = 8'b01011101;
        #1 $display("# %gns %b %b", $time, packet.d, packet.p);
        #1 $finish;
    end
endmodule