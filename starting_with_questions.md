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



Answer:





**Question 3: Is there any pattern in the types (product categories) of products ordered from visitors in each city and country?**


SQL Queries:



Answer:





**Question 4: What is the top-selling product from each city/country? Can we find any pattern worthy of noting in the products sold?**


SQL Queries:



Answer:





**Question 5: Can we summarize the impact of revenue generated from each city/country?**

SQL Queries:



Answer:







