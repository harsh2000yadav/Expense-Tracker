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
    FAST;
    ll t;
    cin>>t;
    while(t--)
    {
        ll n;
        cin>>n;
        string s;
        cin>>s;
        unordered_map<int,int>m;
        m[0]++;
        ll p[n] = {0}; p[0] = s[0]-'0';
        for(int i=1;i<n;i++){
            p[i] = p[i-1] + (s[i]-'0');
        }
        for(int i=0;i<n;i++){
            m[p[i]-(i+1)]++;
        }
        ll ans=0;
        for(auto x : m){
            ans+=(x.second*(x.second-1))/2;
        }
        cout<<ans<<"\n";
    }

}



