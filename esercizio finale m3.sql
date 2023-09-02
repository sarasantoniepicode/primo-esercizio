create database esercizio_finale_m3;

use esercizio_finale_m3;

create table Editore (
codice_editore char(10) not null,
denominazione char(50) not null,
indirizzo_editore varchar(255) not null,
città_editore char(30) not null,
telefono_editore char(30),
agente char(100) not null,
sito_web varchar(255),
mail_editore char(30),
primary key(codice_editore)
);


create table Libro (
numero_inventario char(10) not null,
titolo char(50) not null,
lingua char(20) not null,
anno_pubblicazione char(4) not null,
anno_stampa char(4) not null,
codice_editore1 char(10),
primary key(numero_inventario),
foreign key(codice_editore1) references Editore(codice_editore) on update cascade on delete no action
);

create table ParolaChiave (
codice_parola char(10) not null,
descrizione char(50) not null,
primary key(codice_parola)
);

create table Contiene (
numero_inventario1 char(10) not null,
codice_parola1 char(10) not null,
primary key(numero_inventario1,codice_parola1),
foreign key(numero_inventario1) references Libro(numero_inventario) on update cascade on delete no action,
foreign key(codice_parola1) references ParolaChiave(codice_parola) on update cascade on delete no action
);

create table Autore (
codice_autore char(10) not null,
cognome_autore char(50) not null,
nome_autore char (50) not null,
data_nascita date not null,
indirizzo_autore varchar(255) not null,
cap_autore char(5) not null,
città_autore char(30) not null,
nazione char(30),
primary key(codice_autore)
);

create table Scrive (
codice_autore2 char(10) not null,
numero_inventario2 char(10) not null,
primary key(codice_autore2,numero_inventario2),
foreign key(codice_autore2) references Autore(codice_autore) on update cascade on delete no action,
foreign key(numero_inventario2) references Libro(numero_inventario) on update cascade on delete no action
);

create table Socio (
codice_socio char(10) not null,
cognome_socio char(50) not null,
nome_socio char(50) not null,
data_nascita_socio date not null,
indirizzo_socio varchar(255) not null,
cap_socio char(50) not null,
città_socio char(30) not null,
telefono_socio char(30),
mail_socio char(30),
primary key(codice_socio)
);

create table Prestito (
codice_socio3 char(10) not null,
numero_inventario3 char(10) not null,
durata_prestito char(2) not null,
primary key(codice_socio3,numero_inventario3),
foreign key(codice_socio3) references Socio(codice_socio) on update cascade on delete no action,
foreign key(numero_inventario3) references Libro(numero_inventario) on update cascade on delete no action
);

insert into Editore
values(01,'Ponte alle Grazie','Via della Scala','Firenze',055312456,'Rossi','wwww.ponteallegrazie.it','ponteallegrazie@gmail.com'),
      (02,'Mondadori','Corso Sempione','Milano',027899100,'Verdi','www.mondadori.it','mondadori@gmail.com'),
      (03,'Feltrinelli','Via Vittorio Emanuele','Torino',0115643789,'BIANCHI','wwww.feltinelli.com','feltrinelli@gmail.com');

insert into Libro
 values (10,'MOMO','italiano',1995,1996,01),
        (20,'Il nome della rosa','italiano',1988,1989,02),
        (30,'Blackwater','inglese',2007,2009,03);
 
 insert into ParolaChiave
 values ('gl','fantasia'),
        ('mp','storico'),
        ('pf','thriller');
 
 insert into Contiene
  values (10,'lg'),
         (20,'pm'),
         (30,'fp');
 
 insert into Autore
 values (90,'Ende','Michael',1969-12-23,'Wagnwer Strasse',34567,'Berlino','Germania'),
        (80,'Eco','Umberto',1938-04-25,'Via della Liberazione',56079,'Torino','Italia'),
        (70,'Elliot','Thomas',1950-01-30,'Fifth Evenue',90110,'New York','Stati Uniti');
 
 insert into Scrive
 values (09,01),
        (08,02),
        (07,03);
 
 insert into Socio
 values (111,'Valignani','Serena',1970-05-06,'Via Roma',52021,'Bucine',3456756123,'serena.valignani@gmail.com'),
        (112,'Rossi','Fabio',1985-11-17,'Corso Italia',52025,'Montevarchi',3338965478,'fabiorossi@gmail.com'),
        (113,'Gusella','Erika',1972-09-25,'Via della Resistenza',52027,'San Giovanni Valdarno',3306789456,'gusella.erika@gmail.com');

 insert into Prestito
 values (111,01,09),
        (112,02,07),
        (113,03,14);
        
-- Query 1 Visualizzare la data di nascita di Eco nel formato mese, giorno,anno e il suo codice autore--

select date_format(Autore.data_nascita, '%M %d %y') as data_nascita, codice_autore
from Autore
inner join Scrive ON Autore.codice_autore=Scrive.codice_autore2
where Autore.codice_autore='Eco';

-- Query 2 Gli autori il cui cognome inizia per E --

select Autore.cognome_autore
from Autore
where Autore.cognome_autore LIKE "D%";

-- Query 3 Visualizzare i libri attualmente in prestito ad un socio --

select titolo
from Socio,Prestito,Libro
where Socio.codice_socio=Prestito.codice_socio3 and Prestito.numero_inventario3=Libro.numero_inventario and cognome_socio='Valignani' and nome_socio='Valeria';

-- Query 4 Visualizzare i libri scritti da un autore e presenti in biblioteca --

select titolo
from Autore,Scrive,Libro
where Autore.codice_autore=Scrive.codice_autore2 and Scrive.numero_inventario2=Libro.numero_inventario and cognome_autore='Eco' and nome_autore='Umberto'
group by titolo;

-- Query 5 Cercare i libri che contengono una specifca parola chiave --

select titolo
from Libro,Contiene,ParolaChiave
where Libro.numero_inventario=Contiene.numero_inventario1 and Contiene.codice_parola1=ParolaChiave.codice_parola and Descrizione='fantasia';

-- Query 6 Determinare il numero di libri presenti in biblioteca per ogni autore --

select cognome_autore,nome_autore,count(*) as numero_libri
from Autore,Scrive
where Autore.codice_autore=Scrive.codice_autore2
group by cognome_autore,nome_autore
order by cognome_autore;

-- Query 7 In relazione al titolo di un libro, indicare il numero di copie presenti in biblioteca --

select titolo,count(*) as numero_copie
from Libro
where titolo='Il nome della rosa'
group by titolo;

-- Query 8 Quanti libri sono attualmente in prestito --

select count(*) as numero_prestiti
from Prestito
where durata_prestito is not null;

-- Query 9 Elenco dei libri di cui esistono più copie in biblioteca --

select titolo,count(*) as numero_copie
from Libro
group by titolo
having count(*)>2
order by numero_copie desc;

-- Query 10 Visualizzare per ogni socio il codice, l'indirizzo, la data di nascita ed il numero di libri in prestito --

select codice_socio,indirizzo_socio,data-nascita_socio,count(*) as numero_prestiti
from Socio
inner join Prestiti ON Socio.codice_socio=Prestiti.codoce_socio3
group by codice_socio,indirizzo_socio,data_nascita_socio;