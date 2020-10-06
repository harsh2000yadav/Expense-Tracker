#pragma GCC optimize("Ofast")
#pragma GCC target("avx,avx2,fma")
#pragma GCC optimization("unroll-loops")
#include<bits/stdc++.h>
using namespace std;
const int M = 1e9+7;
#define ll long long
#define FAST ios_base::sync_with_stdio(0); cin.tie(0); cout.tie(0);
int main()
{
   ll n;
   cin>>n;
   string s;
   cin>>s;
   char p =' ';
   ll cnt = 0;
   for(auto x: s){
    if(x==p) cnt++;
    else p = x;
   }
   cout<<cnt<<endl;
}




