
select customer.customer_id , customer.first_name,customer.last_name, sum(invoice.total) as total
from customer
Join invoice ON customer.customer_id = invoice.customer_id
group by customer.customer_id
order by total desc
limit 1