#include <string>
#include <iostream>
#include <fstream>
#include <vector>
using namespace std;

struct node
{
  int depth;
  node* parent;
  vector < node* > children;
};

int main(int argc, char const *argv[])
{
  char ch;
  fstream fin("09.txt", fstream::in);
  node* root = new node;
  root->depth = 0;
  root->parent = NULL;
  node* nd = root;
  node* tmp;
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
      continue;
    }
    switch(ch)
    {
      case '<': br = true; break;
      case '{':
        tmp = new node;
        tmp->depth = nd->depth + 1;
        count += tmp->depth;
        tmp->parent = nd;
        nd->children.push_back(tmp);
        nd = tmp;
        break;
      case '}':
        if (nd->parent != NULL) nd = nd->parent;
        break;
      default: break;
    }
  }
    cout<<count<<endl;

  	return 0;
}