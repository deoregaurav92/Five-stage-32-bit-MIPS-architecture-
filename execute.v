// 3rd Stage of Pipeline: // ************* Execution Stage*************
module execute(clk_46,rst_46,opcode_46,a_46,b_46,sign_ext_46,alu_out_46,alu_src_46,opcode_out_46,src_reg_46,dest_reg_46, targ_reg_46,src_reg_out_46,dest_reg_out_46,targ_reg_out_46);
input clk_46,rst_46;
input [5:0] opcode_46;
input [5:0] src_reg_46,dest_reg_46,targ_reg_46;
input [31:0] a_46,b_46,sign_ext_46;
output [5:0] opcode_out_46;
output reg [31:0] alu_out_46;
output [31:0] alu_src_46;
output [5:0] src_reg_out_46,dest_reg_out_46,targ_reg_out_46;

parameter ADD = 6'b110001;// for adding two regs and stores value reg
parameter LDW = 6'b010111;// load data from memory to reg
parameter MUL = 6'b100111;// multiply two regs
parameter BLT = 6'b010110;// it will branch if less than other one
parameter STW = 6'b010101;// stores data from reg to mem
parameter BR = 6'b000110;// unconditional branch
parameter ADDI = 6'b000100;// addition of immediate data to reg
parameter BEQ = 6'b100110;// Branch if the values are equal
parameter NOPE = 6'b111111;// special instruction which do no operation

// If reset is found assigning value to 0
assign opcode_out_46 = rst_46 ? 0 : opcode_46;
assign src_reg_46_out = rst_46 ? 0 : src_reg_46;
assign dest_reg_out_46 = rst_46 ? 0 : dest_reg_46;
assign targ_reg_out_46 = rst_46 ? 0 : targ_reg_46;
assign alu_src_46 = rst_46 ? 0 : b_46;
always @ (*)
begin
#0;
if(rst_46)
begin
alu_out_46 = 0;
end
else
begin
case(opcode_46)
// According to various inst various execution takes place.
ADD : alu_out_46 = a_46 + b_46;
LDW : alu_out_46 = a_46 + sign_ext_46;
MUL : alu_out_46 = a_46 * b_46;
STW : alu_out_46 = a_46 + sign_ext_46;
ADDI: alu_out_46 = a_46 + sign_ext_46;
//SUBI: alu_out_46 = a_46 - sign_ext_46;
// CALL: alu_out_46 = b_46;
endcase
end
end
endmodule