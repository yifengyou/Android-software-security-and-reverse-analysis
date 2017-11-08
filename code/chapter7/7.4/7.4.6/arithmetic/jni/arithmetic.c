#include <stdio.h>

inline int MAX(int a, int b){ //内联函数，求最大数
	return (a > b) ? a : b;
}

inline int MIN(int a, int b){ //内联函数，求最小数
	return (a < b) ? a : b;
}

double add(int n){	//耗时算法
	int i;
	int m;
	int x = 10000;
	int y = 20000;
	m = MAX(n, x);
	m = MIN(n, y);
	double s = 0.0;
	for (i = 0; i < m * m / 2; i += 21 - 4 * 5){
		s += i * 0.0011;
	}
	for (i = 0; i < m * m / 4; i += 100 - 9 * 11){
		s += i / 12;
	}
	return s;
}

int main(int argc, char* argv[]){
	printf("value is:%lf\n", add(15000));
	return 0;
}



