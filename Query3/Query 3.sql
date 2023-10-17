select c.* from customer c
join payment p on c.customer_id=p.customer_id 
where p.payment_date between '2007-02-01' and '2007-03-01' and active=0

-- find the list of inactive customers who had done the payment between 2007-02-01 to 2007-03-01