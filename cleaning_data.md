What issues will you address by cleaning the data?

--While importing the dataset, I've already briefly explored the data to be able to choose accurate datatypes(Though some of my choices might have been inaccurate)

--I'm torn on whether or not to delete entries tied to empty/irrelevent data
    
--I noticed while scrolling through the data in excel that alot of the City data is ismply not available for some reason.
Right now I'm choosing to leave this column in but I will change the entries from 'Not Available in demo dataset' to '(not set)' to match the other non entries
I will use similar methods to address other missing/inaccurate data for columns that have Accurate and useful data mixed in

--If i have time or the capacity to. i would like to learn how to fix any spelling errors for otherwise useful data




Queries:
Below, provide the SQL queries you used to clean your data.
I will also be creating actual .SQL files of these queries and place them in the SQLs folder.

### **ALL_SESSIONS TABLE INVESTIGATION**
--SEEMS TO BE A TABLE CONTAINING A LOT: WEBTRAFFIC INFO PER PRODUCT AS WELL AS SALES DATA
--THIS IS A DIFFICULT TABLE FOR ME 
```SQL
SELECT CITY
FROM ALL_SESSIONS
WHERE CITY = 'not available in demo dataset';
```
--This is just an investigative query looking for the values when City contains 'not available in demo dataset'. The result was 8302 rows of data out of 15134 entries. this is roughly 55% of all the data in this column.
--i'll be transforming these datapoints to match the established non values for consistency in this case '(not set)'

```SQL
UPDATE ALL_SESSIONS
SET CITY = '(not set)'
WHERE CITY = 'not available in demo dataset';
```
--now the previous query return 0 rows

-- next i assumed that full visitor id was the primary key of this table based on the name of the column compared to the others. to scan for duplicates in this column i used the following query
```SQL
SELECT DISTINCT(FULLVISITORID), --each unique entry from this column
	COUNT(FULLVISITORID) -- frequency of easch itmem in the column
FROM ALL_SESSIONS
GROUP BY DISTINCT(FULLVISITORID) -- create buckets for each unique entry
HAVING COUNT(FULLVISITORID) > 1 -- show me the buckets with more than 1 entry
ORDER BY FULLVISITORID ;
```
--this returns 794 different duplicate keys. and using a similar query i found there was even null data
--this made me decide to double check with the other columns to see if there were any other PK candidates and by far this seems to be the most appropriate.
--but i was apprehensive because this column also had nulls in it. 
-- i decided to delete any duplicate and null FULLVISITORID with the following query as it seemed to be the most appropriate despite the amount of duplicate or missing data compared to the other values in the table
```SQL
DELETE
FROM ALL_SESSIONS
WHERE FULLVISITORID IN
		(SELECT FULLVISITORID
			FROM ALL_SESSIONS
			GROUP BY FULLVISITORID
			HAVING COUNT(*) > 1)
	OR FULLVISITORID IS NULL;


ALTER TABLE ALL_SESSIONS ADD PRIMARY KEY (FULLVISITORID);
```

### **ANALYTICS TABLE INVESTIGATION**
--i could not identify a proper PK in this table 
--i noticed in the assignment file there was a hint that the unitcost column is in this table and not in any others.
```SQL
UPDATE ANALYTICS
SET UNIT_PRICE = UNIT_PRICE / 1000000;
```


### **PRODUCTS TABLE INVESTIGATION**
--SEEMS TO BE A TABLE CONTAING A LIST OF ALL FEATURED PRODUCTS
```SQL
SELECT *
FROM PRODUCTS;
```
--1092 rows returned, that means i should expect the same # of distinct keys in the SKU coloumn

```SQL
SELECT DISTINCT(SKU),
	COUNT(SKU)
FROM PRODUCTS
GROUP BY DISTINCT(SKU)
ORDER BY SKU ;
```
--1092 rows returned. This confirms sku as pk although i dont like that there are 2 different styles of recording this key eg."GGOEGAAX0620" or "9183118"

--making sku our pk column
```SQL
ALTER TABLE PRODUCTS ADD PRIMARY KEY (SKU);
```

--all columns have an appropriate datatype


### **SALES_BY_SKU TABLE INVESTIGATION**

--this table seems to simply be used to track how much a sku has sold

```SQL
SELECT *
FROM SALES_BY_SKU; -- returns 462 rows

SELECT DISTINCT(productsku),
	COUNT(productsku)
FROM SALES_BY_SKU
GROUP BY DISTINCT(productsku)
ORDER BY productsku ;-- returns 462 rows

ALTER TABLE SALES_BY_SKU ADD PRIMARY KEY (PRODUCTSKU);--making PRODUCTSKU pk

ALTER TABLE SALES_BY_SKU RENAME COLUMN OTAL_ORDERED TO TOTAL_ORDERED;--fixing a typo
```


### **SALES_REPORT TABLE INVESTIGATION**
---this table seems to track a running ttotal of how much a product was ordered as well as current stock levels, restock lead time, im unsure what sentiment score and magnitude are for as well as a ratio column

```SQL
SELECT *
FROM sales_report;--reutrns 454 rows


SELECT DISTINCT(PRODUCTSKU),
	COUNT(PRODUCTSKU)
FROM sales_report
GROUP BY DISTINCT(PRODUCTSKU)
ORDER BY PRODUCTSKU ;--returns 454 rows


ALTER TABLE sales_report ADD PRIMARY KEY (PRODUCTSKU);--making PRODUCTSKU pk
```

