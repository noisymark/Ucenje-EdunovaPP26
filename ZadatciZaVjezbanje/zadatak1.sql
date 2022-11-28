# /Applications/XAMPP/xamppfiles/bin/./mysql -uroot < "/Users/marko/Documents/EdunovaPP26/Ucenje-EdunovaPP26/ZadatciZaVjezbanje/zadatak1.sql"

drop database if exists zastitazivotinja;
create database zastitazivotinja character set utf8;
use zastitazivotinja;

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    dob int(2),
    sticenik int
);

create table sticenik (
    sifra int not null primary key auto_increment,
    vrsta varchar(50),
    dob int(2),
    brojchipa varchar(50),
    prostor int
);

create table prostor (
    sifra int not null primary key auto_increment,
    duzina decimal(18,2),
    sirina decimal(18,2)
);

alter table osoba add foreign key (sticenik) references sticenik(sifra);

alter table sticenik add foreign key (prostor) references prostor(sifra);