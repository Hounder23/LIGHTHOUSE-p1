-- **Question 2: What is the average number of products ordered from visitors in each city and country?**

SELECT CITY,
	AVG(P.orderedquantity) AS AVG_PRODUCT_QUANT_PER_CITY
FROM ALL_SESSIONS A
JOIN PRODUCTS P ON A.PRODUCTSKU = P.SKU
WHERE CITY != '(not set)' -- do not select the entries named not set as those are invalid for this question
GROUP BY CITY
HAVING AVG(P.orderedquantity) >= 0
ORDER BY AVG_PRODUCT_QUANT_PER_CITY DESC
LIMIT 10;



SELECT COUNTRY,
	AVG(P.orderedquantity) AS AVG_PRODUCT_QUANT_PER_COUNTRY
FROM ALL_SESSIONS A
JOIN PRODUCTS P ON A.PRODUCTSKU = P.SKU
WHERE COUNTRY != '(not set)' -- do not select the entries named not set as those are invalid for this question
GROUP BY COUNTRY
HAVING AVG(P.orderedquantity) >= 0
ORDER BY AVG_PRODUCT_QUANT_PER_COUNTRY DESC
LIMIT 10;


