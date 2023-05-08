-- Select the top 100 customers by revenue they've generated
-- Include customer_id, the total they've paid, their name, city and country

SELECT	customer.customer_id,		
		SUM(payment.amount) AS total_paid,	
		CONCAT(customer.first_name, ' ', customer.last_name) AS customer,	
		city.city,	
		country.country	
-- join payment, rental, customer, address, city, and country tables			
FROM payment			
INNER JOIN	rental ON payment.rental_id = rental.rental_id		
INNER JOIN	customer ON rental.customer_id = customer.customer_id		
INNER JOIN	address ON customer.address_id = address.address_id		
INNER JOIN	city ON address.city_id = city.city_id		
INNER JOIN	country ON city.country_id = country.country_id		
-- group by cusomter_id, customer name, city, country			
GROUP BY 	customer.customer_id,		
			customer,
			city.city,
			country.country
-- sort by total paid by customer, with highest amount at the top			
ORDER BY total_paid DESC
-- top 100 only
LIMIT 100;			
