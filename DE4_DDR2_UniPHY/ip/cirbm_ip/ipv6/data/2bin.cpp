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
	const size_t row_length = 1024;
	string line;
	string word;
	string zero;//0s add to then end of a row to complete a row length
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
			
			if(word=="0"){
				outfile<<"0,";
			}
			else{
				outfile<<"1,";
			}	
			++i;
			comma = comma2;
		}
		if(i<row_length){
			for(int j=i+1;j<row_length;j++){
				outfile<<"0,";}
			outfile<<"0";
		}
		outfile<<endl;
		i = 0;
	}

	infile.close();
	outfile.close();
	cout<<"Over!"<<endl;
}

