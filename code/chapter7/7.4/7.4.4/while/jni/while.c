#include <stdio.h>

int dowhile(int n){
	int i = 1;
	int s = 0;
	do{
		s += i;
	}while(i++ < n);
	return s;
}

int whiledo(int n){
	int i = 1;
	int s = 0;
	while(i <= n){
		s += i++;
	}
	return s;
}

int main(int argc, char* argv[]){
	printf("dowhile:%d\n", dowhile(100));
	printf("while:%d\n", whiledo(100));
	return 0;
}
