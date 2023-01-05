/*
Question: 

This is the same question as problem #28 in the SQL Chapter of Ace the Data Science Interview!
Assume you are given the table containing measurement values obtained from a Google sensor over several days.
Measurements are taken several times within a given day.
Write a query to obtain the sum of the odd-numbered and even-numbered measurements on a particular day, in two different columns.
Refer to the Example Output below for the output format.

Definition:
1st, 3rd, and 5th measurements taken within a day are considered odd-numbered measurements 
and the 2nd, 4th, and 6th measurements are even-numbered measurements.

Source: https://datalemur.com/questions/odd-even-measurements
Credits: https://www.linkedin.com/in/nick-singh-tech
*/

/*My solution:*/
WITH extract_date AS
  (SELECT *, measurement_time::DATE AS measurement_day
  FROM measurements),
  
  even_odd_rank AS
    (SELECT
      measurement_day,
      measurement_time,
      measurement_value,
      RANK() OVER(PARTITION BY measurement_day ORDER BY measurement_time)
      FROM extract_date),
      
  even AS
    (SELECT measurement_day, SUM(measurement_value) AS even_sum
      FROM even_odd_rank
      WHERE rank % 2 = 0
      GROUP BY measurement_day),
      
  odd AS
    (SELECT measurement_day, SUM(measurement_value) AS odd_sum
      FROM even_odd_rank
      WHERE rank % 2 != 0
      GROUP BY measurement_day)
      
SELECT o.measurement_day, odd_sum, even_sum
FROM odd AS o  
INNER JOIN even AS e  
ON o.measurement_day = e.measurement_day
ORDER BY o.measurement_day