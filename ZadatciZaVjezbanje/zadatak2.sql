# /Applications/XAMPP/xamppfiles/bin/./mysql -uroot < "/Users/marko/Documents/EdunovaPP26/Ucenje-EdunovaPP26/ZadatciZaVjezbanje/zadatak2.sql"

drop database if exists odgojnaskupina;
create database odgojnaskupina character set utf8;
use odgojnaskupina;

create table odgojnaskupina(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    maksimalnibrojdjece int,
    trajanje int
);

create table dijete(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    oib int,
    odgojnaskupina int
);

create table odgajateljica(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    oib int,
    dijete int
);

alter table dijete add foreign key (odgojnaskupina) references odgojnaskupina(sifra);
alter table odgajateljica add foreign key (dijete) references dijete(sifra);