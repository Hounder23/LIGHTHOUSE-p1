SELECT *
FROM PRODUCTS;


--counting SKU to make sure this is a primary key for this table (it is)
SELECT DISTINCT(SKU),
	COUNT(SKU)
FROM PRODUCTS
GROUP BY DISTINCT(SKU)
ORDER BY SKU ;


--making sku our pk column
ALTER TABLE PRODUCTS ADD PRIMARY KEY (SKU);