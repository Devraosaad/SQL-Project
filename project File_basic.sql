--  Q1: Who is the senior most employee based on job title? 
use Music_Information;
select * from employee
order by levels desc
limit 1;

--  Q2: Which countries have the most Invoices? 

select count(*) as c, billing_country  from invoice
group by billing_country
order by c desc 
limit 1;


--  Q3: What are top 3 values of total invoice? 
SELECT * FROM invoice
order by total desc
limit 3;


--  Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
-- Write a query that returns one city that has the highest sum of invoice totals. 
-- Return both the city name & sum of all invoice totals 
use Music_Information;
select SUM(total)  as invoice_total, billing_city  from invoice 
group by billing_city
order by invoice_total  desc
limit 5;


--  Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
-- Write a query that returns the person who has spent the most money.
SELECT customer.customer_id, customer.first_name, customer.last_name, 
       SUM(invoice.total) AS total
FROM customer 
JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id, customer.first_name, customer.last_name
ORDER BY total DESC
LIMIT 1;

