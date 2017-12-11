#include <iostream>
#include <fstream>
#include <stdlib.h>
using namespace std;
int abs(int a){if (a<0) return -a;else return a;}
int min(int a, int b){if (a<b) return a; else b;}
int main()
{
  int tmp, x = 0, y = 0, mx = 0;
	char ch, tm;
  fstream fin("11.txt", fstream::in);
  while (fin >> noskipws >> ch)
  {
    tm = ch;
    if (ch == 's') y --; else y++;
    if (!(fin >> noskipws >> ch) || ch == ',') 
    {
      if (tm == 's') y --; else y++;
      if (abs(y) >= abs(x)) tmp = abs(abs(x)-abs(y))/2 + min(abs(x), abs(y));
      else tmp = abs(x);
      if (tmp > mx) mx = tmp;
      continue;
    }
    if (ch == 'w') x--; else x++;
    if (abs(y) >= abs(x)) tmp = abs(abs(x)-abs(y))/2 + min(abs(x), abs(y));
      else tmp = abs(x);
      if (tmp > mx) mx = tmp;
    if (fin >> noskipws >> ch) continue;
  }
  cout<<mx<<endl;
  return 0;	
}