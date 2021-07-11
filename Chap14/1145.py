L = [* map(int, input().split())]


def gcd(a , b):
    if not a*b: return a+ b
    if a>b: return gcd(a%b , b)
    return gcd(a,b%a)
mn = 1e9
for i in range(5):
    for j in range(i+1,5):
        for k in range(j+1,5):
            tmp = gcd(L[i],L[j])
            lcm = (L[i]//tmp)*L[j]
            tmp = gcd(lcm , L[k])
            lcm = (lcm//tmp) * L[k]
            mn = min(mn , lcm)
print(mn)

#5 7 15