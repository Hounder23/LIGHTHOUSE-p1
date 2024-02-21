What are your risk areas? Identify and describe them.

-   Performance wise i dont think any of my code is too inneficient... at least on my machine nothing took more than a few seconds to return my query results and for that reason i dont know whether or not my code has good performance and it might be on of my risk areas.
-   Data integrity is definitly one of my risk areas. the whole cleaning process had me pulling my hair trying to understand what values to remove or rename but iwthin my saved queries i dont think that i overlooked these instances of garbage data and properly filtered them out DURING the query but i was hesitant to alter any of the raw data too much


QA Process:
Describe your QA process and include the SQL queries used to execute it.

-   a lot of my QA process was verifying whether or not certain columns were candidates for PK and if they were i would change their designation to that of PK so that if new values are to be added the database knows not to accept duplicates
- i would do this by checking for duplicate records using queries like this one
```sql 
SELECT DISTINCT(FULLVISITORID), --each unique entry from this column
 COUNT(FULLVISITORID) -- frequency of easch itmem in the column
FROM ALL_SESSIONS
GROUP BY DISTINCT(FULLVISITORID) -- create buckets for each unique entry
HAVING COUNT(FULLVISITORID) > 1 -- show me the buckets with more than 1 entry
ORDER BY FULLVISITORID ;
```
- when i found duplicate data or null data in a column i thought should be a PK then i would delete those entries with a query similar to the following
```sql
--this small query is to remove all null and duplicate values in the FULLVISITORID column so that i can make it a PK
DELETE
FROM ALL_SESSIONS
WHERE FULLVISITORID IN
		(SELECT FULLVISITORID
			FROM ALL_SESSIONS
			GROUP BY FULLVISITORID
			HAVING COUNT(*) > 1)
	OR FULLVISITORID IS NULL;
```
-   and of course once those steps were completed i could set the column as PK
```sql
ALTER TABLE ALL_SESSIONS ADD PRIMARY KEY (FULLVISITORID);
```
-   some of the data was input incorrectly and needed to be reduced by a factor of 1000000 and that query looks like this
```sql
UPDATE ALL_SESSIONS
SET productprice = productprice / 1000000;
```
-   some of the data had mismatching names for data when there was no value set so i would shoose a convention and apply it to the incorrect ones
```sql
 UPDATE ALL_SESSIONS
SET CITY = '(not set)'
WHERE CITY = 'not available in demo dataset' ;
```