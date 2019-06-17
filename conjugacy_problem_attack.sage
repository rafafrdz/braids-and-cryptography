from functools import *

######################################################
## Algoritmo:
## Ataque contra el problema de la conjugación
## ===========================================
## Autor: Rafael Fernandez Ortiz
## Fecha: 16/Junio/2019
######################################################

## Dado que Sage devuelve la left_normal_form()
## en una tupla, esta funcion hace que
## la compacte en una unica expresion como trenza
def compact(w):
    h = B([1])/B([1])
    for i in w:
        h *= i
    return h
######################################################
## Parametros iniciales
## ====================
# n = # A determinar
# B = BraidGroup(n)
# v = # Trenza a determinar
# x = # Trena a determinar
# w = compact((x*v/x).left_normal_form())
######################################################

## Dada una permutacion, te devuelve su trenza asociada
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

def tau(c1,c2):
    t = [None]*n
    c1, c2 = [x-1 for x in c1], [x-1 for x in c2]
    for i in range(len(c1)):
        t[c1[i]] = c2[i]+1
    return t

## Algoritmo para estimar las posibles trenzas conjugadoras
def guessBraid(w,v):
    t = [None]*n
    pv = v.permutation().cycle_tuples()
    pw = w.permutation().cycle_tuples()
    xs = []
    for i in pv:
        xs += [(i,map(lambda a: tau(i,a),filter(lambda x: len(i)==len(x), pw)))]

    ## Metodo para estimar todas las permutaciones posibles
    def guessPermutation(ciclos=xs):
        m = max([len(x[0]) for x in ciclos])

        def permJoin(ls, ds):  # aiuda
            ks = ls[:]
            for i in range(len(ks)):
                if ks[i] is None:
                    ks[i] = ds[i]
            return (ks)

        def shuffle(m, desc=ciclos):  # operasao
            ind = [x[0] for x in (filter(lambda x: len(x[0]) == m, desc))]
            ps = [x[1] for x in (filter(lambda x: len(x[0]) == m, desc))]
            t, b = [], len(ind)
            for i in range(b):
                d = [None] * n
                for x in ps:
                    d = permJoin(d, x[i])
                    i = (i + 1) % b
                t += [d]
            return t

        partesPerm = list(filter(lambda x: x != [], [shuffle(k) for k in range(m, 0, -1)]))
        permutaciones = partesPerm[0]
        for t in partesPerm[1:]:
            permutaciones = [permJoin(x, y) for x in permutaciones for y in t]
        return permutaciones

    return guessPermutation()

## Realiza el ataque devolviendote la trenza conjugadora en caso exito
## Devuelve None en caso de fracaso
def attack(a,b):
    trenzasPosibles = [braidPermutation(x) for x in guessBraid(a,b)]
    for x in trenzasPosibles:
        if a.left_normal_form()==(x*b/x).left_normal_form():
            return x
