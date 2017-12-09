#include <string>
#include <iostream>
#include <fstream>
#include <vector>
using namespace std;

int main(int argc, char const *argv[])
{
  char ch;
  fstream fin("09.txt", fstream::in);
  bool ex = false, br = false;
  int count = 0;
  while (fin >> noskipws >> ch)
  {
    if (ex)
    {
      ex = false;
      continue;
    }
    if (ch == '!')
    {
      ex = true;
      continue;
    }
    if (br)
    {
      if (ch == '>') br = false;
      else count++;
      continue;
    }
    if (ch == '<') br = true;
  }
    cout<<count<<endl;

  	return 0;
}