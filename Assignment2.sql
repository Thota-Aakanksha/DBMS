#Query 1
select count(distinct f.film_id)
from film f 
join film_category fc on f.film_id = fc.film_id
join category c on fc.category_id = c.category_id
where f.special_features like '%Deleted Scenes%' 
and c.name = 'Documentary';

#Query 2
select count( distinct f.film_id)
from film f 
join film_category fc on f.film_id = fc.film_id
join category c on fc.category_id = c.category_id
join inventory i on f.film_id = i.film_id
join store s on i.store_id = s.store_id
join staff m on s.manager_staff_id = m.staff_id 
where c.name ='Sci-Fi' 
and m.first_name = 'Jon' 
and m.last_name = 'Stephens';

#Query 3
select c.name, sum(p.amount) total_sales
from payment p
join rental r on p.rental_id = r.rental_id
join inventory i on r.inventory_id = i.inventory_id
join film f on i.film_id = f.film_id
join film_category fc on f.film_id = fc.film_id
join category c on fc.category_id = c.category_id
where c.name = 'Animation';

#Query 4
select cat.name category, count(cat.name) NumberOfMovies
from customer c 
join rental r on c.customer_id = r.customer_id 
join inventory i on r.inventory_id=i.inventory_id
join film f on i.film_id=f.film_id
join film_category fc on f.film_id = fc.film_id
join category cat on fc.category_id = cat.category_id
where c.first_name='PATRICIA'
and c.last_name='JOHNSON'
group by cat.name
order by count(cat.name) desc limit 3;

#Query 5
select f.film_id, f.title, f.description,  f.rating ,c.first_name, c.last_name 
from customer c 
join rental r on c.customer_id = r.customer_id 
join inventory i on r.inventory_id = i.inventory_id
join film f on i.film_id = f.film_id
where f.rating='R' 
and c.first_name='SUSAN'
and c.last_name='WILSON';
