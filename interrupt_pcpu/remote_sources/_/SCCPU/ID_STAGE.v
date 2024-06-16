`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:26:48 05/15/2019 
// Design Name: 
// Module Name:    ID_STAGE 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ID_STAGE(
	/*interrupt*/
	npc,
	id_pc,
	exe_pc,
	overflow,
	intr,
	/*interrupt*/
	id_a, 
	id_b, 
	stall, 
	pc4,
	inst,
	wdi,
	wb_wreg,
	wb_rn,
	rsrtequ,
	clk,
	clrn,
	bpc,
	jpc,
	pcsource,
	wreg,
	m2reg,
	wmem,
	aluc,
	aluimm,
	rn,
	a,
	b,
	imm,
	shift, 
	regrt,
	uns,
	compact,
	half,
	is_byte,
	/*interrupt*/
	selpc,
	epc,
	inta,
	exc,
	add_or_sub
	/*interrupt*/
    );
	 /*intr*/
	 input [31:0] npc, id_pc, exe_pc;
	 input overflow, intr;
	 /*intr*/
	 input stall; //��ͣ����signal 
	 input [31:0] pc4,inst,wdi;		//pc4-PCֵ���ڼ���jpc��inst-��ȡ��ָ�wdi-��Ĵ���д�������
	 input clk,clrn;		//clk-ʱ���źţ�clrn-��λ�źţ�
	 input rsrtequ;		//branch�����ź�
	 input wb_wreg;
	 input [4:0] wb_rn;
	 input [31:0] id_a, id_b;
	 output [31:0] bpc,jpc,a,b,imm;		//bpc-branch_pc��jpc-jump_pc��a-�Ĵ���������a��b-�Ĵ���������b��imm-������������
	 output [3:0] aluc;		//ALU�����ź�
	 output [1:0] pcsource;		//��һ��ָ���ַѡ��
	 output wreg,m2reg,wmem,aluimm,shift,uns,compact,half,is_byte;	//exp2 adds wreg	
	 output [4:0] rn;//exp2 adds
	 output regrt;

	 /*intr*/
	 output [1:0] selpc;
	 output [31:0] epc;
	 output inta, exc;
	 output add_or_sub;
	 /*intr*/

	 //wire wreg;
	 //wire [4:0] rn;		//д�ؼĴ�����
	 wire [5:0] op,func;
	 wire [4:0] rs,rt,rd;
	 wire [31:0] qa,qb,br_offset;
	 wire [15:0] ext16;
	 wire [4:0] hint;
	 wire regrt,sext,e;
	 
	 assign func=inst[5:0];  
	 assign op=inst[31:26];
	 assign rs=inst[25:21];
	 assign rt=inst[20:16];
	 assign rd=inst[15:11];
	 assign hint=inst[10:6];

	 //interrupt
	 wire exc, wsta, wcau, wepc, mtc0, inta;
	 wire [1:0] mfc0;
	 wire [31:0] sta, cau, epc, sta_in, cau_in, epc_in,
	 			 sta_11_a0, epc_11_a0, cause;
	 
	 dff32e c0_Status (sta_in, clk, clrn, wsta, sta); //Status register
	 dff32e c0_Cause (cau_in, clk, clrn, wcau, cau); //Cause register
	 dff32e c0_EPC (epc_in, clk, clrn, wepc, epc); //Status register
	 //status
	 mux32_2_1 sta_11 ({4'b0, sta[31:4]}, {sta[27:0], 4'b0}, exc, sta_11_a0);
	 mux32_2_1 sta_12 (sta_11_a0, id_b, mtc0, sta_in);
	 //cause
	 mux32_2_1 cau_11 (cause, id_b, mtc0, cau_in);
	 //epc
	 wire [31:0] pc;
	 mux32_2_1 epc_10 (id_pc, exe_pc, overflow, pc);
	 mux32_2_1 epc_11 (epc_11_a0, id_b, mtc0, epc_in);
	 mux32_2_1 epc_12 (pc,npc,inta,epc_11_a0);
	 //mfc0
	 wire [31:0] src;
	 mux32_4_1 sel_c0_alu_mem (id_b, sta, cau, epc, mfc0, src);

	 Control_Unit cu(
		/*intr*/
		sta,
		overflow,
		intr,
		/*intr*/
		id_a, 
		id_b, 
		rs, 
		rt, 
		rd, 
		hint, 
		stall,/*rsrtequ,*/
		func,                          //���Ʋ���
	    op,
		wreg,
		m2reg,
		wmem,
		aluc,
		regrt,
		aluimm,
		sext,
		pcsource,
		shift, 
		jr, 
		al,
		jalr,
		uns,
		compact,
		half,
		is_byte
		/*intr*/
		, cause,
		exc,
		wsta,
		wcau,
		wepc,
		inta,
		mtc0,
		mfc0,
		selpc,
		add_or_sub
		/*intr*/
		);
			 
     Regfile rf (
		/*intr*/
		mfc0,
		src,
		/*intr*/
		wmem, 
		half, 
		is_byte, 
		pc4,
		rd,
		al,
		jalr,
		rs,
		rt,
		wdi,
		wb_rn,
		wb_wreg,
		clk,
		clrn,
		qa,
		qb
		);//�Ĵ����ѣ���32��32λ�ļĴ�����0�żĴ�����Ϊ0
	 mux5_2_1 des_reg_num (
		rd,
		rt,
		regrt,
		rn
		); //ѡ��Ŀ�ļĴ�����������rd,����rt

	 assign a=qa;
	 assign b=qb;

	 assign e=sext&inst[15];//������չ��0��չ
	 assign ext16={16{e}};//������չ
	 assign imm={ext16,inst[15:0]};		//�����������з�����չ

	 assign br_offset = {ext16[13:0],inst[15:0],2'b00};		//����ƫ�Ƶ�ַ
	 add32 br_addr (
		pc4,
		br_offset,
		bpc
		);		//beq,bneָ���Ŀ���ַ�ļ���

	 assign jpc = (jr) ? {id_a[29:0], 2'b00} : {pc4[31:28],inst[25:0],2'b00};		//jumpָ���Ŀ���ַ�ļ���
	 
endmodule
