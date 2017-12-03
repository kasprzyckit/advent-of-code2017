#include <stdio.h>
#include <stdlib.h>
#include <math.h>

struct pos {
    int x;
    int y;
};

int max (int a, int b) {if (a>b) return a; else return b;}
int abs (int a) {if (a < 0) return (-a); else return a;}

int posToInt(struct pos p)
{
    int b = max(abs(p.x), abs(p.y));
    int sm = (2*b - 1)*(2*b - 1);
    int lr = b*2;
    if (b == abs(p.y))
    {
        if (p.y > 0) return sm + (3*lr) + (p.x + b);
        else return sm + (lr) + (b - p.x);
    }
    else
    {
        if (p.x > 0) return sm + (b - p.y);
        else return sm + (2*lr) + (p.y + b);
    }
}
struct pos intToPos (int n)
{
    int b = (int) sqrt(n);
    if (b*b != n) b++;
    if (b%2 == 0) b++;
    int side = b/2;
    int diff = b*b - n;
    struct pos p;
    switch (diff/(b-1))
    {
        case 0: p.x = side - diff; p.y = side; break;
        case 1: p.x = -side; p.y = side - (diff-2*side); break;
        case 2: p.x = - side + (diff-4*side); p.y = -side; break;
        case 3: p.x = side; p.y = -side + (diff-6*side); break;
    }
    return p;
}
int u(int n){struct pos p = intToPos(n); p.y--;return posToInt(p);}
int l(int n){struct pos p = intToPos(n); p.x--;return posToInt(p);}
int d(int n){struct pos p = intToPos(n); p.y++;return posToInt(p);}
int r(int n){struct pos p = intToPos(n); p.x++;return posToInt(p);}
int ur(int n){struct pos p = intToPos(n); p.y--;p.x++;return posToInt(p);}
int ul(int n){struct pos p = intToPos(n); p.y--;p.x--;return posToInt(p);}
int dr(int n){struct pos p = intToPos(n); p.y++;p.x++;return posToInt(p);}
int dl(int n){struct pos p = intToPos(n); p.y++;p.x--;return posToInt(p);}

int main(void)
{
    int n, i, b, diff;
    int maxi = 10;
    scanf("%d", &n);
    maxi = 100;
    struct pos p;
    int dat[maxi];
    dat[0]=0;dat[1]=1;dat[2]=1;dat[3]=2;dat[4]=4;dat[5]=5;
    dat[6]=10;dat[7]=11;dat[8]=23;dat[9]=25;
    for (i = 10; i<=maxi; i++)
    {
        b = (int) sqrt(i);
        if (b*b != i) b++;
        if (b%2 == 0) b++;
        diff = b*b - i;
        if (diff%(b-1) == 0)
        {
            switch (diff/(b-1))
            {
                case 0: dat[i] = dat[u(i)] + dat[l(i)] + dat[ul(i)]; break;
                case 1: dat[i] = dat[u(i)] + dat[ur(i)]; break;
                case 2: dat[i] = dat[r(i)] + dat[dr(i)]; break;
                case 3: dat[i] = dat[d(i)] + dat[dl(i)]; break;
            }
        }
        else if (diff%(b-1) == 1)
        {
            switch (diff/(b-1))
            {
                case 0: dat[i] = dat[u(i)] + dat[l(i)] + dat[ur(i)] + dat[ul(i)]; break;
                case 1: dat[i] = dat[r(i)] + dat[ur(i)] + dat[u(i)]; break;
                case 2: dat[i] = dat[r(i)] + dat[dr(i)] + dat[d(i)]; break;
                case 3: dat[i] = dat[d(i)] + dat[dl(i)] + dat[l(i)]; break;
            }
        }
        else
        {
            switch (diff/(b-1))
            {
                case 0: dat[i] = dat[u(i)] + dat[l(i)] + dat[ur(i)] + dat[ul(i)]; break;
                case 1: dat[i] = dat[r(i)] + dat[ur(i)] + dat[u(i)] + dat[dr(i)]; break;
                case 2: dat[i] = dat[r(i)] + dat[dr(i)] + dat[d(i)] + dat[dl(i)]; break;
                case 3: dat[i] = dat[l(i)] + dat[ul(i)];
                    if (diff%(b-1) != b-2) dat[i] += dat[dl(i)] + dat[d(i)]; break;
            }
        }
        if (dat[i] > n)
        {
            printf("%d\n", dat[i]);
            break;
        }
    }
    return 0;
}