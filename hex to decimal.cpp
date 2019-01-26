#include <iostream>
#include <string>
#include <sstream>
using namespace std;

int main(){
	int decimal_value = 100;
	
	std::stringstream ss;
	ss << std::hex << decimal_value; // int decimal_value
	std::string res ( ss.str() );
	std::cout << res << endl;
	
		
	return 0;
}

