`timescale 1ns/1ns

program chstrdt();
    string from_str = "Hello world!";
    string to_str;
    string all_str;

    int vi;
    initial
    begin
        $display("from_str = %s", from_str);

        to_str = from_str;
        $display("to_str = %s", to_str);

        from_str = "I love you!";
        $display("from_str = %s", from_str);

        to_str = from_str.toupper();
        $display("Uppercase from_str = %s", to_str);

        to_str = from_str.tolower();
        $display("Lowercase from_str = %s", to_str);

        $display("String Length of from_str = %0d", from_str.len());

        if (from_str == to_str)
            $display("Two strings <%s> & <%s> are same.", from_str, to_str);
        else
            $display("Two strings <%s> & <%s> are different.", from_str, to_str);
        
            all_str = {from_str, to_str};
            $display("concatenated String = %s", all_str);

            to_str = "1234";

            vi = to_str.atoi();
            $display ("to_str = %s, Int = %0d", to_str, vi);

            #1 $finish;
    end

endprogram

