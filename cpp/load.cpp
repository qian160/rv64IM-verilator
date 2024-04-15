#include <iostream>
#include <stdio.h>
#include <assert.h>
#include <fstream>

using namespace std;
void load(char *img_file) {
	FILE * in = fopen(img_file, "rb");
    if (!in) {
        cout << "failed to open " << img_file << "!\n";
        exit(1);
    }

    const char *output_name = "/home/s081/Downloads/projects/cpu/img";
	FILE *output(fopen(output_name, "w"));
    if (!output) {
        cout << "failed to open " << output_name << "!\n";
        exit(1);
    }

	uint8_t buffer;
	while(1){
		if(fread(&buffer, sizeof(uint8_t), 1, in) <= 0) break;
		fprintf(output, "%02x\n", buffer);
	}

	fclose(output);
	fclose(in);
}