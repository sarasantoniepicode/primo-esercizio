import pandas as pd
covid=pd.read_csv("owid-covid-data.csv",sep=",")
print(covid)

#Verificare le dimensioni del dataset e le diciture presenti nell'intestazione
covid.shape
print(covid)
covid.columns
covid.describe()

#Per ogni continente trovare il numero di casi totali avvenuti in quello stesso continente; non consideraare locazioni che nel dataset non appartengono a nessun continente.
europa=covid.groupby(["continent"]=="Europe")
europa.get_group("total_cases")
europa.count()
print(europa)
