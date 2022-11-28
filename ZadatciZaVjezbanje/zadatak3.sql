# /Applications/XAMPP/xamppfiles/bin/./mysql -uroot < "/Users/marko/Documents/EdunovaPP26/Ucenje-EdunovaPP26/ZadatciZaVjezbanje/zadatak3.sql"

drop database if exists muzej;
create database muzej character set utf8;
use muzej;

create table izlozba(
    sifra int not null primary key auto_increment,
    maksimalnibrojdjela int,
    pocetak datetime,
    trajanje decimal(18.2),
    kustos int,
    sponzor int,
    djelo int
);

create table djelo(
    sifra int not null primary key auto_increment,
    kreator varchar(50),
    naziv varchar(50),
    cijena decimal(18.2)
);

create table kustos(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    dob int(2)
);

create table sponzor(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    iban varchar(50),
    webstranica varchar(50)
);


alter table izlozba add foreign key (djelo) references djelo (sifra);
alter table izlozba add foreign key (sponzor) references sponzor (sifra);
alter table izlozba add foreign key (kustos) references kustos (sifra);

