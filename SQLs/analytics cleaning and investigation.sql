SELECT *
FROM ANALYTICS;

SELECT DISTINCT(fullvisitorid),
	COUNT(fullvisitorid)
FROM ANALYTICS
GROUP BY DISTINCT(fullvisitorid)
ORDER BY fullvisitorid ;

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

