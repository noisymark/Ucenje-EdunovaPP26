# /Applications/XAMPP/xamppfiles/bin/./mysql -uroot --default_character_set=utf8 < "/Users/marko/Documents/EdunovaPP26/Ucenje-EdunovaPP26/DDL_DML/zadatak1.sql"

drop database if exists mladic_cura;
create database mladic_cura default charset utf8;
use mladic_cura;

create table mladic(
    sifra int not null primary key auto_increment,
    suknja varchar(50) not null,
    kuna decimal(16,8) not null,
    drugiputa datetime,
    asocijalno boolean,
    ekstrovertno boolean not null,
    dukserica varchar(48) not null,
    muskarac int
);

create table muskarac(
    sifra int not null primary key auto_increment,
    bojaociju varchar(50) not null,
    hlace varchar(50),
    modelnaocala varchar (43),
    maraka decimal(14,5) not null,
    zena int
);

create table zena(
    sifra int not null primary key auto_increment,
    treciputa datetime,
    hlace varchar(46),
    kratkamajica varchar(31) not null,
    jmbag char(11) not null,
    bojaociju varchar(39) not null,
    haljina varchar(44),
    sestra int
);

create table sestra(
    sifra int not null primary key auto_increment,
    introvertno boolean,
    haljina varchar(31) not null,
    maraka decimal(16,6),
    hlace varchar(46) not null,
    narukvica int
);

create table sestra_svekar(
    sifra int not null primary key auto_increment,
    sestra int,
    svekar int
);

create table svekar(
    sifra int not null primary key auto_increment,
    bojaociju varchar(40) not null,
    prstena int,
    dukserica varchar(41),
    lipa decimal(13,8),
    eura decimal(12,7),
    majica varchar(35)
);

create table punac(
    sifra int not null primary key auto_increment,
    ogrlica int,
    gustoca decimal(14,9),
    hlace varchar(41) not null
);

create table cura(
    sifra int not null primary key auto_increment,
    novcica decimal(16,5) not null,
    gustoca decimal(18,6) not null,
    lipa decimal(13,10),
    ogrlica int not null,
    bojakose varchar(38),
    suknja varchar(36),
    punac int
);

alter table cura add foreign key (punac) references punac(sifra);
alter table mladic add foreign key (muskarac) references muskarac(sifra);
alter table muskarac add foreign key (zena) references zena(sifra);
alter table zena add foreign key (sestra) references sestra(sifra);
alter table sestra_svekar add foreign key (sestra) references sestra(sifra);
alter table sestra_svekar add foreign key (svekar) references svekar(sifra);

select * from muskarac;

insert into muskarac(sifra,bojaociju,hlace,modelnaocala,maraka,zena)
values
(null,'plava','znj','HBBH',23423,null),
(null,'smeda','crne','BBZZ',123123,null),
(null,'zelena','tamnoplave','BBBBB',1234124,null);

select * from zena;

insert into zena(sifra,treciputa,hlace,kratkamajica,jmbag,bojaociju,haljina,sestra)
values
(null,'2022-11-11','uske','XL','02934802349','smeda','siva',null),
(null,'2021-12-12','siroke','L','839274920','zelena','crna',null),
(null,'2020-03-13','fit','S','2934879234','plava','trulavisnja',null);

select * from sestra_svekar;

insert into sestra_svekar(sifra,sestra,svekar)
values
(null,null,null),
(null,null,null),
(null,null,null);

select * from cura;

insert into cura(sifra,novcica,gustoca,lipa,ogrlica,bojakose,suknja,punac)
values
(null,238974,15.78,123,222,'smeda','uska',null),
(null,324234,15.78,333,111,'plava','uska',null),
(null,324234,15.78,222,444,'sargopirgasta','uska',null);

select * from mladic;

delete from mladic where kuna > 15.78;

select kratkamajica from zena where hlace like '%ana%';

select f.dukserica, a.asocijalno, b.hlace 
from mladic a
inner join muskarac b on a.muskarac = b.sifra 
inner join zena c on b.zena = c.sifra 
inner join sestra d on c.sestra = d.sifra 
inner join sestra_svekar e on d.sifra = e.sestra 
inner join svekar f on e.svekar = f.sifra
where c.hlace like 'a%' and d.haljina like '%ba%'
order by b.hlace asc;

select a.haljina, a.maraka
from sestra a
left join sestra_svekar b on a.sifra = b.sestra
where b.sestra is null;


