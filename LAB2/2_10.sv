`timescale 1ns/1ns
typedef enum {S1, S2, S3} states_t;
states_t c_state = S1, n_state;

program ckdyncast();
    initial
    begin
        $display("c_state = %0d (%s)", c_state, c_state.name());
        $cast(n_state, c_state + 1);
        $display("c_state = %0d (%s)", c_state, c_state.name());

        $cast(n_state, c_state + 2);
        $display("c_state = %0d (%s)", c_state, c_state.name());

        $cast(n_state, c_state + 3);
        $display("c_state = %0d (%s)", c_state, c_state.name());

        n_state = c_state.next(1);
        $display("c_state = %0d (%s)", c_state, c_state.name());

        n_state = c_state.next(2);
        $display("c_state = %0d (%s)", c_state, c_state.name());

        n_state = c_state.next(3);
        $display("c_state = %0d (%s)", c_state, c_state.name());

        n_state = c_state.last();
        $display("c_state = %0d (%s)", c_state, c_state.name());

        n_state = c_state.first();
        $display("c_state = %0d (%s)", c_state, c_state.name());

        #1 $finish;
    end
endprogram