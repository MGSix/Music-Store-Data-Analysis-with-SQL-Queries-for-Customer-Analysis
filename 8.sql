WITH popular_genre AS (
    SELECT COUNT(invoice_line.quantity) AS purchases, 
           customer.country, 
           genre.name AS genre_name, 
           genre.genre_id,
           ROW_NUMBER() OVER (PARTITION BY customer.country ORDER BY COUNT(invoice_line.quantity) DESC) AS rowno
    FROM invoice_line
    JOIN invoice ON invoice.invoice_id = invoice_line.invoice_id
    JOIN customer ON customer.customer_id = invoice.customer_id
    JOIN track ON track.track_id = invoice_line.track_id
    JOIN genre ON genre.genre_id = track.genre_id
    GROUP BY customer.country, genre.name, genre.genre_id
    ORDER BY customer.country ASC, purchases DESC
)
SELECT * 
FROM popular_genre 
WHERE rowno <= 1;
