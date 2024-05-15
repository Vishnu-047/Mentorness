
-- To avoid any errors, check missing value / null value 
-- Q1. Write a code to check NULL values
SELECT * FROM covidcases
WHERE 
    Date IS NULL
    OR Confirmed IS NULL
	OR Deaths IS NULL
    OR Recovered IS NULL;

-- Q2. If NULL values are present, update them with zeros for all columns. 
-- No NuLL Values are there in the given dataset.

-- Q3. check total number of rows
SELECT COUNT(*) FROM covidcases; 

-- Q4. Check what is start_date and end_date
SELECT 
	MIN(Date) AS Start_date,
    Max(Date) AS End_date
FROM 
	covidcases;
    
-- Q5. Number of month present in dataset
SELECT
  YEAR(Date) AS Year,
  COUNT(DISTINCT MONTH (Date)) AS number_of_months
FROM
  covidcases
GROUP BY 
	YEAR(Date);

-- Q6. Find monthly average for confirmed, deaths, recovered
SELECT 
    MONTH(Date) AS Month,
    YEAR(Date) AS Year,
	AVG(Confirmed) AS Confirmed_avg,
    AVG(Deaths) AS Deaths_avg,
    AVG(Recovered) AS Recovered_avg
FROM 
	covidcases
GROUP BY 
    Month,
    Year;

-- Q7. Find most frequent value for confirmed, deaths, recovered each month 
SELECT
  MONTH (Date) AS Month,
  YEAR (Date) AS Year, 
  MAX(Confirmed) AS Most_frequent_confirmed,
  MAX(Deaths) AS Most_frequent_deaths,
  MAX(Recovered) AS Most_frequent_recovered
FROM
  covidcases
GROUP BY
  MONTH (Date),
  YEAR (Date);

-- Q8. Find minimum values for confirmed, deaths, recovered per year
SELECT YEAR(`Date`) AS Year,
       MIN(Confirmed) AS Min_Cnfmd,
       MIN(Deaths) AS Min_Deaths,
       MIN(Recovered) AS Min_Rcvrd
FROM covidcases
GROUP BY Year;

-- Q9. Find maximum values of confirmed, deaths, recovered per year
SELECT
	   YEAR(`Date`) AS Year,
       MAX(Confirmed) AS Max_Cnfmd,
       MAX(Deaths) AS Max_Deaths,
       MAX(Recovered) AS Max_Rcvrd
FROM 
	covidcases
GROUP BY 
	Year;

-- Q10. The total number of case of confirmed, deaths, recovered each month
SELECT 
	MONTH(Date) AS Month,
    YEAR (Date) AS Year,
	SUM(Confirmed) AS Total_Confirmed,
    SUM(Deaths) AS Total_Deaths,
    SUM(Recovered) AS Total_Recovered
FROM 
	covidcases
GROUP BY 
	MONTH ,
    YEAR;

-- Q11. Check how corona virus spread out with respect to confirmed case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT
	SUM(Confirmed) AS Total_Confirmed,
    AVG(Confirmed) AS Average_Confirmed,
	Round(Variance(Confirmed)) As Var_Confirmed,
    Round(STDDEV(Confirmed)) AS Standard_deviation
FROM
    covidcases;

-- Q12. Check how corona virus spread out with respect to death case per month
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT
	MONTH(Date) AS Month,
    YEAR(Date) AS Year,
	SUM(Deaths) AS Total_Deaths,
    AVG(Deaths) AS Average_Deaths,
	Round(Variance(Deaths)) As Var_Deaths,
    Round(STDDEV(Deaths)) AS Standard_deviation
FROM
    covidcases
GROUP BY
	MONTH,
    Year;
    
-- Q13. Check how corona virus spread out with respect to recovered case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT
	SUM(Recovered) AS Total_Recovered,
    AVG(Recovered) AS Average_Recovered,
	Round(Variance(Recovered)) As Var_Recovered,
    Round(STDDEV(Recovered)) AS Standard_deviation
FROM
    covidcases;
    
-- Q14. Find Country having highest number of the Confirmed case
SELECT 
	Country, 
	SUM(confirmed) as Total_Confirmed
FROM 
	covidcases
GROUP BY 
	Country
ORDER BY 
	Total_Confirmed DESC
LIMIT 5;

-- Q15. Find Country having lowest number of the death case
SELECT 
	Country, 
	SUM(Deaths) as Total_Deaths
FROM 
	covidcases
GROUP BY 
	Country
ORDER BY 
	Total_Deaths ASC
LIMIT 5;

-- Q16. Find top 5 countries having highest recovered case
SELECT 
	Country, 
	SUM(Recovered) as Total_Recovered
FROM 
	covidcases
GROUP BY 
	Country
ORDER BY 
	Total_Recovered DESC
LIMIT 5;


