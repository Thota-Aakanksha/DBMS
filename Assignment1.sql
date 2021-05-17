
# Query 1;
select f.film_id, f.title, f.description,  f.rating, c.name
from film f 
join film_category fc on f.film_id = fc.film_id
join category c on fc.category_id = c.category_id
where f.rating='PG-13'
and c.name='Comedy';


#Query 2 
select f.film_id, f.title, count(r.rental_id) NoOfRentals , c.name
from film f 
join film_category fc on f.film_id = fc.film_id 
join category c on fc.category_id = c.category_id
join inventory i on f.film_id = i.film_id
join rental r on i.inventory_id = r.inventory_id
where c.name='Horror'
group by f.film_id
order by count(r.rental_id) desc limit 3;


#Query 3
select distinct c.name, c.address, f.category, c.country 
from customer_list c 
join rental r on c.Id = r.customer_id
join inventory i on r.inventory_id = i.inventory_id
join film_list f on i.film_id = f.fid
where c.country='India' and f.category='Sports';


#Query 4
select distinct c.Id, c.name, c.address, c.country,  a.first_name, a.last_name 
from customer_list c 
join rental r on r.customer_id = c.Id  
join inventory i on i.inventory_id=r.inventory_id
join film_list f on f.fid=i.film_id
join film_actor fa on fa.film_id = f.fid
join actor a on a.actor_id = fa.actor_id
where c.country='Canada' 
and a.first_name='NICK'
and a.last_name='WAHLBERG';


#Query 5
select count(f.film_id)
from film f
join film_actor fa on f.film_id = fa.film_id
join actor a on fa.actor_id = a.actor_id
where  a.first_name = 'SEAN'
and a.last_name = 'WILLIAMS';

