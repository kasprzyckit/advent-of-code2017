#include <iostream>
#include <vector>
#include <fstream>
#include <string>
#include <stdlib.h>
using namespace std;
main()
{
	vector < int > numbs;
	string line;
 	ifstream myfile ("05.txt");
  	if (myfile.is_open())
  	{
    	while ( getline (myfile,line) )
    	{
      		numbs.push_back(atoi(line.c_str()));
    	}
    	myfile.close();
  	}
  	else cout << "Unable to open file";
  	
  	int i = 0;
  	int tmp;
  	int count = 0;
  	while (i >= 0 and i < numbs.size())
  	{
  		count++;
  		tmp = i;
  		i += numbs[i];
  		if (numbs[tmp] < 3) numbs[tmp]++;
      else numbs[tmp]--;
  	}
  	cout<<count<<endl;
	
}