#include <string>
#include <iostream>
#include <fstream>
using namespace std;

int main(int argc, char const *argv[])
{
	char ch;
  int a, b, first;
  int sum = 0;
  bool flag = true;
  fstream fin("01.txt", fstream::in);
  while (fin >> noskipws >> ch)
  {
    b = ch - '0';
    if (flag)
    {
      first = a = b;
      flag = false;
      continue;
    }
    if (a == b) sum += a;
    a = b;
  }
  if (b == first) sum += b;
  cout<<sum<<endl;

  	return 0;
}