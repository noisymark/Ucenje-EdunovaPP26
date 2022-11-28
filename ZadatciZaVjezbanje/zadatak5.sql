# /Applications/XAMPP/xamppfiles/bin/./mysql -uroot < "/Users/marko/Documents/EdunovaPP26/Ucenje-EdunovaPP26/ZadatciZaVjezbanje/zadatak5.sql"

drop database if exists taxisluzba;
create database taxisluzba character set utf8;
use taxisluzba;

create table taxisluzba(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    sjediste varchar(100),
    brojvozila int,
    vozilo int
);

create table vozilo(
    sifra int not null primary key auto_increment,
    model varchar(50),
    maksimalnoputnika int,
    registracijskatablica varchar(50),
    vozac int
);

create table putnik(
    sifra int not null primary key auto_increment,
    relacija varchar(50),
    termin datetime,
    nacinplacanja varchar(50)
);

create table voznja(
    sifra int not null primary key auto_increment,
    trajanje decimal(18,2),
    cijena decimal(18.2),
    brojkilometararelacije int,
    putnik int,
    vozac int
);

create table vozac(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    radnovrijeme varchar(50)
);

alter table taxisluzba add foreign key (vozilo) references vozilo(sifra);
alter table vozilo add foreign key (vozac) references vozac(sifra);
alter table voznja add foreign key (putnik) references putnik(sifra);
alter table voznja add foreign key (vozac) references vozac(sifra);
