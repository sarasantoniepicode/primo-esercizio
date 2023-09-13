a = input("Inserisci il primo numero: ")
b = input("Inserisci il secondo numero: ")

if a == b:
    print("I numeri sono identici")
elif a > b:
    print("Il numero più grande tra i due è " + str(a))
else:
    print("Il numero più grande tra i due è " + str(b))

a=input("inserisci il primo numero:")
b=input("inserisci il secondo numero:")
c=input("inserisci il terzo numero:")
if a >= b and a >= c:
    print(a)
elif b >= a and b >= c:
    print(b)
elif c >= a and c >= b:
    print(c)

lista_numeri=[3,21,7,19,45]
numero_maggiore=lista_numeri[0]
for numero in lista_numeri:
    if numero > numero_maggiore:
        numero_maggiore = numero
print("Il numero maggiore tra tutti è:", numero_maggiore)

