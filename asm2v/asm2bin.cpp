#include <iostream>
#include <sstream>
#include <string>
#include <unordered_map>
#include <vector>
#include <iomanip>
#include <bitset>
#include <unordered_set>
#include <fstream>
using namespace std;

// 将寄存器名转换为编号
int getRegisterNumber(const string &reg)
{
    if (reg[0] != 'r')
    {
        cerr << "Invalid register name: " << reg << endl;
        exit(1);
    }
    return stoi(reg.substr(1));
}

// 操作码表
unordered_map<string, string> opcodeMap = {
    {"add", "00000000000100000"},
    {"and", "00000100000100000"},
    {"or", "00000100001000000"},
    {"xor", "00000100010000000"},
    {"sll", "000010000011"},
    {"srl", "000010000010"},
    {"addi", "000101"},
    {"andi", "001001"},
    {"ori", "001010"},
    {"xori", "001100"},
    {"load", "001101"},
    {"store", "001110"},
    {"beq", "001111"},
    {"bne", "010000"},
    {"jump", "010010"},
    // 其他指令的操作码可以在这里添加
};

unordered_set<char> delimiters = {' ', ',', '(', ')'};
// 使用多个分隔符分割字符串
std::vector<std::string> splitString(const std::string& input) {
    std::vector<std::string> tokens;
    std::stringstream ss;
    for (char ch : input) {
        if (delimiters.find(ch) != delimiters.end()) {
            if (!ss.str().empty()) {
                tokens.push_back(ss.str());
                ss.str("");
                ss.clear();
            }
        } else {
            ss << ch;
        }
    }
    if (!ss.str().empty()) {
        tokens.push_back(ss.str());
    }
    return tokens;
}

// 将16位立即数转换为二进制字符串
std::string toBinaryString(int n)
{
    std::string s = std::bitset<16>(n).to_string();
    return s;
}

int main()
{
    // 示例指令列表
    vector<string> instructions;
    string in = "insts.txt";
    string out = "output.txt";
    ifstream infile(in);
    ofstream outfile(out);
    string line;
    while(getline(infile, line)) {
        if(!line.empty())instructions.push_back(line);
    }
    infile.close();
    int i = 0;
    for (const string &instruction : instructions)
    {
        std::vector<std::string>inst_split = splitString(instruction);
        string op, rd, rs, rt, imm, offset, shift, target;
        string inst;
        int instInt;
        op = inst_split[0];
        i++;
        // 译码
        if (op == "add" || op == "and" || op == "or" || op == "xor")
        {
            rd = inst_split[1];
            rs = inst_split[2];
            rt = inst_split[3];
            rd = toBinaryString(getRegisterNumber(rd)).substr(11);
            rs = toBinaryString(getRegisterNumber(rs)).substr(11);
            rt = toBinaryString(getRegisterNumber(rt)).substr(11);
            inst = opcodeMap[op] + rd + rs + rt;
            instInt = stoi(inst, nullptr, 2);
            outfile << "	 assign rom[6'h" << hex << std::setw(3) << std::setfill('0') << i << "]=32'h" << hex << std::setw(8) << std::setfill('0') << instInt << ";		//" << instruction << endl;
        }
        if(op == "sll" || op == "srl")
        {
            rd = inst_split[1];
            rt = inst_split[2];
            shift = inst_split[3];
            rd = toBinaryString(getRegisterNumber(rd)).substr(11);
            rt = toBinaryString(getRegisterNumber(rt)).substr(11);
            shift = toBinaryString(stoi(shift, nullptr, 16)).substr(11);//shift in decimal
            inst = opcodeMap[op] + shift + rd + "00000" + rt;
            instInt = stoi(inst, nullptr, 2);
            outfile << "	 assign rom[6'h" << hex << std::setw(3) << std::setfill('0') << i << "]=32'h" << hex << std::setw(8) << std::setfill('0') << instInt << ";		//" << instruction << endl;
        }
        if(op == "addi" || op == "andi" || op == "ori" || op == "xori")
        {
            rt = inst_split[1];
            rs = inst_split[2];
            imm = inst_split[3];
            rt = toBinaryString(getRegisterNumber(rt)).substr(11);
            rs = toBinaryString(getRegisterNumber(rs)).substr(11);
            imm = toBinaryString(stoi(imm, nullptr, 16));//imm in decimal
            inst = opcodeMap[op] + imm + rs + rt;
            instInt = stoi(inst, nullptr, 2);
            outfile << "	 assign rom[6'h" << hex << std::setw(3) << std::setfill('0') << i << "]=32'h" << hex << std::setw(8) << std::setfill('0') << instInt << ";		//" << instruction << endl;
        }
        if(op == "load" || op == "store")
        {
            rt = inst_split[1];
            offset = inst_split[2];
            rs = inst_split[3];
            rt = toBinaryString(getRegisterNumber(rt)).substr(11);
            rs = toBinaryString(getRegisterNumber(rs)).substr(11);
            offset = toBinaryString(stoi(offset, nullptr, 16));//offset in decimal
            inst = opcodeMap[op] + offset + rs + rt;
            instInt = stoi(inst, nullptr, 2);
            outfile << "	 assign rom[6'h" << hex << std::setw(3) << std::setfill('0') << i << "]=32'h" << hex << std::setw(8) << std::setfill('0') << instInt << ";		//" << instruction << endl;
        }
        if(op == "beq" || op == "bne")
        {
            rs = inst_split[1];
            rt = inst_split[2];
            offset = inst_split[3];
            rs = toBinaryString(getRegisterNumber(rs)).substr(11);
            rt = toBinaryString(getRegisterNumber(rt)).substr(11);
            offset = toBinaryString(stoi(offset, nullptr, 16));//offset in decimal
            inst = opcodeMap[op] + offset + rs + rt;
            instInt = stoi(inst, nullptr, 2);
            outfile << "	 assign rom[6'h" << hex << std::setw(3) << std::setfill('0') << i << "]=32'h" << hex << std::setw(8) << std::setfill('0') << instInt << ";		//" << instruction << endl;
        }
        if(op == "jump")
        {
            target = inst_split[1];
            target = bitset<26>(stoi(target, nullptr, 16)).to_string();//offset in decimal
            inst = opcodeMap[op] + target;
            instInt = stoi(inst, nullptr, 2);
            outfile << "	 assign rom[6'h" << hex << std::setw(3) << std::setfill('0') << i << "]=32'h" << hex << std::setw(8) << std::setfill('0') << instInt << ";		//" << instruction << endl;
        }
    }
    return 0;
}