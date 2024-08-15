select distinct email,first_name, last_name
from customer
join invoice ON customer.customer_id = invoice.customer_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
where track_id IN(Select track_id from track join genre on track.genre_id = genre.genre_id
where genre.name like 'Rock')
order by email;