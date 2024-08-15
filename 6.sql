select name, milliseconds
from track
where milliseconds > (select avg(milliseconds)as avg_track_length from track)
order by milliseconds desc;


select distinct email as email,first_name as firstname, last_name as lastname, genre.name as name
from customer
join invoice on invoice.customer_id = customer.customer_id
join invoice_line on invoice_line.Invoice_id = invoice.invoice_id
join track on track.track_id = invoice_line.track_id
join genre on genre.genre_id = track.genre_id
where genre.name like 'rock'
order by email;