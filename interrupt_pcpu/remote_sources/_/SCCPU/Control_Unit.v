`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:46:15 05/15/2019 
// Design Name: 
// Module Name:    Control_Unit 
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
module Control_Unit (
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
    stall,
    func,
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
  /*intr*/
  input [31:0] sta;
  input intr, overflow;
  /*intr*/

  input [31:0] id_a, id_b;  //前推
  input stall;  //暂停控制信号
  input [5:0] func, op;  //指令中相应控制码字段
  input [4:0] hint, rs, rt, rd;
  output wreg, m2reg, wmem, regrt, aluimm, sext, shift, jr, al, jalr, uns, compact, half, is_byte;
  wire id_wreg_org, id_wmem_org;
  output [3:0] aluc;  //ALU控制码
  output [1:0] pcsource;  //PC多路选择器控制码

  /*intr*/
  output [31:0] cause;
  output exc, wsta, wcau, wepc, inta, mtc0;
  output [1:0] mfc0, selpc;
  output add_or_sub;
  /*intr*/

  wire r_type = ~|op;
  //R型指令，共22条
  //加减操作
  wire i_add = r_type & (func == 6'b100000);
  wire i_addu = r_type & (func == 6'b100001);
  wire i_sub = r_type & (func == 6'b100010);
  wire i_subu = r_type & (func == 6'b100011);
  //逻辑操作
  wire i_nor = r_type & (func == 6'b100111) & (hint == 5'b0);
  wire i_or = r_type & (func == 6'b100101) & (hint == 5'b0);
  wire i_and = r_type & (func == 6'b100100);
  wire i_xor = r_type & (func == 6'b100110);
  //跳转
  wire i_jr = r_type & (func == 6'b001001) & (rt == 5'b0) & (rd == 5'b0);
  //乘法
  wire i_mul = r_type & (func == 6'b011000) & (hint == 5'b00010);
  wire i_muh = r_type & (func == 6'b011000) & (hint == 5'b00011);
  wire i_mulu = r_type & (func == 6'b011001) & (hint == 5'b00010);
  wire i_muhu = r_type & (func == 6'b011001) & (hint == 5'b00011);
  //特殊指令
  wire i_nop = r_type & (func == 6'b0) & (hint == 6'b0) & (rs == 0) & (rt == 0)&(rd == 0);  ///////nop 机器码是全0
  //移位指令
  wire i_sll = r_type & (func == 6'b0) & (rs == 5'b0) & (~i_nop);  //rs也为0
  wire i_sllv = r_type & (func == 6'b000100) & (hint == 5'b0);
  wire i_sra = r_type & (func == 6'b000011) & (rs == 0);  //rs也为0
  wire i_srav = r_type & (func == 6'b000111) & (hint == 5'b0);
  wire i_srl = r_type & (func == 6'b000010) & (rs == 0);  //rs也为0
  wire i_srlv = r_type & (func == 6'b000110) & (hint == 5'b0);
  //比较指令
  wire i_slt = r_type & (func == 6'b101010) & (hint == 5'b0);
  wire i_sltu = r_type & (func == 6'b101011) & (hint == 5'b0);

  //除法和取模，未实现
  wire i_div = r_type & (func == 6'b011010) & (hint == 5'b00010);
  wire i_mod = r_type & (func == 6'b011010) & (hint == 5'b00011);
  wire i_divu = r_type & (func == 6'b011011) & (hint == 5'b00010);
  wire i_modu = r_type & (func == 6'b011011) & (hint == 5'b00011);


  //I型指令，共36条
  //加法，共2条
  wire i_addiu = (op == 6'b001001);
  //逻辑操作，共3条
  wire i_andi = (op == 6'b001100);
  wire i_xori = (op == 6'b001110);
  wire i_ori = (op == 6'b001101);
  //控制语句，共9条
  wire i_b = (op == 6'b000100) & (rs == 5'b0) & (rt == 5'b0);  //与beq相同, tested
  wire i_bal = (op == 6'b000001) & (rs == 5'b0) & (rt == 5'b10001);  //tested
  wire i_beq = (op == 6'b000100);  //tested
  wire i_bgez = (op == 6'b000001) & (rt == 5'b00001);  //tested
  wire i_bgezal = (op == 6'b000001) & (rt == 5'b10001);  //tested
  wire i_bgtz = (op == 6'b000111) & (rt == 5'b0);  //tested
  wire i_blez = (op == 6'b000110) & (rt == 5'b0);  //tested
  wire i_bltz = (op == 6'b000001) & (rt == 5'b0);  //tested
  wire i_bne = (op == 6'b000101);  //tested
  //compact 语句，共10条
  wire i_blezc = (op == 6'b010110) & (rs == 5'b0) & (rt != 5'b0);  //tested
  wire i_bgezc = (op == 6'b010110) & (rs == rt) & (rs != 5'b0);  //tested
  wire i_bgec = (op == 6'b010110) & (rs != rt) & (rs != 5'b0) & (rt != 5'b0);  //tested
  wire i_bgtzc = (op == 6'b010111) & (rs == 5'b0) & (rt != 5'b0);  //tested
  wire i_bltzc = (op == 6'b010111) & (rs == rt) & (rs != 5'b0);  //tested
  wire i_bltc = (op == 6'b010111) & (rs != rt) & (rs != 5'b0) & (rt != 5'b0);  //tested
  wire i_bgeuc = (op == 6'b000110) & (rs != rt) & (rs != 5'b0) & (rt != 5'b0);  //tested
  wire i_bltuc = (op == 6'b000111) & (rs != rt) & (rs != 5'b0) & (rt != 5'b0);  //tested
  wire i_beqc = (op == 6'b001000) & (rs < rt) & (rs != 5'b0) & (rt != 5'b0);  //tested
  wire i_bnec = (op == 6'b011000) & (rs < rt) & (rs != 5'b0) & (rt != 5'b0);  //tested
  //内存读取，共6条
  wire i_lb = (op == 6'b100000);  //tested
  wire i_lbu = (op == 6'b100100);  //tested
  wire i_lh = (op == 6'b100001);  //tested
  wire i_lhu = (op == 6'b100101);  //tested
  wire i_lui = (op == 6'b001111) & (rs == 5'b0);  //tested
  wire i_lw = (op == 6'b100011);  //tested
  //内存写入，共3条
  wire i_sb = (op == 6'b101000);  //tested
  wire i_sh = (op == 6'b101001);  //tested
  wire i_sw = (op == 6'b101011);  //tested
  //比较指令，共2条
  wire i_slti = (op == 6'b001010);  //tested
  wire i_sltiu = (op == 6'b001011);  //tested


  //J型指令，共3条
  wire i_j = (op == 6'b000010);  //tested
  wire i_jal = (op == 6'b000011);  //tested
  wire i_jalr = (op == 6'b000000) & (rt == 5'b0) & (rd != 5'b0) & (func == 6'b001001);  //tested

  //中断指令，共4条
  // wire i_break = r_type & (func == 6'b001101);
  wire i_syscall = r_type & (func == 6'b001100);
  wire i_eret = (op == 6'b010000) & (rs == 5'b10000) & (rt == 0) & (rd == 0) & (hint == 0) & (func == 6'b011000);
  wire i_mfc0 = (op == 6'b010000) & (rs == 0) & (hint == 0) & (func[5:3] == 0);
  wire i_mtc0 = (op == 6'b010000) & (rs == 5'b00100) & (hint == 0) & (func[5:3] == 0);
  wire unimplemented_inst = ~(i_add | i_addu | i_sub | i_subu | 
                              i_nor | i_or | i_and | i_xor | 
                              i_jr |
                              i_mul | i_muh | i_mulu | i_muhu |
                              i_nop |
                              i_sll | i_sllv | i_sra | i_srav | i_srl | i_srlv |
                              i_slt | i_sltu |
                              /*I型*/
                              i_addiu |
                              i_andi | i_xori | i_ori |
                              i_b | i_bal | i_beq | i_bgez | i_bgezal | i_bgtz | i_blez | i_bltz | i_bne |
                              i_blezc | i_bgezc | i_bgec | i_bgtzc | i_bltzc | i_bltc | i_bgeuc | i_bltuc | i_beqc | i_bnec |
                              i_lb | i_lbu | i_lh | i_lhu | i_lui | i_lw |
                              i_sb | i_sh | i_sw |
                              i_slti | i_sltiu |
                              /*J型*/
                              i_j | i_jal | i_jalr |
                              /*中断指令*/
                              i_syscall | i_eret | i_mfc0 | i_mtc0
                             );


  ////////////////////////////////////////////控制信号的生成/////////////////////////////////////////////////////////
  assign id_wreg_org = i_add | i_addu | i_and | i_div | i_mod | i_divu | i_modu | i_mul | i_muh | i_mulu | i_muhu | 
	 					  i_nor | i_or | i_sll | i_sllv | i_slt | i_sltu | i_sra | i_srav | i_srl | i_srlv | i_sub | i_subu | i_xor | 
						  i_addiu | i_andi | i_ori | i_xori |  
						  i_lb | i_lbu | i_lh | i_lhu | i_lui | i_lw | 
						  i_slti | i_sltiu |
              i_mfc0;								//id级译码后写寄存器堆使能信号

  assign regrt = i_addiu | i_andi | i_ori | i_xori | 
	 				i_lb | i_lbu | i_lh | i_lhu | i_lui | i_lw |
					i_slti | i_sltiu |
          i_mfc0;    								//regrt为1时目的寄存器是rt，否则为rd

  assign m2reg = i_lw | i_lhu | i_lh | i_lbu | i_lb;  				//运算结果写回寄存器：为1时将存储器数据写入寄存器，否则将ALU结果写入寄存器

  assign shift = i_sll | i_sra | i_srl;								//ALUa数据输入选择：为1时ALUa输入端使用移位位数字段inst[19:15]

  assign aluimm = i_addiu | i_andi | i_ori | i_xori | 
	 				 i_lb | i_lbu | i_lh | i_lhu | i_lw | 
					 i_sw | i_sb | i_sh | i_slti | i_sltiu;				//ALUb数据输入选择：为1时ALUb输入端使用立即数

  assign sext = i_addiu | i_slti | i_sltiu |
	 			   i_b | i_bal |  i_beq | i_bgez | i_bgezal | i_bgtz | i_blez | i_bltz | i_bne | 
				   i_lb | i_lbu | i_lh | i_lhu | i_lw | i_sb | i_sh | i_sw |
           i_blezc | i_bgezc | i_bgec | i_bgtzc | 
           i_bltzc | i_bltc | i_bgeuc | i_bltuc | 
           i_beqc | i_bnec;
  //为1时符号拓展，否则零拓展

  assign id_wmem_org = i_sw | i_sh | i_sb;						//存储器写信号：为1时写存储器，否则不写 id级译码后写数据存储器使能信号

  assign jr = i_jr | i_jalr;

  assign jalr = i_jalr;  //保存放回地址到指定寄存器

  assign uns = i_addu | i_subu | i_addiu | i_divu | i_modu | i_mulu | i_muhu | i_sltu | i_sltiu | i_bgeuc | i_bltuc | i_lhu | i_lbu;//ALU的操作数是否无符号的控制信号

  assign compact = i_blezc | i_bgezc | i_bgec | i_bgtzc | 
                  i_bltzc | i_bltc | i_bgeuc | i_bltuc | 
                  i_beqc | i_bnec;                                                      //是否为compact指令，compact指令没有delay slot，也就是说会把紧接着的指令变为nop


  assign half = i_sh | i_lh | i_lhu;  //读半字

  assign is_byte = i_sb | i_lb | i_lbu;  //读字节
  //stall added wreg and wmem
  assign wreg = ~stall & id_wreg_org;
  assign wmem = ~stall & id_wmem_org;

  //aluc = 
  //0000
  wire alu_add = i_add | i_addu | i_addiu | i_sw | i_sh | i_sb | i_lw | i_lhu | i_lh | i_lb | i_lbu;
  //0001
  wire alu_and = i_and | i_andi;
  //0010                                                                                
  wire alu_div = i_div | i_divu;
  //0011                                                                                
  wire alu_mod = i_mod | i_modu;
  //0100                                                                                
  wire alu_mul = i_mul | i_mulu;
  //0101                                                                                
  wire alu_muh = i_muh | i_muhu;
  //0110                                                                                
  wire alu_nor = i_nor;
  //0111
  wire alu_or = i_or | i_ori;
  //1000
  wire alu_sll = i_sll | i_sllv;
  //1001
  wire alu_lt = i_slt | i_sltu | i_slti | i_sltiu | i_bltz | i_bgezal | i_bgez;//bltz, bgezal, bgez要取反
  //1010
  wire alu_sra = i_sra | i_srav;
  //1011
  wire alu_srl = i_srl | i_srlv;
  //1100
  wire alu_sub = i_sub | i_subu | i_bne | i_beq;
  //1101
  wire alu_xor = i_xor | i_xori;
  //1110
  wire alu_lui = i_lui;
  //1111
  wire alu_gt = i_blez | i_bgtz | i_blezc;

  //aluc
  assign aluc[0] = alu_and | alu_mod | alu_muh | alu_or | alu_lt | alu_srl | alu_xor | alu_gt;
  assign aluc[1] = alu_div | alu_mod | alu_nor | alu_or | alu_sra | alu_srl | alu_lui | alu_gt;
  assign aluc[2] = alu_mul | alu_muh | alu_nor | alu_or | alu_sub | alu_xor | alu_lui | alu_gt;
  assign aluc[3] = alu_sll | alu_lt | alu_sra | alu_srl | alu_sub | alu_xor | alu_lui | alu_gt;


  //cond
  wire signed [31:0] s_a = id_a;
  wire signed [31:0] s_b = id_b;
  wire rseqrt = (id_a == id_b);
  wire rsnert = ~rseqrt;
  wire rsgert = !(s_a < s_b);
  wire rsltrt = ~rsgert;
  wire rsgert_u = !(id_a < id_b);
  wire rsltrt_u = ~rsgert_u;
  wire rsgtz = (s_b > 0);
  wire rslez = ~rsgtz;
  wire rsltz = (s_b < 0);
  wire rsgez = ~rsltz;


  //al
  assign al = i_bal | i_jal | (i_bgezal & rsgez) | i_jalr;  //保存返回地址到31号寄存器控制信号

  //pcsource
  assign pcsource[1] = i_j | i_jal | i_jalr | i_jr;
  assign pcsource[0] = i_b | i_bal | 
                       ((i_beq | i_beqc)& rseqrt) | ((i_bne | i_bnec)& rsnert) |
                       ((i_bgez | i_bgezal | i_bgezc) & rsgez) | ((i_bgtz | i_bgtzc) & rsgtz) |
                       ((i_blez | i_blezc) & rslez) | ((i_bltz | i_bltzc) & rsltz) |
                       (i_bgec & rsgert) | (i_bltc & rsltrt) | (i_bgeuc & rsgert_u) | (i_bltuc & rsltrt_u);

  //intr
  assign add_or_sub = i_add | i_sub;
  wire int_int = sta[0] & intr;
  wire exc_sys = sta[1] & i_syscall;
  wire exc_uni = sta[2] & unimplemented_inst;
  wire exc_ovr = sta[3] & overflow;
  assign inta = int_int;
  assign exc = int_int | exc_sys | exc_uni | exc_ovr;
  //ExcCode: 00：外部中断(npc)、01：系统调用(id_pc)、10：未实现的指令(id_pc)、11：溢出(exe_pc)
  //外部中断：当前被IF的指令要被执行
  //系统调用：IF的指令被置0
  //未实现的指令：IF的指令被置0
  //溢出：IF和ID的指令被置0
  wire ExcCode0 = i_syscall | overflow;
  wire ExcCode1 = unimplemented_inst | overflow;
  assign cause = {28'h0, ExcCode1, ExcCode0, 2'b00};
  //产生3个c0寄存器的写使能信号
  wire rd_is_status = (rd == 5'd12);
  wire rd_is_cause  = (rd == 5'd13);
  wire rd_is_epc    = (rd == 5'd14);
  assign mtc0 = i_mtc0;
  assign wsta = exc | mtc0 & rd_is_status | i_eret;
  assign wcau = exc | mtc0 & rd_is_cause;
  assign wepc = exc | mtc0 & rd_is_epc;
  //mfc0
  assign mfc0[0] = i_mfc0 & rd_is_status | i_mfc0 & rd_is_epc;
  assign mfc0[1] = i_mfc0 & rd_is_cause  | i_mfc0 & rd_is_epc;
  //selpc
  assign selpc[0] = i_eret;
  assign selpc[1] = exc;
  
endmodule
