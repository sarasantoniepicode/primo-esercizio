create database esercizio_d7_m3;

use esercizio_d7_m3;

/*
Dipendente(id,nome,cognome,email,numerotelefono,data_assunzione,id_lavoro,salario,id_manager,id_dipartimento)
Dipartimento(id_dipartimento,nome_dipartimento,id_manager,id_location)
*/

select date_format(Dipendente.data_assunzione, '%M %d %y') as data_assunzione, Dipendente.id
from Dipendente
inner join Dipartimento ON Dipendente.id=Dipartimento.id_manager
where Dipartimento.nome_dipendente='Amministrazione';

select Dipendnete.nome,Dipendente.cognome
from Dipendente
where month(data_assunzione)=6;

select year(Dipendente.data_assunzione)
from Dipendente
group by year(Dipendente.data_assunzione)
having count(*)>10;

select Dipartimento.nome_dipartimento,concat(Dipendente.nome,' ',Dipendente.cognome),Dipendente.salario
from Dipartimento,Dipendente
where Dipartimento.id_manager=Dipendente.id 
AND datediff(now(),Dipendente.data_assunzione)>1825;

