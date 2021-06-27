// Combining all these modules together:
`include "fetch.v"
`include "decode.v"
`include "execute.v"
`include "mw.v"
`include "wb.v"

module proc(clk_46,rst_46,mrd_i_46,mwd_i_46,mra_i_46,mwa_i_46,mwr_i_46,mrd_d_46,mwd_d_46,mra_d_46,mwa_d_46,mwr_d_46);
input clk_46,rst_46;
input [31:0] mrd_i_46,mrd_d_46; //// memory access to read data
output [31:0] mwd_i_46,mwd_d_46; //// memory access to write data
output [31:0] mra_i_46,mra_d_46; //// memory access to read address
output [31:0] mwa_i_46,mwa_d_46; //// memory access to write address
output mwr_i_46,mwr_d_46; //// memory access to write enable
// Intiating 32 bit wires
wire [31:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
// Intiating 32 bit wires
wire [31:0] r10,r11,r12,r13,r14,r15,r16,r17,r18,r19;
// Intiating 32 bit wires
wire [31:0] r20,r21,r22,r23,r24,r25,r26,r27,r28,r29;

// Intiating 32 bit wires
wire [31:0] r30,r31;
// Transferring data from one to another stages:
wire [31:0] PC_in_fd_46;
wire [31:0] NPC_fd_46;
wire [31:0] IR_fd_46;
wire PC_sel_fd_46;
wire [31:0] sign_ext_de_46;
wire [5:0] opcode_de_46;
wire [5:0] src_reg_de_46;
wire [5:0] dest_reg_de_46;
wire [5:0] targ_reg_de_46;
wire [31:0] a_de_46;
wire [31:0] b_de_46;
wire [31:0] alu_out_em_46;
wire [31:0] alu_src_em_46;
wire [5:0] opcode_out_em_46;
wire [5:0] src_reg_out_em_46;
wire [5:0] dest_reg_out_em_46;
wire [5:0] targ_reg_out_em_46;
wire [31:0] mem_out1_mr_46;
wire [31:0] mem_out2_mr_46;
wire [5:0] opcode_out_mr_46;
wire [5:0] src_reg_out_mr_46;
wire [5:0] dest_reg_out_mr_46;
wire [5:0] targ_reg_out_mr_46;
// Till the clock arrives this regs stores the values till that time
reg [31:0] NPC_fd_f_46;
reg PC_sel_fd_f_46;
reg PC_in_fd_f_46;
reg [31:0] IR_fd_f_46;
reg [31:0] a_de_f_46;
reg [31:0] b_de_f_46;
reg [31:0] sign_ext_de_f_46,a_de_f_46,b_de_f_46;
reg [5:0] opcode_de_f_46,src_reg_de_f_46,dest_reg_de_f_46,targ_reg_de_f_46;
reg [31:0] alu_out_em_f_46,alu_src_em_f_46;
reg [5:0] opcode_out_em_f_46,src_reg_out_em_f_46,dest_reg_out_em_f_46,targ_reg_out_em_f_46;
reg [31:0] mem_out1_mr_f_46,mem_out2_mr_f_46,mem_out1_mr_ff_46;
reg [5:0] opcode_out_mr_f_46,src_reg_out_mr_f_46,dest_reg_out_mr_f_46,targ_reg_out_mr_f_46;
reg [31:0] a_de_m_46,b_de_m_46;
wire [31:0] alu_out_em_m_46,alu_src_em_m_46;
parameter ADD = 6'b110001;
parameter LDW = 6'b010111;
parameter MUL = 6'b100111;
parameter BLT = 6'b010110;
parameter STW = 6'b010101;
parameter ADDI = 6'b000100;
parameter SUBI = 6'b011111;
parameter NOPE = 6'b111111;
initial
begin
a_de_m_46 = 0;
b_de_m_46 = 0;

end
// initializing all values to zero,
always @(posedge clk_46 or posedge rst_46)
begin
if(rst_46)
begin
NPC_fd_f_46 <= 0;
PC_sel_fd_f_46 <= 0;
PC_in_fd_f_46 <= 0;
IR_fd_f_46 <= 0;
sign_ext_de_f_46 <= 0;
opcode_de_f_46 <= 0;
src_reg_de_f_46 <= 0;
dest_reg_de_f_46 <= 0;
targ_reg_de_f_46 <= 0;
a_de_f_46 <= 0;
b_de_f_46 <= 0;
alu_out_em_f_46 <= 0;
alu_src_em_f_46 <= 0;
opcode_out_em_f_46 <= 0;
src_reg_out_em_f_46 <= 0;
dest_reg_out_em_f_46 <= 0;
targ_reg_out_em_f_46 <= 0;
mem_out1_mr_f_46 <= 0;
mem_out2_mr_f_46 <= 0;
opcode_out_mr_f_46 <= 0;
src_reg_out_mr_f_46 <= 0;
dest_reg_out_mr_f_46 <= 0;
targ_reg_out_mr_f_46 <= 0;
mem_out1_mr_ff_46 <= 0;
end
else
// at every clock data will be transferred to the next stage:
begin
NPC_fd_f_46 <= NPC_fd_46;
PC_sel_fd_f_46 <= PC_sel_fd_46;
PC_in_fd_f_46 <= PC_in_fd_46;
IR_fd_f_46 <= IR_fd_46;
sign_ext_de_f_46 <= sign_ext_de_46;
opcode_de_f_46 <= opcode_de_46;
src_reg_de_f_46 <= src_reg_de_46;
dest_reg_de_f_46 <= dest_reg_de_46;
targ_reg_de_f_46 <= targ_reg_de_46;
a_de_f_46 <= a_de_46;
b_de_f_46 <= b_de_46;
alu_out_em_f_46 <= alu_out_em_46;
alu_src_em_f_46 <= alu_src_em_46;
opcode_out_em_f_46 <= opcode_out_em_46;
src_reg_out_em_f_46 <= src_reg_out_em_46;
dest_reg_out_em_f_46 <= dest_reg_out_em_46;
targ_reg_out_em_f_46 <= targ_reg_out_em_46;
mem_out1_mr_f_46 <= mem_out1_mr_46;
mem_out2_mr_f_46 <= mem_out2_mr_46;
opcode_out_mr_f_46 <= opcode_out_mr_46;
src_reg_out_mr_f_46 <= src_reg_out_mr_46;
dest_reg_out_mr_f_46 <= dest_reg_out_mr_46;
targ_reg_out_mr_f_46 <= targ_reg_out_mr_46;
mem_out1_mr_ff_46 <= mem_out1_mr_f_46;
end
end
// initiating each and every modules to the main module
fetch
f(.clk_46(clk_46),.rst_46(rst_46),.mra_i_46(mra_i_46),.mrd_i_46(mrd_i_46),.PC_in_46(PC_in_fd_46),.NPC_46
(NPC_fd_46),.IR_46 (IR_fd_46),.PC_sel_46(PC_sel_fd_46));
decode
d(.clk_46(clk_46),.rst_46(rst_46),.IR_46(IR_fd_f_46),.PC_46(NPC_fd_f_46),.a_46(a_de_46),.b_46(b_de_46),.
NPC_46(PC_in_fd_46
),.PC_sel_46(PC_sel_fd_46),.sign_ext_46(sign_ext_de_46),.opcode_46(opcode_de_46),.src_reg_46(src_reg_
de_46),.dest_reg_46(des
t_reg_de_46),.targ_reg_46(targ_reg_de_46),.r0(r0),.r1(r1),.r2(r2),.r3(r3),.r4(r4),.r5(r5),.r6(r6),.r7(r7),.r8(r8),.r9(r9),.r10(r10),.r11(r11), .r12(r12),.r13(r13),.r14(r14),.r15(r15),.r16(r16),.r17(r17),.r18(r18),.r19(r19),
.r20(r20),.r21(r21),.r22(r22),.r23(r23),.r24(r24),.r25(r25),.r26(r26),.r27(r27),.r28(r28),.r29(r29),.r30(r30),.r31(r31)
);
execute
e(.clk_46(clk_46),.rst_46(rst_46),.opcode_46(opcode_de_f_46),.a_46(a_de_m_46),.b_46(b_de_m_46),.sign_e
xt_46(sign_ext_de_f_40),.alu_out_46(alu_out_em_46),.alu_src_46(alu_src_em_46),.opcode_out_46(opcode_out_em_46),.src_reg_51(src_reg_de_f_46),.des
t_reg_46(dest_reg_de_f_46),.targ_reg_46(targ_reg_de_f_46),.src_reg_out_46(src_reg_out_em_46),.dest_reg_
out_46(dest_reg_out_e m_46),.targ_reg_out_46(targ_reg_out_em_46));
memory_write
m(.clk_46(clk_46),.rst_46(rst_46),.opcode_46(opcode_out_em_f_46),.src_reg_46(src_reg_out_em_f_46),.dest
_reg_46(dest_reg_out_
em_f_46),.targ_reg_46(targ_reg_out_em_f_46),.alu_out_46(alu_out_em_f_46),.alu_src_46(alu_src_em_f_46),.
mem_out1_46(mem_o
ut1_mr_46),.mem_out2_46(mem_out2_mr_46),.opcode_out_46(opcode_out_mr_46),.src_reg_out_46(src_reg
_out_mr_46),.dest_reg_
out_46(dest_reg_out_mr_46),.targ_reg_out_46(targ_reg_out_mr_46),.mwr_d_46(mwr_d_46),.mwd_d_46(mwd
_d_46),.mwa_d_46(m
wa_d_46),.mra_d_46(mra_d_46),.mrd_d_46(mrd_d_46),.r0(r0),.r1(r1),.r2(r2),.r3(r3),.r4(r4),.r5(r5),.r6(r6),.r7(r7),
.r8(r8),.r9(r9),.r10(r10),.r11(r11),.r12(r12),.r13(r13),.r14(r14),.r15(r15),.r16(r16),.r17(r17),.r18(r18),.r19(r19),
.r20(r20),.r21(r21),.r22(r22),.r23(r23),.r24(r24),.r25(r25),.r26(r26),.r27(r27),.r28(r28),.r29(r29),.r30(r30),.r31(r31)
);
rw
r(.clk_46(clk_46),.rst_46(rst_46),.opcode_46(opcode_out_mr_f_46),.src_reg_46(src_reg_out_mr_f_46),.dest_r
eg_46(dest_reg_out_m
r_f_46),.targ_reg_46(targ_reg_out_mr_f_46),.mem_out1_46(mem_out1_mr_f_46),.mem_out2_46(mem_out2_
mr_f_46),.r0(r0),.r1(r1
),.r2(r2),.r3(r3),.r4(r4),.r5(r5),.r6(r6),.r7(r7),.r8(r8),.r9(r9),.r10(r10),.r11(r11),.r12(r12),.r13(r13),.r14(r14),.r15(r15)
,.r16(r16),.r17(r17), .r18(r18),.r19(r19),
.r20(r20),.r21(r21),.r22(r22),.r23(r23),.r24(r24),.r25(r25),.r26(r26),.r27(r27),.r28(r28),.r29(r29),.r30(r30),.r31(r31)
);
always @(*)
begin
a_de_m_46 = a_de_f_46;
b_de_m_46 = b_de_f_46;
// decoding opcode and doing operation accordingly
case(opcode_out_em_f_46)
CALL:
begin
case(opcode_de_f_46)
ADD:
begin
a_de_m_46 = (targ_reg_out_em_f_46 == src_reg_de_f_46 ) ? alu_out_em_f_46 : a_de_f_46;
b_de_m_46 = (targ_reg_out_em_f_46 == dest_reg_de_f_46) ? alu_out_em_f_46 : b_de_f_46;
end
MUL:
begin
a_de_m_46 = (targ_reg_out_em_f_46 == src_reg_de_f_46 ) ? alu_out_em_f_46 : a_de_f_46;
b_de_m_46 = (targ_reg_out_em_f_46 == dest_reg_de_f_46) ? alu_out_em_f_46 : b_de_f_46;
end
ADDI:
begin
a_de_m_46 = (targ_reg_out_em_f_46 == src_reg_de_f_46 ) ? alu_out_em_f_46 : a_de_f_46;
end
SUBI:
begin
a_de_m_46 = (targ_reg_out_em_f_46 == src_reg_de_f_46 ) ? alu_out_em_f_46 : a_de_f_46;
end
LDW:
begin
a_de_m_46 = (targ_reg_out_em_f_46 == src_reg_de_f_46 ) ? alu_out_em_f_46 : a_de_f_46;
end
STW:
begin
a_de_m_46 = (targ_reg_out_em_f_46 == src_reg_de_f_46 ) ? alu_out_em_f_46 : a_de_f_46;
b_de_m_46 = (targ_reg_out_em_f_46 == dest_reg_de_f_46) ? alu_out_em_f_46 : b_de_f_46;
end
BNE:
begin
a_de_m_46 = (targ_reg_out_em_f_46 == src_reg_de_f_46 ) ? alu_out_em_f_46 : a_de_f_46;
b_de_m_46 = (targ_reg_out_em_f_46 == dest_reg_de_f_46) ? alu_out_em_f_46 : b_de_f_46;
end
endcase
end
ADD:
begin
case(opcode_de_f_46)
ADD:
begin
a_de_m_46 = (targ_reg_out_em_f_46 == src_reg_de_f_46 ) ? alu_out_em_f_46 : a_de_f_46;
b_de_m_46 = (targ_reg_out_em_f_46 == dest_reg_de_f_46) ? alu_out_em_f_46 : b_de_f_46;
end
MUL:
begin
a_de_m_46 = (targ_reg_out_em_f_46 == src_reg_de_f_46 ) ? alu_out_em_f_46 : a_de_f_46;
b_de_m_46 = (targ_reg_out_em_f_46 == dest_reg_de_f_46) ? alu_out_em_f_46 : b_de_f_46;
end
ADDI:
begin
a_de_m_46 = (targ_reg_out_em_f_46 == src_reg_de_f_46 ) ? alu_out_em_f_46 : a_de_f_46;
end
SUBI:
begin
a_de_m_46 = (targ_reg_out_em_f_46 == src_reg_de_f_46 ) ? alu_out_em_f_46 : a_de_f_46;
end
LDW:
begin
a_de_m_46 = (targ_reg_out_em_f_46 == src_reg_de_f_46 ) ? alu_out_em_f_46 : a_de_f_46;
end
STW:
begin
a_de_m_46 = (targ_reg_out_em_f_46 == src_reg_de_f_46 ) ? alu_out_em_f_46 : a_de_f_46;
b_de_m_46 = (targ_reg_out_em_f_46 == dest_reg_de_f_46) ? alu_out_em_f_46 : b_de_f_46;
end
BNE:
begin
a_de_m_46 = (targ_reg_out_em_f_46 == src_reg_de_f_46 ) ? alu_out_em_f_46 : a_de_f_46;
b_de_m_46 = (targ_reg_out_em_f_46 == dest_reg_de_f_46) ? alu_out_em_f_46 : b_de_f_46;
end
endcase
end
MUL:
begin
case(opcode_de_f_46)
ADD:
begin
a_de_m_46 = (targ_reg_out_em_f_46 == src_reg_de_f_46 ) ? alu_out_em_f_46 : a_de_f_46;
b_de_m_46 = (targ_reg_out_em_f_46 == dest_reg_de_f_46) ? alu_out_em_f_46 : b_de_f_46;
end
MUL:
begin
a_de_m_46 = (targ_reg_out_em_f_46 == src_reg_de_f_46 ) ? alu_out_em_f_46 : a_de_f_46;
b_de_m_46 = (targ_reg_out_em_f_46 == dest_reg_de_f_46) ? alu_out_em_f_46 : b_de_f_46;
end
ADDI:
begin
a_de_m_46 = (targ_reg_out_em_f_46 == src_reg_de_f_46 ) ? alu_out_em_f_46 : a_de_f_46;
end
SUBI:
begin
a_de_m_46 = (targ_reg_out_em_f_46 == src_reg_de_f_46 ) ? alu_out_em_f_46 : a_de_f_46;
end
LDW:
begin
a_de_m_46 = (targ_reg_out_em_f_46 == src_reg_de_f_46 ) ? alu_out_em_f_46 : a_de_f_46;
end
STW:
begin
a_de_m_46 = (targ_reg_out_em_f_46 == src_reg_de_f_46 ) ? alu_out_em_f_46 : a_de_f_46;
b_de_m_46 = (targ_reg_out_em_f_46 == dest_reg_de_f_46) ? alu_out_em_f_46 : b_de_f_46;
end
BNE:
begin
a_de_m_46 = (targ_reg_out_em_f_46 == src_reg_de_f_46 ) ? alu_out_em_f_46 : a_de_f_46;
b_de_m_46 = (targ_reg_out_em_f_46 == dest_reg_de_f_46) ? alu_out_em_f_46 : b_de_f_46;
end
endcase
end
ADDI:
begin
case(opcode_de_f_46)
ADD:
begin
a_de_m_46 = (dest_reg_out_em_f_46 == src_reg_de_f_46 ) ? alu_out_em_f_46 : a_de_f_46;
b_de_m_46 = (dest_reg_out_em_f_46 == dest_reg_de_f_46) ? alu_out_em_f_46 : b_de_f_46;
end
MUL:
begin
a_de_m_46 = (dest_reg_out_em_f_46 == src_reg_de_f_46 ) ? alu_out_em_f_46 : a_de_f_46;
b_de_m_46 = (dest_reg_out_em_f_46 == dest_reg_de_f_46) ? alu_out_em_f_46 : b_de_f_46;
end
ADDI:
begin
a_de_m_46 = (dest_reg_out_em_f_46 == src_reg_de_f_46 ) ? alu_out_em_f_46 : a_de_f_46;
end
SUBI:
begin
a_de_m_46 = (dest_reg_out_em_f_46 == src_reg_de_f_46 ) ? alu_out_em_f_46 : a_de_f_46;
end
LDW:
begin
a_de_m_46 = (dest_reg_out_em_f_46 == src_reg_de_f_46 ) ? alu_out_em_f_46 : a_de_f_46;
end
STW:
begin
a_de_m_46 = (dest_reg_out_em_f_46 == src_reg_de_f_46 ) ? alu_out_em_f_46 : a_de_f_46;
b_de_m_46 = (dest_reg_out_em_f_46 == dest_reg_de_f_46) ? alu_out_em_f_46 : b_de_f_46;
end
BNE:
begin
a_de_m_46 = (targ_reg_out_em_f_46 == src_reg_de_f_46 ) ? alu_out_em_f_46 : a_de_f_46;
b_de_m_46 = (targ_reg_out_em_f_46 == dest_reg_de_f_46) ? alu_out_em_f_46 : b_de_f_46;
end
endcase
end
SUBI:
begin
case(opcode_de_f_46)
ADD:
begin
a_de_m_46 = (dest_reg_out_em_f_46 == src_reg_de_f_46 ) ? alu_out_em_f_46 : a_de_f_46;
b_de_m_46 = (dest_reg_out_em_f_46 == dest_reg_de_f_46) ? alu_out_em_f_46 : b_de_f_46;
end
MUL:
begin
a_de_m_46 = (dest_reg_out_em_f_46 == src_reg_de_f_46 ) ? alu_out_em_f_46 : a_de_f_46;
b_de_m_46 = (dest_reg_out_em_f_46 == dest_reg_de_f_46) ? alu_out_em_f_46 : b_de_f_46;
end
ADDI:
begin
a_de_m_46 = (dest_reg_out_em_f_46 == src_reg_de_f_46 ) ? alu_out_em_f_46 : a_de_f_46;
end
SUBI:
begin
a_de_m_46 = (dest_reg_out_em_f_46 == src_reg_de_f_46 ) ? alu_out_em_f_46 : a_de_f_46;
end
LDW:
begin
a_de_m_46 = (dest_reg_out_em_f_46 == src_reg_de_f_46 ) ? alu_out_em_f_46 : a_de_f_46;
end
STW:
begin
a_de_m_46 = (dest_reg_out_em_f_46 == src_reg_de_f_46 ) ? alu_out_em_f_46 : a_de_f_46;
b_de_m_46 = (dest_reg_out_em_f_46 == dest_reg_de_f_46) ? alu_out_em_f_46 : b_de_f_46;
end
BNE:
begin
a_de_m_46 = (targ_reg_out_em_f_46 == src_reg_de_f_46 ) ? alu_out_em_f_46 : a_de_f_46;
b_de_m_46 = (targ_reg_out_em_f_46 == dest_reg_de_f_46) ? alu_out_em_f_46 : b_de_f_46;
end
endcase
end
LDW:
begin
end
endcase
case(opcode_out_mr_f_46)
ADD:
begin
case(opcode_de_f_46)
ADD:
begin
a_de_m_46 = (targ_reg_out_mr_f_46 == src_reg_de_f_46 ) ? mem_out1_mr_f_46 : a_de_m_46;
b_de_m_46 = (targ_reg_out_mr_f_46 == dest_reg_de_f_46) ? mem_out1_mr_f_46 : b_de_m_46;
end
MUL:
begin
a_de_m_46 = (targ_reg_out_mr_f_46 == src_reg_de_f_46 ) ? mem_out1_mr_f_46 : a_de_m_46;
b_de_m_46 = (targ_reg_out_mr_f_46 == dest_reg_de_f_46) ? mem_out1_mr_f_46 : b_de_m_46;
end
ADDI:
begin
a_de_m_46 = (targ_reg_out_mr_f_46 == src_reg_de_f_46 ) ? mem_out1_mr_f_46 : a_de_m_46;
end
SUBI:
begin
a_de_m_46 = (targ_reg_out_mr_f_46 == src_reg_de_f_46 ) ? mem_out1_mr_f_46 : a_de_m_46;
end
LDW:
begin
a_de_m_46 = (targ_reg_out_mr_f_46 == src_reg_de_f_46 ) ? mem_out1_mr_f_46 : a_de_m_46;
end
STW:
begin
a_de_m_46 = (targ_reg_out_mr_f_46 == src_reg_de_f_46 ) ? mem_out1_mr_f_46 : a_de_m_46;
b_de_m_46 = (targ_reg_out_mr_f_46 == dest_reg_de_f_46) ? mem_out1_mr_f_46 : b_de_m_46;
end
BNE:
begin
a_de_m_46 = (targ_reg_out_mr_f_46 == src_reg_de_f_46 ) ? mem_out1_mr_f_46 : a_de_m_46;
b_de_m_46 = (targ_reg_out_mr_f_46 == dest_reg_de_f_46) ? mem_out1_mr_f_46 : b_de_m_46;
end
endcase
end
MUL:
begin
case(opcode_de_f_46)
ADD:
begin
a_de_m_46 = (targ_reg_out_mr_f_46 == src_reg_de_f_46 ) ? mem_out1_mr_f_46 : a_de_m_46;
b_de_m_46 = (targ_reg_out_mr_f_46 == dest_reg_de_f_46) ? mem_out1_mr_f_46 : b_de_m_46;
end
MUL:
begin
a_de_m_46 = (targ_reg_out_mr_f_46 == src_reg_de_f_46 ) ? mem_out1_mr_f_46 : a_de_m_46;
b_de_m_46 = (targ_reg_out_mr_f_46 == dest_reg_de_f_46) ? mem_out1_mr_f_46 : b_de_m_46;
end
ADDI:
begin
a_de_m_46 = (targ_reg_out_mr_f_46 == src_reg_de_f_46 ) ? mem_out1_mr_f_46 : a_de_m_46;
end
SUBI:
begin
a_de_m_46 = (targ_reg_out_mr_f_46 == src_reg_de_f_46 ) ? mem_out1_mr_f_46 : a_de_m_46;
end
LDW:
begin
a_de_m_46 = (targ_reg_out_mr_f_46 == src_reg_de_f_46 ) ? mem_out1_mr_f_46 : a_de_m_46;
end
STW:
begin
a_de_m_46 = (targ_reg_out_mr_f_46 == src_reg_de_f_46 ) ? mem_out1_mr_f_46 : a_de_m_46;
b_de_m_46 = (targ_reg_out_mr_f_46 == dest_reg_de_f_46) ? mem_out1_mr_f_46 : b_de_m_46;
end
BNE:
begin
a_de_m_46 = (targ_reg_out_mr_f_46 == src_reg_de_f_46 ) ? mem_out1_mr_f_46 : a_de_m_46;
b_de_m_46 = (targ_reg_out_mr_f_46 == dest_reg_de_f_46) ? mem_out1_mr_f_46 : b_de_m_46;
end
endcase
end
ADDI:
begin
case(opcode_de_f_46)
ADD:
begin
a_de_m_46 = (dest_reg_out_mr_f_46 == src_reg_de_f_46 ) ? mem_out1_mr_f_46 : a_de_m_46;
b_de_m_46 = (dest_reg_out_mr_f_46 == dest_reg_de_f_46) ? mem_out1_mr_f_46 : b_de_m_46;
end
MUL:
begin
a_de_m_46 = (dest_reg_out_mr_f_46 == src_reg_de_f_46 ) ? mem_out1_mr_f_46 : a_de_m_46;
b_de_m_46 = (dest_reg_out_mr_f_46 == dest_reg_de_f_46) ? mem_out1_mr_f_46 : b_de_m_46;
end
ADDI:
begin
a_de_m_46 = (dest_reg_out_mr_f_46 == src_reg_de_f_46 ) ? mem_out1_mr_f_46 : a_de_m_46;
end
SUBI:
begin
a_de_m_46 = (dest_reg_out_mr_f_46 == src_reg_de_f_46 ) ? mem_out1_mr_f_46 : a_de_m_46;
end
LDW:
begin
a_de_m_46 = (dest_reg_out_mr_f_46 == src_reg_de_f_46 ) ? mem_out1_mr_f_46 : a_de_m_46;
end
STW:
begin
a_de_m_46 = (dest_reg_out_mr_f_46 == src_reg_de_f_46 ) ? mem_out1_mr_f_46 : a_de_m_46;
b_de_m_46 = (dest_reg_out_mr_f_46 == dest_reg_de_f_46) ? mem_out1_mr_f_46 : b_de_m_46;
end
BNE:
begin
a_de_m_46 = (targ_reg_out_mr_f_46 == src_reg_de_f_46 ) ? mem_out1_mr_f_46 : a_de_m_46;
b_de_m_46 = (targ_reg_out_mr_f_46 == dest_reg_de_f_46) ? mem_out1_mr_f_46 : b_de_m_46;
end
endcase
end
SUBI:
begin
case(opcode_de_f_46)
ADD:
begin
a_de_m_46 = (dest_reg_out_mr_f_46 == src_reg_de_f_46 ) ? mem_out1_mr_f_46 : a_de_m_46;
b_de_m_46 = (dest_reg_out_mr_f_46 == dest_reg_de_f_46) ? mem_out1_mr_f_46 : b_de_m_46;
end
MUL:
begin
a_de_m_46 = (dest_reg_out_mr_f_46 == src_reg_de_f_46 ) ? mem_out1_mr_f_46 : a_de_m_46;
b_de_m_46 = (dest_reg_out_mr_f_46 == dest_reg_de_f_46) ? mem_out1_mr_f_46 : b_de_m_46;
end
ADDI:
begin
a_de_m_46 = (dest_reg_out_mr_f_46 == src_reg_de_f_46 ) ? mem_out1_mr_f_46 : a_de_m_46;
end
SUBI:
begin
a_de_m_46 = (dest_reg_out_mr_f_46 == src_reg_de_f_46 ) ? mem_out1_mr_f_46 : a_de_m_46;
end
LDW:
begin
a_de_m_46 = (dest_reg_out_mr_f_46 == src_reg_de_f_46 ) ? mem_out1_mr_f_46 : a_de_m_46;
end
STW:
begin
a_de_m_46 = (dest_reg_out_mr_f_46 == src_reg_de_f_46 ) ? mem_out1_mr_f_46 : a_de_m_46;
b_de_m_46 = (dest_reg_out_mr_f_46 == dest_reg_de_f_46) ? mem_out1_mr_f_46 : b_de_m_46;
end
BNE:
begin
a_de_m_46 = (targ_reg_out_mr_f_46 == src_reg_de_f_46 ) ? mem_out1_mr_f_46 : a_de_m_46;
b_de_m_46 = (targ_reg_out_mr_f_46 == dest_reg_de_f_46) ? mem_out1_mr_f_46 : b_de_m_46;
end
endcase
end
LDW:
begin
case(opcode_de_f_46)
ADD:
begin
a_de_m_46 = (dest_reg_out_mr_f_46 == src_reg_de_f_46 ) ? mem_out1_mr_f_46 : a_de_m_46;
b_de_m_46 = (dest_reg_out_mr_f_46 == dest_reg_de_f_46) ? mem_out1_mr_f_46 : b_de_m_46;
end
MUL:
begin
a_de_m_46 = (dest_reg_out_mr_f_46 == src_reg_de_f_46 ) ? mem_out1_mr_f_46 : a_de_m_46;
b_de_m_46 = (dest_reg_out_mr_f_46 == dest_reg_de_f_46) ? mem_out1_mr_f_46 : b_de_m_46;
end
ADDI:
begin
a_de_m_46 = (dest_reg_out_mr_f_46 == src_reg_de_f_46 ) ? mem_out1_mr_f_46 : a_de_m_46;
end
SUBI:
begin
a_de_m_46 = (dest_reg_out_mr_f_46 == src_reg_de_f_46 ) ? mem_out1_mr_f_46 : a_de_m_46;
end
LDW:
begin
a_de_m_46 = (dest_reg_out_mr_f_46 == src_reg_de_f_46 ) ? mem_out1_mr_f_46 : a_de_m_46;
end
STW:
begin
a_de_m_46 = (dest_reg_out_mr_f_46 == src_reg_de_f_46 ) ? mem_out1_mr_f_46 : a_de_m_46;
b_de_m_46 = (dest_reg_out_mr_f_46 == dest_reg_de_f_46) ? mem_out1_mr_f_46 : b_de_m_46;
end
BNE:
begin
a_de_m_46 = (targ_reg_out_mr_f_46 == src_reg_de_f_46 ) ? mem_out1_mr_f_46 : a_de_m_46;
b_de_m_46 = (targ_reg_out_mr_f_46 == dest_reg_de_f_46) ? mem_out1_mr_f_46 : b_de_m_46;
end
endcase
end
endcase
end
endmodule