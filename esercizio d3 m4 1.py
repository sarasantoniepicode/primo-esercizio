nome_scuola="epicode"
x=0
while x<len(nome_scuola):
    print(nome_scuola[x])
    x +=1   

numero=0
frase_2= []
while numero<21:
    frase_2.append(str(numero))
    numero+=1
print(" - ".join(frase_2))

fr_3=" "
pt_3=0
while pt_3 <11:
    fr_3=(fr_3 + str(2**pt_3) + " -")
    pt_3 +=1
print(fr_3[0:-2])


pt_4_N=int(input("inserire di seguito leN potenze di 2 che si desiderano calcolare:"))
fr_4=str(" ")
pt_4= int(0)
while pt_4<=pt_4_N:
    fr_4=(fr_4 +str(2**pt_4)+ " -")
    pt_4+=1
print("la lista delle" + str(pt_4_N)+ "potenza di 2 è:\n" + fr_4[0:-2])


studenti = ["Alex", "Bob", "Cindy", "Dan", "Emma", "Faith", "Grace", "Henry"]
corsi = ["Cybersecurity", "Data Analyst", "Backend", "Frontend", "Data Analyst", "Backend", "Frontend"]
if len(studenti)==len(corsi):
    print("le due liste hanno la stessa lunghezza")
else:
    print("le liste hanno lunghezza differente")

studenti_2 = ["Alex", "Bob", "Cindy", "Dan", "Emma", "Faith", "Grace", "Henry"]
corsi_2 = ["Cybersecurity", "Data Analyst", "Backend", "Frontend", "Data Analyst", "Backend"]
corsi_2.append("Frontend")
corsi_2.append("Cybersecurity")
if len(studenti_2)== len(corsi_2):
   print("le liste hanno la stessa lunghezza.\n Ecco la lista corsi:\n" + str(corsi_2))


fr_6=input(str("inserire la stringa da elaborare:"))
while len(fr_6)<6:
    print("la lunghezza della stringa è inferiore a 6: inseriscine una con 6 o più caratteri")
    fr_6=input(str("inserire la stringa da elaborare: "))
fr_6=(fr_6[0:3]+ "..." + fr_6[-3:])
print("il risultato dell'elaborazione è:\n" + fr_6)


n_7=int(input("inserire il numero di cui calcolare i fattori:"))
lista_fattori=[]
fattore=2
while n_7 !=1:
    if n_7%fattore==0:
       n_7 /=fattore
       lista_fattori.append(str(fattore))
    else: fattore +=1
print("la lista dei fattori è: \n" + str(lista_fattori))
