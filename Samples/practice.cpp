#include <iostream>
#include <stdio.h>
class A {
    public:
	A(){std::cout << "xdd" << std::endl;
}
	~A(){}
	virtual void afficher(){
		std::cout << "A" << std::endl;
	}
};
class B : public A {
    public:
	B(){}
	~B(){}
	virtual void afficher(){
		std::cout << "B" << std::endl;
	}
};
class AA {
    public:
	AA(){}
	~AA(){}
	virtual void afficher(){
		std::cout << "A" << std::endl;
	}
};

class BB : public AA {
    public:
	BB(){}
	~BB(){}


	virtual void afficher(){
		std::cout << "B" << std::endl;
	}
};

int main() {
	A* temp = new B();
	AA* temp2 = new BB();
	temp->afficher();
	temp2->afficher();

	// answer: B \n B
}
