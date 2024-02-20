SELECT *
FROM ANALYTICS;

SELECT DISTINCT(unit_price),
	COUNT(unit_price)
FROM ANALYTICS
GROUP BY DISTINCT(unit_price)
ORDER BY unit_price ;

--commented out the below so i dont accidently run it again
-- UPDATE ANALYTICS
-- SET UNIT_PRICE = UNIT_PRICE / 1000000;



--i was using the comments below to paste around when investigating
/*
visitid
visitstarttime
date_
fullvisitorid
userid
channelgrouping
socialengagementtype
units_sold
pageviews
timeonsite
bounces
revenue
unit_price
visitnumber
*/

