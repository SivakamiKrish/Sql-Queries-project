select extract(year from payment_date),city, sum(amount) from payment p
join customer c on p.customer_id=c.customer_id
join address ad on c.address_id=ad.address_id
join city ct on ad.city_id=ct.city_id
group by city, extract(year from payment_date)
order by extract(year from payment_date) desc

-- Find the sum of amount by city and year
-- The year should be sorted in descending 