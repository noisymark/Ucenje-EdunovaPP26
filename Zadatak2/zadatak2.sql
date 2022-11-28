# /Applications/XAMPP/bin/./mysql -uroot < /Users/marko/Documents/EdunovaPP26/Ucenje-EdunovaPP26/zadatak2.sql

drop database if exists zadatak2;
create database zadatak2 default charset utf8;
use zadatak2;

create table opcina(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    zupanija int
);

create table zupanija(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    zupan int
);

create table mjesto(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    opcina int
);

create table zupan(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50)
);

alter table mjesto add foreign key (opcina) references opcina(sifra);
alter table opcina add foreign key (zupanija) references zupanija(sifra);
alter table zupanija add foreign key (zupan) references zupan(sifra);