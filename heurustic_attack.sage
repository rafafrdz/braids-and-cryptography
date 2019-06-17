from functools import *
load("gpermutation.sage")
n = #Parametro a determinar
B = BraidGroup(n)

def tau(w): #Función tau
    return B.delta()*w*B.delta().inverse()

## Dado que Sage devuelve la left_normal_form()
## en una tupla, esta funcion hace que
## la compacte en una unica expresion como trenza
def compact(w):
    h = B([1])/B([1])
    for i in w:
        h *= i
    return h

# Algoritmo de ataque heurísicto
def heuristicAttack(w,v):
    alpha, delta = B([1])/B([1]), B.delta().inverse()
    v, w = v.left_normal_form(), w.left_normal_form()
    rv = -list(filter(lambda x: v[0]==delta**x, range(n)))[0]
    rw = -list(filter(lambda x: w[0]==delta**x, range(n)))[0]
    while rw < rv:
        gamma = tau(w[1].inverse())
        for i in range(rw-1):
            gamma = tau(gamma)
        gamma = B.delta()* gamma
        alpha = gamma * alpha
        w = (gamma * compact(w) / gamma).left_normal_form()
        rw = -list(filter(lambda x: w[0]==delta**x, range(n)))[0]
    supw, supv = len(w[1:]) + rw, len(v[1:]) + rv
    while supw > supv:
        gamma = w[-1]
        alpha = gamma * alpha
        w = (gamma * compact(w) / gamma).left_normal_form()
        rw = -list(filter(lambda x: w[0]==delta**x, range(n)))[0]
        supw = len(w[1:]) + rw
    mu = gpermutation(compact(w),compact(v))
    alpha = mu * alpha
    w = (mu * compact(w) / mu).left_normal_form()
    if v == w:
        return alpha
    else:
        return "Fracaso"
