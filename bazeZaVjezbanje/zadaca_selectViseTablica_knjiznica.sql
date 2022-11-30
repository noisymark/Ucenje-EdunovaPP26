# BAZA KNJIZNICA

select * from katalog;

select b.naslov as 'Naslov', CONCAT(a.ime,' ',a.prezime) as 'Autor' 
from autor a
inner join katalog b on a.sifra = b.autor
where a.ime = 'August' and a.prezime = 'Šenoa';

select b.naslov as 'Naslov', CONCAT(a.ime,' ',a.prezime) as 'Autor', c.naziv as 'Mjesto izdavanja'
from autor a
inner join katalog b on a.sifra = b.autor
inner join mjesto c on b.mjesto = c.sifra 
where a.ime = 'August' and a.prezime = 'Šenoa';

select b.naslov as 'Naslov', CONCAT(a.ime,' ',a.prezime) as 'Autor', c.naziv as 'Mjesto izdavanja',
d.naziv as 'Izdavač'
from autor a
inner join katalog b on a.sifra = b.autor
inner join mjesto c on b.mjesto = c.sifra 
inner join izdavac d on b.izdavac = d.sifra 
where a.ime = 'August' and a.prezime = 'Šenoa';


