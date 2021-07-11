#include <stdio.h>
#include <stdlib.h>
int gcd(int a , int b)
{
    if(a * b ==0) return a + b;
    if(a > b) return gcd(a%b , b);
    else return gcd(a , b%a); 
}
int main()
{
    int *x = (int *) malloc(5 * sizeof(int));
    for(int i=0; i<5;++i)
        scanf("%d" , &x[i]);
    printf("%d" , x[0]);
    int mn = 1000000 + 1;
    for(int i = 0 ; i < 5 ; ++i)
    {  
        for(int j = i + 1 ; j < 5 ; ++j)
        {
            for(int k = j + 1 ; k < 5 ; ++k)
            {
                int a = x[i];
                int b = x[j];
                int c = x[k];
                int tmp , lcm;
                tmp = gcd(a,b);
                lcm = (a/tmp) * b;
                tmp = gcd(lcm , c);
                lcm = (lcm/tmp) * c;
                if(lcm < mn)
                {
                    mn = lcm;
                }

            }
        }
    }
    printf("%d" , mn);
}