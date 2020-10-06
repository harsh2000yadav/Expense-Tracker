#include<bits/stdc++.h>
using namespace std;
const int M = 1e9+7;
#define ll long long
int main()
{
    ll n;
    cin>>n;
    char s[100][100];
    for(int i=0; i<n; i++)
    {
        for(int j=0; j<n; j++)
        {
            cin>>s[i][j];
        }
    }


    int a[100]= {0};
    int c[100] = {0};
    for(int i=0; i<n; i++)
    {
        int cnt=0;
        for(int j=0; j<n; j++)
        {
            if(s[i][j]=='C')
            {
                cnt++;
            }
        }
        a[i] = n-cnt;
    }
    for(int i=0; i<n; i++)
    {
        int cnt = 0;
        for(int j=0; j<n; j++)
        {
            if(s[j][i]=='C')
            {
                cnt++;
            }
        }
        c[i]=n-cnt;
    }
    int ans = 0,mr=0,mc=0;
    for(int i=0; i<n; i++)
    {
        int x =a[i];
        int j = i,lc=0,rc=0,la=0;
        for(int h=j;h>=max(0,j-x);h--){
             if(h==j-x) break;
            if(a[h]>=x) rc++;
        }
        for(int k=j; k<j+x; k++)
        {
            if(a[k]<x)
            {
                break;
            }
            else lc++;
        }
        la = max(rc,lc);
        mr = max(mr,la);
    }
    for(int i=0; i<n; i++)
    {
        int x =c[i];
        int j = i,lc=0,rc=0,la=0;
        for(int h=j;h>=max(0,j-x);h--){
            if(h==j-x) break;
            if(c[h]>=x) rc++;
        }
        for(int k=j; k<j+x; k++)
        {
            if(c[k]<x)
            {
                break;
            }
            else lc++;
        }
        la = max(rc,lc);
        mc = max(mc,la);
    }

    cout<<max(mc,mr)<<endl;

}
