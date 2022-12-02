# /Applications/XAMPP/bin/./mysql -uroot --default_character_set=utf8 < "/Users/marko/Documents/EdunovaPP26/Ucenje-EdunovaPP26/zadatak1.sql"

drop database if exists zadatak1;
create database zadatak1 default charset utf8;
use zadatak1;

create table opcina(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    zupanija int
);

create table zupanija(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    zupan varchar(50)
);

alter table opcina add foreign key (zupanija) references zupanija(sifra);