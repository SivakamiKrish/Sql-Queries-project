![DVD](https://github.com/SivakamiKrish/Sql-Queries-project/assets/147556202/b494218c-74aa-4829-a15c-399cb5aea30e)
# Sql-Queries-project


This SQL project dataset consists of multiple tables that capture various aspects of a DVD rental system. The tables include film, category, film category, film actor, actor, language, customer, address, city, country, payment, rental, store, inventory, and staff. The dataset provides a comprehensive set of data for analysis and insights. The project involves performing several analysis tasks using SQL queries.

The SQL project dataset offers an opportunity to analyze customer rental behavior, identify high-spending customers, track actor movie counts, and explore films in specific genres. These queries provide valuable insights into the rental business, customer preferences, and the performance of actors and films in the dataset. Entity Relationship diagram for DvD database is shown below

ERD Diagram

![276379761-1c449a82-2d23-4267-8314-8031cd9c0aec](https://github.com/SivakamiKrish/Sql-Queries-project/assets/147556202/919451fe-1f7c-420f-8a23-e4c19d94971f)

PostgreSQL Database Tables
There are 15 tables in the DVD Rental database:

actor – stores actors data including first name and last name.
film – stores film data such as title, release year, length, rating, etc.
film_actor – stores the relationships between films and actors.
category – stores film’s categories data.
film_category- stores the relationships between films and categories.
store – contains the store data including manager staff and address.
inventory – stores inventory data.
rental – stores rental data.
payment – stores customer’s payments.
staff – stores staff data.
customer – stores customer data.
address – stores address data for staff and customers
city – stores city names.
country – stores country names.


SQL QUERIES

select extract(year from payment_date),city, sum(amount) from payment p
/n join customer c on p.customer_id=c.customer_id
join address ad on c.address_id=ad.address_id
join city ct on ad.city_id=ct.city_id
group by city, extract(year from payment_date)
order by extract(year from payment_date) desc

Aggregate the total amount by city and year, with the years sorted in descending order.

select f.film_id,f.title,count(inventory_id) from film f
join inventory i on f.film_id=i.film_id
group by f.film_id,f.title having count(inventory_id)<3

Retrieve the titles of films with fewer than 3 copies in stock, using the 'HAVING' clause.

select c.* from customer c
join payment p on c.customer_id=p.customer_id 
where p.payment_date between '2007-02-01' and '2007-03-01' and active=0

Identify the customers who are currently inactive and made payments between February 1, 2007, and March 1, 2007.

select r.* from rental r
join inventory i on r.inventory_id=i.inventory_id
join film f on i.film_id=f.film_id
where title like 'C%' or title like 'A%'

Retrieve rental details for films whose titles start with the letters 'C' or 'A'.

select distinct amount from payment 
where amount not in (select max(amount) from payment
)
order by amount desc limit 1

Retrieve the payment amount that is the second highest.


select distinct count(*) from customer c
join address ad on c.address_id=ad.address_id
join city ct on ct.city_id=ad.city_id
join country co on ct.country_id=co.country_id
where active=1 and co.country in ('Thailand','India','Canada')

Count the unique active customers from any three countries

select distinct city,count(c.customer_id) over (partition by city) as ct
from city cit
join address ad on cit.city_id =ad.city_id
join customer c on ad.address_id=c.address_id
order by count(c.customer_id) over (partition by city) desc

Utilize a window function to determine the customer count per city

-- without window function
select city,count(c.customer_id) from city ct
join address ad on ct.city_id =ad.city_id
join customer c on ad.address_id=c.address_id
group by city
order by count(c.customer_id) desc

select first_name,email,
case when email like '%_@%.%'
then 'valid'
else 'invalid'
end as email_validation
from customer

Using a CASE statement, validate email addresses for their validity and correctness.

select title, 'long duration films' film_type from film 
where length>90 
union
select title,'recent release' film_type from film 
where release_year >=2006

Retrieve films that have a lengthy duration and were recently released

with recent_film as (
select title from film where release_year>2000)

select * from inventory where film_id in (select film_id from recent_film)

Utilizing a Common Table Expression (CTE), discover films released after the year 2000.




