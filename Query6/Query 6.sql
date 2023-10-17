-- Number of distinct active  customers in any 3 countries 

select distinct count(*) from customer c
join address ad on c.address_id=ad.address_id
join city ct on ct.city_id=ad.city_id
join country co on ct.country_id=co.country_id
where active=1 and co.country in ('Thailand','India','Canada')