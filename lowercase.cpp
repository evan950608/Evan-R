#include <iostream>
#include <string>
#include <algorithm>
using namespace std;

int main(){
	string data = "Abc"; 
	cout << data << endl;
	
	transform(data.begin(), data.end(), data.begin(), ::toupper);
	cout << data << endl;

	transform(data.begin(), data.end(), data.begin(), ::tolower);
	cout << data << endl;
	
	return 0;
}
