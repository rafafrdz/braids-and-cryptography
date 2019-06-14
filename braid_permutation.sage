from functools import *

def braidPermutation(p):
    B = BraidGroup(max(p))
    xs,n = list(map(lambda x: x-1, p)), len(p)
    trenza = []
    while xs != list(range(n)):
        k= max(list(filter(lambda i: xs[i]!= i, range(n))))
        fk , ys= xs[k], xs
        trenza += [[fk+1,k+1]]
        for i in range(n):
            if i < k and xs[i] < xs[k]:
                ys[i] = xs[i]
            elif i < k and xs[i] > xs[k]:
                ys[i] = xs[i] -1
            else:
                ys[i] = i
        xs = ys
    if trenza != []:
        braidPermutation = list(reduce((lambda a,b: a+b), list(map(lambda x: list(range(x[0],x[1])), trenza))))
        braid = B(braidPermutation)
        return braid
    else:
        return B([1])/B([1])
