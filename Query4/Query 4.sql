-- find the rental details where film name starts with C or A

select r.* from rental r
join inventory i on r.inventory_id=i.inventory_id
join film f on i.film_id=f.film_id
where title like 'C%' or title like 'A%'