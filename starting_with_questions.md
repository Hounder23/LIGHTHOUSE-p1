Answer the following questions and provide the SQL queries used to find the answer.

    
**Question 1: Which cities and countries have the highest level of transaction revenues on the site?**


SQL Queries:

Finding the city with the largest sum of total tranaction revenue for all non null city entries
```SQL
SELECT CITY,
	SUM(TOTALTRANSACTIONREVENUE) AS SUM_OF_TRANSACTION_REVENUE
FROM ALL_SESSIONS
WHERE CITY != '(not set)'--exclude the sum of all not set city
GROUP BY CITY
HAVING SUM(TOTALTRANSACTIONREVENUE) IS NOT NULL --exclude all null sums from output
ORDER BY SUM(TOTALTRANSACTIONREVENUE) DESC;--order from largest to smallest sum
```
Finding the country with the largest sum of total tranaction revenue for all non null country entries
```SQL
SELECT COUNTRY,
	SUM(TOTALTRANSACTIONREVENUE) AS SUM_OF_TRANSACTION_REVENUE
FROM ALL_SESSIONS
WHERE COUNTRY != '(not set)' -- exclude the sum of not set country
GROUP BY COUNTRY
HAVING SUM(TOTALTRANSACTIONREVENUE) IS NOT NULL --exclude all null sums from output
ORDER BY SUM(TOTALTRANSACTIONREVENUE) DESC;--order from largest to smallest sum
```



Answer:
    COUNTRIES
"United States"	13154170000
"Israel"	602000000
"Australia"	358000000
"Canada"	150150000
"Switzerland"	16990000

    CITIES
"San Francisco"	1564320000
"Sunnyvale"	992230000
"Atlanta"	854440000
"Palo Alto"	608000000
"Tel Aviv-Yafo"	602000000
"New York"	598350000
"Mountain View"	483360000
"Los Angeles"	479480000
"Chicago"	449520000
"Sydney"	358000000
"Seattle"	358000000
"San Jose"	262380000
"Austin"	157780000
"Nashville"	157000000
"San Bruno"	103770000
"Toronto"	82160000
"Houston"	38980000
"Columbus"	21990000
"Zurich"	16990000



**Question 2: What is the average number of products ordered from visitors in each city and country?**


SQL Queries:
```SQL
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
```


Answer:
CITIES WITH THEIR AVG  VOLUME OF PRODUCTS ORDERED FROM VISITORS IN THAT CITY
"Madrid"	10.0000000000000000
"Salem"	8.0000000000000000
"Atlanta"	4.0000000000000000
"Houston"	2.0000000000000000
"New York"	1.1666666666666667
"Chicago"	1.00000000000000000000
"San Jose"	1.00000000000000000000
"Columbus"	1.00000000000000000000
"Los Angeles"	1.00000000000000000000
"Ann Arbor"	1.00000000000000000000
"Mountain View"	1.00000000000000000000
"Detroit"	1.00000000000000000000
"Bengaluru"	1.00000000000000000000
"Sunnyvale"	1.00000000000000000000
"Seattle"	1.00000000000000000000
"San Francisco"	1.00000000000000000000
"Dallas"	1.00000000000000000000
"Dublin"	1.00000000000000000000
"Palo Alto"	1.00000000000000000000

COUNTRIES WITH THEIR AVG VOLUME OF PRODUCTS ORDERED FROM VISITORS IN THAT COUNTRY
"Spain"	10.0000000000000000
"United States"	4.0238095238095238
"Colombia"	1.00000000000000000000
"France"	1.00000000000000000000
"Canada"	1.00000000000000000000
"Argentina"	1.00000000000000000000
"India"	1.00000000000000000000
"Ireland"	1.00000000000000000000
"Mexico"	1.00000000000000000000
"Finland"	1.00000000000000000000



**Question 3: Is there any pattern in the types (product categories) of products ordered from visitors in each city and country?**


SQL Queries:



Answer:





**Question 4: What is the top-selling product from each city/country? Can we find any pattern worthy of noting in the products sold?**


SQL Queries:



Answer:





**Question 5: Can we summarize the impact of revenue generated from each city/country?**

SQL Queries:



Answer:







