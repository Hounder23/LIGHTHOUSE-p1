-- **Question 2: What is the average number of products ordered from visitors in each city and country?**

SELECT CITY,
	AVG(PRODUCTQUANTITY) AS AVG_PRODUCT_QUANT_PER_CITY
FROM ALL_SESSIONS
WHERE CITY != '(not set)' -- do not select the entries named not set as those are invalid for this question
GROUP BY CITY
HAVING AVG(PRODUCTQUANTITY) >= 0
ORDER BY AVG_PRODUCT_QUANT_PER_CITY DESC;

SELECT COUNTRY,
	AVG(PRODUCTQUANTITY) AS AVG_PRODUCT_QUANT_PER_COUNTRY
FROM ALL_SESSIONS
WHERE COUNTRY != '(not set)' -- do not select the entries named not set as those are invalid for this question
GROUP BY COUNTRY
HAVING AVG(PRODUCTQUANTITY) >= 0
ORDER BY AVG_PRODUCT_QUANT_PER_COUNTRY DESC;


