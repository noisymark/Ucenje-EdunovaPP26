# /Applications/XAMPP/bin/./mysql -uroot < /Users/marko/Documents/EdunovaPP26/Ucenje-EdunovaPP26/zadatak4.sql

drop database if exists zadatak4;
create database zadatak4 default charset utf8;
use zadatak4;

create table zaposlenik(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    placa varchar(50),
    nadredeni int

);

alter table zaposlenik add foreign key (nadredeni) references zaposlenik(sifra);