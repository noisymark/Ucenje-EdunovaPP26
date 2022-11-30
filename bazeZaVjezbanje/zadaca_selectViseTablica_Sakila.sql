select * from actor;

select c.title as 'Title', CONCAT(a.first_name,' ',a.last_name) as 'Actor' 
from actor a
inner join film_actor b on a.actor_id = b.actor_id 
inner join film c on b.film_id = c.film_id 
where a.first_name = 'Burt' and a.last_name = 'Posey';

select CONCAT(f.first_name,' ',f.last_name) as 'Rented by', c.title as 'Movie', CONCAT(a.first_name,' ',a.last_name) as "Actor" 
from actor a
inner join film_actor b on a.actor_id = b.actor_id 
inner join film c on b.film_id = c.film_id 
inner join inventory d on c.film_id = d.film_id 
inner join rental e on d.inventory_id = e.inventory_id 
inner join customer f on e.customer_id = f.customer_id 
where a.first_name = 'Burt' and a.last_name = 'Posey';