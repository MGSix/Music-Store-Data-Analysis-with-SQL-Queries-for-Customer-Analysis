WITH 
customer_with_country AS (
    SELECT customer.customer_id,first_name,last_name,billing_country, 
           SUM(total) AS total_spending,
		   row_number() over(partition by billing_country order by sum (total)desc)as Rowno
		   FROM invoice
    JOIN customer ON customer.customer_id = invoice.customer_id
    GROUP BY 1,2,3,4
    ORDER BY 4 asc,5 DESC),
SELECT * FROM customer_with_country
WHERE Rowno = 1;