from random import *
from functools import *
from time import *

orden = 5  # fijamos el orden de Bn, por defecto
def CrypSysAAFG(n = orden, numGeneradores = 5, r = 3):
    B = BraidGroup(n)
    def Alicia():
        ga = list(map(lambda x: list(map(lambda x: randint(1, n-1), range(randint(5, 10)))), range(r)))
        xt = list(map(lambda x: choice(ga), range(numGeneradores)))
        a = B(list(reduce((lambda a,b: a+b),xt)))
        indxa = [ i for x in xt for i in range(len(ga))  if ga[i]==x]
        return ga, xt, a, indxa
    def Bob():
        gb = list(map(lambda x: list(map(lambda x: randint(1, n-1), range(randint(5, 10)))), range(r)))
        yk = list(map(lambda x: choice(gb), range(numGeneradores)))
        b = B(list(reduce((lambda a,b: a+b),yk)))
        indxb = [ i for y in yk for i in range(len(gb))  if gb[i]==y]
        return gb, yk, b, indxb

    ga, xt, a, indxa = Alicia()
    gb, yk, b, indxb = Bob()

    # Bob le envia a Alicia
    clavePublica = list(map(lambda x: (b*B(x)*b.inverse()).left_normal_form(), ga))

    def generaClaveCompartida(k=None):
        bab = list(reduce((lambda a,b: a+b), map(lambda i : clavePublica[i], indxa)))
        tmp = B([1])*B([1]).inverse()
        for i in bab:
            tmp*=i
        bab = tmp
        ## Alicia genera la clave compartida
        ababAlicia = (bab*a.inverse()).inverse()
        abab = a * b * a.inverse() * b.inverse()
        ## Check de clave compartida
        if ababAlicia.left_normal_form() == abab.left_normal_form():
            k = abab
        return k

    claveCompartida = generaClaveCompartida()
    return claveCompartida

def benchmark(m=orden, r = 3, k = 5):
    t0 = time()
    CrypSysAAFG(m,k,r)
    t1=time()
    return(t1-t0)
