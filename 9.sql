WITH Recursive
customer_with_country AS (
    SELECT customer.customer_id,first_name,last_name,billing_country, 
           SUM(total) AS total_spending
    FROM invoice
    JOIN customer ON customer.customer_id = invoice.customer_id
    GROUP BY 1,2,3,4
    ORDER BY 1,5 DESC
),
country_max_spending AS (
    SELECT billing_country, 
           MAX(total_spending) AS max_spending
    FROM customer_with_country
    GROUP BY billing_country
)

select cc.billing_country, cc.total_spending, cc.first_name, cc.last_name
from customer_with_country cc
Join country_max_spending ms
on cc.billing_country = ms.billing_country
where cc.total_spending = ms.max_spending
order by 1;