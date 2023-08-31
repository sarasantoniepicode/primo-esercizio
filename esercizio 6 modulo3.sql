create database esercizio_D6_M3;


create table Studente (
matricola_studente varchar (255),
nome_studente varchar (255),
città_studente varchar (255),
primary key (matricola_studente)
);

create table Docente (
matricola_docente varchar (255),
nome_docente varchar (255),
primary key (matricola_docente,nome_docente)
);
create table Corso (
codice_corso varchar (255),
nome_corso varchar (255),
matricola_docente varchar (255),
primary key (codice_corso),
constraint fk_matricola_docente_Corso_Docente foreign key (matricola_docente) references Docente(matricola_docente) on update cascade on delete no action
);

create table Esame (
codice_corso varchar (255),
matricola_studente varchar (255),
data_esame date,
voto_esame dec (2),
settore_scientifico varchar (255),
primary key (codice_corso,matricola_studente),
constraint fk_matricola_studente_Studente_Esame foreign key (matricola_studente) references Studente(matricola_studente) on update cascade on delete no action,
constraint fk_codice_corso_Esame_Corso foreign key (codice_corso) references Corso(codice_corso) on update cascade on delete no action
);

select max(voto_esame), min(voto_esame), avg(voto_esame),Studente.matricola_studente,Studente.nome_studente
from Esame
inner join Studente ON Esame.matricola_studente=Studente.matricola_studente
group by Studente.matricola_studente,Studente.nome_studente;

select max(voto_esame) AS voto_max, min(voto_esame), avg(voto_esame),Studente.matricola_studente,Studente.nome_studente
from Esame
inner join Studente ON Esame.matricola_studente=Studente.matricola_studente
group by Studente.matricola_studente,Studente.nome_studente
having avg(Esame.voto_esame)>25 AND COUNT(DISTINCT(Esame.data_esame))>=10
order by voto_max ASC;
