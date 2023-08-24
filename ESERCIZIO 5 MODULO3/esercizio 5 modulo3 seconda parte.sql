create database esercizio_5_m3_parte2;

use esercizio_5_m3_parte2

create table Studente (
matricola_studente varchar (255),
nome_studente varchar (255),
città varchar (255),
primary key (matricola_studente)
);

create table Corso (
codice_corso varchar (255),
nome_corso varchar (255),
matricola_docente varchar (255),
primary key (codice_corso),
constraint fk_matricola_docente_Corso_Docente foreign key (matricola_docente) references Docente(matricola_docente) on update cascade on delete no action
);

create table Docente (
matricola_docente varchar (255),
nome_docente varchar (255),
primary key (matricola_docente,nome_docente)
);

create table Esame (
codice_esame varchar (255),
matricola_studente varchar (255),
data_esame date not null,
voto_esame float,
settore_scientifico varchar (255),
primary key (codice_esame,matricola_studente),
constraint fk_matricola_studente_Esame_Studente foreign key (matricola_studente) references Studente(matricola_studente) on update cascade on delete no action,
constraint fk_esame_corso_Esame foreign key (codice_esame) references Corso(codice_corso) on update cascade on delete no action
);

use esercizio_5_m3_parte2

select Esame.matricola_studente,Studente.nome_studente,Studente.città_studente,Docente.nome_docente,Esame.codice_esame,Esame.data_esame
from Esame
inner join Corso ON Esame.codice_esame=Corso.codice_corso
inner join Docente ON Corso.matricola_docente=Docente.matricola_docente
inner join Studente ON Studente.matricola_studente=Esame.matricola_studente
where Esame.voto>28;

select Docente.nome_docente,Esame.settore_scentifico,Corso.nome_corso
from Docente
inner join Corso ON Corso.matricola_docente=Docente.matricola_docente
inner join Esame ON Esame.codice_esame=Corso.codice_corso;


