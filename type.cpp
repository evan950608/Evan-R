#include <iostream> 
#include <typeinfo>
#include <string>
using namespace std;



int main(){
	int n = 123;
	string s = "abc";
	if (typeid(n).name() == typeid(1).name())
	{
		cout << typeid(n).name() << endl;		
	} 
	else 
	{
		cout << "false";
	}

	//cout << typeid(s).name() << endl;
	
	return 0;
}

