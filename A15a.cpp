#include <iostream>
using namespace std;
int abs(int a){if (a<0) return -a;else return a;}
int min(int a, int b){if (a<b) return a; else b;}
int main()
{
  long long unsigned int a = 699;
  long long unsigned int b = 124;
  unsigned int divv = 2147483647;
  int count = 0;
  for (int i = 0; i<40000000; i++)
  {
    a *= 16807;
    a = a%divv;
    b *= 48271;
    b = b%divv;
    //cout<< a<< " "<< ((a << 48))<<"   "<<b<< " "<< ((b << 48))<<endl;
    if ((a << 48)==(b << 48)) count++;
  }
  cout<<count;
}
