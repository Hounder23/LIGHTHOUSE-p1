-- **Question 5: Can we summarize the impact of revenue generated from each city/country?**

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
