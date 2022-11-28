# /Applications/XAMPP/xamppfiles/bin/./mysql -uroot < "/Users/marko/Documents/EdunovaPP26/Ucenje-EdunovaPP26/ZadatciZaVjezbanje/zadatak7.sql"

drop database if exists urar;
create database urar default charset utf8;
use urar;

create table urar(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    adresa varchar(100),
    brojtelefona varchar(50),
    korisnik int
);

create table korisnik(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    nacinplacanja varchar(50),
    sat int
);

create table sat(
    sifra int not null primary key auto_increment,
    model varchar(50),
    vrijednost decimal(18,2),
    proizvodac varchar(50),
    popravak int
);

create table popravak(
    sifra int not null primary key auto_increment,
    termin datetime,
    cijena decimal(18,2),
    trajanje decimal(18,2)
);

alter table urar add foreign key (korisnik) references korisnik(sifra);
alter table korisnik add foreign key (sat) references sat(sifra);
alter table sat add foreign key (popravak) references popravak(sifra);