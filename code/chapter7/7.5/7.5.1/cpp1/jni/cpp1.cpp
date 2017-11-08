#include <stdio.h>

class aclass{
	private:
		int m;
		char c;
	public:
		aclass(int i, char ch) {
			printf("Constructor called.\n");
			this->m = i;
			this->c = ch;
		}
		~aclass() {//定义析构函数   
			printf("Destructor called.\n");
		}
		int getM() const {
			return m;
		}
		void setM(int m) {
			this->m = m;
		}
		char getC() const{
			return c;
		}
		void setC(char c) {
			this->c = c;
		}
		int add(int a, int b) {
			printf("%d\n", a+b);
		}
};

int main(int argc, char* argv[]){
	aclass *a = new aclass(3, 'c');
	a->setM(5);
	a->setC('a');
	a->add(2, 8);
	printf("%d\n", a->getM());
	delete a;
	return 0;
}
