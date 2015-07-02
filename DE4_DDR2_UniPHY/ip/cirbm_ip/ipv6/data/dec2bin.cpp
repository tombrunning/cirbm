#include<iostream>
#include<cstdlib>
#include<cstring>
#include<string>
#include<fstream>
#include<cmath>
using namespace std;

string dec2binStr(int decimal, int length);
string dec2bin(int number);

int main(){
	int i=0; 
	size_t comma = 0,comma2=0,dec_point=0;
	const int cnt=784;
	string line;
	string word;
	string binary;
	string zero;
	string sign = "0";
	string int_part = "0000";
	string frac_part = "00000000000";
	double realnum;
	ifstream infile;
	ofstream outfile;
	infile.open("data.txt");
	outfile.open("bin.dat");
	
	if(!infile.is_open()||!outfile.is_open()){
		cout<<"File open failed."<<endl;
		exit(0);
	}

	while(!infile.eof()){
		getline(infile,line);
		comma = line.find(',',0);
		while(comma<line.size() && i != cnt-1){
			comma2=line.find(',',comma+1);
			word = line.substr(comma+1,comma2-comma-1);
			realnum = atof(line.substr(comma+1,comma2-comma-1).c_str());
			
			if(realnum<0){
				sign = '1';
				dec_point = word.find('.',0);
				if(string::npos == dec_point){
					int_part = zero.assign(4-word.length(),'0') + word;
				}
				else{
					int_part = dec2binStr(atoi(word.substr(1,dec_point-1).c_str()),4);//Avoid sign "-"
					frac_part = dec2binStr(atoi(word.substr(dec_point+1,comma2-comma-1).c_str()),11);
				}
				outfile<<sign+int_part+frac_part<<" ";
			}
			else{
				sign = '0';
				dec_point = word.find('.',0);
				if(string::npos == dec_point){
					int_part = zero.assign(4-word.length(),'0') + word; 
				}
				else{
					int_part = dec2binStr(atoi(word.substr(0,dec_point-1).c_str()),4);
					frac_part = dec2binStr(atoi(word.substr(dec_point+1,comma2-comma-1).c_str()),11);
					//这个算法有问题，应该采用网上的那种算法，乘以2的幂后转换。再把小数点移动回来，回头再改。
					//cout<<word<<"---"<<atoi(word.substr(dec_point+1,comma2-comma-1).c_str())<<endl;
				}
				outfile<<sign+int_part+frac_part<<" ";
			}	
			sign = "0";
			int_part = "0000";
			frac_part = "00000000000";
			++i;
			comma = comma2;
		}
		outfile<<endl;
		i = 0;
	}

	infile.close();
	outfile.close();
	cout<<"Over!"<<endl;
}

string dec2binStr(int decimal, int length){
	string dec;
	string result;
	string zero;
	dec = dec2bin(decimal);
	if(length <= dec.length()){
		result = dec.substr(0,length-1);
	}else{
		result = dec + zero.assign(length-dec.length(),'0');
	}
	return result;
}
string dec2bin(int number){
	if(number == 0) return "0";
	if(number == 1) return "1";
	
	if(number%2 == 0){
		return dec2bin(number/2) + "0";
	}else{
		return dec2bin(number/2) + "1";
	}
}