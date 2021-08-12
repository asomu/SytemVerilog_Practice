`timescale 1ns/1ns

program ckcvbin2;

    bit [3:0] a;
    bit [3:0] aq[$] = '{3,4,5,6,7};

    covergroup cg;
        AUTO : coverpoint a{
            option.auto_bin_max =4;
        }

        MANUAL : coverpoint a {
            bins w = {0,1};
            bins x = {2,3};
            bins y = {4,5};
            bins z = {6,7};
        }

        EACHBIN : coverpoint a {
            bins x[] = {[0:7]};
        }

        BIN4 : coverpoint a{
            bins x[4] = {[0:7]};
        }

        BINIGR : coverpoint a{
            ignore_bins ig = {1,2,3,4,5};
        }

        BINTR : coverpoint a {
            bins tr34 = (3=>4);
            bins tr56 = (5=>6);
        }

        MULTIBINTR : coverpoint a {
            bins trm[] = (3,4 => 5,6);
        }

    endgroup

    cg cg_inst = new();

    initial
    begin
        $monitor("@ %3gns a=%0d", $time, a);

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