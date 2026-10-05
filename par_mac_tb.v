`timescale 1ns / 1ps

module parameterized_mac_tb;

    reg clk;
    reg rst;
    reg [31:0] a;
    reg [31:0] b;

    wire [47:0] acc;

    parameterized_mac #(
        .DATA_WIDTH(32),
        .ACC_WIDTH(48)
    ) dut (
        .clk(clk),
        .rst(rst),
        .a(a),
        .b(b),
        .acc(acc)
    );

    always #5 clk = ~clk;

    initial begin

        clk = 0;
        rst = 1;
        a = 0;
        b = 0;

        // Reset
        #10;
        rst = 0;

        // 5 × 3 = 15
        a = 5;
        b = 3;
        #10;

        // 2 × 4 = 8 → accumulator = 23
        a = 2;
        b = 4;
        #10;

        // 10 × 5 = 50 → accumulator = 73
        a = 10;
        b = 5;
        #10;

        $finish;

    end

endmodule
