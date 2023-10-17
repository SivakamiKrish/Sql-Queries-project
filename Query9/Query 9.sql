-- find log duration film and recent release film


select title, 'long duration films' film_type from film 
where length>90 
union
select title,'recent release' film_type from film 
where release_year >=2006
