// 5th Stage of Pipeline: // ************* Write Back Stage*************
module rw(clk_46,rst_46,opcode_46,src_reg_46,dest_reg_46,targ_reg_46,mem_out1_46,mem_out2_46,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19, r20,r21,r22,r23,r24,r25,r26,r27,r28,r29,r30,r31);
input clk_46,rst_46;
input [5:0] opcode_46;
input [5:0] src_reg_46,dest_reg_46,targ_reg_46;
input [31:0] mem_out1_46,mem_out2_46;
// initiating 32 bit regs
output reg [31:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
output reg [31:0] r10,r11,r12,r13,r14,r15,r16,r17,r18,r19;
output reg [31:0] r20,r21,r22,r23,r24,r25,r26,r27,r28,r29;
output reg [31:0] r30,r31;

parameter ADD = 6'b110001;
parameter LDW = 6'b010111;
parameter MUL = 6'b100111;
parameter BLT = 6'b010110;
parameter STW = 6'b010101;
parameter ADDI = 6'b000100;
parameter SUBI = 6'b011111;
parameter NOPE = 6'b111111;

// if reset in set to 1 all the values will be transferred to 0
initial
begin
r0 = 0;
r1 = 0;
r2 = 0;
r3 = 0;
r4 = 3;
r5 = 0;
r6 = 0;
r7 = 0;
r8 = 0;
r9 = 0;
r10 = 0;
r11 = 0;
r12 = 0;
r13 = 0;
r14 = 0;
r15 = 0;
r16 = 0;
r17 = 0;
r18 = 0;
r19 = 0;
r20 = 0;
r21 = 0;
r22 = 0;
r23 = 0;
r24 = 0;
r25 = 0;
r26 = 0;
r27 = 0;
r28 = 0;
r29 = 32'h00000051;
r30 = 150;
r31 = 190;
end
always @(*)
begin
case(opcode_46)
ADD:
begin
case(targ_reg_46)
R0 : r0 = mem_out1_46;
R1 : r1 = mem_out1_46;
R2 : r2 = mem_out1_46;
R3 : r3 = mem_out1_46;
R4 : r4 = mem_out1_46;
R5 : r5 = mem_out1_46;
R6 : r6 = mem_out1_46;
R7 : r7 = mem_out1_46;
R8 : r8 = mem_out1_46;
R9 : r9 = mem_out1_46;
R10 : r10 = mem_out1_46;
R11 : r11 = mem_out1_46;
R12 : r12 = mem_out1_46;
R13 : r13 = mem_out1_46;
R14 : r14 = mem_out1_46;
R15 : r15 = mem_out1_46;
R16 : r16 = mem_out1_46;
R17 : r17 = mem_out1_46;
R18 : r18 = mem_out1_46;
R19 : r19 = mem_out1_46;
R20 : r20 = mem_out1_46;
R21 : r21 = mem_out1_46;
R22 : r22 = mem_out1_46;
R23 : r23 = mem_out1_46;
R24 : r24 = mem_out1_46;
R25 : r25 = mem_out1_46;
R26 : r26 = mem_out1_46;
R27 : r27 = mem_out1_46;
R28 : r28 = mem_out1_46;
R29 : r29 = mem_out1_46;
R30 : r30 = mem_out1_46;
R31 : r31 = mem_out1_46;
endcase
end
LDW:
begin
case(dest_reg_46)
R0 : r0 = mem_out1_46;
R1 : r1 = mem_out1_46;
R2 : r2 = mem_out1_46;
R3 : r3 = mem_out1_46;
R4 : r4 = mem_out1_46;
R5 : r5 = mem_out1_46;
R6 : r6 = mem_out1_46;
R7 : r7 = mem_out1_46;
R8 : r8 = mem_out1_46;
R9 : r9 = mem_out1_46;
R10 : r10 = mem_out1_46;
R11 : r11 = mem_out1_46;
R12 : r12 = mem_out1_46;
R13 : r13 = mem_out1_46;
R14 : r14 = mem_out1_46;
R15 : r15 = mem_out1_46;
R16 : r16 = mem_out1_46;
R17 : r17 = mem_out1_46;
R18 : r18 = mem_out1_46;
R19 : r19 = mem_out1_46;
R20 : r20 = mem_out1_46;
R21 : r21 = mem_out1_46;
R22 : r22 = mem_out1_46;
R23 : r23 = mem_out1_46;
R24 : r24 = mem_out1_46;
R25 : r25 = mem_out1_46;
R26 : r26 = mem_out1_46;
R27 : r27 = mem_out1_46;
R28 : r28 = mem_out1_46;
R29 : r29 = mem_out1_46;
R30 : r30 = mem_out1_46;
R31 : r31 = mem_out1_46;
endcase
end
MUL:
begin
case(targ_reg_46)
R0 : r0 = mem_out1_46;
R1 : r1 = mem_out1_46;
R2 : r2 = mem_out1_46;
R3 : r3 = mem_out1_46;
R4 : r4 = mem_out1_46;
R5 : r5 = mem_out1_46;
R6 : r6 = mem_out1_46;
R7 : r7 = mem_out1_46;
R8 : r8 = mem_out1_46;
R9 : r9 = mem_out1_46;
R10 : r10 = mem_out1_46;
R11 : r11 = mem_out1_46;
R12 : r12 = mem_out1_46;
R13 : r13 = mem_out1_46;
R14 : r14 = mem_out1_46;
R15 : r15 = mem_out1_46;
R16 : r16 = mem_out1_46;
R17 : r17 = mem_out1_46;
R18 : r18 = mem_out1_46;
R19 : r19 = mem_out1_46;
R20 : r20 = mem_out1_46;
R21 : r21 = mem_out1_46;
R22 : r22 = mem_out1_46;
R23 : r23 = mem_out1_46;
R24 : r24 = mem_out1_46;
R25 : r25 = mem_out1_46;
R26 : r26 = mem_out1_46;
R27 : r27 = mem_out1_46;
R28 : r28 = mem_out1_46;
R29 : r29 = mem_out1_46;
R30 : r30 = mem_out1_46;
R31 : r31 = mem_out1_46;
endcase
end
ADDI:
begin
case(dest_reg_46)
R0 : r0 = mem_out1_46;
R1 : r1 = mem_out1_46;
R2 : r2 = mem_out1_46;
R3 : r3 = mem_out1_46;
R4 : r4 = mem_out1_46;
R5 : r5 = mem_out1_46;
R6 : r6 = mem_out1_46;
R7 : r7 = mem_out1_46;
R8 : r8 = mem_out1_46;
R9 : r9 = mem_out1_46;
R10 : r10 = mem_out1_46;
R11 : r11 = mem_out1_46;
R12 : r12 = mem_out1_46;
R13 : r13 = mem_out1_46;
R14 : r14 = mem_out1_46;
R15 : r15 = mem_out1_46;
R16 : r16 = mem_out1_46;
R17 : r17 = mem_out1_46;
R18 : r18 = mem_out1_46;
R19 : r19 = mem_out1_46;
R20 : r20 = mem_out1_46;
R21 : r21 = mem_out1_46;
R22 : r22 = mem_out1_46;
R23 : r23 = mem_out1_46;
R24 : r24 = mem_out1_46;
R25 : r25 = mem_out1_46;
R26 : r26 = mem_out1_46;
R27 : r27 = mem_out1_46;
R28 : r28 = mem_out1_46;
R29 : r29 = mem_out1_46;
R30 : r30 = mem_out1_46;
R31 : r31 = mem_out1_46;
endcase
end
CALL :
begin
r31 = mem_out2_46;
end
SUBI:
begin
case(dest_reg_46)
R0 : r0 = mem_out1_46;
R1 : r1 = mem_out1_46;
R2 : r2 = mem_out1_46;
R3 : r3 = mem_out1_46;
R4 : r4 = mem_out1_46;
R5 : r5 = mem_out1_46;
R6 : r6 = mem_out1_46;
R7 : r7 = mem_out1_46;
R8 : r8 = mem_out1_46;
R9 : r9 = mem_out1_46;
R10 : r10 = mem_out1_46;
R11 : r11 = mem_out1_46;
R12 : r12 = mem_out1_46;
R13 : r13 = mem_out1_46;
R14 : r14 = mem_out1_46;
R15 : r15 = mem_out1_46;
R16 : r16 = mem_out1_46;
R17 : r17 = mem_out1_46;
R18 : r18 = mem_out1_46;
R19 : r19 = mem_out1_46;
R20 : r20 = mem_out1_46;
R21 : r21 = mem_out1_46;
R22 : r22 = mem_out1_46;
R23 : r23 = mem_out1_46;
R24 : r24 = mem_out1_46;
R25 : r25 = mem_out1_46;
R26 : r26 = mem_out1_46;
R27 : r27 = mem_out1_46;
R28 : r28 = mem_out1_46;
R29 : r29 = mem_out1_46;
R30 : r30 = mem_out1_46;
R31 : r31 = mem_out1_46;
endcase
end
endcase
end
endmodule