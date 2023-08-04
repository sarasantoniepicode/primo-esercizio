create database esercizio_4_M4;

use esercizio_4_M4;

create table aeroporto (
città varchar(255),
nazione varchar(255),
numeropiste tinyint unsigned,
primary key (citta)
);

create table aereo (
tipoaereo varchar(255),
numeropasseggeri smallint unsigned,
quantitàmerci int unsigned,
primary key (tipoaereo)
);

create table volo (
idvolo char(5),
giornosett enum("lunedì","martedì","mercoledì","giovedì","venerdì","sabato","domenica"),
cittàpartenza varchar(255),
orapartenza time,
cittàarrivo varchar(255),
oraarrivo time,
tipoaereo varchar(255),
primary key (idvolo),
constraint FKaereovolo foreign key (tipoaereo) references aereo (tipoaereo) on update cascade on delete no action,
constraint FKcittàpartenzaaereoportovolo foreign key (cittàpartenza) references aereoporto (città) on update cascade on delete no action,
constraint FKcittàarrivoaeroportovolo foreign key (cittàarrivo) references aeroporto
);

