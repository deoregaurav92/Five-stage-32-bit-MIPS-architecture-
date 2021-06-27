// 4th Stage of Pipeline: // ************* Memory write ************* // During this stage memory will be accessed
// and data transfer from reg to mem // take place
module memory_write(clk_46,rst_46,opcode_46,src_reg_46,dest_reg_46,targ_reg_46,alu_out_46,alu_src_46,mem_out1_46,mem_out2_46,opcode_out_46,src_reg_out_46,dest_reg_out_46,targ_reg_out_46,mwr_d_46,mwd_d_46,mwa_d_46,mra_d_46, mrd_d_46,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,
r20,r21,r22,r23,r24,r25,r26,r27,r28,r29,r30,r31);
input clk_46,rst_46;
input [5:0] opcode_46;
input [5:0] src_reg_46,dest_reg_46,targ_reg_46;
input [31:0] alu_out_46,alu_src_46;
input [31:0] mrd_d_46;
output reg [31:0]mem_out1_46;
output [31:0] mem_out2_46;
output [5:0] opcode_out_46;
output [5:0] src_reg_out_46,dest_reg_out_46,targ_reg_out_46;
output reg [31:0] mra_d_46;
output reg [31:0] mwd_d_46,mwa_d_46;
output reg mwr_d_46;
// Each regs are intiated
input [31:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
// Each regs are intiated
input [31:0] r10,r11,r12,r13,r14,r15,r16,r17,r18,r19;
// Each regs are intiated
input [31:0] r20,r21,r22,r23,r24,r25,r26,r27,r28,r29;
input [31:0] r30,r31;

parameter ADD = 6'b110001;// for adding two regs and stores value reg
parameter LDW = 6'b010111;// load data from memory to reg
parameter MUL = 6'b100111;// multiply two regs
parameter BLT = 6'b010110;// it will branch if less than other one
parameter STW = 6'b010101;// stores data from reg to mem
parameter BR = 6'b000110;// unconditional branch
parameter ADDI = 6'b000100;// addition of immediate data to reg
parameter BEQ = 6'b100110;// Branch if the values are equal
parameter NOPE = 6'b111111;// special instruction which do no operation

assign opcode_out_46 = rst_46 ? 5'b0 : opcode_46;
assign src_reg_out_46 = rst_46 ? 5'b0 : src_reg_46;
assign dest_reg_out_46 = rst_46 ? 5'b0 : dest_reg_46;
assign targ_reg_out_46 = rst_46 ? 5'b0 : targ_reg_46;
assign mem_out2_46 = rst_46 ? 5'b0 : alu_src_46;
always @(*)
begin
if(rst_46)
begin
mem_out1_46 = 0;
end
else
begin
mwr_d_46 = 1'b0;
case(opcode_46)
LDW :
begin
mra_d_46 = alu_out_46;
mem_out1_46 = mrd_d_46;
end
STW:
begin
mwd_d_46 = alu_src_46;
mwa_d_46 = alu_out_46;
mwr_d_46 = 1'b1;
end
default : mem_out1_46 = alu_out_46;
endcase
end
end
endmodule