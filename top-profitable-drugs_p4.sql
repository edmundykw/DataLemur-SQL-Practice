/*
Question: 

CVS Health is trying to better understand its pharmacy sales, and how well different drugs are selling.
Write a query to find the top 2 drugs sold, in terms of units sold, for each manufacturer.
List your results in alphabetical order by manufacturer.

Source: https://datalemur.com/questions/top-drugs-sold
Credits: https://www.linkedin.com/in/nick-singh-tech
*/

/*My solution:*/
SELECT ranks.manufacturer, drug
FROM
  (SELECT *,
  rank() OVER (
    PARTITION BY manufacturer 
    ORDER BY units_sold DESC) 
  FROM pharmacy_sales) AS ranks
WHERE ranks.rank < 3
