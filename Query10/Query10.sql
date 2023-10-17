-- To find the film which are released after 2000 using CTE

with recent_film as (
select title from film where release_year>2000)

select * from inventory where film_id in (select film_id from recent_film)




