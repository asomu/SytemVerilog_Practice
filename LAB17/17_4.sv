`timescale 1ns/1ns

program ckcvbin3;

    bit [3:0] a;
    bit [3:0] aq[$] = '{3,3,3,4,4};
    bit [3:0] b;
    bit [3:0] bq[$] = '{1,6,3,6,3,6,3,5};

    covergroup cg;
        ABINSQ1 : coverpoint a{
            bins tr3x5 = (3[*5]);
            bins tr4x2 = (4[*2]);
        }

        ABINSQ2 : coverpoint a {
            bins tr2m[] = (3[*3:5]);            
        }

        BBINSQ1 : coverpoint b {
            bins tr63x3 = (1=>3[->3]=>5);
        }
        
        BBINSQ2 : coverpoint b {
            bins tr63x3 = (1=>3[=2]=>5);
        }        
    endgroup

    cg cg_inst = new();

    initial
    begin
        // $monitor("@ %3gns a=%0d", $time, a);

        foreach(aq[i])
        begin
            #1 a = aq[i];
            cg_inst.sample();
            $display("cg_inst coverage = %f", cg_inst.get_inst_coverage());
            $display("AUTO coverage = %f", cg_inst.AUTO.get_coverage());
            $display("MANUAL coverage = %f", cg_inst.MANUAL.get_coverage());
            $display("EACHBIN coverage = %f", cg_inst.EACHBIN.get_coverage());
            $display("BIN4 coverage = %f", cg_inst.BIN4.get_coverage());
            $display("BINTR coverage = %f", cg_inst.BINTR.get_coverage());
            $display("MULTIBINTR coverage = %f\t", cg_inst.MULTIBINTR.get_coverage());
        end
        #1 $finish;
    end
endprogram