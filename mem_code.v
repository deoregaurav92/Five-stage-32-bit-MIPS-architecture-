// Now making a Data memory where enrolment will be stored. It stores the data.
module data_mem_46(input clk_46,input [31:0] waddr_46,
input [31:0] wdata_46, input write_46,
input [31:0] raddr_46, output [31:0] rdata_46);
reg [31:0] mem_46[0:2000];
reg [31:0] rdata_46x;
wire [31:0] w0,w1,w2;
initial
begin
// Writing SJSU ID in the mem_46ory locations:
// SJSU ID: 015215746
// For 9 Digits 9 Location will be required
	mem_46[30] = 0;
    mem_46[34] = 1;
    mem_46[38] = 5;
    mem_46[42] = 2;
    mem_46[46] = 1;
    mem_46[50] = 5;
	mem_46[54] = 7;
	mem_46[58] = 4;
	mem_46[62] = 6;

// SJSU ID: 0 1 5 2 1 5 7 4 6
// Adding 2 to each digit: 2 3 7 4 3 7 9 6 8 
// For 9 Digits 9 Location will be required
	mem_46[60] = 2;
    mem_46[64] = 3;
    mem_46[68] = 7;
    mem_46[72] = 4;
    mem_46[76] = 3;
    mem_46[80] = 7;
	mem_46[84] = 9;
	mem_46[88] = 6;
	mem_46[92] = 8;
end

assign rdata_46 = rdata_46x;

always @(*) 
begin
	rdata_46x <= mem_46[raddr_46];
end

always @(posedge(clk_46))
begin
	if(write_46) begin
		mem_46[waddr_46]<=#2 wdata_46;
	end
// $monitor (" mem_46 ----->>>> %d at time %t",mem_46[7],$realtime);
end
endmodule