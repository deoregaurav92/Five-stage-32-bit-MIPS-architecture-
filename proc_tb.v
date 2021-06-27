// Test Bench for the given instructions:
`include "mem_code.v"
`include "ins_mem.v"
`include "proc.v"

module proc_tb();
reg clk_46,rst_46;
wire [31:0] mrd_d_46,mrd_i_46;
wire [31:0] mwd_d_46,mwd_i_46;
wire [31:0] mwa_d_46,mwa_i_46;
wire [31:0] mra_d_46,mra_i_46;
wire mwr_d_46,mwr_i_46;
//proc DUT(clk,rst,mrd_i,mwd_i,mra_i,mwa_i,mwr_i,mrd_d,mwd_d,mra_d,mwa_d,mwr_d);
proc
DUT(clk_46,rst_46,mrd_i_46,mwd_i_46,mra_i_46,mwa_i_46,mwr_i_46,mrd_d_46,mwd_d_46,mra_d_46,mwa_
d_46,mwr_d_46);
ins_mem_46
m0(.clk_46(clk_46),.waddr_46(mwa_i_46),.wdata_46(mwd_i_46),.write_46(mwr_i_46),.raddr_46(mra_i_46),.rd
ata_46(mrd_i_46));
data_mem_46
m1(.clk_46(clk_46),.waddr_46(mwa_d_46),.wdata_46(mwd_d_46),.write_46(mwr_d_46),.raddr_46(mra_d_46),
.rdata_46(mrd_d_46) );
initial
begin
clk_46 = 1'b0;
forever #5 clk_46 = ~clk_46;
end
initial
// Reset signal intiated.
begin
#2 rst_46 = 1'b1;
#5 rst_46 = 1'b0;
end
initial
begin
$dumpfile ("proc.vcd");
$dumpvars (0,proc_tb);
#2500 $finish();
end
endmodule