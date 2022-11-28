# /Applications/XAMPP/xamppfiles/bin/./mysql -uroot < "/Users/marko/Documents/EdunovaPP26/Ucenje-EdunovaPP26/ZadatciZaVjezbanje/zadatak4.sql"

drop database if exists samostan;
create database samostan default charset utf8;
use samostan;

create table svecenik (
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    datumrodenja datetime,
    nadredeni int
);

create table nadredeni (
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    datumrodenja datetime
);

create table posao (
    sifra int not null primary key auto_increment,
    vrstaposla varchar(50),
    trajanje decimal(18,2),
    pocetak datetime,
    svecenik int
);

alter table svecenik add foreign key (nadredeni) references nadredeni(sifra);
alter table posao add foreign key (svecenik) references svecenik(sifra);