# LJESTVE (HASH) JE KOMENTAR I ON SE NE IZVODI
# KOMANDA KOJA SE LIJEPI U SHELL (MACOS) JE U LINIJI ISPOD
# /Applications/XAMPP/xamppfiles/bin/./mysql -uroot < "/Users/marko/Documents/EdunovaPP26/Ucenje-EdunovaPP26/skripta.sql"

drop database if exists edunovapp26;
# BRISE STARU BAZU PODATAKA AKO VEC POSTOJI DA BI MOGLI NAPRAVITI NOVU VERZIJU
create database edunovapp26 character set utf8;
# KREIRA NOVU BAZU PODATAKA "EDUNOVAPP26"
use edunovapp26;
# KORISTIMO NOVU BAZU PODATAKA DA BI U NJU POHRANILI NOVE ENTITETE I VRSTE PODATAKA

create table smjer(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    cijena decimal(18,2),
    upisnina decimal(18,2),
    certificiran boolean not null,
    trajanje int not null
);
# KREIRA TABLICU UNUTAR BAZE 
# "INT NOT NULL PRIMARY KEY AUTO_INCREMENT" OZNACAVA DA CE BAZA ZA SVAKI NOVI UNOS GENERIRATI POSEBNU SIFRU
# "VARCHAR(50)" OZNACAVA VARIJABILNI UNOS ZNAKOVA, KORISTI SE U 99% SLUCAJEVA, AKO IMAMO OGROMAN UNOS, ONDA SE KORISTI "TEXT"
# "DECIMAL(18,2)" OZNACAVA DECIMALNI BROJ KOJI MOZE IMATI 18 ZNAMENAKA TE 2 BROJA NAKON ZAREZA
# "INT (INTEGER)" PO ZADANOM SPREMA DO 11 ZNAMENAKA
# SVI VANJSKI KLJUCEVI SE OZNACAVAJU SA "INT"
# "BOOLEAN" oznacava vrijednost True/False

create table grupa(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    maksimalnopolaznika int not null,
    datumpocetka datetime,
    smjer int,
    predavac int
);
# U "DATETIME" SE MOZE POHRANITI TOCAN DATUM I TOCNO VRIJEME

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    email varchar(50) not null,
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

# 1 -  vrijednost sifre u tablici smjer
insert into smjer (sifra,naziv,certificiran,trajanje,cijena,upisnina)
values(null,'PHP Programiranje',false,130,6999.99,500);

# 2 -  vrijednost sifre u tablici smjer
insert into smjer (sifra,naziv,certificiran,trajanje,cijena,upisnina)
values(null,'Java Programiranje',true,150,9999.99,500);

insert into grupa (sifra,naziv,maksimalnopolaznika,datumpocetka,smjer)
values
(null,'PP26',20,'2022-11-07 19:00:00',1),
(null,'JP27',20,'2022-11-07 17:00:00',2);

# UNOS VRIJEDNOSTI U TABLICE
# insert into [IME TABLICE] (ATRIBUTI U KOJE CEMO UNOSITI)
# values (VRIJEDNOSTI ZA ATRIBUTE U KOJE SMO REKLI DA UNOSIMO ODVOJENI ZAREZOM)

# MOGUC JE UNOS VISE PODATAKA OD JEDNOM PREKO PRIMJERA IZNAD (SAMO SE NAKON ZAVRSETKA ZAGRADE STAVI ZAREZ I PONOVE PODATCI)
# VANJSKI KLJUCEVI SE MORAJU DEFINIRATI SIFRAMA OD PRIPADAJUCIH ENTITETA 


# 1 - 20
insert into osoba (sifra,ime,prezime,email)
values
(null,'Adam','Vicković','vickovic2203@gmail.com'),
(null,'Boris','Bukovec','botaosijek@gmail.com'),
(null,'Darija','Dumančić','darija.zdarilek@gmail.com'),
(null,'Darijan','Petrač','darijan.petrac@gmail.com'),
(null,'Domagoj','Čuli','domo.culi@gmail.com'),
(null,'Filip','Janješić','filip.janjesic@gmail.com'),
(null,'Iris','Matokić','irismatokic@gmail.com'),
(null,'Ivan','Sambol','ivan.sambol@skole.hr'),
(null,'Kristijan','Lovrić','klovric991@gmail.com'),
(null,'Lobel','Špehar','lobel.spehar.os@gmail.com'),
(null,'Luka','Agić','agic.luke@gmail.com'),
(null,'Marko','Mikulić','marko_mikulic08@hotmail.com'),
(null,'Marko','Pavlović','markopavlovic316@gmail.com'),
(null,'Nemanja','Đurić','nemanja.duric92@gmail.com'),
(null,'Stjepan','Abramović','stjepanabramovic1@gmail.com'),
(null,'Sven','Ostojić','sven.ostojic@outlook.com'),
(null,'Tonko','Vorgić','tonko85@gmail.com'),
(null,'Jakov','Beg','jakovbeg@gmail.com'),
(null,'Tomislav','Ružičić','truzicic@gmail.com'),
(null,'Tomislav','Jakopec','tjakopec@gmail.com'),

# 1 - 19
insert into polaznik (sifra,osoba)
values
(null,1), (null,2), (null,3), (null,4), (null,5), (null,6), (null,7), (null,8), (null,9), (null,10), (null,11), (null,12),
(null,13), (null,14), (null,15), (null,16), (null,17), (null,18), (null,19); 

# 1
insert into predavac (sifra,osoba)
values (null,20);

# 1 - 19
insert into clan(grupa,polaznik)
values
(1,1), (1,2), (1,3), (1,4), (1,5), (1,6), (1,7), (1,8), (1,9), (1,10), (1,11), (1,12), (1,13), (1,14), (1,15), (1,16), (1,17), (1,18), (1,19);


