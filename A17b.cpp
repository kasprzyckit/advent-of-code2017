#include <iostream>
using namespace std;

int main(int argc, char const *argv[])
{
	int ln, off;
	cin>>ln>>off;
	int val = -1, ind = 0;
	for (int i = 1; i <= ln; i++)
	{
		ind = (ind + off)%i;
		if (ind++ == 0) val = i;
	}
	cout<<val<<endl;
}