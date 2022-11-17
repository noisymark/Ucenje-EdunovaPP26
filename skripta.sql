# LJESTVE (HASH) JE KOMENTAR I ON SE NE IZVODI
# KOMANDA KOJA SE LIJEPI U SHELL (MACOS) JE U LINIJI ISPOD
# sudo ./Applications/XAMPP/xamppfiles/bin/mysql -uroot < /Users/marko/Documents/edunovapp26/skripta.sql

drop database if exists edunovapp26;
# BRISE STARU BAZU PODATAKA AKO VEC POSTOJI DA BI MOGLI NAPRAVITI NOVU VERZIJU
create database edunovapp26;
# KREIRA NOVU BAZU PODATAKA "EDUNOVAPP26"
use edunovapp26;
# KORISTIMO NOVU BAZU PODATAKA DA BI U NJU POHRANILI NOVE ENTITETE I VRSTE PODATAKA

create table smjer(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    cijena decimal(18,2),
    upisnina decimal(18,2),
    certificiran boolean,
    trajanje int,
    predavac int
);
# KREIRA TABLICU UNUTAR BAZE 
# "INT NOT NULL PRIMARY KEY AUTO_INCREMENT" OZNACAVA DA CE BAZA ZA SVAKOG NOVOG KORISNIKA GENERIRATI POSEBAN KLJUC
# "VARCHAR(50)" OZNACAVA VARIJABILNI UNOS ZNAKOVA, KORISTI SE U 99% SLUCAJEVA, AKO IMAMO OGROMAN UNOS, ONDA SE KORISTI "TEXT"
# "DECIMAL(18,2)" OZNACAVA DECIMALNI BROJ KOJI MOZE IMATI 18 ZNAMENAKA TE 2 BROJA NAKON ZAREZA
# "INT (INTEGER)" PO ZADANOM SPREMA DO 11 ZNAMENAKA
# SVI VANJSKI KLJUCEVI SE OZNACAVAJU SA "INT"
# "BOOLEAN" oznacava vrijednost True/False

create table grupa(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    maksimalnopolaznika int,
    datumpocetka datetime,
    smjer int,
    predavac int
);
# U "DATETIME" SE MOZE POHRANITI TOCAN DATUM I TOCNO VRIJEME

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    email varchar(50),
    oib char(11)
);

create table polaznik(
    sifra int not null primary key auto_increment,
    brojugovora varchar(20),
    osoba int
);

create table predavac(
    sifra int not null primary key auto_increment,
    iban varchar(50),
    osoba int
);

create table clan(
    grupa int,
    polaznik int
);

alter table grupa add foreign key (smjer) references smjer(sifra);
alter table grupa add foreign key (predavac) references predavac(sifra);

alter table clan add foreign key (grupa) references grupa(sifra);
alter table clan add foreign key (polaznik) references polaznik(sifra);

alter table polaznik add foreign key (osoba) references osoba(sifra);

alter table predavac add foreign key (osoba) references osoba(sifra);

# ALTER TABLE [IME ENTITETA OD KOJEG POLAZI VANJSKI KLJUČ] ADD FOREIGN KEY [IME ENTITETA NA KOJEM ZAVRŠAVA VANJSKI KLJUČ]
# REFERENCES [IME ATRIBUTA KOJE DIJELI ENTITET] (IME ATRIBUTA KOJI SE PRENOSI U PRETHODNI ATRIBUT)