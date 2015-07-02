#include<iostream>
#include<cstdlib>
#include<cstring>
#include<string>
#include<fstream>
using namespace std;

int main(){
	int i=0;
	size_t comma = 0,comma2=0;
	const int cnt=784;
	string line;
	ifstream infile;
	ofstream outfile;
	infile.open("data.txt");
	outfile.open("data1.txt");
	
	if(!infile.is_open()||!outfile.is_open()){
		cout<<"File open failed."<<endl;
		exit(0);
	}

	while(!infile.eof()){
		getline(infile,line);
		comma = line.find(',',0);
		outfile<< atof(line.substr(0,comma).c_str())<<" ";
		while(comma<line.size() && i != cnt-1){
			comma2=line.find(',',comma+1);
			outfile<<atof(line.substr(comma+1,comma2-comma-1).c_str())<<" ";
			++i;
			comma = comma2;
		}
		outfile<<endl;
		i = 0;
	}

	infile.close();
	outfile.close();
	cout<<"Over!!!!!"<<endl;
}
	
