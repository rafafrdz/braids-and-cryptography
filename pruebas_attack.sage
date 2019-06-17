from random import *
from time import *
load("conjugacy_problem_attack.sage")
n = 5
B = BraidGroup(n)
def simulate(numGeneradores=5):
    V = B(list(map(lambda x: randint(1, n-1), range(randint(1, numGeneradores)))))
    x = B(list(map(lambda x: randint(1, n-1), range(randint(1, numGeneradores)))))
    W = compact((x*V/x).left_normal_form())
    ls = attack(W,V)
    return x, ls
def benchmark(numSimulate = 20, p=5):
    t0 = time()
    k = 0
    for i in range(numSimulate):
        a = simulate()[1]
        if a!= None:
            k+=1
    t1 = time()
    print("El experimento ha finalizado con {} resultados exitosos\nEn un tiempo de {} segundos\nRatio de exito: {}% \nTiempo medio por ataque: {} segundos".format(k,t1-t0,100*float(k/numSimulate),float((t1-t0)/numSimulate)))


def simulate_multiple(numGeneradores=5,numvi=10):
    V = list(map(lambda x: B(list(map(lambda x: randint(1, n-1), range(randint(1, numGeneradores))))), range(numvi)))
    x = B(list(map(lambda x: randint(1, n-1), range(randint(1, numGeneradores)))))
    W = [compact((x*vi/x).left_normal_form()) for vi in V]
    ls = list(filter(lambda x: x is not None, map(lambda i: attack(W[i],V[i]), range(len(W)))))
    return x, ls
def benchmark_multiple(numSimulate = 20, p = 5):
    t0 = time()
    k = 0
    for i in range(numSimulate):
        a = simulate_multiple(p)[1]
        if a!= []:
            k+=1
    t1 = time()
    print("El experimento ha finalizado con {} resultados exitosos\nEn un tiempo de {} segundos\nRatio de exito: {}% \nTiempo medio por ataque: {} segundos".format(k,t1-t0,100*float(k/numSimulate),float((t1-t0)/numSimulate)))
