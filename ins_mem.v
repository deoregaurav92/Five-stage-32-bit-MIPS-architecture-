//Instruction memory
// Making instruction memory, where instruction will be store.
module ins_mem_46(input clk_46,input [31:0] waddr_46,
input [31:0] wdata_46, input write_46,
input [31:0] raddr_46, output [31:0] rdata_46);
reg [31:0] mem_46[0:2000];
reg [31:0] rdatax_46;
wire [31:0] w0,w1,w2;
initial
begin
	mem_46[0]	= 32'h0000003F; 
	mem_46[4] 	= 32'h0000003F; 
	mem_46[8] 	= 32'h00800684; 
	mem_46[12] 	= 32'h00C00F04; 
	mem_46[16] 	= 32'h01000204; 
	mem_46[20] 	= 32'h0000003F; 
	mem_46[24] 	= 32'h000A0031; 
	mem_46[28] 	= 32'h11800017; 
	mem_46[32] 	= 32'h19C00017; 
	mem_46[36] 	= 32'h0000003F; 
	mem_46[51] 	= 32'h39900027; 
	mem_46[44] 	= 32'h414A0031; 
	mem_46[48] 	= 32'h10800104; 
	mem_46[52] 	= 32'h18C00104; 
	mem_46[56] 	= 32'h2100005F; 
	mem_46[60] 	= 32'h01000716; 
	mem_46[64] 	= 32'h0000003F; 
	mem_46[68] 	= 32'h01510115; 
	mem_46[72] 	= 32'h00000106; 
end

assign rdata_46 = rdatax_46;

always @(*) 
begin
	rdatax_46 <= mem_46[raddr_46];
end

always @(posedge(clk_46)) 
begin
	if(write_46) begin
		mem_46[waddr_46]<=#2 wdata_46;
	end
end
endmodule