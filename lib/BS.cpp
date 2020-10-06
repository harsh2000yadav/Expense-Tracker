#pragma GCC optimize("Ofast")
#pragma GCC target("avx,avx2,fma")
#pragma GCC optimization("unroll-loops")
#include<bits/stdc++.h>
using namespace std;
const int M = 1e9+7;
#define ll long long
#define FAST ios_base::sync_with_stdio(0); cin.tie(0); cout.tie(0);
const ll s=1e5;
ll a[s],q[s];
ll LSR(ll f,ll n){
    ll l= -1;
    ll r = n;
    while(l+1<r){
        ll mi = (l+r)/2;
        if(a[mi]<=f) l = mi;
        else r = mi;
    }
    return l;
}
ll RSR(ll f,ll n){
    ll l= -1;
    ll r = n;
    while(l+1<r){
        ll mi = (l+r)/2;
        if(a[mi]>=f) r = mi;
        else l = mi;
    }
    return r;
}
int main()
{
ll n,k;
cin>>n;
for(int i=0;i<n;i++) cin>>a[i];
cin>>k;
sort(a,a+n);
vector<ll>p;
for(int i=0;i<k;i++) {
    ll a,b;
    cin>>a>>b;
    ll f1 = RSR(a,n);
    ll f2 = LSR(b,n);
   // cout<<f1<<" "<<f2<<endl;
    if(f1>f2) p.push_back(0);
    else{
        p.push_back(f2-f1+1);

    }
    }
    for(auto x : p) cout<<x<<" ";
}






