#include<iostream>
#include<stdio.h>
#include<assert.h>
#include<fstream>

using namespace std;
// g++ -std=c++17 load.cpp -o load 
int main(int argc, char **argv)
{
	if(argc < 2){
		cout << "need an argument!\n";
		return 0;
	}

	string img_file(argv[1]);

	FILE * in = fopen(img_file.c_str(), "rb");
	assert(in);	

	FILE *output(fopen("/home/s081/Downloads/projects/cpu/img", "w"));
	assert(output);

	uint8_t buffer;
	while(1){
		if(fread(&buffer, sizeof(uint8_t), 1, in) <= 0) break;
		fprintf(output, "%02x\n", buffer);
	}

	fclose(output);
	fclose(in);
}
