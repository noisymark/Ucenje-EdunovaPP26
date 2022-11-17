# /Applications/XAMPP/bin/./mysql -uroot < /Users/marko/Documents/EdunovaPP26/Ucenje-EdunovaPP26/zadatak3.sql

drop database if exists zadatak3;
create database zadatak3;
use zadatak3;

create table projekt(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    cijena int
);

create table sudjeluje(
    projekt int,
    programer int,
    datumpocetka datetime,
    datumkraja datetime
);

create table programer(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    datumrodenja datetime,
    placa decimal(18,2)
);

alter table sudjeluje add foreign key (projekt) references projekt(sifra);
alter table sudjeluje add foreign key (programer) references programer(sifra);