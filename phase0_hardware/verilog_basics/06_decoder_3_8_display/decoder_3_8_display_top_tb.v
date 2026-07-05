`timescale 1ns/1ns

module decoder_3_8_display_top_tb();

    localparam STEP = 20;

    reg [2:0] in;
    wire [7:0] decoder_3_8_display_out;

    decoder_3_8_display_top u_top (
        .input_data(in),
        .out_seg(decoder_3_8_display_out)
    );

    initial begin
        $dumpfile("decoder_3_8_display_top.vcd");
        $dumpvars(0, decoder_3_8_display_top_tb);
        $monitor("Time=%0t: in=%b, out=%b", $time, in, decoder_3_8_display_out);

        in = 3'b000; #(STEP);
        in = 3'b001; #(STEP);
        in = 3'b010; #(STEP);
        in = 3'b011; #(STEP);
        in = 3'b100; #(STEP);
        in = 3'b101; #(STEP);
        in = 3'b110; #(STEP);
        in = 3'b111; #(STEP);

        $finish;
    end

endmodule
