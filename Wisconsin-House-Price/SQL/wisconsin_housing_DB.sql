#Number of Columns in the database
SELECT COUNT(*) AS NumberOfRows FROM wisc_house.wisc_house_price;



#To see the structure and format of the data (To get the Head)
SELECT * 
FROM wisc_house.wisc_house_price
LIMIT 10;



#Retriving the average price from 2014-2023 in Wisconsin
SELECT AVG(Price) as Average_housing_price_wisconsin
FROM wisc_house.wisc_house_price;



#Retriving Top 10 Counites by Average price
SELECT CountyName, AVG(Price) as Average_price_counties
FROM wisc_house.wisc_house_price
GROUP BY CountyName
ORDER BY AVG(Price) DESC
LIMIT 10;



#Retriving Bottom 10 Counites by Average price
SELECT CountyName, AVG(Price) as Average_price_counties
FROM wisc_house.wisc_house_price
GROUP BY CountyName
ORDER BY AVG(Price) ASC
LIMIT 10;


#Retriving Average price by each Year over the last Decade
SELECT Year, AVG(Price) as Average_price_counties
FROM wisc_house.wisc_house_price
GROUP BY Year
LIMIT 10;



#Retriving the Maximum housing price over the years
SELECT *
FROM wisc_house.wisc_house_price
WHERE Price = (SELECT MAX(Price) 
			   FROM wisc_house.wisc_house_price 
			   WHERE Year <> 2024);



#Retriving the percent change in the average housing price from 2014 to 2023
SELECT
  (AVG(CASE WHEN Year = 2023 THEN Price END) - AVG(CASE WHEN Year = 2014 THEN Price END)) 
  / AVG(CASE WHEN Year = 2014 THEN Price END) * 100 AS PercentChange
FROM wisc_house.wisc_house_price
WHERE Year IN (2014, 2023);



#Retriving the percent change by Top 10 county in the average housing price from 2014 to 2023
SELECT CountyName, 
	   AVG(CASE WHEN Year = 2014 THEN Price END) AS AvgPrice2014,
	   AVG(CASE WHEN Year = 2023 THEN Price END) AS AvgPrice2023,
	   (AVG(CASE WHEN Year = 2023 THEN Price END) - AVG(CASE WHEN Year = 2014 THEN Price END)) 
       / AVG(CASE WHEN Year = 2014 THEN Price END) * 100 AS PercentChange
FROM wisc_house.wisc_house_price
WHERE Year IN (2014, 2023)
GROUP BY CountyName
ORDER BY PercentChange DESC
LIMIT 10;
