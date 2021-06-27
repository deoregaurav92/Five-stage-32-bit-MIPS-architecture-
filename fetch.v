module fetch(clk_46,rst_46,mra_i_46,mrd_i_46,PC_in_46,NPC_46,IR_46,PC_sel_46);
input clk_46,rst_46;
input PC_sel_46; // used to select new pc line or not
input [31:0] mrd_i_46; // memory instruction read
input [31:0] PC_in_46; // PC data initiated
output reg [31:0] NPC_46; // After execution Next PC will be stored in this reg.
output reg [31:0]mra_i_46;
output [31:0] IR_46; // Instruction of 32 bit is stored in IR register
reg [31:0] PC; //PC will have current instruction memory location.
// Instructions from code memory will be stored in IR re
assign IR_46 = mrd_i_46;
// On reset pc will be have value 0 so the execution will start from first memory location.
always @(posedge clk_46 or posedge rst_46)
begin
	if(rst_46)
	begin
		PC = 0;
	end
	else
	begin
		PC = PC_sel_46 ? PC_in_46 : PC;
		mra_i_46 = rst_46 ? 32'bz :PC;
// Each of the instruction are at 4 bit difference to each other
		PC = PC + 4;
		NPC_46 = PC_sel_46 ? PC_in_46 : PC;
//$display("Instruction in the first stage: %b",IR_46);
	end
end
endmodule