Question 1: Which city country combo has the highest avg time on a website?

SQL Queries:
```SQL
SELECT CITY,
	COUNTRY,
	AVG(A.TIMEONSITE) * 0.0166 AS AVG_TIME_ON_SITE_IN_MINUTES
FROM ANALYTICS A
JOIN ALL_SESSIONS ALS ON A.FULLVISITORID = ALS.FULLVISITORID
WHERE CITY != '(not set)'
	AND COUNTRY != '(not set)'
GROUP BY CITY,
		COUNTRY
HAVING AVG(A.TIMEONSITE) IS NOT NULL
ORDER BY AVG_TIME_ON_SITE_IN_MINUTES desc
LIMIT 10;
```

Answer: 

"San Mateo"	"United States"	53.07020000000000000000
"Sakai"	"Japan"	30.71368888888888888852
"East Lansing"	"United States"	28.76780000000000000000
"Osaka"	"Japan"	28.05465841346153846090
"Oviedo"	"United States"	27.45640000000000000000
"Mexico City"	"United States"	26.96519090909090909106
"Rexburg"	"United States"	26.40230000000000000000
"Singapore"	"France"	22.48922727272727272682
"Chicago"	"United States"	21.33859212370137714494
"Jersey City"	"United States"	20.90950127659574468018


Question 2: Which CITY COUNTRY COMBO had the highest sentiment score FOR WHICH PRODUCT?

SQL Queries:
```SQL
SELECT CITY,
	COUNTRY,
	v2productname,
	max(sentimentscore) AS HIGHEST_PRODUCT_RATING
FROM ANALYTICS A
JOIN ALL_SESSIONS ALS ON A.FULLVISITORID = ALS.FULLVISITORID
JOIN PRODUCTS P ON ALS.PRODUCTSKU = P.SKU
WHERE 	CITY != '(not set)'
	AND	COUNTRY != '(not set)'
GROUP BY CITY,
		COUNTRY,
		v2productname
ORDER BY HIGHEST_PRODUCT_RATING DESC
LIMIT 10;
```

Answer:
"Fremont"	"United States"	"Google Stylus Pen w/ LED Light"	0.9
"Istanbul"	"Turkey"	"Google G Noise-reducing Bluetooth Headphones"	0.9
"Chennai"	"India"	"Google Hard Cover Journal"	0.9
"Edmonton"	"Canada"	"Google Stylus Pen w/ LED Light"	0.9
"Chicago"	"United States"	"Google Pocket Bluetooth Speaker"	0.9
"Chicago"	"United States"	"Google G Noise-reducing Bluetooth Headphones"	0.9
"Austin"	"United States"	"Google G Noise-reducing Bluetooth Headphones"	0.9
"Ann Arbor"	"United States"	"Metal Texture Roller Pen"	0.9
"Detroit"	"United States"	"Google 22 oz Water Bottle"	0.9
"Mountain View"	"United States"	"Google G Noise-reducing Bluetooth Headphones"	0.9



Question 3: 

SQL Queries:

Answer:
