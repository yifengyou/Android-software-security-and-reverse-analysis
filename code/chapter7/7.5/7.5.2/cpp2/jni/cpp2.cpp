#include <iostream>
using namespace std;

class aclass{
	private:
		int m;
		char c;
	public:
		aclass(int i, char ch) {
			cout<<"Constructor called."<<endl;
			this->m = i;
			this->c = ch;
		}
		~aclass() {//定义析构函数   
			cout<<"Destructor called."<<endl;
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
			cout<<a+b;
		}
};

int main(int argc, char* argv[]){
	aclass *a = new aclass(3, 'c');
	a->setM(5);
	a->setC('a');
	a->add(2, 8);
	//printf("%d\n", a->getM());
	cout<<a->getM()<<endl;
	delete a;
	return 0;
}
