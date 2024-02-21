-- **Question 3: Is there any pattern in the types (product categories) of products ordered
-- from visitors in each city and country?**


SELECT 
	COUNTRY,
	V2PRODUCTCATEGORY,
	COUNT(V2PRODUCTCATEGORY) 	AS CATEGORY_POPULARITY, 	--show popularity of this category 
	AVG(PRODUCTPRICE) 			AS AVG_PRODUCTPRICE,-- show avg price in this category
	CURRENCYCODE,									
	AVG(TIMEONSITE) 			AS AVG_TIMEONSITE 	-- show avg time spent on site for this category
FROM ALL_SESSIONS
WHERE COUNTRY = 'Canada'
	AND	COUNTRY != '(not set)'
	AND V2PRODUCTCATEGORY != '(not set)'
GROUP BY COUNTRY,
	V2PRODUCTCATEGORY,
	CURRENCYCODE
ORDER BY 	COUNTRY, 
			CATEGORY_POPULARITY desc
LIMIT 5;

SELECT 
	CITY,
	V2PRODUCTCATEGORY,
	COUNT(V2PRODUCTCATEGORY) 	AS CATEGORY_POPULARITY, 	--show popularity of this category 
	AVG(PRODUCTPRICE) 			AS AVG_PRODUCTPRICE,-- show avg price in this category
	CURRENCYCODE,									
	AVG(TIMEONSITE) 			AS AVG_TIMEONSITE 	-- show avg time spent on site for this category
FROM ALL_SESSIONS
WHERE	CITY = 'Toronto'
	AND	CITY != '(not set)'
	AND V2PRODUCTCATEGORY != '(not set)'
GROUP BY CITY,
	V2PRODUCTCATEGORY,
	CURRENCYCODE
ORDER BY 	CITY, 
			CATEGORY_POPULARITY desc
LIMIT 5;