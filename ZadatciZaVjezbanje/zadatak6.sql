# /Applications/XAMPP/xamppfiles/bin/./mysql -uroot < "/Users/marko/Documents/EdunovaPP26/Ucenje-EdunovaPP26/ZadatciZaVjezbanje/zadatak6.sql"

drop database if exists postolar;
create database postolar default charset utf8;
use postolar;

create table postolar(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    adresa varchar(100),
    komadodjece int
);

create table komadodjece(
    sifra int not null primary key auto_increment,
    boja varchar(50),
    materijal varchar(50),
    sirina decimal(18,2),
    duzina decimal(18,2),
    visina decimal(18,2),
    korisnik int,
    popravak int
);

create table korisnik(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    nacinplacanja varchar(50)
);

create table popravak(
    sifra int not null primary key,
    cijena decimal(18,2),
    trajanje int,
    termin datetime
);

alter table postolar add foreign key (komadodjece) references komadodjece (sifra);
alter table komadodjece add foreign key (korisnik) references korisnik (sifra);
alter table komadodjece add foreign key (popravak) references popravak (sifra);