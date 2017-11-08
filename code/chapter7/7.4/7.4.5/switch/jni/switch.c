#include <stdio.h>

int switch1(int a, int b, int i){
	switch (i){
	case 1:
		return a + b;
		break;
	case 2:
		return a - b;
		break;
	case 3:
		return a * b;
		break;
	case 4:
		return a / b;
		break;
	default:
		return a + b;
		break;
	}
}

int main(int argc, char* argv[]){
	printf("switch1:%d\n", switch1(3, 5, 3));
	return 0;
}
