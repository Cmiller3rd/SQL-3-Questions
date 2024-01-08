-- Q1: List all customers who live in Texas (use JOINs): 
-- Dorothy Taylor, Thelma Mrray, Daniel Cabral, Leonard Schofield, Alfredo Mcadams

select customer.customer_id, first_name, last_name, district
from address
left join customer
on address.address_id = customer_id
where district = 'Texas';

-- Q2: Get all payments above $6.99 with Customer's Full Name:
-- Mary Smith, Douglas Graf, Peter Menard, Harold Martino, Alfredo Mcadams, 
-- Alvin Deloach, Ida Andrews

select customer.customer_id, amount, first_name, last_name
from payment
left join customer
on payment.customer_id = customer.customer_id
where amount > 6.99
group by customer.customer_id, payment.amount
order by customer_id desc;


-- Q3: Show all customers' names who have payments over $175 (use subqueries):
-- Mary Smith, Peter Menard, Douglas Graf

select first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	group by amount, customer_id
	having amount > 175
	order by amount desc
);

-- Q4: List all customers who live in Nepal (use the city table): Kevin Schuler

select customer.first_name, customer.last_name, country.country
from customer
left join address
on customer.address_id = address.address_id
left join city
on address.city_id = city.city_id
left join country
on city.country_id = country.country_id
where country = 'Nepal';

-- Q5: Which staff member had the most transactions? Staff_ID 2

select staff_id, count(staff_id)
from payment
group by staff_id;

-- Q6: How many movies of each rating are there?
-- NC-17: 209, R: 196, PG-13: 224, PG: 194, G: 178

select rating, count(rating)
from film
group by rating;

-- Q7: Show all customers who have a single payment over $6.99 (use subqueries):
-- Mary Smith, Ida Andrews, Peter Menard, Harold Martino, 
-- Douglas Graf, Alvin Deloach, Alfredo Mcadams

select first_name, last_name 
from customer
where customer_id in (
	select customer_id
	from payment
	group by amount, customer_id
	having amount > 6.99
	order by amount desc
);

-- Q8: How many free rentals did our stores give away? ??? 14,562?

select count(amount) 
from payment 
where amount <= 0;