-- find the second highest payment

select distinct amount from payment 
where amount not in (select max(amount) from payment
)
order by amount desc limit 1

--select max(amount) from payment
