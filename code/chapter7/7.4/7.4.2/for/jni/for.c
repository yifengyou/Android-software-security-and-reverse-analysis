#include <stdio.h>

int nums[5] = {1, 2, 3, 4, 5};

int for1(int n){	//普通for循环
	int i = 0;
	int s = 0;
	for (i = 0; i < n; i++){
		s += i * 2;
	}
	return s;
}

int for2(int n){	//访问全局数组
	int i = 0;
	int s = 0;
	for (i = 0; i < n; i++){
		s += i * i + nums[n-1];
	}
	return s;
}

int main(int argc, char* argv[]){
	printf("for1:%d\n", for1(5));
	printf("for2:%d\n", for2(5));
	return 0;
}
