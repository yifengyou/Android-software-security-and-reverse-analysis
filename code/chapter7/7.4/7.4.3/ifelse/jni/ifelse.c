#include <stdio.h>

void if1(int n){	//if elseÓï¾ä
	if(n < 10){
		printf("the number less than 10\n");
	} else {
		printf("the number greater than or equal to 10\n");
	}
}

void if2(int n){		//¶àÖØif elseÓï¾ä
	if(n < 16){
		printf("he is a boy\n");
	} else if(n < 30){
		printf("he is a young man\n");
	} else if(n < 45){
		printf("he is a strong man\n");
	} else{
		printf("he is an old man\n");
	}
}

int main(int argc, char* argv[]){
	if1(5);
	if2(35);
	return 0;
}
