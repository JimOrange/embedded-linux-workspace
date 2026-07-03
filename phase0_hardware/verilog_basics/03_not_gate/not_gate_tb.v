`define SIM
`timescale 1ns/1ns

module not_gate_tb();

    localparam STEP = 20;

    reg a;
    wire not_gate_out;

    not_gate u_not_gate(
        .a(a),
        .out(not_gate_out)
    );

    initial begin
        $dumpfile("not_gate.vcd");
        $dumpvars(0, not_gate_tb);
        $monitor("Time=%0t: a=%b, out=%b", $time, a, not_gate_out);

        // 覆盖所有 2 种输入组合
        a = 0; #(STEP);
        a = 1; #(STEP);

        $finish;
    end

endmodule