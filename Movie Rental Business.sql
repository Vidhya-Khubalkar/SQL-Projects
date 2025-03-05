SELECT *
FROM rental;


SELECT 
	rental_date,
    customer_id
FROM rental;


#Assignment 1
SELECT 
	first_name,
    last_name,
    email
FROM customer;


SELECT DISTINCT
	rating
FROM film;


SELECT DISTINCT
	rental_duration
FROM film;

#Assignment 2 (3 Methods)
SELECT
	customer_id,
    rental_id,
	amount,
    payment_date
FROM payment
WHERE customer_id <= 100;


SELECT
	customer_id,
    rental_id,
	amount,
    payment_date
FROM payment
WHERE customer_id BETWEEN '1' AND '100';


SELECT
	customer_id,
    rental_id,
	amount,
    payment_date
FROM payment
WHERE customer_id < 101;


SELECT 
	customer_id,
    rental_id,
    amount,
    payment_date
FROM payment
WHERE amount = 0.99
	AND payment_date > '2006-01-01';
    

#Assignment 3
SELECT 
	customer_id,
	rental_id,
    amount,
    payment_date
FROM payment
WHERE customer_id <= 100
	AND amount > 5
    AND payment_date >= '2006-01-01';


#Assignment 4
SELECT 
	customer_id,
	rental_id,
    amount,
    payment_date
FROM payment
WHERE amount > 5 
	OR customer_id = 5
	OR customer_id = 11
    OR customer_id = 29;


SELECT 
	customer_id,
	rental_id,
    amount,
    payment_date
FROM payment
WHERE customer_id = 5
	OR customer_id = 11
    OR customer_id = 29;


SELECT
	customer_id,
    rental_id,
    amount,
    payment_date
FROM payment
WHERE customer_id IN (5, 11, 29);


SELECT
	customer_id,
    rental_id,
    amount,
    payment_date
FROM payment
WHERE amount > 5
	OR customer_id IN (5, 11, 29);


SELECT 
	film_id,
	title
FROM film
WHERE title LIKE "LOVE%";

SELECT * FROM film;


SELECT
	film_id,
	title
FROM film
WHERE title LIKE "%LOVE%";


SELECT
	film_id,
	title
FROM film
WHERE title LIKE "_ONE%";


SELECT
	film_id,
	title
FROM film
WHERE title LIKE "_ANCES%";


SELECT
	film_id,
	title
FROM film
WHERE title NOT LIKE "%LOVE%";


#Assignment 
SELECT
	film_id,
    title,
    special_features
FROM film
WHERE special_features LIKE "%Behind the Scenes";




-- GROUP BY, COMMENTS AND ALIASES

SELECT
	rating,
    COUNT(film_id) as films_with_this_rating
FROM film
GROUP BY rating;	

/* 
THIS IS A MULTI LINE 
COMMENT
*/


-- Assigment 
SELECT
	rental_duration,
	COUNT(title) AS films_with_this_rental_duration
FROM film
GROUP BY rental_duration;


 SELECT
	rental_duration,
    rating,
	COUNT(title) AS films_with_this_rental_duration
FROM film
GROUP BY 
	rental_duration,
    rating;
    
    
SELECT
	rental_duration,
    rating,
	COUNT(title) AS films_with_this_rental_duration
FROM film
GROUP BY 
	rental_duration,
    rating;


SELECT
	rating,
    COUNT(film_id) AS total_film_with_this_rating,
    MIN(length) AS Shortest_Film,
    MAX(length) as Longest_Film,
    AVG(length),
    AVG(rental_duration)
FROM film
GROUP BY
	rating;


-- Assignment 
SELECT
	replacement_cost,
    COUNT(film_id) AS Total_Films,
    AVG(rental_rate) AS Average_Rental_Rate,
    MIN(rental_rate) AS Cheapest_Rate,
    MAX(rental_rate) AS Most_Expensive_Rate
FROM film
GROUP BY
	replacement_cost;	


SELECT
	customer_id,
    COUNT(rental_id) AS Total_Rentals
FROM rental
GROUP BY customer_id
HAVING Total_Rentals >= 30;


SELECT 
	customer_id,
    COUNT(rental_id) AS Total_Rentals
FROM rental
GROUP BY customer_id
HAVING Total_Rentals < 15;


SELECT
	customer_id,
    payment_id,
    amount,
    payment_date
FROM payment
ORDER BY amount DESC, customer_id;


SELECT
	title,
    length,
    rental_rate
FROM film
ORDER BY length DESC, rental_rate DESC;


SELECT
	title,
    CASE
		WHEN rating  IN('R', 'NC-17') THEN "Too Adult"
		WHEN rental_rate >= 3.99 THEN "Too Expensive"
        WHEN length NOT BETWEEN 60 AND 90 THEN "Too_short_or_Too_long"
        WHEN description LIKE "%Shark%" THEN "nope_has_sharks"
        ELSE "great reco for kids"
        END AS RECOMMENDATION
FROM film;

SELECT * FROM customer;

SELECT
	first_name,
    last_name,
    CASE
		WHEN store_id = 1 AND active = 1 THEN "Store 1 Active"
        WHEN store_id = 1 AND active = 0 THEN "Store 1 Inactive"
        WHEN store_id = 2 AND active = 1 THEN "Store 2 Active"
        WHEN store_id = 2 AND active = 0 THEN "Store 2 Inactive"
		END AS Active_Status
FROM customer;


SELECT * FROM inventory;


SELECT
    film_id,
    count(CASE WHEN store_id = 1 THEN inventory_id ELSE NULL END )AS store_1_inventory,
	count(CASE WHEN store_id = 2 THEN inventory_id ELSE NULL END )AS store_2_inventory
from inventory
group by film_id
order by film_id;


SELECT
	store_id,
    COUNT(CASE WHEN active = 1 THEN customer_id END) AS ACTIVE,
    COUNT(CASE WHEN active = 0 THEN customer_id END) AS INACTIVE
FROM customer
GROUP BY store_id;








-- MID COURSE PROJECT

-- 1.

SELECT
	first_name,
    last_name,
    email,
    store_id
FROM staff;


-- 2.

SELECT
	store_id,
	COUNT(film_id) AS ITEM
FROM inventory
GROUP BY store_id;


-- 3.

SELECT
	store_id,
    COUNT(customer_id) AS Active_Customers
FROM customer
WHERE active = 1
GROUP BY store_id;


-- 4.

SELECT
	COUNT(email) AS Total_Customer_Email_ID
FROM customer;


-- 5.

SELECT  
	store_id,
	COUNT(DISTINCT film_id) AS Total_Film_Titles
FROM inventory
GROUP BY store_id;

SELECT DISTINCT
	COUNT(category_id)
FROM category;


-- 6.

SELECT
	MIN(replacement_cost),
    MAX(replacement_cost),
    AVG(replacement_cost)
FROM film;


-- 7.

SELECT
	AVG(amount),
    MAX(amount)
FROM payment; 


-- 8.

SELECT
	customer_id,
    COUNT(rental_id) AS Total_Renatls_Made
FROM payment
GROUP BY customer_id
ORDER BY Total_Renatls_Made DESC;



select * from customer_list