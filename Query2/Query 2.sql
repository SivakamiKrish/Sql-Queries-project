-- find the film title that are less than 3 in stock using having


select f.film_id,f.title,count(inventory_id) from film f
join inventory i on f.film_id=i.film_id
group by f.film_id,f.title having count(inventory_id)<3





