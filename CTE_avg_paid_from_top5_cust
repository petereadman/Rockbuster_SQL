-- Find the average amount paid by the top 5 customers
 -- define cte total_amount_paid_cte
WITH TOTAL_AMOUNT_PAID_CTE (TOTAL_PAID,

	CUSTOMER_ID,
	FIRST_NAME,
	LAST_NAME,
	CITY,
	COUNTRY) AS 
	
	-- subquery returning top 5 customers inserted here as CTE
	
	(SELECT SUM(A.AMOUNT) AS TOTAL_PAID,
			B.CUSTOMER_ID,
			B.FIRST_NAME,
			B.LAST_NAME,
			D.CITY,
			E.COUNTRY
		FROM PAYMENT A
		INNER JOIN CUSTOMER B ON B.CUSTOMER_ID = A.CUSTOMER_ID
		INNER JOIN ADDRESS C ON C.ADDRESS_ID = B.ADDRESS_ID
		INNER JOIN CITY D ON D.CITY_ID = C.CITY_ID
		INNER JOIN COUNTRY E ON E.COUNTRY_ID = D.COUNTRY_ID
		WHERE CITY IN (	'Aurora',
				'Acua',
				'Citrus Heights',
				'Iwaki',
				'Ambattur',
				'Shanwei',
				'So Leopoldo',
				'Teboksary',
				'Tianjin',
				'Cianjur')
		GROUP BY B.CUSTOMER_ID,
			B.FIRST_NAME,
			B.LAST_NAME,
			E.COUNTRY_ID,
			D.CITY_ID
		ORDER BY TOTAL_PAID DESC
		LIMIT 5)

-- SELECT average from CTE (total_amount_paid_cte)
SELECT AVG (TOTAL_AMOUNT_PAID_CTE.TOTAL_PAID)
FROM TOTAL_AMOUNT_PAID_CTE;
