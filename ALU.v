module alu (
    input a0,
    input b0,
    input c_in,
    input b_in,
    input [2:0] sel,
    output c_out,
    output b_out,
    output y
);
wire and_lu;
wire nor_lu;
wire xor_lu;
wire sum;
wire diff;
assign sum  = a0 ^ b0 ^ c_in;
assign c_out = (a0 & b0)|(b0 & c_in)|(c_in & a0);
assign diff = a0 ^ b0 ^ b_in;
assign b_out = (~a0 & b0) | (~(a0 ^ b0) & b_in);
assign and_lu = a0 & b0;
assign nor_lu = ~(a0 | b0);
assign xor_lu = a0 ^ b0;
assign y = (sel == 3'b000) ? sum:
           (sel == 3'b001) ? diff:
           (sel == 3'b010) ? and_lu:
           (sel == 3'b011) ? nor_lu:
           (sel == 3'b111) ? xor_lu:
           1'b0;
endmodule 
