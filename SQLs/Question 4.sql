--**Question 4: What is the top-selling product from each city/country? 
--  Can we find any pattern worthy of noting in the products sold?**


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
ORDER BY number_of_this_item_sold desc
LIMIT 5;


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
ORDER BY number_of_this_item_sold desc
LIMIT 5;
