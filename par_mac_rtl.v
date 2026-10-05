module parameterized_mac #(
    parameter DATA_WIDTH = 32,
    parameter ACC_WIDTH  = 48
)(
    input  wire                  clk,
    input  wire                  rst,
    input  wire [DATA_WIDTH-1:0] a,
    input  wire [DATA_WIDTH-1:0] b,
    output reg  [ACC_WIDTH-1:0]  acc
);

always @(posedge clk) begin
    if (rst)
        acc <= {ACC_WIDTH{1'b0}};
    else
        acc <= acc + (a * b);
end

endmodule
