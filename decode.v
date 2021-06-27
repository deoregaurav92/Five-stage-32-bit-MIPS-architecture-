module decode(clk_46,rst_46,IR_46,PC_46,a_46,b_46,NPC_46,PC_sel_46,sign_ext_46,opcode_46,src_reg_46,dest_reg_46,targ_reg_46,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,
r20,r21,r22,r23,r24,r25,r26,r27,r28,r29,r30,r31);
input clk_46,rst_46;
input [31:0] IR_46;
input [31:0] PC_46;
output reg [31:0] a_46,b_46;
output reg [31:0] NPC_46;
output reg PC_sel_46;
output reg [31:0] sign_ext_46;

output [5:0] opcode_46;
output [5:0] src_reg_46;
output [5:0] dest_reg_46;
output [5:0] targ_reg_46;
// These registers are from register bank which will store all execution val
// These 32 registers will require 5 memory locations.
input [31:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
input [31:0] r10,r11,r12,r13,r14,r15,r16,r17,r18,r19;
input [31:0] r20,r21,r22,r23,r24,r25,r26,r27,r28,r29;
input [31:0] r30,r31;
// 5 wire pair is used to access each of the registers
wire [5:0] acce;
//. Each of the regs are stored with specific parameter which defines it's //memory locations
parameter R0 = 5'b00000;
parameter R1 = 5'b00001;
parameter R2 = 5'b00010;
parameter R3 = 5'b00011;
parameter R4 = 5'b00100;
parameter R5 = 5'b00101;
parameter R6 = 5'b00110;
parameter R7 = 5'b00111;
parameter R8 = 5'b01000;
parameter R9 = 5'b01001;
parameter R10 = 5'b01010;
parameter R11 = 5'b01011;
parameter R12 = 5'b01100;
parameter R13 = 5'b01101;
parameter R14 = 5'b01110;
parameter R15 = 5'b01111;
parameter R16 = 5'b10000;
parameter R17 = 5'b10001;
parameter R18 = 5'b10010;
parameter R19 = 5'b10011;
parameter R20 = 5'b10100;
parameter R21 = 5'b10101;
parameter R22 = 5'b10110;
parameter R23 = 5'b10111;
parameter R24 = 5'b11000;
parameter R25 = 5'b11001;
parameter R26 = 5'b11010;
parameter R27 = 5'b11011;
parameter R28 = 5'b11100;
parameter R29 = 5'b11101;
parameter R30 = 5'b11110;
parameter R31 = 5'b11111;
// Each of the MIPS instructions are have predefined 6-bit hex code //which is written below
parameter ADD = 6'b110001;// for adding two regs and stores value reg
parameter LDW = 6'b010111;// load data from memory to reg
parameter MUL = 6'b100111;// multiply two regs
parameter BLT = 6'b010110;// it will branch if less than other one
parameter STW = 6'b010101;// stores data from reg to mem
parameter BR = 6'b000110;// unconditional branch
parameter ADDI = 6'b000100;// addition of immediate data to reg

parameter BEQ = 6'b100110;// Branch if the values are equal
parameter NOPE = 6'b111111;// special instruction which do no operation
assign opcode_46 = rst_46 ? 6'b000000 : IR_46[5:0];
assign src_reg_46 = rst_46 ? 5'b000000 : IR_46[31:27];
assign dest_reg_46 = rst_46 ? 5'b000000 : IR_46[26:22];
assign targ_reg_46 = rst_46 ? 5'b000000 : IR_46[21:17];
assign j = rst_46 ? 5'b000000 : IR_46[16:11];
always @(*)
begin
	if(rst_46)
	begin
		NPC_46 = 0;
		PC_sel_46 = 0;
		sign_ext_46 = 0;
		a_46= 0;
		b_46= 0;
	end
// According to each individual instructions each of the temp regs assigned values.
	else
	begin
		PC_sel_46 = 1'b0;
		case(opcode_46)
		ADD:
		begin
// Value for the source reg stored in src
			case(src_reg_46)
			R0 : a_46 = r0;
			R1 : a_46 = r1;
			R2 : a_46 = r2;
			R3 : a_46 = r3;
			R4 : a_46 = r4;
			R5 : a_46 = r5;
			R6 : a_46 = r6;
			R7 : a_46 = r7;
			R8 : a_46 = r8;
			R9 : a_46 = r9;
			R10 : a_46 = r10;
			R11 : a_46 = r11;
			R12 : a_46 = r12;
			R13 : a_46 = r13;
			R14 : a_46 = r14;
			R15 : a_46 = r15;
			R16 : a_46 = r16;
			R17 : a_46 = r17;
			R18 : a_46 = r18;
			R19 : a_46 = r19;
			R20 : a_46 = r20;
			R21 : a_46 = r21;
			R22 : a_46 = r22;
			R23 : a_46 = r23;
			R24 : a_46 = r24;
			R25 : a_46 = r25;
			R26 : a_46 = r26;
			R27 : a_46 = r27;
			R28 : a_46 = r28;
			R29 : a_46 = r29;
			R30 : a_46 = r30;
			R31 : a_46 = r31;
			endcase
// Destination which is stored in b
			case(dest_reg_46)
			R0 : b_46 = r0;
			R1 : b_46 = r1;
			R2 : b_46 = r2;
			R3 : b_46 = r3;
			R4 : b_46 = r4;
			R5 : b_46 = r5;
			R6 : b_46 = r6;
			R7 : b_46 = r7;
			R8 : b_46 = r8;
			R9 : b_46 = r9;
			R10 : b_46 = r10;
			R11 : b_46 = r11;
			R12 : b_46 = r12;
			R13 : b_46 = r13;
			R14 : b_46 = r14;
			R15 : b_46 = r15;
			R16 : b_46 = r16;
			R17 : b_46 = r17;
			R18 : b_46 = r18;
			R19 : b_46 = r19;
			R20 : b_46 = r20;
			R21 : b_46 = r21;
			R22 : b_46 = r22;
			R23 : b_46 = r23;
			R24 : b_46 = r24;
			R25 : b_46 = r25;
			R26 : b_46 = r26;
			R27 : b_46 = r27;
			R28 : b_46 = r28;
			R29 : b_46 = r29;
			R30 : b_46 = r30;
			R31 : b_46 = r31;
			endcase
		end
	LDW:
	begin
		case(src_reg_46)
		R0 : a_46 = r0;
		R1 : a_46 = r1;
		R2 : a_46 = r2;
		R3 : a_46 = r3;
		R4 : a_46 = r4;
		R5 : a_46 = r5;
		R6 : a_46 = r6;
		R7 : a_46 = r7;
		R8 : a_46 = r8;
		R9 : a_46 = r9;
		R10 : a_46 = r10;
		R11 : a_46 = r11;
		R12 : a_46 = r12;
		R13 : a_46 = r13;
		R14 : a_46 = r14;
		R15 : a_46 = r15;
		R16 : a_46 = r16;
		R17 : a_46 = r17;
		R18 : a_46 = r18;
		R19 : a_46 = r19;
		R20 : a_46 = r20;
		R21 : a_46 = r21;
		R22 : a_46 = r22;
		R23 : a_46 = r23;
		R24 : a_46 = r24;
		R25 : a_46 = r25;
		R26 : a_46 = r26;
		R27 : a_46 = r27;
		R28 : a_46 = r28;
		R29 : a_46 = r29;
		R30 : a_46 = r30;
		R31 : a_46 = r31;
		endcase
		sign_ext_46 = IR_46[21] ? {16'hFFFF,IR_46[21:6]} : {16'h0000,IR_46[21:6]};
	end
MUL:
begin
case(src_reg_46)
R0 : a_46 = r0;
R1 : a_46 = r1;
R2 : a_46 = r2;
R3 : a_46 = r3;
R4 : a_46 = r4;
R5 : a_46 = r5;
R6 : a_46 = r6;
R7 : a_46 = r7;
R8 : a_46 = r8;
R9 : a_46 = r9;
R10 : a_46 = r10;
R11 : a_46 = r11;
R12 : a_46 = r12;
R13 : a_46 = r13;
R14 : a_46 = r14;
R15 : a_46 = r15;
R16 : a_46 = r16;
R17 : a_46 = r17;
R18 : a_46 = r18;
R19 : a_46 = r19;
R20 : a_46 = r20;
R21 : a_46 = r21;
R22 : a_46 = r22;
R23 : a_46 = r23;
R24 : a_46 = r24;
R25 : a_46 = r25;
R26 : a_46 = r26;
R27 : a_46 = r27;
R28 : a_46 = r28;
R29 : a_46 = r29;
R30 : a_46 = r30;
R31 : a_46 = r31;
endcase

case(dest_reg_46)
R0 : b_46 = r0;
R1 : b_46 = r1;
R2 : b_46 = r2;
R3 : b_46 = r3;
R4 : b_46 = r4;
R5 : b_46 = r5;
R6 : b_46 = r6;
R7 : b_46 = r7;
R8 : b_46 = r8;
R9 : b_46 = r9;
R10 : b_46 = r10;
R11 : b_46 = r11;
R12 : b_46 = r12;
R13 : b_46 = r13;
R14 : b_46 = r14;
R15 : b_46 = r15;
R16 : b_46 = r16;
R17 : b_46 = r17;
R18 : b_46 = r18;
R19 : b_46 = r19;
R20 : b_46 = r20;
R21 : b_46 = r21;
R22 : b_46 = r22;
R23 : b_46 = r23;
R24 : b_46 = r24;
R25 : b_46 = r25;
R26 : b_46 = r26;
R27 : b_46 = r27;
R28 : b_46 = r28;
R29 : b_46 = r29;
R30 : b_46 = r30;
R31 : b_46 = r31;
endcase
end
BLT:
begin
case(src_reg_46)
R0 : a_46 = r0;
R1 : a_46 = r1;
R2 : a_46 = r2;
R3 : a_46 = r3;
R4 : a_46 = r4;
R5 : a_46 = r5;
R6 : a_46 = r6;
R7 : a_46 = r7;
R8 : a_46 = r8;
R9 : a_46 = r9;
R10 : a_46 = r10;
R11 : a_46 = r11;
R12 : a_46 = r12;
R13 : a_46 = r13;
R14 : a_46 = r14;
R15 : a_46 = r15;
R16 : a_46 = r16;
R17 : a_46 = r17;
R18 : a_46 = r18;
R19 : a_46 = r19;
R20 : a_46 = r20;
R21 : a_46 = r21;
R22 : a_46 = r22;
R23 : a_46 = r23;
R24 : a_46 = r24;
R25 : a_46 = r25;
R26 : a_46 = r26;
R27 : a_46 = r27;
R28 : a_46 = r28;
R29 : a_46 = r29;
R30 : a_46 = r30;
R31 : a_46 = r31;
endcase
case(dest_reg_46)
R0 : b_46 = r0;
R1 : b_46 = r1;
R2 : b_46 = r2;
R3 : b_46 = r3;
R4 : b_46 = r4;
R5 : b_46 = r5;
R6 : b_46 = r6;
R7 : b_46 = r7;
R8 : b_46 = r8;
R9 : b_46 = r9;
R10 : b_46 = r10;
R11 : b_46 = r11;
R12 : b_46 = r12;
R13 : b_46 = r13;
R14 : b_46 = r14;
R15 : b_46 = r15;
R16 : b_46 = r16;
R17 : b_46 = r17;
R18 : b_46 = r18;
R19 : b_46 = r19;
R20 : b_46 = r20;
R21 : b_46 = r21;
R22 : b_46 = r22;
R23 : b_46 = r23;
R24 : b_46 = r24;
R25 : b_46 = r25;
R26 : b_46 = r26;
R27 : b_46 = r27;
R28 : b_46 = r28;
R29 : b_46 = r29;
R30 : b_46 = r30;
R31 : b_46 = r31;
endcase
sign_ext_46 = IR_46[21] ? {16'hFFFF,IR_46[21:6]} : {16'h0000,IR_46[21:6]};
NPC_46 = (a_46<b_46) ? (PC_46 - sign_ext_46) : PC_46;
PC_sel_46 = 1'b1;
end
STW:
begin
case(src_reg_46)
R0 : a_46 = r0;
R1 : a_46 = r1;
R2 : a_46 = r2;
R3 : a_46 = r3;
R4 : a_46 = r4;
R5 : a_46 = r5;
R6 : a_46 = r6;
R7 : a_46 = r7;
R8 : a_46 = r8;
R9 : a_46 = r9;
R10 : a_46 = r10;
R11 : a_46 = r11;
R12 : a_46 = r12;
R13 : a_46 = r13;
R14 : a_46 = r14;
R15 : a_46 = r15;
R16 : a_46 = r16;
R17 : a_46 = r17;
R18 : a_46 = r18;
R19 : a_46 = r19;
R20 : a_46 = r20;
R21 : a_46 = r21;
R22 : a_46 = r22;
R23 : a_46 = r23;
R24 : a_46 = r24;
R25 : a_46 = r25;
R26 : a_46 = r26;
R27 : a_46 = r27;
R28 : a_46 = r28;
R29 : a_46 = r29;
R30 : a_46 = r30;
R31 : a_46 = r31;
endcase
case(dest_reg_46)
R0 : b_46 = r0;
R1 : b_46 = r1;
R2 : b_46 = r2;
R3 : b_46 = r3;
R4 : b_46 = r4;
R5 : b_46 = r5;
R6 : b_46 = r6;
R7 : b_46 = r7;
R8 : b_46 = r8;
R9 : b_46 = r9;
R10 : b_46 = r10;
R11 : b_46 = r11;
R12 : b_46 = r12;
R13 : b_46 = r13;
R14 : b_46 = r14;
R15 : b_46 = r15;
R16 : b_46 = r16;
R17 : b_46 = r17;
R18 : b_46 = r18;
R19 : b_46 = r19;
R20 : b_46 = r20;
R21 : b_46 = r21;
R22 : b_46 = r22;
R23 : b_46 = r23;
R24 : b_46 = r24;
R25 : b_46 = r25;
R26 : b_46 = r26;
R27 : b_46 = r27;
R28 : b_46 = r28;
R29 : b_46 = r29;
R30 : b_46 = r30;
R31 : b_46 = r31;
endcase
sign_ext_46 = IR_46[21] ? {16'hFFFF,IR_46[21:6]} : {16'h0000,IR_46[21:6]};
end
BR:
begin
sign_ext_46 = IR_46[21] ? {16'hFFFF,IR_46[21:6]} : {16'h0000,IR_46[21:6]};
NPC_46 = PC_46 - sign_ext_46;
PC_sel_46 = 1'b1;
end
ADDI:
begin
case(src_reg_46)
R0 : a_46 = r0;
R1 : a_46 = r1;
R2 : a_46 = r2;
R3 : a_46 = r3;
R4 : a_46 = r4;
R5 : a_46 = r5;
R6 : a_46 = r6;
R7 : a_46 = r7;
R8 : a_46 = r8;
R9 : a_46 = r9;
R10 : a_46 = r10;
R11 : a_46 = r11;
R12 : a_46 = r12;
R13 : a_46 = r13;
R14 : a_46 = r14;
R15 : a_46 = r15;
R16 : a_46 = r16;
R17 : a_46 = r17;
R18 : a_46 = r18;
R19 : a_46 = r19;
R20 : a_46 = r20;
R21 : a_46 = r21;
R22 : a_46 = r22;
R23 : a_46 = r23;
R24 : a_46 = r24;
R25 : a_46 = r25;
R26 : a_46 = r26;
R27 : a_46 = r27;
R28 : a_46 = r28;
R29 : a_46 = r29;
R30 : a_46 = r30;
R31 : a_46 = r31;
endcase
sign_ext_46 = IR_46[21] ? {16'hFFFF,IR_46[21:6]} : {16'h0000,IR_46[21:6]};
end
BEQ :
begin
case(src_reg_46)
R0 : a_46 = r0;
R1 : a_46 = r1;
R2 : a_46 = r2;
R3 : a_46 = r3;
R4 : a_46 = r4;
R5 : a_46 = r5;
R6 : a_46 = r6;
R7 : a_46 = r7;
R8 : a_46 = r8;
R9 : a_46 = r9;
R10 : a_46 = r10;
R11 : a_46 = r11;
R12 : a_46 = r12;
R13 : a_46 = r13;
R14 : a_46 = r14;
R15 : a_46 = r15;
R16 : a_46 = r16;
R17 : a_46 = r17;
R18 : a_46 = r18;
R19 : a_46 = r19;
R20 : a_46 = r20;
R21 : a_46 = r21;
R22 : a_46 = r22;
R23 : a_46 = r23;
R24 : a_46 = r24;
R25 : a_46 = r25;
R26 : a_46 = r26;
R27 : a_46 = r27;
R28 : a_46 = r28;
R29 : a_46 = r29;
R30 : a_46 = r30;
R31 : a_46 = r31;
endcase
case(dest_reg_46)
R0 : b_46 = r0;
R1 : b_46 = r1;
R2 : b_46 = r2;
R3 : b_46 = r3;
R4 : b_46 = r4;
R5 : b_46 = r5;
R6 : b_46 = r6;
R7 : b_46 = r7;
R8 : b_46 = r8;
R9 : b_46 = r9;
R10 : b_46 = r10;
R11 : b_46 = r11;
R12 : b_46 = r12;
R13 : b_46 = r13;
R14 : b_46 = r14;
R15 : b_46 = r15;
R16 : b_46 = r16;
R17 : b_46 = r17;
R18 : b_46 = r18;
R19 : b_46 = r19;
R20 : b_46 = r20;
R21 : b_46 = r21;
R22 : b_46 = r22;
R23 : b_46 = r23;
R24 : b_46 = r24;
R25 : b_46 = r25;
R26 : b_46 = r26;
R27 : b_46 = r27;
R28 : b_46 = r28;
R29 : b_46 = r29;
R30 : b_46 = r30;
R31 : b_46 = r31;
endcase
sign_ext_46 = IR_46[21] ? {16'hFFFF,IR_46[21:6]} : {16'h0000,IR_46[21:6]};
NPC_46 = (a_46==b_46) ? (PC_46 - sign_ext_46) : PC_46;
PC_sel_46 = (a_46==b_46) ? 1'b1 : 1'b0;
end
// Nope is special instruction which is used to put memory stall cycles
// It will avoid possible hazards
endcase
end
end
endmodule