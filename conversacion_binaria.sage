
n = 8
B = BraidGroup(n)
a = B([3,1,2])
b = B([-5,1])

def compact(w):
    h = B([1])/B([1])
    for i in w:
        h *= i
    return h

elem = list(map(lambda x: B([x+1]), range(n-1)))
elemCiph = list(map(lambda x: (b*x/b).left_normal_form(), elem))

h = ((compact(elemCiph[2]) * compact(elemCiph[0]) * compact(elemCiph[1])/a).inverse()).left_normal_form()
abab = (a*b/a/b).left_normal_form()

# Comprobacion
print(h == abab)
