# /Applications/XAMPP/xamppfiles/bin/./mysql -uroot --default_character_set=utf8 < "/Users/marko/Documents/EdunovaPP26/Ucenje-EdunovaPP26/DDL_DML/Novizadatci/zadatak1.sql"

drop database if exists muskarac_neprijateljica;
create database muskarac_neprijateljica;
use muskarac_neprijateljica;

create table muskarac(
    id int not null primary key auto_increment,
    maraka decimal 17,7 not null,
    hlace varchar(45) not null,
    prstena int,
    neprijateljica int
);

create table neprijateljica(
    id int not null primary key auto_increment,
    indiferentno boolean not null,
    modelnaocala varchar(39),
    maraka decimal(12,10),
    kratkamajica varchar(32),
    ogrlica int
);

create table sestra(
    id int not null primary key auto_increment,
    introvertno boolean not null,
    carape varchar(41),
    suknja varchar(40),
    narukvica int not null
);

create table punac(
    id int not null primary key auto_increment,
    modelnaocala varchar(39),
    treciputa datetime,
    drugiputa datetime,
    novcica decimal(14,6) not null,
    narukvica int
);

create table zarucnica(
    id int not null primary key auto_increment,
    stilfrizura varchar(40),
    prstena int not null,
    gustoca decimal(14,5),
    modelnaocala varchar(35) not null,
    nausnica int not null
);

# DBeaver ne zeli uopce spremati funkcije ni procedure pa sam prekinuo zadatak i javio se predavacu 
# :(