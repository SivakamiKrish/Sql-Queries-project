# Sql-Queries-project

select extract(year from payment_date),city, sum(amount) from payment p
join customer c on p.customer_id=c.customer_id
join address ad on c.address_id=ad.address_id
join city ct on ad.city_id=ct.city_id
group by city, extract(year from payment_date)
order by extract(year from payment_date) desc

Aggregate the total amount by city and year, with the years sorted in descending order.

-- find the film title that are less than 3 in stock using having
select f.film_id,f.title,count(inventory_id) from film f
join inventory i on f.film_id=i.film_id
group by f.film_id,f.title having count(inventory_id)<3

-- find the list of inactive customers who had done the payment between 2007-02-01 to 2007-03-01

select c.* from customer c
join payment p on c.customer_id=p.customer_id 
where p.payment_date between '2007-02-01' and '2007-03-01' and active=0

-- find the rental details where film name starts with C or A

select r.* from rental r
join inventory i on r.inventory_id=i.inventory_id
join film f on i.film_id=f.film_id
where title like 'C%' or title like 'A%'

-- find the second highest payment

select distinct amount from payment 
where amount not in (select max(amount) from payment
)
order by amount desc limit 1

-- Number of distinct active  customers in any 3 countries 

select distinct count(*) from customer c
join address ad on c.address_id=ad.address_id
join city ct on ct.city_id=ad.city_id
join country co on ct.country_id=co.country_id
where active=1 and co.country in ('Thailand','India','Canada')

-- Use window function to find out count of customers per city


select distinct city,count(c.customer_id) over (partition by city) as ct
from city cit
join address ad on cit.city_id =ad.city_id
join customer c on ad.address_id=c.address_id
order by count(c.customer_id) over (partition by city) desc

-- without window function
select city,count(c.customer_id) from city ct
join address ad on ct.city_id =ad.city_id
join customer c on ad.address_id=c.address_id
group by city
order by count(c.customer_id) desc


-- using case function

select first_name,email,
case when email like '%_@%.%'
then 'valid'
else 'invalid'
end as email_validation
from customer

-- find log duration film and recent release film


select title, 'long duration films' film_type from film 
where length>90 
union
select title,'recent release' film_type from film 
where release_year >=2006

-- To find the film which are released after 2000 using CTE

with recent_film as (
select title from film where release_year>2000)

select * from inventory where film_id in (select film_id from recent_film)
