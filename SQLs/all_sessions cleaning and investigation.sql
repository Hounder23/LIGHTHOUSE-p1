SELECT *
FROM ALL_SESSIONS;

--looking at city column for these weird entries

SELECT CITY
FROM ALL_SESSIONS
WHERE CITY = 'not available in demo dataset' ;

--cleaning these entries to match the already established non value entries
 UPDATE ALL_SESSIONS
SET CITY = '(not set)'
WHERE CITY = 'not available in demo dataset' ;
 --commented out so i dont run it twice
-- UPDATE ALL_SESSIONS
-- SET productprice = productprice / 1000000;
--reduce the price of the products by 1000000 from the hint
 --looking at unique entries for different columns looking for garbage data
--keeping an eye for typo duplicate
-- Also trying to identify the PK of this table (STILL UNCLEAR)

SELECT DISTINCT(FULLVISITORID), --each unique entry from this column
 COUNT(FULLVISITORID) -- frequency of easch itmem in the column
FROM ALL_SESSIONS
GROUP BY DISTINCT(FULLVISITORID) -- create buckets for each unique entry
HAVING COUNT(FULLVISITORID) > 1 -- show me the buckets with more than 1 entry
ORDER BY FULLVISITORID ;

--this small query is to remove all null and duplicate values in the FULLVISITORID column so that i can make it a PK
DELETE
FROM ALL_SESSIONS
WHERE FULLVISITORID IN
		(SELECT FULLVISITORID
			FROM ALL_SESSIONS
			GROUP BY FULLVISITORID
			HAVING COUNT(*) > 1)
	OR FULLVISITORID IS NULL;


ALTER TABLE ALL_SESSIONS ADD PRIMARY KEY (FULLVISITORID);