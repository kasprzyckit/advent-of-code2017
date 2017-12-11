#include <iostream>
#include <fstream>
#include <stdlib.h>
using namespace std;
int abs(int a){if (a<0) return -a;else return a;}
int min(int a, int b){if (a<b) return a; else b;}
int main()
{
  int x = 0, y = 0;
	char ch, tm;
  fstream fin("11.txt", fstream::in);
  while (fin >> noskipws >> ch)
  {
    tm = ch;
    if (ch == 's') y --; else y++;
    if (!(fin >> noskipws >> ch) || ch == ',') 
    {
      if (tm == 's') y --; else y++;
      continue;
    }
    if (ch == 'w') x--; else x++;
    if (fin >> noskipws >> ch) continue;
  }
  if (abs(y) >= abs(x)) cout<<abs(abs(x)-abs(y))/2 + min(abs(x), abs(y))<<endl;
  else cout<< abs(x);
  return 0;	
}