create table Store (
IDstore int, 
indirizzofisico text not null,
numeroditelefono text not null,
primary key (IDstore)
);

create table Dipendente (
codicefiscale varchar(16),
nome text not null,
titolodistudio text not null,
recapito text not null,
ruolo text not null,
IDstore int not null,
datainizioimpiego date not null,
datafineimpiego date,
primary key (codicefiscale,datainizioimpiego),
foreign key (IDstore) references Store(IDstore) on update cascade on delete no action);

create table Settore (
IDstore int,
IDsettore int,
primary key(IDstore,IDsettore),
foreign key (IDstore) references Store(IDstore) on update cascade on delete no action);

create table Videogioco (
titolo varchar(100),
sviluppatore varchar(100),
annodiuscita year not null,
prezzo decimal(5,2) not null,
genere text not null,
remake boolean not null,
primary key (titolo,sviluppatore)
);

create table Sitrova (
IDstore int,
IDsettore int,
posizione text not null,
disponibilità boolean not null,
titolo varchar(100),
sviluppatore varchar(100) not null,
primary key (IDstore,IDsettore,settore,titolo,sviluppatore),
foreign key (IDstore) references Store(IDstore) on update cascade on delete no action,
foreign key (titolo,sviluppatore) references Videogioco(titolo,sviluppatore) on update cascade on delete no action
);

