Answer the following questions and provide the SQL queries used to find the answer.

    
**Question 1: Which cities and countries have the highest level of transaction revenues on the site?**


SQL Queries:

Finding the city with the largest sum of total tranaction revenue for all non null city entries
```SQL
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
```



Answer:
    COUNTRIES
"United States"	10536.0700000000000000
"Israel"	602.0000000000000000
"Australia"	358.0000000000000000
"Canada"	150.1500000000000000
"Switzerland"	16.9900000000000000

    CITIES
"San Francisco"	1251.1300000000000000
"Sunnyvale"	872.2300000000000000
"Palo Alto"	608.0000000000000000
"Tel Aviv-Yafo"	602.0000000000000000
"New York"	598.3500000000000000
"Los Angeles"	479.4800000000000000
"Mountain View"	474.3800000000000000
"Chicago"	449.5200000000000000
"Seattle"	358.0000000000000000
"Sydney"	358.0000000000000000



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
```SQL
SELECT 
	COUNTRY,
	V2PRODUCTCATEGORY,
	COUNT(V2PRODUCTCATEGORY) 	AS CATEGORY_POPULARITY, 	--show popularity of this category 
	AVG(PRODUCTPRICE) 			AS AVG_PRODUCTPRICE,-- show avg price in this category
	CURRENCYCODE,									
	AVG(TIMEONSITE) 			AS AVG_TIMEONSITE 	-- show avg time spent on site for this category
FROM ALL_SESSIONS
WHERE COUNTRY != '(not set)'
	AND V2PRODUCTCATEGORY != '(not set)'
GROUP BY COUNTRY,
	V2PRODUCTCATEGORY,
	CURRENCYCODE
ORDER BY 	--COUNTRY, 
			CATEGORY_POPULARITY desc;

SELECT 
	CITY,
	V2PRODUCTCATEGORY,
	COUNT(V2PRODUCTCATEGORY) 	AS CATEGORY_POPULARITY, 	--show popularity of this category 
	AVG(PRODUCTPRICE) 			AS AVG_PRODUCTPRICE,-- show avg price in this category
	CURRENCYCODE,									
	AVG(TIMEONSITE) 			AS AVG_TIMEONSITE 	-- show avg time spent on site for this category
FROM ALL_SESSIONS
WHERE CITY != '(not set)'
	AND V2PRODUCTCATEGORY != '(not set)'
GROUP BY CITY,
	V2PRODUCTCATEGORY,
	CURRENCYCODE
ORDER BY 	--CITY, 
			CATEGORY_POPULARITY desc;
```


Answer:
using the 2 querries above i have created 2 tables which can be used to compare the most popular categories,from which country/city this category is most popular, the avg price of the products in taht category then tender used and the avg time spent on site in that category for that country/city.
i was suprised to see how popular men apparel in general so high on the list.


**Question 4: What is the top-selling product from each city/country? Can we find any pattern worthy of noting in the products sold?**

SQL Queries:
```SQL
-- sub query creates a list of all products sold in every city/country and orders it by amount sold
--the outer query pulls the top result from each city and shows you how much of it was sold to that city

SELECT city,
       productsku,
       v2productname,
	   sku_count as number_of_this_item_sold
FROM (
    SELECT city,
           productsku,
           v2productname,
           COUNT(productsku) AS sku_count,
           ROW_NUMBER() OVER (PARTITION BY city ORDER BY COUNT(productsku) DESC) AS row_num
    FROM all_sessions
    WHERE city != '(not set)' 
      AND productsku != '(not set)'
      AND productsku IS NOT NULL
    GROUP BY city, productsku, v2productname
) AS subquery
WHERE row_num = 1
ORDER BY city;


SELECT country,
       productsku,
       v2productname,
	   sku_count as number_of_this_item_sold
FROM (
    SELECT country,
           productsku,
           v2productname,
           COUNT(productsku) AS sku_count,
           ROW_NUMBER() OVER (PARTITION BY country ORDER BY COUNT(productsku) DESC) AS row_num
    FROM all_sessions
    WHERE country != '(not set)' 
      AND productsku != '(not set)'
      AND productsku IS NOT NULL
    GROUP BY country, productsku, v2productname
) AS subquery
WHERE row_num = 1
ORDER BY country;
```


Answer: the two querries above show a list of the most bought products in each city though i've noticed that it doesnt work well when there are tied results in the nested query to get more meaningful data we might filter on number_of_this_item_sold to get more meaningfull results


**Question 5: Can we summarize the impact of revenue generated from each city/country?**

SQL Queries:
```SQL
SELECT 
    City, 
    Country, 
    SUM(totaltransactionrevenue/1000000) AS TotalRevenue,
    SUM(totaltransactionrevenue/1000000) / (SELECT SUM(totaltransactionrevenue/1000000) 
											FROM public.all_sessions 
											WHERE city != '(not set)' AND country != '(not set)') 
											* 100 AS RevenuePercentage
FROM public.all_sessions
WHERE city != '(not set)' AND country != '(not set)'
GROUP BY City, Country
HAVING SUM(totaltransactionrevenue/1000000) IS NOT NULL
ORDER BY TotalRevenue DESC;
```


Answer:
This query shows the sum of total revenue generated by each city/country combo where neithere the city or the country are set to '(not set)' and where the total sum revenue result is not null

"San Francisco"	"United States"	1251.1300000000000000	17.86282320355220513700
"Sunnyvale"	"United States"	872.2300000000000000	12.45313459259576533700
"Palo Alto"	"United States"	608.0000000000000000	8.68062991676303879200
"Tel Aviv-Yafo"	"Israel"	602.0000000000000000	8.59496580574235090900
"New York"	"United States"	530.3600000000000000	7.57213632015533758800
"Los Angeles"	"United States"	479.4800000000000000	6.84570465869990434200
"Mountain View"	"United States"	474.3800000000000000	6.77289016433231964100
"Chicago"	"United States"	449.5200000000000000	6.41795519766993618000
"Seattle"	"United States"	358.0000000000000000	5.11129195756771034100
"Sydney"	"Australia"	358.0000000000000000	5.11129195756771034100
"San Jose"	"United States"	262.3800000000000000	3.74609157493468111500
"Austin"	"United States"	157.7800000000000000	2.25268057280735569200
"Nashville"	"United States"	157.0000000000000000	2.24154423837466626700
"Atlanta"	"United States"	111.9600000000000000	1.59849231164603589300
"San Bruno"	"United States"	103.7700000000000000	1.48156080010279693300
"Toronto"	"Canada"	82.1600000000000000	1.17302722690995274200
"New York"	"Canada"	67.9900000000000000	0.97071715138276152500
"Houston"	"United States"	38.9800000000000000	0.55653117459773561200
"Columbus"	"United States"	21.9900000000000000	0.31395896689082109100
"Zurich"	"Switzerland"	16.9900000000000000	0.24257220770691452100






