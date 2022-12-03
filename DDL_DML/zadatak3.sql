# /Applications/XAMPP/xamppfiles/bin/./mysql -uroot --default_character_set=utf8 < "/Users/marko/Documents/EdunovaPP26/Ucenje-EdunovaPP26/DDL_DML/zadatak3.sql"

drop database if exists brat_prijatelj;
create database brat_prijatelj default charset utf8;
use brat_prijatelj;

create table brat(
    sifra int not null primary key auto_increment,
    jmbag char(11),
    ogrlica int not null,
    ekstrovertno boolean not null
);

create table prijatelj_brat(
    sifra int not null primary key auto_increment,
    prijatelj int,
    brat int
);

create table prijatelj(
    sifra int not null primary key auto_increment,
    kuna decimal(16,10),
    haljina varchar(37),
    lipa decimal(13,10),
    dukserica varchar(31),
    indifirentno boolean not null
);

create table ostavljena(
    sifra int not null primary key auto_increment,
    kuna decimal(17,5),
    lipa decimal(15,6),
    majica varchar(36),
    modelnaocala varchar(31) not null,
    prijatelj int
);

create table snasa(
    sifra int not null primary key auto_increment,
    introvertno boolean,
    kuna decimal(15,6) not null,
    eura decimal(12,9) not null,
    treciputa datetime,
    ostavljena int
);

create table punica(
    sifra int not null primary key auto_increment,
    asocijalno boolean,
    kratkamajica varchar(44),
    kuna decimal(13,8) not null,
    vesta varchar(32) not null,
    snasa int
);

create table svekar(
    sifra int not null primary key auto_increment,
    novcica decimal(16,8) not null,
    suknja varchar(44) not null,
    bojakose varchar(36),
    prstena int,
    narukvica int not null,
    cura int
);

create table cura(
    sifra int not null primary key auto_increment,
    dukserica varchar(49),
    maraka decimal(13,7),
    drugiputa datetime,
    majica varchar(49),
    novcica decimal(15,8),
    ogrlica int not null
);

alter table punica add foreign key (snasa) references snasa(sifra);
alter table snasa add foreign key (ostavljena) references ostavljena(sifra);
alter table ostavljena add foreign key (prijatelj) references prijatelj(sifra);
alter table prijatelj_brat add foreign key (prijatelj) references prijatelj(sifra);
alter table prijatelj_brat add foreign key (brat) references brat(sifra);

alter table svekar add foreign key (cura) references cura(sifra);

select * from snasa;

insert into snasa (sifra,introvertno,kuna,eura,treciputa,ostavljena)
values
(null,true,0,0,'2000-01-01',null),
(null,false,1,2,'2001-02-02',null),
(null,true,3,4,'2002-03-03',null);

select * from ostavljena;

insert into ostavljena (sifra,kuna,lipa,majica,modelnaocala,prijatelj)
values
(null,20,20,'nema','crni',null),
(null,30,10,'ima previše','beli',null),
(null,66,55,'ima','nema',null);

select * from prijatelj_brat;

insert into prijatelj_brat (sifra,prijatelj,brat)
values
(null,null,null),
(null,null,null),
(null,null,null);

select * from svekar;

update svekar set suknja='Osijek' where sifra>0;

delete from punica where kratkamajica='AB';

select majica from ostavljena where lipa not in (9,10,20,30,35); 

select f.ekstrovertno, a.vesta, b.kuna 
from punica a
inner join snasa b on a.snasa = b.sifra
inner join ostavljena c on b.ostavljena = c.sifra 
inner join prijatelj d on c.prijatelj = d.sifra 
inner join prijatelj_brat e on e.prijatelj = d.sifra 
inner join brat f on e.brat = f.sifra
where c.lipa != 91 and d.haljina like '%ba%'
order by b.kuna asc;

select a.haljina, a.lipa 
from prijatelj a
inner join prijatelj_brat b
where b.prijatelj is null;


# RIJESENO U 00:28:03