-- **Question 3: Is there any pattern in the types (product categories) of products ordered
-- from visitors in each city and country?**

WITH MODE_CURRENCYCODE AS --this cte is used to clean up the query a little bit
	(SELECT CURRENCYCODE  -- other wise there would have been 2 subsqueries to try and read though in th main query
		FROM
			(SELECT CURRENCYCODE,
					COUNT(*) AS FREQUENCY
				FROM ALL_SESSIONS
				WHERE COUNTRY != '(not set)'
					AND V2PRODUCTCATEGORY != 'not set'
				GROUP BY CURRENCYCODE
				ORDER BY COUNT(*) DESC
				LIMIT 1) AS MODE_SUBQUERY)
SELECT 
	COUNTRY,
	V2PRODUCTCATEGORY,
	COUNT(V2PRODUCTCATEGORY) 	AS CATEGORY_COUNT,
	AVG(PRODUCTPRICE) 			AS AVG_PRODUCTPRICE,
	AVG(TIMEONSITE) 			AS AVG_TIMEONSITE,
	(SELECT CURRENCYCODE FROM MODE_CURRENCYCODE) AS MODE_CURRENCY
FROM ALL_SESSIONS
WHERE COUNTRY != '(not set)'
	AND V2PRODUCTCATEGORY != 'not set'
GROUP BY COUNTRY,
	V2PRODUCTCATEGORY
ORDER BY COUNTRY, AVG_PRODUCTPRICE desc;