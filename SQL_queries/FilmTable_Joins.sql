-- Combine attributes from multiple tables into one new 'film_table' for ease of use in Tableau

-- Select total revenue (of each film), Film Title, Rental Duration, Relsease Year, Rental Rate, Rating, Language, Genre
SELECT SUM(PAYMENT.AMOUNT) AS REVENUE,
	FILM.TITLE,
	FILM.RENTAL_DURATION,
	FILM.RELEASE_YEAR,
	FILM.RENTAL_RATE,
	FILM.RATING,
	LANGUAGE.NAME AS LANGUAGE,
	CATEGORY.NAME AS GENRE
FROM PAYMENT
-- Join Payment, Film, Language, and Category tables
INNER JOIN RENTAL ON PAYMENT.RENTAL_ID = RENTAL.RENTAL_ID
INNER JOIN INVENTORY ON RENTAL.INVENTORY_ID = INVENTORY.INVENTORY_ID
INNER JOIN FILM ON INVENTORY.FILM_ID = FILM.FILM_ID
INNER JOIN FILM_CATEGORY ON FILM.FILM_ID = FILM_CATEGORY.FILM_ID
INNER JOIN CATEGORY ON FILM_CATEGORY.CATEGORY_ID = CATEGORY.CATEGORY_ID
INNER JOIN LANGUAGE ON FILM.LANGUAGE_ID = LANGUAGE.LANGUAGE_ID
-- Group by Title, Rental Duration, Release Year, Rental Rate, Rating, Language, Genre
GROUP BY FILM.TITLE,
	FILM.RENTAL_DURATION,
	FILM.RELEASE_YEAR,
	FILM.RENTAL_RATE,
	FILM.RATING,
	LANGUAGE,
	GENRE
-- Sort by 'Revenue' with highest-earning film at the top
ORDER BY REVENUE DESC;
