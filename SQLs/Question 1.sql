-- **Question 1: Which cities and countries have the highest level of transaction revenues on the site?**

SELECT CITY,
	SUM(TOTALTRANSACTIONREVENUE/1000000) AS SUM_OF_TRANSACTION_REVENUE
FROM ALL_SESSIONS
WHERE CITY != '(not set)'--exclude the sum of all not set city
GROUP BY CITY
HAVING SUM(TOTALTRANSACTIONREVENUE) IS NOT NULL --exclude all null sums from output
ORDER BY SUM(TOTALTRANSACTIONREVENUE) DESC--order from largest to smallest sum
LIMIT 10;

SELECT COUNTRY,
	SUM(TOTALTRANSACTIONREVENUE/1000000) AS SUM_OF_TRANSACTION_REVENUE
FROM ALL_SESSIONS
WHERE COUNTRY != '(not set)' -- exclude the sum of not set country
GROUP BY COUNTRY
HAVING SUM(TOTALTRANSACTIONREVENUE) IS NOT NULL --exclude all null sums from output
ORDER BY SUM(TOTALTRANSACTIONREVENUE) DESC--order from largest to smallest sum
LIMIT 10;