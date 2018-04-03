// 6b|5b|5b|5b|5b|6b|
// Opcode|Rs|Rt|Rt|Rd|Shift|Function
// Opcode|Rs|Rt|Address/Immediate Value
// Opcode|Branch Target Address
package def;
	typedef enum logic[5:0]{
		rType = 6'd0,
		lType = 6'd35,
		sType = 6'd43,
		jType = 6'd4
	} opCodeType;

	typedef enum logic[5:0] {
		ADD     = 6'd32,
		SUB     = 6'd34,
		AND     = 6'd36,
		OR     = 6'd37,
		SLT     = 6'd52
	} funcType;

	typedef struct packed{
		opCodeType opCode;
		logic [4:0] rs;
		logic [4:0] rt;
		logic [4:0] rd;
		logic [4:0] shamt;
		funcType func;
	} instrType;

	typedef enum logic[4:0] {
		zero = 5'd0,
		at = 5'd1,
		v0 = 5'd2,
		v1 = 5'd3,
		a0 = 5'd4,
		a1 = 5'd5,
		a2 = 5'd6,
		a3 = 5'd7,
		t0 = 5'd8,
		t1 = 5'd9,
		t2 = 5'd10,
		t3 = 5'd11,
		t4 = 5'd12,
		t5 = 5'd13,
		t6 = 5'd14,
		t7 = 5'd15,
		s0 = 5'd16,
		s1 = 5'd17,
		s2 = 5'd18,
		s3 = 5'd19,
		s4 = 5'd20,
		s5 = 5'd21,
		s6 = 5'd22,
		s7 = 5'd23,
		t8 = 5'd24,
		t9 = 5'd25,
		k0 = 5'd26,
		k1 = 5'd27,
		gp = 5'd28,
		sp = 5'd29,
		fp = 5'd30,
		ra = 5'd31
	} regAddr;
endpackage : def
