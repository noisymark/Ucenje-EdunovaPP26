# /Applications/XAMPP/xamppfiles/bin/./mysql -uroot < "/Users/marko/Documents/EdunovaPP26/Ucenje-EdunovaPP26/ZadatciZaVjezbanje/zadatak8.sql"

drop database if exists doktorskaordinacija;
create database doktorskaordinacija;
use doktorskaordinacija;

create table doktor(
    sifra int not null primary key auto_increment,
    iskustvo varchar(50),
    ime varchar(50),
    prezime varchar(50),
    pacijent int
);

create table pacijent(
    sifra int not null primary key auto_increment,
    osiguranik boolean,
    ime varchar(50),
    prezime varchar(50),
    lijecenje int
);

create table lijecenje(
    sifra int not null primary key auto_increment,
    vrstalijecenja varchar(50),
    trajanje decimal(18,2),
    posebnolijecenje boolean
);

alter table doktor add foreign key (pacijent) references pacijent(sifra);
alter table pacijent add foreign key (lijecenje) references lijecenje(sifra);