
-- using case function

select first_name,email,
case when email like '%_@%.%'
then 'valid'
else 'invalid'
end as email_validation
from customer