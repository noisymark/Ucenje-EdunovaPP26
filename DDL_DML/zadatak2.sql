# /Applications/XAMPP/xamppfiles/bin/./mysql -uroot --default_character_set=utf8 < "/Users/marko/Documents/EdunovaPP26/Ucenje-EdunovaPP26/DDL_DML/zadatak2.sql"

drop database if exists brat_neprijatelj;
create database brat_neprijatelj default charset utf8;
use brat_neprijatelj;

create table brat(
    sifra int not null primary key auto_increment,
    suknja varchar(47),
    ogrlica int not null,
    asocijalno boolean not null,
    neprijatelj int
);

create table neprijatelj(
    sifra int not null primary key auto_increment,
    majica varchar(32),
    haljina varchar(43) not null,
    lipa decimal(16,8),
    modelnaocala varchar(49) not null,
    kuna decimal(12,6) not null,
    jmbag char(11),
    cura int
);

create table cura(
    sifra int not null primary key auto_increment,
    haljina varchar(33) not null,
    drugiputa datetime not null,
    suknja varchar(33),
    narukvica int,
    introvertno boolean,
    majica varchar(40) not null,
    decko int
);

create table decko(
    sifra int not null primary key auto_increment,
    indifirentno boolean,
    vesta varchar(34),
    asocijalno boolean not null
);

create table decko_zarucnica(
    sifra int not null primary key auto_increment,
    decko int,
    zarucnica int
);

create table zarucnica(
    sifra int not null primary key auto_increment,
    narukvica int,
    bojakose varchar(37) not null,
    novcica decimal(15,9),
    lipa decimal(15,8) not null,
    indifirentno boolean not null
);

create table prijatelj(
    sifra int not null primary key auto_increment,
    modelnaocala varchar(37),
    treciputa datetime not null,
    ekstrovertno boolean not null,
    prviputa datetime,
    svekar int
);

create table svekar(
    sifra int not null primary key auto_increment,
    stilfrizura varchar(48),
    ogrlica int not null,
    asocijalno boolean not null
);

alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);
alter table neprijatelj add foreign key (cura) references cura(sifra);
alter table cura add foreign key (decko) references decko(sifra);
alter table decko_zarucnica add foreign key (decko) references decko(sifra);
alter table decko_zarucnica add foreign key (zarucnica) references zarucnica(sifra);
alter table prijatelj add foreign key (svekar) references svekar(sifra);

select * from neprijatelj;

insert into neprijatelj (sifra,majica,haljina,lipa,modelnaocala,kuna,jmbag,cura)
values
(null,'siva','dugacka','22','HH','22','12321232123',null),
(null,'crna','kratka','33','FF','33','12321232123',null),
(null,'bijela','suknja','44','MM','44','12321232123',null);

select * from cura;

insert into cura(sifra,haljina,suknja,narukvica,introvertno,majica,decko,drugiputa)
values
(null,'nema','nema','123123',false,'crna',null,'2022-01-01'),
(null,'ima','ne zna se','123123',false,'crvena',null,'2021-02-02'),
(null,'ne zna se','ima','123123',false,'ne nosi majice',null,'2020-03-03');

select * from decko_zarucnica;

insert into decko_zarucnica (sifra,decko,zarucnica)
values
(null,null,null),
(null,null,null),
(null,null,null);

select * from prijatelj;

update prijatelj set treciputa='2020-04-30' where sifra > 0;

delete from brat where ogrlica < 14 and ogrlica > 14;

select suknja from cura where drugiputa is null;

select a.vesta, a.asocijalno
from decko a
left join decko_zarucnica b on a.sifra = b.zarucnica 
where b.zarucnica is null;

select f.novcica, a.neprijatelj, b.haljina
from brat a
inner join neprijatelj b on a.neprijatelj = b.sifra
inner join cura c on b.cura = c.sifra
inner join decko d on c.decko = d.sifra
inner join decko_zarucnica e on d.sifra = e.decko
inner join zarucnica f on e.zarucnica = f.sifra
where c.drugiputa is not null and d.vesta like '%ba%'
order by b.haljina asc;

# RIJESENO U 00:36:12