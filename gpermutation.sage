load("braid_permutation.sage")
n = #Parametro a determinar
B = BraidGroup(n)
def gpermutation(w,v):
    t = list(range(n))
    X = [False]*n
    pw,pv = list(map(lambda x: x-1 ,w.permutation())), list(map(lambda x: x-1 ,v.permutation()))
    for i in range(n-1,-1,-1):
        r,s = i,i
        while X[r] == False:
            X[r]=True
            r,s = pv[r],pw[s]
            if r!=s:
                t[r]=s
    X = [False]*(n)
    for i in range(n-1,-1,-1):
        if X[i] == False:
            X[i]=True
            r = i
            while X[t[r]] == False and t[r]!=r:
                r = t[r]
                X[r] = True
            t[r] = i
    return braidPermutation(list(map(lambda x: x+1, t)))
